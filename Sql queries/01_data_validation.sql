
USE project;

-- Display all tables in the project database
SHOW TABLES;

-- Check the number of rows in Uber Trip Details
SELECT COUNT(*) AS total_trips
FROM `Uber Trip Details`;

-- Check the number of rows in the location table
SELECT COUNT(*) AS total_locations
FROM `location table`;

-- Check column names and data types in Uber Trip Details
DESCRIBE `Uber Trip Details`;

-- Check column names and data types in the location table
DESCRIBE `location table`;

-- Check the number of columns in each table
SELECT
    TABLE_NAME,
    COUNT(*) AS total_columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'project'
  AND TABLE_NAME IN ('Uber Trip Details', 'location table')
GROUP BY TABLE_NAME;

-- Check for duplicate trip IDs
SELECT `Trip ID`, COUNT(*) AS copies
FROM `Uber Trip Details`
GROUP BY `Trip ID`
HAVING COUNT(*) > 1;

-- Check for duplicate location IDs
SELECT LocationID, COUNT(*) AS copies
FROM `location table`
GROUP BY LocationID
HAVING COUNT(*) > 1;
