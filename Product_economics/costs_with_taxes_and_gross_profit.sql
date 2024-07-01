-- 1. Revenue Generated on That Day
--    The total amount earned from sales on a specific day.
-- 2. Costs Incurred on That Day
--    The total expenses associated with producing or procuring the products sold on that day.
-- 3. VAT Collected from Sales on That Day
--    The value-added tax collected on sales for that specific day.
-- 4. Gross Profit for the Day
--    Calculated as: Revenue - Costs - VAT. This represents the profit made from sales after accounting for costs and taxes.
-- 5. Total Revenue Up to That Day
--     The cumulative revenue generated from the start of the period up to and including that day.
-- 6. Total Costs Up to That Day
--     The cumulative costs incurred from the start of the period up to and including that day.
-- 7. Total VAT Up to That Day 
--     The cumulative VAT collected from sales from the start of the period up to and including that day.
-- 8. Total Gross Profit Up to That Day 
--     Calculated as: Total Revenue - Total Costs - Total VAT. This shows the cumulative gross profit earned from sales over the period.
-- 9. Share of Gross Profit in Revenue for That Day
--     The ratio of the gross profit for that day to the revenue for that day, expressed as a percentage. This shows the proportion of revenue that remains as profit after accounting for costs and VAT.
-- 10. Share of Total Gross Profit in Total Revenue Up to That Day
--     The ratio of total gross profit to total revenue up to that day, expressed as a percentage. This indicates the overall profitability of the sales over the period.



with 

-- выручка и налоги
accepted_orders as 
    (SELECT 
        creation_time::date as date, order_id, product_id, name, price,
        case
        when name in ('сахар', 'сухарики', 'сушки', 'семечки', 
            'масло льняное', 'виноград', 'масло оливковое', 
            'арбуз', 'батон', 'йогурт', 'сливки', 'гречка', 
            'овсянка', 'макароны', 'баранина', 'апельсины', 
            'бублики', 'хлеб', 'горох', 'сметана', 'рыба копченая', 
            'мука', 'шпроты', 'сосиски', 'свинина', 'рис', 
            'масло кунжутное', 'сгущенка', 'ананас', 'говядина', 
            'соль', 'рыба вяленая', 'масло подсолнечное', 'яблоки', 
            'груши', 'лепешка', 'молоко', 'курица', 'лаваш', 'вафли', 'мандарины')
            then round(price/1.1*0.1,2)
        else round(price/1.2*0.2,2)
        end as tax
    from 
        (SELECT creation_time, order_id, unnest(product_ids) as product_id
        FROM orders
        where order_id NOT IN (SELECT order_id FROM user_actions WHERE action = 'cancel_order')) t1
    left join products using(product_id)
    ),


-- общие затраты (сборка+доставка+аренда)
total_costs as
    (SELECT date, total_costs+collection_costs as costs
    FROM
        (SELECT 
            date,
            case
               when DATE_PART('month',date)=8 then sum(cost_per_courier)+120000
               when DATE_PART('month',date)=9 then sum(cost_per_courier)+150000
            end as total_costs
        FROM
            (SELECT
                courier_id, date, delivered_orders,
                case
                    when delivered_orders>=5 AND DATE_PART('month', date)=8 -- август
                        then 400 + sum(delivered_orders*150)
                    when delivered_orders<5 AND DATE_PART('month', date)=8
                        then sum(delivered_orders*150)
                    when delivered_orders>=5 AND DATE_PART('month', date)=9 -- август
                        then 500 + sum(delivered_orders*150)
                    when delivered_orders<5 AND DATE_PART('month', date)=9
                        then sum(delivered_orders*150)
                end as cost_per_courier
            from
                (SELECT 
                    courier_id, time::date as date,
                    count(order_id) as delivered_orders
                from courier_actions
                where order_id in (SELECT order_id from courier_actions where action='deliver_order')
                    and action='deliver_order'
                group by courier_id, time::date
                ) t1
            group by courier_id, date, delivered_orders
            ) t2
        group by date) t3
    left join 
        (SELECT
            date,
            case
                when DATE_PART('month',date)=8 then sum(delivered_orders*140)
                when DATE_PART('month',date)=9 then sum(delivered_orders*115)
            end as collection_costs
        from
            (SELECT 
                courier_id, time::date as date,
                count(order_id) as delivered_orders
            from courier_actions
            where order_id in (SELECT order_id from courier_actions where action='deliver_order')
                    and action='accept_order'
            group by courier_id, time::date) t4
        group by date) t5 using (date)
    order by date)

-- revenue & tax
SELECT 
    date, revenue, costs, tax, gross_profit, 
    total_revenue, total_costs, total_tax, total_gross_profit, 
    round(100*gross_profit/revenue,2)as gross_profit_ratio,
    round(100*total_gross_profit/total_revenue,2) as total_gross_profit_ratio
from
    (SELECT
        date, revenue, costs, tax, gross_profit,
        sum(revenue) 
            over(order by date rows between 
            UNBOUNDED PRECEDING and current row) as total_revenue,
        sum(costs) 
            over(order by date rows between 
            UNBOUNDED PRECEDING and current row) as total_costs,
        sum(tax) 
            over(order by date rows between 
            UNBOUNDED PRECEDING and current row) as total_tax,
        sum(gross_profit) 
            over(order by date rows between 
            UNBOUNDED PRECEDING and current row) as total_gross_profit
    FROM
        (SELECT 
            date, revenue, costs, tax, 
            revenue-costs-tax as gross_profit
        from
            (SELECT 
                date,
                sum(price) as revenue,
                sum(tax) as tax
            from accepted_orders
            group by date
            order by date) r_t
        left join total_costs using(date)
        ) stats
    ) stats_1


