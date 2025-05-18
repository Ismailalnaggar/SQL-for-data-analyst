🌍 World Life Expectancy Data Project
This project explores and prepares the world_life_expectancy dataset using SQL to ensure data integrity and extract meaningful health and economic insights. It includes comprehensive data cleaning followed by exploratory data analysis (EDA) to understand global patterns in life expectancy, GDP, health metrics, and development status.

+++++++++++

📁 Dataset Overview
The project utilizes a flat, structured dataset named:

world_life_expectancy

Key columns include:

Country, Year

Life Expectancy

GDP

BMI

HIV/AIDS

Status (Developed / Developing)

++++++++++++

🧼 Part 1: Data Cleaning
🧠 Key Cleaning Steps
Data Inspection
Reviewed all records to understand structure, field types, and quality issues.

Duplicate Removal
Identified duplicate entries based on Country and Year using ROW_NUMBER(), and removed them via subqueries.

Record Correction
Deleted invalid entries using known Row_IDs (e.g., corrupted or erroneous data).

Data Standardization
Corrected inconsistent Status values (e.g., empty or null entries) by inferring from valid records of the same country.

🛠️ SQL Techniques Used
Window functions: ROW_NUMBER()

Aggregation: COUNT()

Filtering: WHERE, HAVING

Subqueries for deletion

UPDATE with JOIN to infer missing values

DISTINCT to identify categorical inconsistencies

📊 Part 2: Exploratory Data Analysis (EDA)
🧠 Key Analytical Insights
Life Expectancy Range per Country
Measures progress in health by calculating the 15-year improvement in life expectancy per country.

Global Trends Over Time
Identifies the year with the highest global average life expectancy.

Life Expectancy vs GDP
Compares how economic performance (GDP) correlates with life expectancy over time and across countries.
Analyzes differences between low and high GDP groups using a $1,500 threshold.

Life Expectancy by Development Status
Contrasts average life expectancy between Developed and Developing nations.

BMI and Life Expectancy Relationship
Investigates whether average BMI has a meaningful impact on longevity.
Conclusion: No strong correlation observed.

HIV/AIDS Impact on Life Expectancy
Demonstrates that higher HIV/AIDS prevalence is linked to lower average life expectancy.
Conclusion: Negative correlation confirmed.

🛠️ SQL Techniques Used
Aggregation: AVG(), MIN(), MAX(), SUM()

Conditional logic: CASE WHEN

Grouping and filtering: GROUP BY, HAVING, ORDER BY

Data segmentation: GDP thresholds

Rounding: ROUND() for clearer presentation

📌 Purpose
This project was created to:

Demonstrate end-to-end SQL data analysis: from cleaning to insight generation

Explore the relationship between health outcomes and economic indicators

Prepare data for visual reporting tools such as Power BI or Tableau

Build a foundation for public health and socioeconomic research
