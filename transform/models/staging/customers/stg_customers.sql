
select
    cast(id as uuid) as id,
    first_name,
    last_name,
    email,
    gender,
    _row_ as row_id
from {{ source('example_source', 'customers') }}