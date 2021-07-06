
select
    cast(id as uuid) as id,
    first_name,
    last_name,
    email,
    gender
from {{ ref('stg_customers',) }}