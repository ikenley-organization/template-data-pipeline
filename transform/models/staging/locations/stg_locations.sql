
select
    cast(id as varchar(20)) as id,
    city,
    state,
    cast(lpad(zip, 5, '0') as varchar(5)) as zip,
    _row_ as row_id
from {{ source('example_source', 'locations') }}