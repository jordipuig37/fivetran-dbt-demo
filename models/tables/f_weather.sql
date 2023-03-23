WITH stg_table AS (
    SELECT * FROM {{ ref('stg_weather') }}
),

final AS (
    SELECT
        STATION AS STATION_KEY,
        TO_CHAR(OBS_TIME, 'YYYYMMDD')::INT AS DATE_KEY,
        OBS_TIME,
        TEMP,
        DWPT,
        RHUM,
        PRCP,
        WDIR,
        WSPD,
        PRES,
        COCO
    FROM stg_table
)

SELECT * FROM final