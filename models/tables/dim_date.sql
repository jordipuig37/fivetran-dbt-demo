WITH all_dates AS (
    select
        dateadd(day, seq4(), '2013-06-01') as day_dt
    FROM TABLE(generator(rowcount => 2200))
),

final AS (
    SELECT
        TO_CHAR(DAY_DT, 'YYYYMMDD')::INT AS DATE_KEY,
        DAY_DT AS DATE_DT,
        YEAR(DAY_DT) AS YEAR,
        MONTH(DAY_DT) AS MONTH,
        DAY(DAY_DT) AS DAY
    FROM all_dates
)

SELECT * FROM final