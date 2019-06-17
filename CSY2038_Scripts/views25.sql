/*
Group Number: 25
File Name: views25.sql
Group Members:  Shreejan Regmi - 18417132
				Neetu Kumari Das- 18406487
				Saurav Khatiwada - 18413649
				Hira Bahadur Rana Kauchha - 18413703
Module Name: Database 2
Module Code: CSY2038			
*/

--@E:\CSY2038_Scripts\views25.sql;

--creating view with use of case to show which age groups the staff fall in
--Citation: (Andy Brown, 2012)
CREATE OR REPLACE VIEW view_staff_age_group AS
SELECT staff_id ,CONCAT(CONCAT(CONCAT(staff_fname, ' '), staff_lname) , ' is in ') Name, 
	CASE 
		WHEN (func_calculate_staff_age(staff_dob) IS NULL) THEN 'null age'
		WHEN (func_calculate_staff_age(staff_dob) < 20) THEN 'late teenage'
		WHEN (func_calculate_staff_age(staff_dob) >= 20 AND func_calculate_staff_age(staff_dob) <= 30 ) THEN 'early adulthood'
		WHEN (func_calculate_staff_age(staff_dob) > 30 AND func_calculate_staff_age(staff_dob) <= 60 ) THEN 'adulthood'
		ELSE 'elderliness'
	END AS Age_Group
FROM staff
GO;