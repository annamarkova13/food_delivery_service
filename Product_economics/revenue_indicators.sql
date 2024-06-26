-- Calculation of metrics:
-- Revenue generated per day.
-- Cumulative revenue up to the current day.
-- Increase in revenue generated on that day compared to the revenue of the previous day.

SELECT date,
    revenue, 
    sum(revenue) over(order by date) as total_revenue, 
    round(100*revenue/lag(revenue,1) over()-100,2) as revenue_change
 FROM
    (SELECT date,
        sum(price) as revenue
    FROM
        (SELECT creation_time::date as date,
            order_id, unnest(product_ids) as product_id
        FROM orders
        where order_id NOT IN (SELECT order_id FROM user_actions WHERE action = 'cancel_order')) t1
    left join products using(product_id)
    group by date
    order by date) t2
