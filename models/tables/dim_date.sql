{{
    config(
        materialized='table',
        unique_key='date_key'
    )
}}
WITH distinct_dates AS (
    SELECT DISTINCT
        TO_CHAR(STARTTIME, 'YYYYMMDD')::INT AS DATE_KEY,
        DATE_TRUNC('DAY', STARTTIME) AS DATETIME_DAY
    FROM {{ ref('trips_data') }}
),

final as (
    SELECT
        DATE_KEY,
        DATETIME_DAY
        -- TODO: ADD OTHER HIERARCHIC FIELDS
    FROM distinct_dates
)

SELECT * FROM final