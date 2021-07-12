select * 
from {{ref('population')}} 
inner join {{ref('covid19_latest_stats')}} 
on {{ref('population')}}.code = {{ref('covid19_latest_stats')}}.iso_code 
where code='{{ var("selected_country") }}'

