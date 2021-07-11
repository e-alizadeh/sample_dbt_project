import subprocess

import pandas as pd
from sqlalchemy.types import Integer, DateTime, String, Float

from sqlalchemy.engine.create import create_engine

# Retrieve database credentials from terminal via Heroku CLI 
# This is necessary, particularly in the FREE plan since the database credentials may change.
# $heroku config:get DATABASE_URL --app covid19-owid
raw_db_url = subprocess.run(
    ['heroku', 'config:get', 'DATABASE_URL', '--app', 'covid19-owid'],
    capture_output=True
).stdout

# Convert binary string and remove the newline character
db_url = raw_db_url.decode('ascii').strip()

# Convert "postgres://<db_address>"  --> "postgresql+psycopg2://<db_address>"
final_db_url = "postgresql+psycopg2://" + db_url.lstrip("postgres://")
engine = create_engine(final_db_url)

# Ingest a sample data
DATA_URL = "https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/latest/owid-covid-latest.csv"
df = pd.read_csv(DATA_URL)
df.to_sql(
    "covid_latest",  # table name
    con=engine,
    if_exists='replace',
    index=False,  # In order to avoid writing DataFrame index as a column
    dtype={
        "last_updated_date": DateTime(),
        "total_cases": Integer(),
        "new_cases": Integer()
    }
)


df = pd.read_sql_table(
    "covid19",  # table name
    con=engine,
)


df = pd.read_csv("./population-density-vs-prosperity.csv")
df = df[df["Year"] >= 2015]
df.rename(
    columns={
        "Entity": "entity",
        "Code": "code",
        "Year": "year",
        "Continent": "continent",
        "Population density (people per sq. km of land area)": "population_density",
        "GDP per capita, PPP (constant 2011 international $)": "gdp_per_capita",
        "Total population (Gapminder & UN)": "total_population"
    },
    inplace=True
)
df.to_sql(
    "population_prosperity",  # table name
    con=engine,
    if_exists='replace',
    index=False,  # In order to avoid writing DataFrame index as a column
    dtype={
        "entity": String(),
        "code": String(),
        "year": Integer(),
        "population_density": Float(),
        "gdp_per_capita": Float(),
        "total_population": Integer(),
        "continent": String()
    }
)


