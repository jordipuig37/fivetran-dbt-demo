{{
    config(
        materialized='table',
        unique_key='station_id'
    )
}}

WITH ALL_STATIONS AS (
    SELECT DISTINCT START_STATION_ID AS STATION_ID,
                    START_STATION_NAME AS STATION_NAME,
                    START_STATION_LATITUDE AS STATION_LATITUDE,
                    START_STATION_LONGITUDE AS STATION_LONGITUDE
    FROM FIVETRAN_DATABASE.S3_DEMO.TRIPS_DATA
    UNION
    SELECT DISTINCT END_STATION_ID AS STATION_ID,
                    END_STATION_NAME AS STATION_NAME,
                    END_STATION_LATITUDE AS STATION_LATITUDE,
                    END_STATION_LONGITUDE AS STATION_LONGITUDE
    FROM FIVETRAN_DATABASE.S3_DEMO.TRIPS_DATA
),

FILTERED_STATIONS AS (
    SELECT * FROM ALL_STATIONS
    WHERE STATION_LATITUDE != 0 AND STATION_LONGITUDE != 0
)

SELECT STATION_ID, STATION_NAME,
        MAX(STATION_LATITUDE) AS STATION_LATITUDE,
        MAX(STATION_LONGITUDE) AS STATION_LONGITUDE
FROM FILTERED_STATIONS
GROUP BY 1, 2
