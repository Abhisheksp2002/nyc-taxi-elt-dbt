with source as (
    select * from {{ source('raw', 'raw_trips') }}
),

renamed as (
    select
        "VendorID"                      as vendor_id,
        to_timestamp_ntz("tpep_pickup_datetime"/1000000)          as pickup_at,
        to_timestamp_ntz("tpep_dropoff_datetime"/1000000)         as dropoff_at,
        "passenger_count"               as passenger_count,
        "trip_distance"                 as trip_distance_miles,
        "RatecodeID"                    as rate_code_id,
        "PULocationID"                  as pickup_location_id,
        "DOLocationID"                  as dropoff_location_id,
        "payment_type"                  as payment_type_id,
        "fare_amount"                   as fare_amount,
        "tip_amount"                    as tip_amount,
        "total_amount"                  as total_amount
    from source
)

select * from renamed