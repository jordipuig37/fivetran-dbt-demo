WITH source_trips_data as (
    select * from {{ source('s3_demo', 'trips_data') }}
),

final AS (
    SELECT * FROM source_trips_data
)

SELECT * FROM final