-- Calculation of metrics:
-- Revenue generated on that day.
-- Revenue from orders placed by new users on that day.
-- Share of revenue from new user orders in the total revenue generated on that day.
-- Share of revenue from existing user orders in the total revenue generated on that day.

with
orders_data as
(SELECT order_id, user_id, creation_time::date as date, sum(price) as order_price,
    case 
    when creation_time::date=reg_date then 'new_user'
    else 'old_user'
    end as user_type
from
    (SELECT 
        user_id, reg_date, order_id, creation_time, product_id, price
    from
        (SELECT 
            order_id, creation_time, unnest(product_ids) as product_id
        FROM orders
        where order_id NOT IN 
            (SELECT order_id FROM user_actions 
            WHERE action = 'cancel_order')) t1
    left join products using (product_id)
    left join user_actions using(order_id)
    left join (
        SELECT min(time)::date as reg_date, user_id
        from user_actions
        group by user_id) t4 using(user_id)
    ) t2
group by order_id, creation_time, user_id, reg_date)


SELECT 
    date, 
    revenue, 
    new_users_revenue, 
    round(100*new_users_revenue/revenue,2) as new_users_revenue_share, 
    round(100*old_users_revenue/revenue,2) as old_users_revenue_share
from 
    (SELECT 
        date,
        sum(order_price) as revenue,
        sum(order_price) filter(where user_type='new_user') as new_users_revenue,
        coalesce(sum(order_price) filter(where user_type='old_user'),0) as old_users_revenue
    from orders_data
    group by date
    order by date) t1



