{{
    config(
        materialized='table',
        unique_key=['date_key', 'start_station_id', 'end_station_id']
    )
}}

SELECT 
    TO_CHAR(STARTTIME, 'YYYYMMDD')::INT AS DATE_KEY,
    START_STATION_ID,
    END_STATION_ID,
    BIKEID,
    USERTYPE,
    BIRTH_YEAR,
    GENDER,
    TRIPDURATION,
    STARTTIME,
    STOPTIME
FROM FIVETRAN_DATABASE.S3_DEMO.TRIPS_DATA
