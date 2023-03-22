SELECT WEATHER_CONDITION, MONTH(OBS_TIME) AS MONTH, COUNT(*) AS ROW_COUNT
FROM FIVETRAN_DATABASE.S3_DEMO.WEATHER_NYC
GROUP BY WEATHER_CONDITION, MONTH