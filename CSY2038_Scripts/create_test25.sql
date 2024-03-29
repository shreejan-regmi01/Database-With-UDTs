/*
Group Number: 25
File Name: create_test25.sql
Group Members:  Shreejan Regmi - 18417132
				Neetu Kumari Das- 18406487
				Saurav Khatiwada - 18413649
				Hira Bahadur Rana Kauchha - 18413703
Module Name: Database 2
Module Code: CSY2038			
*/

--@E:\CSY2038_Scripts\create_test25.sql;

--Formatting the columns
COLUMN TNAME FORMAT A30;
COLUMN OBJECT_NAME FORMAT A30;
COLUMN SEQUENCE_NAME FORMAT A30;
COLUMN CONSTRAINT_NAME FORMAT A30;

--Checking if there is any table in the database
SELECT TNAME FROM TAB;
--no rows returned

--Checking if object type 'address_type' is created
SELECT OBJECT_NAME, OBJECT_TYPE FROM USER_OBJECTS WHERE OBJECT_NAME LIKE 'ADDRESS_TYPE';
--1 row returned

--Checking if object table 'addresses' is created
SELECT TNAME FROM TAB WHERE TNAME = 'ADDRESSES';
--1 row returned

--Checking the creation of festival_natures table
SELECT TNAME FROM TAB WHERE TNAME = 'FESTIVAL_NATURES';
--1 row returned

--Checking the creation of table locations
SELECT TNAME FROM TAB WHERE TNAME = 'LOCATIONS';
--1 row returned

--Checking the creation of f_activities_varray_type 
SELECT OBJECT_NAME, OBJECT_TYPE FROM USER_OBJECTS WHERE OBJECT_NAME = 'F_ACTIVITIES_VARRAY_TYPE';
--1 row returned 

--Checking the creation of f_food_offerings_table_type
SELECT OBJECT_NAME, OBJECT_TYPE FROM USER_OBJECTS WHERE OBJECT_NAME = 'F_FOOD_OFFERINGS_TABLE_TYPE';
--1 row returned

--Checking the creation of festival_description_type
SELECT OBJECT_NAME, OBJECT_TYPE FROM USER_OBJECTS WHERE OBJECT_NAME = 'FESTIVAL_DESCRIPTION_TYPE';
--1 row returned

--Testing if the table 'festivals' has been created
SELECT TNAME FROM TAB WHERE TNAME ='FESTIVALS';
--1 row returned

--Checking if contact_type have been created
SELECT OBJECT_NAME, OBJECT_TYPE FROM USER_OBJECTS WHERE OBJECT_NAME ='CONTACT_TYPE';
--1 row returned

--Checking the creation of contact_varray_type
SELECT OBJECT_NAME, OBJECT_TYPE FROM USER_OBJECTS WHERE OBJECT_NAME ='CONTACT_VARRAY_TYPE';
--1 row returned

--Checking the creation of table staff
SELECT TNAME FROM TAB WHERE TNAME = 'STAFF';

--Checking the creation of table festival_staff
SELECT TNAME FROM TAB WHERE TNAME = 'FESTIVAL_STAFF';  


--SEQUENCES 
--Testing if sequence seq_f_nature_id have been created
SELECT SEQUENCE_NAME FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_F_NATURE_ID';
--1 row returned

--Testing if sequence seq_f_location_id have been created
SELECT SEQUENCE_NAME FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_LOCATION_ID';
--1 row returned

--Testing if sequence seq_staff_id have been created
SELECT SEQUENCE_NAME FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_STAFF_ID';
--1 row returned