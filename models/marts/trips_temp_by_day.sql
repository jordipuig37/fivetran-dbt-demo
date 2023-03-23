WITH dim_date AS (
    SELECT * FROM {{ ref('dim_date') }}
),

f_trips AS (
    SELECT * FROM {{ ref('f_trips') }}
),

trips_by_day AS (
    SELECT DATE_KEY, COUNT(*) AS N_TRIPS
    FROM f_trips
    GROUP BY DATE_KEY
),

f_weather AS (
    SELECT * FROM {{ ref('f_weather') }}
),

weather_by_day AS (
    SELECT DATE_KEY, AVG(TEMP) AS AVG_TEMP
    FROM f_weather
    GROUP BY DATE_KEY
),

final AS (
    SELECT dd.DATE_DT AS DATE, tbd.N_TRIPS, wbd.AVG_TEMP
    FROM trips_by_day AS tbd
        join weather_by_day AS wbd
            on tbd.DATE_KEY = wbd.DATE_KEY
        join dim_date AS dd
            on tbd.DATE_KEY = dd.DATE_KEY
)

SELECT * FROM final