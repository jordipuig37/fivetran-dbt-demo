WITH stg_weather AS (
    SELECT * FROM {{ ref('stg_weather') }}
),

filtered_entries AS (
    SELECT *
    FROM stg_weather
    WHERE   LONGITUDE != 0
        AND LONGITUDE != 0
        AND ELEVATION >= 0
),

unique_stations AS (
    SELECT
        STATION AS STATION_KEY,
        MAX(NAME) AS NAME,
        MAX(COUNTRY) AS COUNTRY,
        MAX(REGION) AS REGION,
        MAX(WMO) AS WMO,
        MAX(ICAO) AS ICAO,
        MAX(LATITUDE) AS LATITUDE,
        MAX(LONGITUDE) AS LONGITUDE,
        MAX(ELEVATION) AS ELEVATION,
        MAX(TIMEZONE) AS TIMEZONE
    FROM filtered_entries
    GROUP BY STATION_KEY
),

final as (
    SELECT * from unique_stations
)

SELECT * FROM final