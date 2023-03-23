{{
    config(
        materialized='table',
        unique_key='station_id'
    )
}}

WITH all_stations AS (
    SELECT DISTINCT START_STATION_ID AS STATION_ID,
                    START_STATION_NAME AS STATION_NAME,
                    START_STATION_LATITUDE AS STATION_LATITUDE,
                    START_STATION_LONGITUDE AS STATION_LONGITUDE
    FROM {{ ref('trips_data') }}
    UNION
    SELECT DISTINCT END_STATION_ID AS STATION_ID,
                    END_STATION_NAME AS STATION_NAME,
                    END_STATION_LATITUDE AS STATION_LATITUDE,
                    END_STATION_LONGITUDE AS STATION_LONGITUDE
    FROM {{ ref('trips_data') }}
),

filtered_stations AS (
    SELECT * FROM all_stations
    WHERE STATION_LATITUDE != 0 AND STATION_LONGITUDE != 0
),

final as (
    SELECT STATION_ID, STATION_NAME,
            MAX(STATION_LATITUDE) AS STATION_LATITUDE,
            MAX(STATION_LONGITUDE) AS STATION_LONGITUDE
    FROM filtered_stations
    GROUP BY 1, 2
)

SELECT * FROM final