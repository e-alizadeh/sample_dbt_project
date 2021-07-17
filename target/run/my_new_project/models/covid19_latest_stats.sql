
  create view "d15em1n30ihttu"."dbt_ealizadeh"."covid19_latest_stats__dbt_tmp" as (
    select "iso_code", "total_cases", "new_cases", "total_cases_per_million"  from covid_latest
  );
