
  create view "d15em1n30ihttu"."dbt_ealizadeh"."using_variable__dbt_tmp" as (
    select * 
from "d15em1n30ihttu"."dbt_ealizadeh"."population" 
join on "d15em1n30ihttu"."dbt_ealizadeh"."covid19_latest_stats" 
where code='USA'
  );
