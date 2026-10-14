
USE project;

-- 01. Total trips
-- Business Use: Measure overall trip demand
-- SQL Concepts: COUNT
SELECT COUNT(*) AS total_trips
FROM uber_trip_analysis;


-- 02. Total fare amount
-- Business Use: Measure total recorded fare value
-- SQL Concepts: SUM
SELECT ROUND(SUM(fare_amount), 2) AS total_fare_amount
FROM uber_trip_analysis;


-- 03. Average fare per trip
-- Business Use: Understand the average fare value
-- SQL Concepts: AVG
SELECT ROUND(AVG(fare_amount), 2) AS avg_fare
FROM uber_trip_analysis;


-- 04. Average trip distance
-- Business Use: Understand typical trip distance
-- SQL Concepts: AVG
SELECT ROUND(AVG(trip_distance), 2) AS avg_trip_distance
FROM uber_trip_analysis;


-- 05. Trips by vehicle type
-- Business Use: Compare demand across vehicle types
-- SQL Concepts: GROUP BY
SELECT
    Vehicle,
    COUNT(*) AS total_trips
FROM uber_trip_analysis
GROUP BY Vehicle
ORDER BY total_trips DESC;


-- 06. Payment method distribution
-- Business Use: Understand payment method usage
-- SQL Concepts: GROUP BY
SELECT
    Payment_type,
    COUNT(*) AS total_trips
FROM uber_trip_analysis
GROUP BY Payment_type
ORDER BY total_trips DESC;


-- 07. Top 10 pickup locations
-- Business Use: Identify locations with the highest trip demand
-- SQL Concepts: JOIN + GROUP BY + ORDER BY
SELECT
    pickup_location,
    pickup_city,
    COUNT(*) AS total_trips
FROM uber_trip_analysis
GROUP BY pickup_location, pickup_city
ORDER BY total_trips DESC
LIMIT 10;


-- 08. Top 10 drop-off locations
-- Business Use: Identify the most popular trip destinations
-- SQL Concepts: GROUP BY + ORDER BY + LIMIT
SELECT
    dropoff_location,
    dropoff_city,
    COUNT(*) AS total_trips
FROM uber_trip_analysis
GROUP BY dropoff_location, dropoff_city
ORDER BY total_trips DESC
LIMIT 10;


-- 09. Fare amount by vehicle type
-- Business Use: Compare fare totals and average fares across vehicles
-- SQL Concepts: GROUP BY + SUM + AVG
SELECT
    Vehicle,
    COUNT(*) AS total_trips,
    ROUND(SUM(fare_amount), 2) AS total_fare_amount,
    ROUND(AVG(fare_amount), 2) AS avg_fare
FROM uber_trip_analysis
GROUP BY Vehicle
ORDER BY total_fare_amount DESC;


-- 10. Surge fee analysis
-- Business Use: Understand recorded surge fees by vehicle type
-- SQL Concepts: GROUP BY + SUM + AVG
SELECT
    Vehicle,
    ROUND(SUM(`Surge Fee`), 2) AS total_surge_fees,
    ROUND(AVG(`Surge Fee`), 2) AS avg_surge_fee
FROM uber_trip_analysis
GROUP BY Vehicle
ORDER BY total_surge_fees DESC;
