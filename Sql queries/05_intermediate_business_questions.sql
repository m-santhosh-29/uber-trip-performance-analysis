
USE project;

-- 01. Trips by day
-- Business Use: Identify daily trip demand
-- SQL Concepts: DATE + GROUP BY
SELECT
    DATE(`Pickup Time`) AS trip_date,
    COUNT(*) AS total_trips
FROM uber_trip_analysis
GROUP BY DATE(`Pickup Time`)
ORDER BY trip_date;

-- 02. Trips by hour
-- Business Use: Identify peak travel hours
-- SQL Concepts: HOUR + GROUP BY
SELECT
    HOUR(`Pickup Time`) AS pickup_hour,
    COUNT(*) AS total_trips
FROM uber_trip_analysis
GROUP BY HOUR(`Pickup Time`)
ORDER BY total_trips DESC;

-- 03. Trips by day of the week
-- Business Use: Compare weekday and weekend demand patterns
-- SQL Concepts: DAYNAME + GROUP BY
SELECT
    DAYNAME(`Pickup Time`) AS day_name,
    COUNT(*) AS total_trips
FROM uber_trip_analysis
GROUP BY DAYOFWEEK(`Pickup Time`), DAYNAME(`Pickup Time`)
ORDER BY DAYOFWEEK(`Pickup Time`);

-- 04. Monthly trip demand
-- Business Use: Track demand trends across months
-- SQL Concepts: DATE_FORMAT + GROUP BY
SELECT
    DATE_FORMAT(`Pickup Time`, '%Y-%m') AS trip_month,
    COUNT(*) AS total_trips
FROM uber_trip_analysis
GROUP BY DATE_FORMAT(`Pickup Time`, '%Y-%m')
ORDER BY trip_month;

-- 05. Trips by city
-- Business Use: Compare trip demand across cities
-- SQL Concepts: GROUP BY + ORDER BY
SELECT
    pickup_city,
    COUNT(*) AS total_trips
FROM uber_trip_analysis
GROUP BY pickup_city
ORDER BY total_trips DESC;

-- 06. Average fare by payment method
-- Business Use: Compare average fares across payment methods
-- SQL Concepts: AVG + GROUP BY
SELECT
    Payment_type,
    COUNT(*) AS total_trips,
    ROUND(AVG(fare_amount), 2) AS avg_fare
FROM uber_trip_analysis
GROUP BY Payment_type
ORDER BY avg_fare DESC;

-- 07. Trips with and without surge fees
-- Business Use: Measure how often surge fees are recorded
-- SQL Concepts: CASE + SUM
SELECT
    CASE
        WHEN `Surge Fee` > 0 THEN 'With Surge Fee'
        ELSE 'No Surge Fee'
    END AS surge_status,
    COUNT(*) AS total_trips
FROM uber_trip_analysis
GROUP BY surge_status
ORDER BY total_trips DESC;

-- 08. Average distance by vehicle type
-- Business Use: Compare trip distances across vehicle types
-- SQL Concepts: AVG + GROUP BY
SELECT
    Vehicle,
    COUNT(*) AS total_trips,
    ROUND(AVG(trip_distance), 2) AS avg_trip_distance
FROM uber_trip_analysis
GROUP BY Vehicle
ORDER BY avg_trip_distance DESC;

-- 09. Top 10 pickup-to-drop-off routes
-- Business Use: Identify the most frequently travelled routes
-- SQL Concepts: GROUP BY + COUNT + ORDER BY
SELECT
    pickup_location,
    dropoff_location,
    COUNT(*) AS total_trips
FROM uber_trip_analysis
GROUP BY pickup_location, dropoff_location
ORDER BY total_trips DESC
LIMIT 10;

-- 10. Monthly fare trends
-- Business Use: Monitor monthly fare value
-- SQL Concepts: DATE_FORMAT + SUM + AVG
SELECT
    DATE_FORMAT(`Pickup Time`, '%Y-%m') AS trip_month,
    COUNT(*) AS total_trips,
    ROUND(SUM(fare_amount), 2) AS total_fare_amount,
    ROUND(AVG(fare_amount), 2) AS avg_fare
FROM uber_trip_analysis
GROUP BY DATE_FORMAT(`Pickup Time`, '%Y-%m')
ORDER BY trip_month;
