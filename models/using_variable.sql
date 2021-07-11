select * 
from {{ref('population')}} 
where code='{{ var("selected_country") }}'

