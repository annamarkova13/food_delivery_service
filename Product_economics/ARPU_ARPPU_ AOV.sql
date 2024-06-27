-- Calculation of metrics:
-- Revenue per user (ARPU) for the current day.
-- Revenue per paying user (ARPPU) for the current day.
-- Revenue per order, or average order value (AOV), for the current day.

SELECT
    date,
    round(revenue/unique_users_cnt,2) as arpu,
    round(revenue/paying_users_cnt,2) as arppu, 
    round(aov,2) as aov
FROM
    (SELECT
        time::date as date,
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
                ) t1
            left join products using(product_id)
            group by creation_time, order_id
            ) t2
        LEFT JOIN user_actions using(order_id)
         ) t3
    group by date
    order by date
    ) t4
