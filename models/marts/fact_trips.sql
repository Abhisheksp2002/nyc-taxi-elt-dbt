select
    {{ dbt_utils.generate_surrogate_key(['vendor_id', 'pickup_at', 'dropoff_at']) }} as trip_id,
    vendor_id,
    pickup_location_id,
    dropoff_location_id,
    payment_type_id,
    pickup_at,
    dropoff_at,
    trip_duration_in_minutes,
    trip_distance_miles,
    fare_amount,
    tip_amount,
    total_amount
from {{ ref('int_trip_enriched') }}