WITH PIVOT_WEATHER AS (
    SELECT * FROM {{ref('pivot_weather')}}
),

TRIPS_BY_MONHT AS (
    SELECT * FROM {{ref('trips_by_month')}}
),

FINAL AS (
    SELECT pw.*, tbm.N_TRIPS
    FROM PIVOT_WEATHER pw
    JOIN TRIPS_BY_MONTH tbm
        ON pw.MONTH = tbm.MONTH
)

SELECT * FROM FINAL
