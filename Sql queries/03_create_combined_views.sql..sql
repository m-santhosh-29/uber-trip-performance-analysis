
USE project;

-- Create a view combining Uber trip details with pickup and drop-off locations
CREATE OR REPLACE VIEW uber_trip_analysis AS
SELECT
    t.`Trip ID`,
    t.`Pickup Time`,
    t.`Drop Off Time`,
    t.passenger_count,
    t.trip_distance,
    t.PULocationID,
    pu.Location AS pickup_location,
    pu.City AS pickup_city,
    t.DOLocationID,
    doff.Location AS dropoff_location,
    doff.City AS dropoff_city,
    t.fare_amount,
    t.`Surge Fee`,
    t.Vehicle,
    t.Payment_type
FROM `Uber Trip Details` AS t
LEFT JOIN `location table` AS pu
    ON t.PULocationID = pu.LocationID
LEFT JOIN `location table` AS doff
    ON t.DOLocationID = doff.LocationID;

-- Check the combined view
SELECT *
FROM uber_trip_analysis
LIMIT 20;

-- Check the total number of trips in the combined view
SELECT COUNT(*) AS total_trips
FROM uber_trip_analysis;

-- Check trips where pickup or drop-off location details are missing
SELECT COUNT(*) AS trips_with_missing_locations
FROM uber_trip_analysis
WHERE pickup_location IS NULL
   OR dropoff_location IS NULL;
