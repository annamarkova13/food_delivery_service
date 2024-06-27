-- Calculation of metrics:
-- Revenue per user (ARPU).
-- Revenue per paying user (ARPPU).
-- Revenue per order (AOV).
-- In our calculations, we will only consider data from August 26, 2022, to September 8, 2022, inclusive—ensuring the analysis includes an equal number of all weekdays (exactly two days each).
-- The resulting table will include both the names of the days of the week (e.g., Monday) and the ordinal number of the day of the week (from 1 to 7, where 1 is Monday and 7 is Sunday).

SELECT
    weekday, weekday_number,
    round(revenue/unique_users_cnt,2) as arpu,
    round(revenue/paying_users_cnt,2) as arppu, 
    round(aov,2) as aov
FROM
    (SELECT
        TO_CHAR(time, 'Day') as weekday,
        date_part('isodow', time) as weekday_number,
        sum(order_price) filter(where order_status='payed_order') as revenue, 
        count(DISTINCT user_id) as unique_users_cnt,
        count(DISTINCT user_id) filter(where order_status='payed_order') as paying_users_cnt,
        avg(order_price) filter(where order_status='payed_order') aov
    FROM 
        (SELECT 
            time, order_id, user_id, order_price, action,
            case
                when order_id IN 
                    (SELECT order_id FROM user_actions WHERE action = 'cancel_order')
                    then 'canceled_order'
                else 'payed_order'
            end as order_status    
        FROM
            (SELECT creation_time, order_id, 
                   sum(price) as order_price
            FROM
                (SELECT creation_time, order_id, unnest(product_ids) as product_id
                FROM orders
                where creation_time::date between '2022/08/26' and '2022/09/08'
                ) t1
            left join products using(product_id)
            group by creation_time, order_id
            ) t2
        LEFT JOIN user_actions using(order_id)
         ) t3
    group by weekday_number, weekday
    order by weekday_number
    ) t4
