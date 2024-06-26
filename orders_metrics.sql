-- For each item in the user actions table, we will calculate the following metrics:
-- 1. Total number of orders.
-- 2. Number of first orders (orders placed by users for the first time).
-- 3. Number of orders by new users (orders placed by users on the same day they first used the service).
-- 4. Share of first orders in the total number of orders (ratio of item 2 to item 1).
-- 5. Share of orders by new users in the total number of orders.

with
total_orders as 
    (SELECT
        time::date as date,
        count(DISTINCT order_id) as orders
    FROM user_actions
    where order_id not in (SELECT order_id from user_actions
                            where action='cancel_order')
    group by date),

first_orders as 
    (SELECT 
        start_date as date,
        count(DISTINCT user_id) as new_users
    FROM   
        (SELECT 
            user_id,
            min(time::date) as start_date
        FROM   user_actions
        where order_id not in (SELECT order_id from user_actions where action='cancel_order')
        GROUP BY user_id) t1
    GROUP BY start_date),

new_users_orders as 
    (select 
        time::date as date, 
        count(order_id) as new_users_orders
    from 
        (SELECT *
        from user_actions
        
        FULL JOIN 
            (SELECT 
                user_id,
                min(time::date) as start_date
            FROM   user_actions
            GROUP BY user_id
            ) t1 using(user_id)
        where order_id not in 
            (SELECT order_id from user_actions where action='cancel_order')
        ) t2
    where time::date=start_date
    group by date)

SELECT date, orders, new_users as first_orders, new_users_orders,
    round(100*new_users/orders::decimal,2) as first_orders_share,
    round(100*new_users_orders/orders::decimal,2) as new_users_orders_share
from total_orders
join first_orders using(date)
join new_users_orders using(date)

