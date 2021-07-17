
  create view "d15em1n30ihttu"."dbt_ealizadeh"."jinja_and_variable_usage__dbt_tmp" as (
    select *
from "d15em1n30ihttu"."dbt_ealizadeh"."population" 
inner join "d15em1n30ihttu"."dbt_ealizadeh"."covid19_latest_stats" 
on "d15em1n30ihttu"."dbt_ealizadeh"."population".code = "d15em1n30ihttu"."dbt_ealizadeh"."covid19_latest_stats".iso_code 
where code='USA'
  );
