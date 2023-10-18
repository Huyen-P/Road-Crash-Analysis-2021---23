/* EDA in SQL Queries - Author: Huyen Phan */

---------------------------------------------------------------------------------------------------------------------------------------
-- 01 - Retrieving to UK Road Crash Database
SELECT *
FROM [UK-Road-Crash-DB]..uk_road_crash
ORDER BY accident_index
---------------------------------------------------------------------------------------------------------------------------------------
-- 02 - Counting Total number of casualties and Total number of casualties per level of accident severity (ALL)
SELECT	SUM(number_of_casualties) AS Total_Casualties, COUNT(DISTINCT accident_index) AS Total_Accidents,
		SUM(CASE WHEN accident_severity = 'Slight' THEN number_of_casualties END) AS "Total Slight Casualties",
		SUM(CASE WHEN accident_severity = 'Serious' THEN number_of_casualties END) AS "Total Serious Casualties",
		SUM(CASE WHEN accident_severity = 'Fatal' THEN number_of_casualties END) AS "Total Fatal Casualties"
FROM [UK-Road-Crash-DB]..uk_road_crash
---------------------------------------------------------------------------------------------------------------------------------------
-- 03 - Counting total number of accidents per month each year
SELECT Year(accident_date) AS "Year", DATENAME(MONTH, accident_date) AS Month_Name, COUNT(DISTINCT accident_index ) AS total_accidents
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY Year(accident_date), DATENAME(MONTH, accident_date)
ORDER BY "Year"
---------------------------------------------------------------------------------------------------------------------------------------
-- 04 - Counting total number of casualties per month each year
SELECT Year(accident_date) AS "Year", DATENAME(MONTH, accident_date) AS Month_Name, SUM(number_of_casualties) AS total_casualties
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY Year(accident_date), DATENAME(MONTH, accident_date)
ORDER BY "Year"
---------------------------------------------------------------------------------------------------------------------------------------
-- 05 - Counting total number of casualties per year and total number of casualties in each level of accident severity per year
SELECT 
	YEAR(accident_date) AS "Year",
	SUM(number_of_casualties) AS "Total Casualties", 
	SUM(CASE WHEN accident_severity = 'Slight' THEN number_of_casualties END) AS "Total Slight Casualties",
	SUM(CASE WHEN accident_severity = 'Serious' THEN number_of_casualties END) AS "Total Serious Casualties",
	SUM(CASE WHEN accident_severity = 'Fatal' THEN number_of_casualties END) AS "Total Fatal Casualties" 
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 06 - Counting total number of casualties by vehicle (ALL)
SELECT	SUM(CASE WHEN vehicle_type LIKE 'Agricultural%'THEN number_of_casualties END) AS "Total Casualties by Agricultural Vehicle",
		SUM(CASE WHEN vehicle_type LIKE 'Bus%' OR vehicle_type LIKE 'bus%' THEN number_of_casualties END) AS "Total Casualties by Bus",
		SUM(CASE WHEN vehicle_type LIKE 'Car%' OR vehicle_type LIKE 'car%' THEN number_of_casualties END) AS "Total Casualties by Car",
		SUM(CASE WHEN vehicle_type LIKE 'Motorcycle%' THEN number_of_casualties END) AS "Total Casualties by Motorcycle",
		SUM(CASE WHEN vehicle_type LIKE 'Other%' OR vehicle_type LIKE 'Pedal%'OR vehicle_type LIKE 'missing%' OR vehicle_type LIKE 'horse%'THEN number_of_casualties END) AS "Total Casualties by Others",
		SUM(CASE WHEN vehicle_type LIKE 'Goods%' THEN number_of_casualties END) AS "Total Casualties by Van"
