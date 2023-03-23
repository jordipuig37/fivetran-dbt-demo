WITH source_weather_data as (
    select * from {{ source('s3_demo', 'weather_nyc') }}
),

final AS (
    SELECT * FROM source_weather_data
)

SELECT * FROM final