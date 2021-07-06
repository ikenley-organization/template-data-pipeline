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