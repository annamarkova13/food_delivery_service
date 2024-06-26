-- For each day, we will calculate the average number of minutes couriers took to deliver their orders.

SELECT date,
    round(avg(minutes)) as minutes_to_deliver
FROM
    (SELECT order_id, max(time)::date as date, 
        extract(epoch from age(max(time), min(time)))/60 as minutes
        
    FROM courier_actions
    where order_id in 
        (SELECT order_id
        FROM courier_actions
        where action='deliver_order')
    group by order_id) t1
group by date
order by date
