
select dl.id as location_id
	, dl.city as city 
	, dl.state as state 
	, dl.zip as zip
	, SUM(ord.amount) as total_amount
	, avg(ord.amount) as avg_amount
	, count(*) as volume
from {{ ref('dim_locations') }} dl 
join {{ ref('fct_orders_last_three_years') }} ord 
	on dl.id = ord.location_id 
group by dl.id
	, dl.city 
	, dl.state 
	, dl.zip 
order by 
	dl.state 
	, dl.city 
	, dl.zip 
