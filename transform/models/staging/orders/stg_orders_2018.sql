
select
    id,
    cast("date" as date) as order_date,
    cast(replace(amount, '$', '') as float) as amount,
    customer_id,
    location_id
from {{ source('example_source', 'orders_2018') }}