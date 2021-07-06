
select
    id,
    city,
    state,
    zip
from {{ ref('stg_locations') }}