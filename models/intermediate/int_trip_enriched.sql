with trips as (
    select * from {{ ref('stg_trips')}}
),

enriched as (
    select *,
    datediff('minutes', pickup_at, dropoff_at) as trip_duration_in_minutes
    from trips
    where trip_distance_miles> 0
    and fare_amount> 0
    and dropoff_at> pickup_at
)

select * from enriched