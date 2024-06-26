with 
users_pay as 
	(SELECT time::date as date,
          count(distinct user_id) as paying_users
   FROM   user_actions
   WHERE  order_id not in (SELECT order_id
                           FROM   user_actions
                           WHERE  action = 'cancel_order')
   GROUP BY date
   ORDER BY date), 
   
couriers_pay as 
	(SELECT time::date as date,
          count(distinct courier_id) as active_couriers
   FROM   courier_actions
   WHERE  order_id in (SELECT order_id
                       FROM   courier_actions
                       WHERE  action = 'deliver_order')
   GROUP BY date
   ORDER BY date), 
   
total as 
	(SELECT start_date as date,
          (sum(new_users) OVER (ORDER BY start_date))::int as total_users,
          (sum(new_couriers) OVER (ORDER BY start_date))::int as total_couriers
   FROM   (SELECT start_date,
                  count(courier_id) as new_couriers
           FROM   (SELECT courier_id,
                          min(time::date) as start_date
                   FROM   courier_actions
                   GROUP BY courier_id) t1
           GROUP BY start_date) t2
	 LEFT JOIN (SELECT start_date,
                     count(user_id) as new_users
              FROM   (SELECT user_id,
                             min(time::date) as start_date
                      FROM   user_actions
                      GROUP BY user_id) t3
              GROUP BY start_date) t4 using (start_date))
SELECT date,
       paying_users,
       active_couriers,
       round(paying_users::decimal/total_users*100, 2) as paying_users_share,
       round(active_couriers::decimal/total_couriers*100, 2) as active_couriers_share
FROM   users_pay join couriers_pay using(date) join total using(date)
