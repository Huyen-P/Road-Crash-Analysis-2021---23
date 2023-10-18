/* Cleaning Data in SQL Queries */

---------------------------------------------------------------------------------------------------------------------------------------
-- Standardize Date Format for column "accident_date" (because accident_date was a datetime column after importing from an excel file)
ALTER TABLE [UK-Road-Crash-DB]..uk_road_crash
ADD accident_date_converted DATE 

UPDATE [UK-Road-Crash-DB]..uk_road_crash
SET accident_date_converted = CONVERT (DATE,accident_date)

ALTER TABLE [UK-Road-Crash-DB]..uk_road_crash
DROP COLUMN accident_date

EXEC sp_rename 'uk_road_crash.accident_date_converted', 'accident_date', 'COLUMN'
---------------------------------------------------------------------------------------------------------------------------------------
-- Standardize Time Format for column "time" (because "time" was a datetime column after importing from an excel file)
ALTER TABLE [UK-Road-Crash-DB]..uk_road_crash
ADD time_converted TIME

UPDATE [UK-Road-Crash-DB]..uk_road_crash
SET time_converted = CONVERT (TIME,"time")

ALTER TABLE [UK-Road-Crash-DB]..uk_road_crash
DROP COLUMN "time"

EXEC sp_rename 'uk_road_crash.time_converted', 'time', 'COLUMN'
