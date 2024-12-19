-- Exploratory Data Analysis on World Life Expectancy

-- 1. Inspect the data
SELECT *
FROM world_life_expectancy;

-- 2. Calculate life expectancy range per country
SELECT COUNTRY, 
       MIN(`LIFE EXPECTANCY`) AS Min_Life_Exp, 
       MAX(`LIFE EXPECTANCY`) AS Max_Life_Exp, 
       ROUND(MAX(`LIFE EXPECTANCY`) - MIN(`LIFE EXPECTANCY`), 1) AS Life_Increase_15_years
FROM world_life_expectancy 
GROUP BY COUNTRY
HAVING MIN(`LIFE EXPECTANCY`) <> 0 AND MAX(`LIFE EXPECTANCY`) <> 0
ORDER BY Life_Increase_15_years DESC;

-- 3. Identify the year with the highest average life expectancy
SELECT year, ROUND(AVG(`LIFE EXPECTANCY`), 2) AS Avg_Life_Exp
FROM world_life_expectancy
GROUP BY year
ORDER BY Avg_Life_Exp DESC;

-- 4. Analyze correlation between Life Expectancy and GDP
-- Average life expectancy and GDP by year
SELECT Year, 
       ROUND(AVG(`LIFE EXPECTANCY`), 0) AS Avg_Life_Exp, 
       ROUND(AVG(gdp), 0) AS Avg_GDP
FROM world_life_expectancy 
GROUP BY Year
ORDER BY Year DESC;

-- Average life expectancy and GDP by country
SELECT Country, 
       ROUND(AVG(`LIFE EXPECTANCY`), 0) AS Avg_Life_Exp, 
       ROUND(AVG(gdp), 0) AS Avg_GDP
FROM world_life_expectancy 
GROUP BY COUNTRY
HAVING Avg_Life_Exp <> 0 AND Avg_GDP <> 0
ORDER BY Avg_Life_Exp ASC;

-- Life expectancy based on GDP thresholds
SELECT SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) AS High_GDP_Count,
       AVG(CASE WHEN GDP >= 1500 THEN `LIFE EXPECTANCY` ELSE NULL END) AS High_GDP_Life_Exp,
       SUM(CASE WHEN GDP < 1500 THEN 1 ELSE 0 END) AS Low_GDP_Count,
       AVG(CASE WHEN GDP < 1500 THEN `LIFE EXPECTANCY` ELSE NULL END) AS Low_GDP_Life_Exp
FROM world_life_expectancy;

-- 5. Life expectancy by development status
SELECT Status, 
       AVG(`LIFE EXPECTANCY`) AS Avg_Life_Exp, 
       COUNT(DISTINCT country) AS Country_Count
FROM world_life_expectancy
GROUP BY Status;

-- 6. Finding correlation between BMI and life expectancy
SELECT DISTINCT Country, 
       ROUND(AVG(`LIFE EXPECTANCY`), 1) AS Avg_Life_Exp, 
       ROUND(AVG(BMI), 1) AS Avg_BMI
FROM world_life_expectancy
GROUP BY Country
HAVING Avg_Life_Exp > 0 AND Avg_BMI > 0
ORDER BY Avg_BMI DESC;

-- Conclusion: No significant correlation between BMI and life expectancy.

-- 7. Life expectancy vs HIV/AIDS prevalence
SELECT Country, 
       ROUND(AVG(`HIV/AIDS`), 1) AS Avg_HIV, 
       ROUND(AVG(`LIFE EXPECTANCY`), 1) AS Avg_Life_Exp
FROM world_life_expectancy
GROUP BY Country
HAVING Avg_HIV > 0 AND Avg_Life_Exp > 68
ORDER BY Avg_HIV DESC;

-- Conclusion: Higher HIV/AIDS prevalence correlates with lower life expectancy.