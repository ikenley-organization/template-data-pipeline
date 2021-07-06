
select
    id,
    2017 as order_year,
    order_date,
    amount,
    customer_id,
    location_id
from {{ ref('stg_orders_2017') }}
union
select
    id,
    2018 as order_year,
    order_date,
    amount,
    customer_id,
    location_id
from {{ ref('stg_orders_2018') }}
union
select
    id,
    2019 as order_year,
    order_date,
    amount,
    customer_id,
    location_id
from {{ ref('stg_orders_2019') }}