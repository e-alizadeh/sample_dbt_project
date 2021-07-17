
  create view "d15em1n30ihttu"."dbt_ealizadeh"."using_dbt_utils_macros__dbt_tmp" as (
    select
  continent,
  
  
    sum(
      
      case
      when population.year = '2015'
        then 1
      else 0
      end
    )
    
      
            as "2015"
      
    
    ,
  
    sum(
      
      case
      when population.year = '2017'
        then 1
      else 0
      end
    )
    
      
            as "2017"
      
    
    ,
  
    sum(
      
      case
      when population.year = '2016'
        then 1
      else 0
      end
    )
    
      
            as "2016"
      
    
    ,
  
    sum(
      
      case
      when population.year = '2018'
        then 1
      else 0
      end
    )
    
      
            as "2018"
      
    
    ,
  
    sum(
      
      case
      when population.year = '2019'
        then 1
      else 0
      end
    )
    
      
            as "2019"
      
    
    
  

from "d15em1n30ihttu"."dbt_ealizadeh"."population"
group by continent
  );
