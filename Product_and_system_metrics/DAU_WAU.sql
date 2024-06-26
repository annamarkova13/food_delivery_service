-- DAU
SELECT time::date as date,
    count(user_id) as users_count
FROM user_actions
group by time::date
order by date

-- WAU
SELECT DATE_PART('week',time)::integer as week,
    count(user_id) as users_count
FROM user_actions
group by 1
order by week
