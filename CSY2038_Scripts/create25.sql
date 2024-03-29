/*
Group Number: 25
File Name: create25.sql
Group Members:  Shreejan Regmi - 18417132
				Neetu Kumari Das- 18406487
				Saurav Khatiwada - 18413649
				Hira Bahadur Rana Kauchha - 18413703
Module Name: Database 2
Module Code: CSY2038			
*/

--@E:\CSY2038_Scripts\create25.sql;

--Checking if user space is empty
SELECT tname FROM TAB;
SELECT OBJECT_NAME, OBJECT_TYPE FROM USER_OBJECTS;
SELECT CONSTRAINT_NAME FROM USER_CONSTRAINTS;
SELECT TRIGGER_NAME FROM USER_TRIGGERS;
SELECT SEQUENCE_NAME FROM USER_SEQUENCES;

--Creating object type 'address_type' 
CREATE TYPE address_type AS OBJECT(
street VARCHAR2(20),
city VARCHAR2(20),
country VARCHAR2(20));
/
SHOW ERRORS;
--Checking if the 'address_type' has been created without errors

--Creating object type 'contact_type'
CREATE TYPE contact_type AS OBJECT(
phone VARCHAR2(15), 
email VARCHAR2(20)); 
/
SHOW ERRORS;

--Creating varray type 'f_activities_varray_type' of VARCHAR2
CREATE TYPE f_activities_varray_type AS VARRAY(10) OF VARCHAR2(20);
/
SHOW ERRORS;

--Creating table type 'f_food_offerings_table_type' of VARCHAR2
CREATE TYPE f_food_offerings_table_type AS TABLE OF VARCHAR2(20);
/
SHOW ERRORS;


--Creating object type 'festival_description_type' where varray and table type is used as datatype
CREATE TYPE festival_description_type AS OBJECT(
activities f_activities_varray_type,
running_time VARCHAR2(10),
food f_food_offerings_table_type);
/
SHOW ERRORS;

--Creating varray 'contact_varray_type' of contact_type
CREATE TYPE contact_varray_type AS VARRAY(3) OF contact_type;
/
SHOW ERRORS;

--Creating object table 'addresses' of address_type
CREATE TABLE addresses OF address_type;

--Creating table 'festival_natures'
CREATE TABLE festival_natures(
f_nature_id NUMBER(3),
f_nature_name VARCHAR2(15))
SEGMENT CREATION IMMEDIATE;
--segment creation used to for forcing the value of sequence from 1

--Creating table 'locations' where address_type is used as column
CREATE TABLE locations(
location_id NUMBER(3),
location_name address_type)
SEGMENT CREATION IMMEDIATE;

--Creating table 'festivals' where nested table is used in the object type
CREATE TABLE festivals(
f_nature_id NUMBER(3) NOT NULL,
location_id NUMBER(3) NOT NULL,
festival_name VARCHAR2(25),
festival_date DATE,
ticket_price NUMBER(6,2),
festival_details festival_description_type)
SEGMENT CREATION IMMEDIATE
NESTED TABLE festival_details.food STORE AS f_food_offerings_table;

--Creating table 'staff' where contact_varray_type and address_type as row are used
CREATE TABLE staff(
staff_id NUMBER(3),
staff_fname VARCHAR2(15),
staff_lname VARCHAR2(15),
leader_id NUMBER(3) NOT NULL,
staff_salary NUMBER(7,2),
gender CHAR DEFAULT 'F',
staff_dob DATE,
staff_image BLOB,
staff_contact contact_varray_type,
staff_address REF address_type SCOPE IS addresses)
SEGMENT CREATION IMMEDIATE;

--Creating table 'festival_staff' where there are compound primary and foreign keys
CREATE TABLE festival_staff(
staff_id NUMBER(3) NOT NULL,
f_nature_id NUMBER(3) NOT NULL,
location_id NUMBER(3) NOT NULL)
SEGMENT CREATION IMMEDIATE;

--SEQUENCES
--creating sequence seq_f_nature_id for primary key column of festival_natures table
CREATE SEQUENCE seq_f_nature_id
INCREMENT BY 1
START WITH 001;

--creating sequence seq_location_id for primary key column of locations table
CREATE SEQUENCE seq_location_id
INCREMENT BY 1
START WITH 001;

--creating sequence seq_staff_id for primary key column of staff table
CREATE SEQUENCE seq_staff_id
INCREMENT BY 1
START WITH 001;