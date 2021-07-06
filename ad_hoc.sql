/*
* ad_hoc.sql
* Ad hoc queries to validate dbt tests
*/

select *
from dbt_ikenley.my_first_dbt_model mfdm 
limit 10;

select *
from dbt_ikenley.my_second_dbt_model msdm 
limit 10;

select *
from dbt_ikenley.stg_customers c 
limit 10;

select *
from dbt_ikenley.stg_locations sl 
limit 50;

select *
from dbt_ikenley.dim_locations dl 
limit 10;

select *
from dbt_ikenley.stg_orders_2017 so 
limit 10;

select *
from dbt_ikenley.stg_orders_2018 so 
limit 10;

select *
from dbt_ikenley.stg_orders_2019 so 
limit 10;

select *
from dbt_ikenley.stg_orders_last_three_years solty 
limit 10;

select *
from dbt_ikenley.fct_orders_last_three_years folty 
limit 10;

select dl.id as location_id
	, dl.city as city 
	, dl.state as state 
	, dl.zip as zip
	, SUM(ord.amount) as total_amount
	, avg(ord.amount) as avg_amount
	, count(*) as volume
from dbt_ikenley.dim_locations dl 
join dbt_ikenley.fct_orders_last_three_years ord 
	on dl.id = ord.location_id 
group by dl.id
	, dl.city 
	, dl.state 
	, dl.zip 
order by 
	dl.state 
	, dl.city 
	, dl.zip 
;

