/*
Group Number: 25
File Name: views_test25.sql
Group Members:  Shreejan Regmi - 18417132
				Neetu Kumari Das- 18406487
				Saurav Khatiwada - 18413649
				Hira Bahadur Rana Kauchha - 18413703
Module Name: Database 2
Module Code: CSY2038			
*/

--@E:\CSY2038_Scripts\views_test25.sql;
SELECT OBJECT_NAME, OBJECT_TYPE FROM USER_OBJECTS WHERE OBJECT_NAME='VIEW_STAFF_AGE_GROUP';
--1 row returned

--query to show the count of total staffs in each age group
SELECT Age_Group, COUNT(*) AS "Number of staff" 
FROM view_staff_age_group
GROUP BY Age_Group;

--query to show the age group of a specific staff
SELECT Name, Age_Group
FROM view_staff_age_group
WHERE staff_id=5;
