-- **Project Summary: World Life Expectancy Data Cleaning**

-- **Objective:**
-- The goal of this project is to clean and standardize the `world_life_expectancy` dataset by removing duplicates, correcting missing data, and ensuring consistency in country statuses.

-- **1. Data Inspection:**
-- Retrieve all records from the dataset to inspect its structure and contents.
SELECT *
FROM world_life_expectancy;

-- **2. Duplicate Removal:**
-- Identify duplicate records based on the combination of `country` and `year`.
SELECT country, year, CONCAT(country, year) AS country_year, COUNT(CONCAT(country, year)) AS record_count
FROM world_life_expectancy
GROUP BY country, year, CONCAT(country, year)
HAVING COUNT(CONCAT(country, year)) > 1;

-- Identify specific duplicate rows with row numbers.
SELECT ROW_ID, CONCAT(country, year) AS country_year,
       ROW_NUMBER() OVER (PARTITION BY CONCAT(country, year) ORDER BY CONCAT(country, year)) AS Row_Num
FROM world_life_expectancy
WHERE Row_Num > 1;

-- Delete duplicate rows by Row_ID.
DELETE FROM world_life_expectancy
WHERE Row_ID IN (
    SELECT ROW_ID
    FROM (
        SELECT ROW_ID, CONCAT(country, year) AS country_year,
               ROW_NUMBER() OVER (PARTITION BY CONCAT(country, year) ORDER BY CONCAT(country, year)) AS Row_Num
        FROM world_life_expectancy
    ) AS Row_Table
    WHERE Row_Num > 1
);

-- **3. Record Correction:**
-- Delete a specific incorrect record by Row_ID.
DELETE FROM world_life_expectancy
WHERE Row_ID = 1252;

-- **4. Data Standardization:**
-- Inspect unique status values to check for inconsistencies.
SELECT DISTINCT(Status)
FROM world_life_expectancy
WHERE Status <> '';

-- Identify countries with 'Developing' status.
SELECT country 
FROM world_life_expectancy
WHERE Status = 'Developing';

-- Update empty status values by referencing existing records.
UPDATE world_life_expectancy T1
JOIN world_life_expectancy T2 ON T1.Country = T2.Country
SET T1.Status = 'Developing'
WHERE T1.Status = ''
  AND T2.Status = 'Developing';



