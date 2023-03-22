SELECT *
  FROM {{ref('weather_by_month')}}
    PIVOT(SUM(ROW_COUNT) FOR WEATHER_CONDITION IN ('Rain', 'Fog', 'Overcast', 'Light Rain', 'Fair', 'Cloudy', 'Clear'))
      AS p (MONTH, Rain, Fog, Overcast, Light_Rain, Fair, Cloudy, Clear)
ORDER BY MONTH
