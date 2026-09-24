select distinct
    vendor_id,
    case vendor_id
        when 1 then 'Creative Mobile Technologies'
        when 2 then 'VeriFone Inc'
        else 'Unknown'
    end as vendor_name
from {{ ref('int_trip_enriched') }}