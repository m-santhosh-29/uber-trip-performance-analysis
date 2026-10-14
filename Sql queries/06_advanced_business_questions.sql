
USE project;

-- 01. Rank pickup locations by trip demand
-- Business Use: Identify the busiest pickup locations
-- SQL Concepts: CTE + RANK
WITH pickup_demand AS (
    SELECT
        PULocationID,
        pickup_location,
        pickup_city,
        COUNT(*) AS total_trips
    FROM uber_trip_analysis
    GROUP BY PULocationID, pickup_location, pickup_city
)
SELECT
    PULocationID,
    pickup_location,
    pickup_city,
    total_trips,
    RANK() OVER (ORDER BY total_trips DESC) AS demand_rank
FROM pickup_demand
ORDER BY demand_rank
LIMIT 20;

-- 02. Rank vehicle types by trip demand
-- Business Use: Compare vehicle popularity
-- SQL Concepts: CTE + RANK
WITH vehicle_demand AS (
    SELECT
        Vehicle,
        COUNT(*) AS total_trips
    FROM uber_trip_analysis
    GROUP BY Vehicle
)
SELECT
    Vehicle,
    total_trips,
    RANK() OVER (ORDER BY total_trips DESC) AS vehicle_rank
FROM vehicle_demand
ORDER BY vehicle_rank;

-- 03. Calculate trip duration
-- Business Use: Understand how long trips take
-- SQL Concepts: TIMESTAMPDIFF + AVG
SELECT
    Vehicle,
    COUNT(*) AS total_trips,
    ROUND(
        AVG(TIMESTAMPDIFF(SECOND, `Pickup Time`, `Drop Off Time`)) / 60,
        2
    ) AS avg_duration_minutes
FROM uber_trip_analysis
WHERE `Pickup Time` IS NOT NULL
  AND `Drop Off Time` IS NOT NULL
  AND `Drop Off Time` >= `Pickup Time`
GROUP BY Vehicle
ORDER BY avg_duration_minutes DESC;

-- 04. Identify the longest trips
-- Business Use: Review trips with the greatest recorded distance
-- SQL Concepts: ORDER BY + LIMIT
SELECT
    `Trip ID`,
    pickup_location,
    dropoff_location,
    trip_distance,
    fare_amount,
    Vehicle
FROM uber_trip_analysis
WHERE trip_distance IS NOT NULL
ORDER BY trip_distance DESC
LIMIT 10;

-- 05. Calculate fare per distance unit
-- Business Use: Compare fare value relative to trip distance
-- SQL Concepts: CASE + calculated columns
SELECT
    Vehicle,
    COUNT(*) AS total_trips,
    ROUND(AVG(fare_amount / NULLIF(trip_distance, 0)), 2)
        AS avg_fare_per_distance_unit
FROM uber_trip_analysis
WHERE fare_amount IS NOT NULL
  AND trip_distance > 0
GROUP BY Vehicle
ORDER BY avg_fare_per_distance_unit DESC;

-- 06. Rank payment methods by total fare
-- Business Use: Compare recorded fare value by payment method
-- SQL Concepts: GROUP BY + DENSE_RANK
WITH payment_summary AS (
    SELECT
        Payment_type,
        COUNT(*) AS total_trips,
        SUM(fare_amount) AS total_fare
    FROM uber_trip_analysis
    GROUP BY Payment_type
)
SELECT
    Payment_type,
    total_trips,
    ROUND(total_fare, 2) AS total_fare_amount,
    DENSE_RANK() OVER (ORDER BY total_fare DESC) AS fare_rank
FROM payment_summary
ORDER BY fare_rank;

-- 07. Calculate daily trips and running total
-- Business Use: Track cumulative trip demand over time
-- SQL Concepts: CTE + SUM OVER
WITH daily_trips AS (
    SELECT
        DATE(`Pickup Time`) AS trip_date,
        COUNT(*) AS total_trips
    FROM uber_trip_analysis
    WHERE `Pickup Time` IS NOT NULL
    GROUP BY DATE(`Pickup Time`)
)
SELECT
    trip_date,
    total_trips,
    SUM(total_trips) OVER (
        ORDER BY trip_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_trips
FROM daily_trips
ORDER BY trip_date;

-- 08. Compare each month's trips with the previous month
-- Business Use: Monitor month-over-month demand changes
-- SQL Concepts: CTE + LAG
WITH monthly_trips AS (
    SELECT
        DATE_FORMAT(`Pickup Time`, '%Y-%m') AS trip_month,
        COUNT(*) AS total_trips
    FROM uber_trip_analysis
    WHERE `Pickup Time` IS NOT NULL
    GROUP BY DATE_FORMAT(`Pickup Time`, '%Y-%m')
),
monthly_comparison AS (
    SELECT
        trip_month,
        total_trips,
        LAG(total_trips) OVER (ORDER BY trip_month) AS previous_month_trips
    FROM monthly_trips
)
SELECT
    trip_month,
    total_trips,
    previous_month_trips,
    total_trips - previous_month_trips AS trip_change
FROM monthly_comparison
ORDER BY trip_month;

-- 09. Find the top 3 pickup locations in each city
-- Business Use: Identify leading pickup locations within each city
-- SQL Concepts: CTE + ROW_NUMBER
WITH location_demand AS (
    SELECT
        pickup_city,
        PULocationID,
        pickup_location,
        COUNT(*) AS total_trips
    FROM uber_trip_analysis
    GROUP BY pickup_city, PULocationID, pickup_location
),
ranked_locations AS (
    SELECT
        pickup_city,
        PULocationID,
        pickup_location,
        total_trips,
        ROW_NUMBER() OVER (
            PARTITION BY pickup_city
            ORDER BY total_trips DESC, PULocationID
        ) AS location_rank
    FROM location_demand
)
SELECT
    pickup_city,
    PULocationID,
    pickup_location,
    total_trips,
    location_rank
FROM ranked_locations
WHERE location_rank <= 3
ORDER BY pickup_city, location_rank;

-- 10. Executive KPI summary
-- Business Use: Create a high-level summary for reporting
-- SQL Concepts: Aggregate functions + conditional aggregation
SELECT
    COUNT(*) AS total_trips,
    COUNT(DISTINCT `Trip ID`) AS unique_trip_ids,
    ROUND(SUM(fare_amount), 2) AS total_fare_amount,
    ROUND(AVG(fare_amount), 2) AS avg_fare,
    ROUND(AVG(trip_distance), 2) AS avg_trip_distance,
    ROUND(AVG(passenger_count), 2) AS avg_passenger_count,
    SUM(CASE WHEN `Surge Fee` > 0 THEN 1 ELSE 0 END)
        AS trips_with_surge_fee
FROM uber_trip_analysis;
