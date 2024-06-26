-- Calculating the number of delivered orders, canceled orders, and the share of canceled orders in the total number of orders for each hour.

with
t1 as
    (SELECT DATE_PART('hour',time)::integer as hour,
            count(order_id) as successful_orders
    FROM user_actions
    where order_id IN 
        (SELECT order_id FROM courier_actions 
        WHERE action = 'deliver_order') 
    group by hour
    order by hour),
    
t2 as
    (SELECT DATE_PART('hour',time)::integer as hour,
            count(DISTINCT order_id) as canceled_orders
    FROM user_actions
    where order_id in (select order_id from user_actions where action='cancel_order')
        and action='create_order'
    group by hour
    order by hour),

t3 as
    (SELECT DATE_PART('hour',time)::integer as hour,
        count(order_id) as total_orders
    from user_actions
    where action='create_order'
    group by hour)

SELECT hour, successful_orders, canceled_orders,
    round(canceled_orders/total_orders::decimal,3) as cancel_rate
FROM t1
join t2 using(hour)
join t3 using(hour)


