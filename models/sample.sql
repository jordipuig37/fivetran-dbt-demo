select weather_conditions as conditions,
       count(*) as num_trips
from FIVETRAN_DATABASE.S3_DEMO.TRIPS_DEMO
left outer join FIVETRAN_DATABASE.S3_DEMO.WEATHER_NYC
    on date_trunc('hour', observation_time) = date_trunc('hour', starttime)
where conditions is not null
group by 1
order by 2 desc;