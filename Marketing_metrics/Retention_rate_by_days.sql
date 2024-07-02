SELECT date_trunc('month', start_date)::date start_month, start_date, 
    round(users_cnt::decimal / max(users_cnt) 
        over(partition by start_date),2) as retention,
    time-start_date as day_number
from
    (SELECT time, start_date, 
        count(DISTINCT user_id) as users_cnt
    from (SELECT user_id,
            time::date,
            min(time::date) over(partition by user_id) start_date
        FROM user_actions) t1
    group by start_date, time::Date) t2
order by start_date, day_number
