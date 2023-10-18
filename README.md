![UK_Road_Crash_Analysis](https://github.com/Huyen-P/UK-Road-Crash-Analysis-2019-2022/assets/72473316/b5010b86-6aa6-45fd-962d-c2d3cff633fe)

**Period of time: from 2021 to 2022**

### 01 - INTRODUCTION
- This repository contains the datasource, an EDA SQL script, a data cleaning SQL script and an interactive Tableau workbook for visulization.

- The datasource has **307.973 rows** and **19 columns**.

- Link to the [Tableau dashboard](https://public.tableau.com/app/profile/huyen.phan5825/viz/RoadAccidentDashboard_16962422435460/Dashboard1)

### 02- REQUIREMENTS
- **Initial requirements**: 

Clients want to create a UK Road Crash dashboard for the years from 2021 to 2022 so that they can have the following insights with the hope that they can minimize the loss of lives.

- **KPIs**

📌 Total Casualties, categorized into levels of accident severity, which took place after the accident per year

📌 Total Casualties with respect to level of accident severity and total casualties by type of vehicle per year.

📌 Total Casualties with respect to vehicle type per year.

📌 Monthly trend showing a comparison of casualties for the current year and the previous year.

📌 Total Casualties by Road type.

📌 Distribution of total casualties by road surface.

📌 Relation between Casualties by Area, Location & by Day/ Night.

### 03 - TOOL USED
- **SQL Microsoft Server** for EDA and Data Cleaning Process.

- **Tableau Desktop** for Data Visualization in parallel with Data Analysis.

### 04 - STEPS
**Step 1 - Data Cleaning by Excel**

The raw csv file contained inconsistent data type within column "accident_date", which need to be fixed by using Excel.

**Step 2 - EDA using SQL**

I started with exploratory data analysis to deeper understand about the data patterns, inconsistences and potential insights. 
This step drives effective decision-making, aids in data cleaning, and informs appropriate analysis methods for enhanced project outcomes.

**Step 3 - Data Cleaning using SQL**

This step involves getting rid of data inconsistencies, errors, and duplicates, ensuring the accuracy and reliability of the data I'm using for subsequent analysis.

**Step 4 - Data Processing**

This step contains generating additional columns by organizing, sorting, and filtering the data to derive valuable insights.

**Step 5 - Data Analyzing and Data Visualizing**

I conducted analysis and visualization simultaneously to grasp insights quickly, validate results, communicate effectively, and refine hypotheses iteratively. It aids in comprehensive understanding and facilitates efficient data exploration and interpretation.

**Step 6 - Dashboard Building** 

Finally, I translate all the insights into an interactive Tableau Public dashboard, enabling users to engage with the data.

### 05 - Insights from SQL EDA Script (associated with each KPIs)

Note: Audience can easily find the completed EDA Script in the attached file name: **[03_UKRoadCrash_SQLQuery_DataCleaningScript.sql](https://github.com/Huyen-P/UK-Road-Crash-Analysis/blob/62e3ed5ce8652eccf505a578e57572986c1147a8/03_UKRoadCrash_SQLQuery_DataCleaningScript.sql)**

✅  The **Total Casualties** occurring post the accident amount to **417.883** and was categorized into 3 groups of the level of accident severity including **Slight**, **Serious** and **Fatal** with retrieved numbers are **351.436**, **59.312**,**7.135**; respectively.
```SQL
SELECT	SUM(number_of_casualties) AS "Total Casualties",  COUNT(DISTINCT accident_index) AS "Total Accidents",
	SUM(CASE WHEN accident_severity = 'Slight' THEN number_of_casualties END) AS "Total Slight Casualties",
	SUM(CASE WHEN accident_severity = 'Serious' THEN number_of_casualties END) AS "Total Serious Casualties",
	SUM(CASE WHEN accident_severity = 'Fatal' THEN number_of_casualties END) AS "Total Fatal Casualties"
FROM [UK-Road-Crash-DB]..uk_road_crashSELECT SUM(number_of_casualties) AS CY_Casualties
FROM [UK-Road-Crash-DB] .. uk_road_crash
```
- Result
![EDA_02](https://github.com/Huyen-P/UK-Road-Crash-Analysis/assets/72473316/6feeaf50-a329-4c8d-ad01-b65f1610c6d3)

✅  Total Casualties, categorized into levels of accident severity, which took place after the accident, per year
```SQL
SELECT 
	YEAR(accident_date) AS "Year",
	SUM(number_of_casualties) AS "Total Casualties",
	COUNT(DISTINCT accident_index) AS "Total Accidents",
	SUM(CASE WHEN accident_severity = 'Slight' THEN number_of_casualties END) AS "Total Slight Casualties",
	SUM(CASE WHEN accident_severity = 'Serious' THEN number_of_casualties END) AS "Total Serious Casualties",
	SUM(CASE WHEN accident_severity = 'Fatal' THEN number_of_casualties END) AS "Total Fatal Casualties" 
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
```
- Result
![EDA_05](https://github.com/Huyen-P/UK-Road-Crash-Analysis/assets/72473316/d378b42d-1f8d-48c0-9ff9-483b1249b2de)

✅ Total Casualties with respect to each accident severity and total casualties by each type of vehicle per year.
**Severity Level: Slight**
```SQL
SELECT	YEAR(accident_date) AS "Year", 
	SUM(CASE WHEN accident_severity = 'Slight' AND vehicle_type LIKE 'Agricultural%'THEN number_of_casualties END) AS "Slight Casualties by Agricultural Vehicle",
	SUM(CASE WHEN accident_severity = 'Slight' AND vehicle_type LIKE 'Bus%' OR vehicle_type LIKE 'bus%' THEN number_of_casualties END) AS "Slight Casualties by Bus",
	SUM(CASE WHEN accident_severity = 'Slight' AND vehicle_type LIKE 'Car%' OR vehicle_type LIKE 'car%' THEN number_of_casualties END) AS "Slight Casualties by Car",
	SUM(CASE WHEN accident_severity = 'Slight' AND vehicle_type LIKE 'Motorcycle%' THEN number_of_casualties END) AS "Slight Casualties by Motorcycle",
	SUM(CASE WHEN accident_severity = 'Slight' AND vehicle_type LIKE 'Other%' OR vehicle_type LIKE 'Pedal%'OR vehicle_type LIKE 'missing%' OR vehicle_type LIKE 'horse%'THEN number_of_casualties END)           AS "Slight Casualties by Others",
	SUM(CASE WHEN accident_severity = 'Slight' AND vehicle_type LIKE 'Goods%' THEN number_of_casualties END) AS "Slight Casualties by Van"
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
```
- Result:
![EDA_09](https://github.com/Huyen-P/UK-Road-Crash-Analysis/assets/72473316/48e07783-c2a2-4626-a5bf-ed0411b5705e)

**Severity Level: Serious**
```SQL
SELECT	YEAR(accident_date) AS "Year", 
	SUM(CASE WHEN accident_severity = 'Serious' AND vehicle_type LIKE 'Agricultural%'THEN number_of_casualties END) AS "Serious Casualties by Agricultural Vehicle",
	SUM(CASE WHEN accident_severity = 'Serious' AND vehicle_type LIKE 'Bus%' OR vehicle_type LIKE 'bus%' THEN number_of_casualties END) AS "Serious Casualties by Bus",
	SUM(CASE WHEN accident_severity = 'Serious' AND vehicle_type LIKE 'Car%' OR vehicle_type LIKE 'car%' THEN number_of_casualties END) AS "Serious Casualties by Car",
	SUM(CASE WHEN accident_severity = 'Serious' AND vehicle_type LIKE 'Motorcycle%' THEN number_of_casualties END) AS "Serious Casualties by Motorcycle",
	SUM(CASE WHEN accident_severity = 'Serious' AND vehicle_type LIKE 'Other%' OR vehicle_type LIKE 'Pedal%'OR vehicle_type LIKE 'missing%' OR vehicle_type LIKE 'horse%'THEN number_of_casualties END)          AS "Serious Casualties by Others",
	SUM(CASE WHEN accident_severity = 'Serious' AND vehicle_type LIKE 'Goods%' THEN number_of_casualties END) AS "Serious Casualties by Van"
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
```
- Result:
![EDA_10](https://github.com/Huyen-P/UK-Road-Crash-Analysis/assets/72473316/0f34b117-92fd-40b2-8743-b2c7bfefb9b7)

**Severity Level: Fatal**
```SQL
SELECT	YEAR(accident_date) AS "Year", 
	SUM(CASE WHEN accident_severity = 'Fatal' AND vehicle_type LIKE 'Agricultural%'THEN number_of_casualties END) AS "Fatal Casualties by Agricultural Vehicle",
	SUM(CASE WHEN accident_severity = 'Fatal' AND vehicle_type LIKE 'Bus%' OR vehicle_type LIKE 'bus%' THEN number_of_casualties END) AS "Fatal Casualties by Bus",
	SUM(CASE WHEN accident_severity = 'Fatal' AND vehicle_type LIKE 'Car%' OR vehicle_type LIKE 'car%' THEN number_of_casualties END) AS "Fatal Casualties by Car",
	SUM(CASE WHEN accident_severity = 'Fatal' AND vehicle_type LIKE 'Motorcycle%' THEN number_of_casualties END) AS "Fatal Casualties by Motorcycle",
	SUM(CASE WHEN accident_severity = 'Fatal' AND vehicle_type LIKE 'Other%' OR vehicle_type LIKE 'Pedal%'OR vehicle_type LIKE 'missing%' OR vehicle_type LIKE 'horse%'THEN number_of_casualties END)          AS "Fatal Casualties by Others",
	SUM(CASE WHEN accident_severity = 'Fatal' AND vehicle_type LIKE 'Goods%' THEN number_of_casualties END) AS "Fatal Casualties by Van"
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
```
- Result:
 ![image](https://github.com/Huyen-P/UK-Road-Crash-Analysis/assets/72473316/910840b4-6f38-41bd-920a-df180e1ac9e7)

✅ Total Casualties with respect to vehicle type per year.
```SQL
SELECT	YEAR(accident_date) AS "Year", 
	SUM(CASE WHEN vehicle_type LIKE 'Agricultural%'THEN number_of_casualties END) AS "Total Casualties by Agricultural Vehicle",
	SUM(CASE WHEN vehicle_type LIKE 'Bus%' OR vehicle_type LIKE 'bus%' THEN number_of_casualties END) AS "Total Casualties by Bus",
	SUM(CASE WHEN vehicle_type LIKE 'Car%' OR vehicle_type LIKE 'car%' THEN number_of_casualties END) AS "Total Casualties by Car",
	SUM(CASE WHEN vehicle_type LIKE 'Motorcycle%' THEN number_of_casualties END) AS "Total Casualties by Motorcycle",
	SUM(CASE WHEN vehicle_type LIKE 'Other%' OR vehicle_type LIKE 'Pedal%'OR vehicle_type LIKE 'missing%' OR vehicle_type LIKE 'horse%'THEN number_of_casualties END) AS "Total Casualties by Others",
	SUM(CASE WHEN vehicle_type LIKE 'Goods%' THEN number_of_casualties END) AS "Total Casualties by Van"
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
```
- Result:
  ![image](https://github.com/Huyen-P/UK-Road-Crash-Analysis/assets/72473316/176c8b1d-8715-495b-9f6b-545d0bd9732b)

  
✅ Monthly trend showing a comparison of casualties for the current year and the previous year.

```SQL
SELECT Year(accident_date) AS "Year", DATENAME(MONTH, accident_date) AS Month_Name, SUM(number_of_casualties) AS total_casualties
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY Year(accident_date), DATENAME(MONTH, accident_date)
ORDER BY "Year"
```
- Result:
  ![image](https://github.com/Huyen-P/UK-Road-Crash-Analysis/assets/72473316/3827a4d3-c424-4201-ab24-804caff0462f)

✅ Total Casualties by Road type.

```SQL
SELECT	YEAR(accident_date) AS "Year",
	SUM(CASE WHEN road_type LIKE 'Single%' THEN number_of_casualties END) AS "Single Carriagetway",
	SUM(CASE WHEN road_type LIKE 'Dual%' THEN number_of_casualties END) AS "Dual Carriagetway",
	SUM(CASE WHEN road_type LIKE 'Roundabout%' THEN number_of_casualties END) AS "Roundabout",
	SUM(CASE WHEN road_type LIKE 'one%' THEN number_of_casualties END) AS "One way street",
	SUM(CASE WHEN road_type LIKE 'Slip%' THEN number_of_casualties END) AS "Slip road",
	SUM(CASE WHEN road_type IS NULL THEN number_of_casualties END) AS "Null",
	SUM(number_of_casualties) AS Total_Casualties
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
```
- Result
![image](https://github.com/Huyen-P/UK-Road-Crash-Analysis/assets/72473316/2b48d2ff-c81b-45b3-ab01-b7aa8e38f854)

✅ Distribution of total casualties by road surface condition

```SQL
SELECT	YEAR(accident_date) AS "Year",
	ROUND(SUM(CASE WHEN road_surface_conditions LIKE 'Dry%' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "Dry",
	ROUND(SUM(CASE WHEN road_surface_conditions LIKE 'Frost%' OR road_surface_conditions LIKE 'Snow%' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "Frost/Snow",
	ROUND(SUM(CASE WHEN road_surface_conditions LIKE 'Flood%' OR road_surface_conditions LIKE 'Wet%' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "Wet",
	ROUND(SUM(CASE WHEN road_surface_conditions IS NULL THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "Unknown",
	SUM(number_of_casualties) AS Total_Casualties
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
```
- Result:
  ![image](https://github.com/Huyen-P/UK-Road-Crash-Analysis/assets/72473316/4cb4fec3-3bba-4664-acc6-b3f56d62a203)


✅ Relation between Casualties by Area.

```SQL
SELECT	YEAR(accident_date) AS "Year",
	ROUND(SUM(CASE WHEN urban_or_rural_area = 'Rural' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "PCT_Rural",
	ROUND(SUM(CASE WHEN urban_or_rural_area = 'Urban' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "PCT_Urban"
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY Year(accident_date)
```
- Result:
![image](https://github.com/Huyen-P/UK-Road-Crash-Analysis/assets/72473316/f93b540b-31da-46fa-b521-6a028adec66b)


✅ Relation between Casualtiesby by Day/ Night.

```SQL
SELECT	YEAR(accident_date) AS "Year",
	ROUND(SUM(CASE WHEN light_conditions LIKE 'Day%' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "PCT_Day",
	ROUND(SUM(CASE WHEN light_conditions NOT LIKE 'Day%' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "PCT_Night"
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY Year(accident_date)
```
- Result:
![image](https://github.com/Huyen-P/UK-Road-Crash-Analysis/assets/72473316/166246c7-48dc-4b4f-84ef-0c5450be4d97)

✅ Relation between Casualtiesby by Location.
```SQL
SELECT	TOP 10
		    local_authority, SUM(number_of_casualties) AS Total_Casualties
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY local_authority
ORDER BY Total_Casualties DESC
```
-Result: 
![image](https://github.com/Huyen-P/UK-Road-Crash-Analysis/assets/72473316/5905ffaf-e6da-4442-a2f3-bf7a8517cf74)
