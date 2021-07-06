
select
    id,
    order_year,
    order_date,
    amount,
    customer_id,
    location_id
from {{ ref('stg_orders_last_three_years') }}