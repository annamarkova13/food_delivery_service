-- For each day, we will calculate the following metrics:
-- 1. Number of paying users per active courier.
-- 2. Number of orders per active courier.
-- Paying users are those who placed at least one order on that day, which was not subsequently canceled.
-- Couriers are considered active if on that day they accepted at least one order that was delivered (possibly on the next day), or they delivered any order.

with 
sub_1 as 
    (SELECT time::date as date, COUNT(order_id) as orders
    FROM user_actions
    WHERE order_id not in (SELECT order_id FROM user_actions WHERE action='cancel_order')
    GROUP BY date),

sub_2 as 
    (SELECT time::date as date, 
        COUNT(distinct courier_id) as active_couriers, 
        COUNT(distinct user_id) as active_users
    FROM courier_actions full join user_actions using(time, order_id)
    WHERE order_id not in (SELECT order_id FROM user_actions WHERE action='cancel_order')
    GROUP BY date
    ORDER BY date)

SELECT date,
    ROUND(active_users::decimal/active_couriers,2) as users_per_courier,
    ROUND(orders::decimal/active_couriers,2) as orders_per_courier
FROM sub_1 join sub_2 using(date)
ORDER BY date
