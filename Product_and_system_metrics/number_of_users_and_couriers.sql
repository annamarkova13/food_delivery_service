WITH courier_start_dates AS (
    SELECT
        courier_id,
        MIN(time::date) AS start_date
    FROM courier_actions
    GROUP BY courier_id
),
new_couriers_by_date AS (
    SELECT
        start_date,
        COUNT(courier_id) AS new_couriers
    FROM courier_start_dates
    GROUP BY start_date
),
user_start_dates AS (
    SELECT
        user_id,
        MIN(time::date) AS start_date
    FROM user_actions
    GROUP BY user_id
),
new_users_by_date AS (
    SELECT
        start_date,
        COUNT(user_id) AS new_users
    FROM user_start_dates
    GROUP BY start_date
)
SELECT
    COALESCE(d.start_date, nu.start_date, nc.start_date) AS date,
    COALESCE(new_users, 0) AS new_users,
    COALESCE(new_couriers, 0) AS new_couriers,
    SUM(COALESCE(new_users, 0)) OVER (ORDER BY COALESCE(d.start_date, nu.start_date, nc.start_date))::int AS total_users,
    SUM(COALESCE(new_couriers, 0)) OVER (ORDER BY COALESCE(d.start_date, nu.start_date, nc.start_date))::int AS total_couriers
FROM
    (SELECT DISTINCT start_date FROM courier_start_dates
     UNION
     SELECT DISTINCT start_date FROM user_start_dates) d
LEFT JOIN
    new_couriers_by_date nc ON d.start_date = nc.start_date
LEFT JOIN
    new_users_by_date nu ON d.start_date = nu.start_date
ORDER BY
    date;
