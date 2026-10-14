
USE project;

-- Check missing values in Uber trip details
SELECT
    SUM(`Trip ID` IS NULL) AS missing_trip_ids,
    SUM(`Pickup Time` IS NULL) AS missing_pickup_times,
    SUM(`Drop Off Time` IS NULL) AS missing_dropoff_times,
    SUM(passenger_count IS NULL) AS missing_passenger_counts,
    SUM(trip_distance IS NULL) AS missing_trip_distances,
    SUM(PULocationID IS NULL) AS missing_pickup_locations,
    SUM(DOLocationID IS NULL) AS missing_dropoff_locations,
    SUM(fare_amount IS NULL) AS missing_fares,
    SUM(`Surge Fee` IS NULL) AS missing_surge_fees,
    SUM(Vehicle IS NULL) AS missing_vehicles,
    SUM(Payment_type IS NULL) AS missing_payment_types
FROM `Uber Trip Details`;

-- Find duplicate trip IDs
SELECT `Trip ID`, COUNT(*) AS copies
FROM `Uber Trip Details`
GROUP BY `Trip ID`
HAVING COUNT(*) > 1;

-- Find duplicate location IDs
SELECT LocationID, COUNT(*) AS copies
FROM `location table`
GROUP BY LocationID
HAVING COUNT(*) > 1;

-- Check for negative trip distances, fares, and surge fees
SELECT *
FROM `Uber Trip Details`
WHERE trip_distance < 0
   OR fare_amount < 0
   OR `Surge Fee` < 0;

-- Check for zero or negative passenger counts
SELECT *
FROM `Uber Trip Details`
WHERE passenger_count <= 0;

-- Find pickup location IDs missing from the location table
SELECT t.PULocationID
FROM `Uber Trip Details` AS t
LEFT JOIN `location table` AS l
    ON t.PULocationID = l.LocationID
WHERE t.PULocationID IS NOT NULL
  AND l.LocationID IS NULL;

-- Find drop-off location IDs missing from the location table
SELECT t.DOLocationID
FROM `Uber Trip Details` AS t
LEFT JOIN `location table` AS l
    ON t.DOLocationID = l.LocationID
WHERE t.DOLocationID IS NOT NULL
  AND l.LocationID IS NULL;

-- Find trips where drop-off time is earlier than pickup time
SELECT *
FROM `Uber Trip Details`
WHERE `Pickup Time` IS NOT NULL
  AND `Drop Off Time` IS NOT NULL
  AND `Drop Off Time` < `Pickup Time`;
