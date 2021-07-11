select
  continent,
  {{ dbt_utils.pivot(
      "population.year",
      dbt_utils.get_column_values(ref('population'), "year")
  ) }}
from {{ ref('population') }}
group by continent
