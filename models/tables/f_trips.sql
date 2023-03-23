{{
    config(
        unique_key=['date_key', 'start_station_id', 'end_station_id']
    )
}}

WITH final as (
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
    FROM {{ ref('stg_trips_data') }}
)
SELECT * FROM final