FROM [UK-Road-Crash-DB]..uk_road_crash
---------------------------------------------------------------------------------------------------------------------------------------
-- 07 - Counting total number of casualties by vehicle per year
SELECT	YEAR(accident_date) AS "Year", 
		SUM(CASE WHEN vehicle_type LIKE 'Agricultural%'THEN number_of_casualties END) AS "Total Casualties by Agricultural Vehicle",
		SUM(CASE WHEN vehicle_type LIKE 'Bus%' OR vehicle_type LIKE 'bus%' THEN number_of_casualties END) AS "Total Casualties by Bus",
		SUM(CASE WHEN vehicle_type LIKE 'Car%' OR vehicle_type LIKE 'car%' THEN number_of_casualties END) AS "Total Casualties by Car",
		SUM(CASE WHEN vehicle_type LIKE 'Motorcycle%' THEN number_of_casualties END) AS "Total Casualties by Motorcycle",
		SUM(CASE WHEN vehicle_type LIKE 'Other%' OR vehicle_type LIKE 'Pedal%'OR vehicle_type LIKE 'missing%' OR vehicle_type LIKE 'horse%'THEN number_of_casualties END) AS "Total Casualties by Others",
		SUM(CASE WHEN vehicle_type LIKE 'Goods%' THEN number_of_casualties END) AS "Total Casualties by Van"
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 08 - Counting total number of fatal casualties by vehicle per year (FATAL)
SELECT	YEAR(accident_date) AS "Year", 
		SUM(CASE WHEN accident_severity = 'Fatal' AND vehicle_type LIKE 'Agricultural%'THEN number_of_casualties END) AS "Fatal Casualties by Agricultural Vehicle",
		SUM(CASE WHEN accident_severity = 'Fatal' AND vehicle_type LIKE 'Bus%' OR vehicle_type LIKE 'bus%' THEN number_of_casualties END) AS "Fatal Casualties by Bus",
		SUM(CASE WHEN accident_severity = 'Fatal' AND vehicle_type LIKE 'Car%' OR vehicle_type LIKE 'car%' THEN number_of_casualties END) AS "Fatal Casualties by Car",
		SUM(CASE WHEN accident_severity = 'Fatal' AND vehicle_type LIKE 'Motorcycle%' THEN number_of_casualties END) AS "Fatal Casualties by Motorcycle",
		SUM(CASE WHEN accident_severity = 'Fatal' AND vehicle_type LIKE 'Other%' OR vehicle_type LIKE 'Pedal%'OR vehicle_type LIKE 'missing%' OR vehicle_type LIKE 'horse%'THEN number_of_casualties END) AS "Fatal Casualties by Others",
		SUM(CASE WHEN accident_severity = 'Fatal' AND vehicle_type LIKE 'Goods%' THEN number_of_casualties END) AS "Fatal Casualties by Van"
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 09 - Counting total number of slight casualties by vehicle per year (SLIGHT)
SELECT	YEAR(accident_date) AS "Year", 
		SUM(CASE WHEN accident_severity = 'Slight' AND vehicle_type LIKE 'Agricultural%'THEN number_of_casualties END) AS "Fatal Casualties by Agricultural Vehicle",
		SUM(CASE WHEN accident_severity = 'Slight' AND vehicle_type LIKE 'Bus%' OR vehicle_type LIKE 'bus%' THEN number_of_casualties END) AS "Fatal Casualties by Bus",
		SUM(CASE WHEN accident_severity = 'Slight' AND vehicle_type LIKE 'Car%' OR vehicle_type LIKE 'car%' THEN number_of_casualties END) AS "Fatal Casualties by Car",
		SUM(CASE WHEN accident_severity = 'Slight' AND vehicle_type LIKE 'Motorcycle%' THEN number_of_casualties END) AS "Fatal Casualties by Motorcycle",
		SUM(CASE WHEN accident_severity = 'Slight' AND vehicle_type LIKE 'Other%' OR vehicle_type LIKE 'Pedal%'OR vehicle_type LIKE 'missing%' OR vehicle_type LIKE 'horse%'THEN number_of_casualties END) AS "Fatal Casualties by Others",
		SUM(CASE WHEN accident_severity = 'Slight' AND vehicle_type LIKE 'Goods%' THEN number_of_casualties END) AS "Fatal Casualties by Van"
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 10 - Counting total number of serious casualties by vehicle per year (SERIOUS)
SELECT	YEAR(accident_date) AS "Year", 
		SUM(CASE WHEN accident_severity = 'Serious' AND vehicle_type LIKE 'Agricultural%'THEN number_of_casualties END) AS "Fatal Casualties by Agricultural Vehicle",
		SUM(CASE WHEN accident_severity = 'Serious' AND vehicle_type LIKE 'Bus%' OR vehicle_type LIKE 'bus%' THEN number_of_casualties END) AS "Fatal Casualties by Bus",
		SUM(CASE WHEN accident_severity = 'Serious' AND vehicle_type LIKE 'Car%' OR vehicle_type LIKE 'car%' THEN number_of_casualties END) AS "Fatal Casualties by Car",
		SUM(CASE WHEN accident_severity = 'Serious' AND vehicle_type LIKE 'Motorcycle%' THEN number_of_casualties END) AS "Fatal Casualties by Motorcycle",
		SUM(CASE WHEN accident_severity = 'Serious' AND vehicle_type LIKE 'Other%' OR vehicle_type LIKE 'Pedal%'OR vehicle_type LIKE 'missing%' OR vehicle_type LIKE 'horse%'THEN number_of_casualties END) AS "Fatal Casualties by Others",
		SUM(CASE WHEN accident_severity = 'Serious' AND vehicle_type LIKE 'Goods%' THEN number_of_casualties END) AS "Fatal Casualties by Van"
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 11 - Calculating the percentage of casualties in each weather condition group per year (ALL)
SELECT	YEAR(accident_date) AS "Year",
		ROUND(SUM(CASE WHEN weather_conditions LIKE 'Fine%' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "Fine",
		ROUND(SUM(CASE WHEN weather_conditions LIKE 'Raining%' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "Rain",
		ROUND(SUM(CASE WHEN weather_conditions LIKE 'Snowing%' OR weather_conditions LIKE 'Fog%'THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "Snow/Fog",
		ROUND(SUM(CASE WHEN weather_conditions LIKE 'Other%' OR weather_conditions IS NULL THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "Others",
		SUM(number_of_casualties) AS Total_Casualties
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 12 - Calculating the percentage of fatal casualties in each weather condition group per year (FATAL)
SELECT	YEAR(accident_date) AS "Year",
		ROUND(SUM(CASE WHEN accident_severity = 'Fatal' AND weather_conditions LIKE 'Fine%' THEN number_of_casualties END)/SUM(CASE WHEN accident_severity = 'Fatal' THEN number_of_casualties END)*100,2) AS "Fine_Fatal",
		ROUND(SUM(CASE WHEN accident_severity = 'Fatal' AND weather_conditions LIKE 'Raining%' THEN number_of_casualties END)/SUM(CASE WHEN accident_severity = 'Fatal' THEN number_of_casualties END)*100,2) AS "Rain_Fatal",
		ROUND(SUM(CASE WHEN accident_severity = 'Fatal' AND weather_conditions LIKE 'Snowing%' OR weather_conditions LIKE 'Fog%'THEN number_of_casualties END)/SUM(CASE WHEN accident_severity = 'Fatal' THEN number_of_casualties END)*100,2) AS "Snow/Fog_Fatal",
		ROUND(SUM(CASE WHEN accident_severity = 'Fatal' AND weather_conditions LIKE 'Other%' OR weather_conditions IS NULL THEN number_of_casualties END)/SUM(CASE WHEN accident_severity = 'Fatal' THEN number_of_casualties END)*100,2) AS "Others_Fatal",
		SUM(CASE WHEN accident_severity = 'Fatal' THEN number_of_casualties END) AS Total_Casualties_Fatal
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 13 - Calculating the percentage of slight casualties in each weather condition group per year (SLIGHT) 
SELECT	YEAR(accident_date) AS "Year",
		ROUND(SUM(CASE WHEN accident_severity = 'Slight' AND weather_conditions LIKE 'Fine%' THEN number_of_casualties END)/SUM(CASE WHEN accident_severity = 'Slight' THEN number_of_casualties END)*100,2) AS "Fine_Slight",
		ROUND(SUM(CASE WHEN accident_severity = 'Slight' AND weather_conditions LIKE 'Raining%' THEN number_of_casualties END)/SUM(CASE WHEN accident_severity = 'Slight' THEN number_of_casualties END)*100,2) AS "Rain_Slight",
		ROUND(SUM(CASE WHEN accident_severity = 'Slight' AND weather_conditions LIKE 'Snowing%' OR weather_conditions LIKE 'Fog%'THEN number_of_casualties END)/SUM(CASE WHEN accident_severity = 'Slight' THEN number_of_casualties END)*100,2) AS "Snow/Fog_Slight",
		ROUND(SUM(CASE WHEN accident_severity = 'Slight' AND weather_conditions LIKE 'Other%' OR weather_conditions IS NULL THEN number_of_casualties END)/SUM(CASE WHEN accident_severity = 'Slight' THEN number_of_casualties END)*100,2) AS "Others_Slight",
		SUM(CASE WHEN accident_severity = 'Slight' THEN number_of_casualties END) AS Total_Casualties_Slight
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 14 - Calculating the percentage of serious casualties in each weather condition group per year (SERIOUS) Serious
SELECT	YEAR(accident_date) AS "Year",
		ROUND(SUM(CASE WHEN accident_severity = 'Serious' AND weather_conditions LIKE 'Fine%' THEN number_of_casualties END)/SUM(CASE WHEN accident_severity = 'Serious' THEN number_of_casualties END)*100,2) AS "Fine_Serious",
		ROUND(SUM(CASE WHEN accident_severity = 'Serious' AND weather_conditions LIKE 'Raining%' THEN number_of_casualties END)/SUM(CASE WHEN accident_severity = 'Serious' THEN number_of_casualties END)*100,2) AS "Rain_Serious",
		ROUND(SUM(CASE WHEN accident_severity = 'Serious' AND weather_conditions LIKE 'Snowing%' OR weather_conditions LIKE 'Fog%'THEN number_of_casualties END)/SUM(CASE WHEN accident_severity = 'Serious' THEN number_of_casualties END)*100,2) AS "Snow/Fog_Serious",
		ROUND(SUM(CASE WHEN accident_severity = 'Serious' AND weather_conditions LIKE 'Other%' OR weather_conditions IS NULL THEN number_of_casualties END)/SUM(CASE WHEN accident_severity = 'Serious' THEN number_of_casualties END)*100,2) AS "Others_Serious",
		SUM(CASE WHEN accident_severity = 'Serious' THEN number_of_casualties END) AS Total_Casualties_Serious
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 15 - Counting total number of casualties by each road surface condition (ALL)
SELECT	YEAR(accident_date) AS "Year",
		ROUND(SUM(CASE WHEN road_surface_conditions LIKE 'Dry%' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "Dry",
		ROUND(SUM(CASE WHEN road_surface_conditions LIKE 'Frost%' OR road_surface_conditions LIKE 'Snow%' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "Frost/Snow",
		ROUND(SUM(CASE WHEN road_surface_conditions LIKE 'Flood%' OR road_surface_conditions LIKE 'Wet%' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "Wet",
		ROUND(SUM(CASE WHEN road_surface_conditions IS NULL THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "Unknown",
		SUM(number_of_casualties) AS Total_Casualties
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 16 - Counting total number of fatal casualties by each road surface condition (FATAL)
SELECT	YEAR(accident_date) AS "Year",
		ROUND(SUM(CASE WHEN accident_severity = 'Fatal' AND road_surface_conditions LIKE 'Dry%' THEN number_of_casualties END)/SUM(CASE WHEN  accident_severity = 'Fatal' THEN number_of_casualties END)*100,2) AS "Dry_Fatal",
		ROUND(SUM(CASE WHEN accident_severity = 'Fatal' AND road_surface_conditions LIKE 'Frost%' OR accident_severity = 'Fatal' AND road_surface_conditions LIKE 'Snow%' THEN number_of_casualties END)/SUM(CASE WHEN  accident_severity = 'Fatal' THEN number_of_casualties END)*100,2) AS "Frost/Snow_Fatal",
		ROUND(SUM(CASE WHEN accident_severity = 'Fatal' AND road_surface_conditions LIKE 'Flood%' OR accident_severity = 'Fatal' AND road_surface_conditions LIKE 'Wet%' THEN number_of_casualties END)/SUM(CASE WHEN  accident_severity = 'Fatal' THEN number_of_casualties END)*100,2) AS "Wet_Fatal",
		ROUND(SUM(CASE WHEN accident_severity = 'Fatal' AND road_surface_conditions IS NULL THEN number_of_casualties END)/SUM(CASE WHEN  accident_severity = 'Fatal' THEN number_of_casualties END)*100,2) AS "Unknown_Fatal",
		SUM(CASE WHEN  accident_severity = 'Fatal' THEN number_of_casualties END) AS Total_Fatal_Casualties
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 17 - Counting total number of slight casualties by each road surface condition (SLIGHT)
SELECT	YEAR(accident_date) AS "Year",
		ROUND(SUM(CASE WHEN accident_severity = 'Slight' AND road_surface_conditions LIKE 'Dry%' THEN number_of_casualties END)/SUM(CASE WHEN  accident_severity = 'Slight' THEN number_of_casualties END)*100,2) AS "Dry_Slight",
		ROUND(SUM(CASE WHEN accident_severity = 'Slight' AND road_surface_conditions LIKE 'Frost%' OR accident_severity = 'Slight' AND road_surface_conditions LIKE 'Snow%' THEN number_of_casualties END)/SUM(CASE WHEN  accident_severity = 'Slight' THEN number_of_casualties END)*100,2) AS "Frost/Snow_Slight",
		ROUND(SUM(CASE WHEN accident_severity = 'Slight' AND road_surface_conditions LIKE 'Flood%' OR accident_severity = 'Slight' AND road_surface_conditions LIKE 'Wet%' THEN number_of_casualties END)/SUM(CASE WHEN  accident_severity = 'Slight' THEN number_of_casualties END)*100,2) AS "Wet_Slight",
		ROUND(SUM(CASE WHEN accident_severity = 'Slight' AND road_surface_conditions IS NULL THEN number_of_casualties END)/SUM(CASE WHEN  accident_severity = 'Slight' THEN number_of_casualties END)*100,2) AS "Unknown_Slight",
		SUM(CASE WHEN  accident_severity = 'Slight' THEN number_of_casualties END) AS Total_Slight_Casualties
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 18 - Counting total number of serious casualties by each road surface condition (SERIOUS)
SELECT	YEAR(accident_date) AS "Year",
		ROUND(SUM(CASE WHEN accident_severity = 'Serious' AND road_surface_conditions LIKE 'Dry%' THEN number_of_casualties END)/SUM(CASE WHEN  accident_severity = 'Serious' THEN number_of_casualties END)*100,2) AS "Dry_Serious",
		ROUND(SUM(CASE WHEN accident_severity = 'Serious' AND road_surface_conditions LIKE 'Frost%' OR accident_severity = 'Serious' AND road_surface_conditions LIKE 'Snow%' THEN number_of_casualties END)/SUM(CASE WHEN  accident_severity = 'Serious' THEN number_of_casualties END)*100,2) AS "Frost/Snow_Serious",
		ROUND(SUM(CASE WHEN accident_severity = 'Serious' AND road_surface_conditions LIKE 'Flood%' OR accident_severity = 'Serious' AND road_surface_conditions LIKE 'Wet%' THEN number_of_casualties END)/SUM(CASE WHEN  accident_severity = 'Serious' THEN number_of_casualties END)*100,2) AS "Wet_Serious",
		ROUND(SUM(CASE WHEN accident_severity = 'Serious' AND road_surface_conditions IS NULL THEN number_of_casualties END)/SUM(CASE WHEN  accident_severity = 'Serious' THEN number_of_casualties END)*100,2) AS "Unknown_Serious",
		SUM(CASE WHEN  accident_severity = 'Serious' THEN number_of_casualties END) AS Total_Serious_Casualties
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 19 - Counting total number of casualties by each road type (ALL)
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
---------------------------------------------------------------------------------------------------------------------------------------
-- 20 - Counting total number of fatal casualties by each road type (FATAL)
SELECT	YEAR(accident_date) AS "Year",
		SUM(CASE WHEN accident_severity = 'Fatal' AND road_type LIKE 'Single%' THEN number_of_casualties END) AS "Single Carriagetway",
		SUM(CASE WHEN accident_severity = 'Fatal' AND road_type LIKE 'Dual%' THEN number_of_casualties END) AS "Dual Carriagetway",
		SUM(CASE WHEN accident_severity = 'Fatal' AND road_type LIKE 'Roundabout%' THEN number_of_casualties END) AS "Roundabout",
		SUM(CASE WHEN accident_severity = 'Fatal' AND road_type LIKE 'one%' THEN number_of_casualties END) AS "One way street",
		SUM(CASE WHEN accident_severity = 'Fatal' AND road_type LIKE 'Slip%' THEN number_of_casualties END) AS "Slip road",
		SUM(CASE WHEN accident_severity = 'Fatal' AND road_type IS NULL THEN number_of_casualties END) AS "Null",
		SUM(CASE WHEN accident_severity = 'Fatal' THEN number_of_casualties END) AS Total_Casualties_Fatal
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 21 - Counting total number of slight casualties by each road type (SLIGHT)
SELECT	YEAR(accident_date) AS "Year",
		SUM(CASE WHEN accident_severity = 'Slight' AND road_type LIKE 'Single%' THEN number_of_casualties END) AS "Single Carriagetway ",
		SUM(CASE WHEN accident_severity = 'Slight' AND road_type LIKE 'Dual%' THEN number_of_casualties END) AS "Dual Carriagetway",
		SUM(CASE WHEN accident_severity = 'Slight' AND road_type LIKE 'Roundabout%' THEN number_of_casualties END) AS "Roundabout",
		SUM(CASE WHEN accident_severity = 'Slight' AND road_type LIKE 'one%' THEN number_of_casualties END) AS "One way street",
		SUM(CASE WHEN accident_severity = 'Slight' AND road_type LIKE 'Slip%' THEN number_of_casualties END) AS "Slip road",
		SUM(CASE WHEN accident_severity = 'Slight' AND road_type IS NULL THEN number_of_casualties END) AS "Null",
		SUM(CASE WHEN accident_severity = 'Slight' THEN number_of_casualties END) AS Total_Casualties_Slight
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 22 - Counting total number of serious casualties by each road type (SERIOUS)
SELECT	YEAR(accident_date) AS "Year",
		SUM(CASE WHEN accident_severity = 'Serious' AND road_type LIKE 'Single%' THEN number_of_casualties END) AS "Single Carriagetway ",
		SUM(CASE WHEN accident_severity = 'Serious' AND road_type LIKE 'Dual%' THEN number_of_casualties END) AS "Dual Carriagetway",
		SUM(CASE WHEN accident_severity = 'Serious' AND road_type LIKE 'Roundabout%' THEN number_of_casualties END) AS "Roundabout",
		SUM(CASE WHEN accident_severity = 'Serious' AND road_type LIKE 'one%' THEN number_of_casualties END) AS "One way street",
		SUM(CASE WHEN accident_severity = 'Serious' AND road_type LIKE 'Slip%' THEN number_of_casualties END) AS "Slip road",
		SUM(CASE WHEN accident_severity = 'Serious' AND road_type IS NULL THEN number_of_casualties END) AS "Null",
		SUM(CASE WHEN accident_severity = 'Serious' THEN number_of_casualties END) AS Total_Casualties_Serious
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY YEAR(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 23 - Retrieving TOP 10 locations of Total_Casualties
SELECT	TOP 10
		local_authority, SUM(number_of_casualties) AS Total_Casualties
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY local_authority
ORDER BY Total_Casualties DESC
---------------------------------------------------------------------------------------------------------------------------------------
-- 24 - The comparision of casualties in area per year
SELECT	YEAR(accident_date) AS "Year",
		ROUND(SUM(CASE WHEN urban_or_rural_area = 'Rural' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "PCT_Rural",
		ROUND(SUM(CASE WHEN urban_or_rural_area = 'Urban' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "PCT_Urban"
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY Year(accident_date)
---------------------------------------------------------------------------------------------------------------------------------------
-- 25 - Casualties by Light Condition
SELECT	YEAR(accident_date) AS "Year",
		ROUND(SUM(CASE WHEN light_conditions LIKE 'Day%' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "PCT_Day",
		ROUND(SUM(CASE WHEN light_conditions NOT LIKE 'Day%' THEN number_of_casualties END)/SUM(number_of_casualties)*100,2) AS "PCT_Night"
FROM [UK-Road-Crash-DB]..uk_road_crash
GROUP BY Year(accident_date)