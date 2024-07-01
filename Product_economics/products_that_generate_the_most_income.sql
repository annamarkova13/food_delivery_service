-- For each product listed in the products table, we will calculate the following metrics for the entire period covered in the orders table:
-- The total revenue generated from the sale of this product over the entire period.
-- The share of revenue from the sale of this product in the total revenue generated over the entire period.
-- Products with a rounded share of revenue less than 0.5% will be combined into a general category named "OTHER," summing the rounded shares of these products.

SELECT 
    product_name, 
    sum(revenue) as revenue, 
    sum(share_in_revenue) as share_in_revenue
from 
    (SELECT 
        case
        when round(100*sum(price)/total_revenue,2)>0.5 then name
        else 'ДРУГОЕ'
        end as product_name, 
        sum(price) as revenue,
        round(100*sum(price)/total_revenue,2) as share_in_revenue
    from 
        (SELECT creation_time, order_id, product_id, name, price,
            sum(price) over() as total_revenue
        FROM 
            (SELECT creation_time, order_id, unnest(product_ids) as product_id
            FROM orders
            where order_id IN 
                (SELECT order_id 
                FROM courier_actions 
                WHERE action = 'deliver_order')
            ) t1
        left join products using(product_id)
        ) t2
    group by name, total_revenue
    order by revenue desc 
    ) t3
group by product_name
order by revenue desc 
