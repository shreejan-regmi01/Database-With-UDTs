/*
Group Number: 25
File Name: procedures_test25.sql
Group Members:  Shreejan Regmi - 18417132
				Neetu Kumari Das - 18406487 
				Saurav Khatiwada - 18413649
				Hira Bahadur Rana Kauchha - 18413703
Module Name: Database 2
Module Code: CSY2038			
*/

--@E:\CSY2038_Scripts\procedures_test25.sql;

--to display output on the screen
SET SERVEROUTPUT ON

----TEST PROCEDURE proc_insert_f_natures
--querying the festival_natures table
SELECT f_nature_id, f_nature_name FROM festival_natures;

--executing procedure proc_param_insert_f_natures
EXECUTE proc_insert_f_natures('ART');

--querying the festival_natures table to check if procedure is executed properly
SELECT * FROM festival_natures ORDER BY f_nature_id;

--TEST PROCEDURE proc_insert_locations
--querying locations table before executing 
SELECT l.location_id, l.location_name.street Street, l.location_name.city City, l.location_name.country Country
FROM locations l;
--9 rows selected

--executing procedure proc_insert_locations
EXECUTE proc_insert_locations;

--querying locations table after executing
SELECT l.location_id, l.location_name.street Street, l.location_name.city City, l.location_name.country Country
FROM locations l;
--10 rows


--TESTING PROCEDURE proc_insert_staff
--querying staff table before executing procedure proc_insert_staff
SELECT staff_id, staff_fname, staff_lname FROM staff;
--5 rows returned

--executing procedure proc_insert_staff
EXECUTE proc_insert_staff('LUPIN', 'DAHAL', 1, 1200.5 ,'M', '12 SAINT ROAD');


--querying staff table after executing procedure proc_insert_staff
SELECT staff_id, staff_fname, staff_lname FROM staff;
--6 rows returned


--TESTING PROCEDURE proc_update_staff_salary
--querying staff details before executing procedure 
SELECT s.staff_id, s.staff_fname, s.staff_salary FROM staff s WHERE s.gender = 'F';
--Output:
--	 STAFF_ID STAFF_FNAME     STAFF_SALARY
--	-------- --------------- ------------
--         4 SHREYA              8240.8
--		   5 SAMI				5500.65

--executing procedure proc_update_staff_salary 
EXECUTE proc_update_staff_salary('F');
--UPDATE SUCCESSFUL

--querying staff details after executing procedure
SELECT s.staff_id, s.staff_fname, s.staff_salary FROM staff s WHERE s.gender = 'F';
--   STAFF_ID STAFF_FNAME     STAFF_SALARY
--	---------- --------------- ------------
--         	 4 SHREYA               9064.88
--		   	 5 SAMI			        6050.72

--exception handling
--querying staff details before executing procedure 
SELECT s.staff_id, s.staff_fname, s.staff_salary FROM staff s WHERE s.gender = 'M';
--Output:
--	 STAFF_ID STAFF_FNAME     STAFF_SALARY
--	-------- --------------- -------------
--		   1 AAYUSH               2000.56
--		   2 HIRA				   2200.2
--		   3 SALON 				  9000.79
--		   6 LUPIN				   1200.5

--executing procedure proc_update_staff_salary		   
EXECUTE proc_update_staff_salary('M');
--NO UPDATES EXECUTED

--querying staff details after executing procedure 
SELECT s.staff_id, s.staff_fname, s.staff_salary FROM staff s WHERE s.gender = 'M';
--Output:
--	 STAFF_ID STAFF_FNAME     STAFF_SALARY
--	-------- --------------- -------------
--		   1 AAYUSH               2000.56
--		   2 HIRA				   2200.2
--		   3 SALON 				  9000.79
--		   6 LUPIN				   1200.5
		   
 
--TESTING PROCEDURE proc_delete_staff
--querying staff details before executing procedure 
SELECT s.staff_id, s.staff_fname, s.staff_salary FROM staff s WHERE s.staff_id=6;
--OUTPUT:
--   STAFF_ID STAFF_FNAME     STAFF_SALARY
--	---------- --------------- ------------
--         6 	LUPIN           1200.5
 

--executing procedure proc_delete_staff 
EXECUTE proc_delete_staff(6);

--querying staff details after executing procedure
SELECT s.staff_id, s.staff_fname, s.staff_salary FROM staff s WHERE s.staff_id=7;
--no rows selected

--PROCEDURE 6
--checking the creation of procedure proc_out_param
SELECT OBJECT_NAME, OBJECT_TYPE FROM USER_OBJECTS WHERE OBJECT_NAME= 'PROC_OUT_PARAM';
--1 row returned

--creating anonymous block to test procedure proc_out_param
DECLARE 
	vc_staff_name VARCHAR2(30);
	
BEGIN
	proc_out_param(1, vc_staff_name);
	DBMS_OUTPUT.PUT_LINE(vc_staff_name);
END;
/
--AAYUSH MOKTAN

--testing exception handling of proc_out_param
DECLARE 
	vc_staff_name VARCHAR2(30);
	
BEGIN
	proc_out_param(15, vc_staff_name);
	DBMS_OUTPUT.PUT_LINE(vc_staff_name);
END;
/
--(NO ROWS FOUND)

--PROCEDURE 7
--checking the creation of procedure proc_out_in_param
SELECT OBJECT_NAME, OBJECT_TYPE FROM USER_OBJECTS WHERE OBJECT_NAME= 'PROC_OUT_IN_PARAM';
--1 row returned

--creating anonymous block to test procedure proc_out_in_param
DECLARE 
	vn_ticket_price festivals.ticket_price%TYPE;
	
	BEGIN 
		DBMS_OUTPUT.PUT_LINE('GAME-GUESS THE HIGHEST TICKET PRICE');
		vn_ticket_price:=&price;
		DBMS_OUTPUT.PUT_LINE('YOUR INPUT PRICE IS '||vn_ticket_price);
		proc_out_in_param(vn_ticket_price);
		DBMS_OUTPUT.PUT_LINE('THE HIGHEST TICKET PRICE IS '||vn_ticket_price);
END;
/
--OUTPUT:
--Enter value for price: 400
--old   6: vn_ticket_price:=&price;
--new   6: vn_ticket_price:=400;
--GAME-GUESS THE HIGHEST TICKET PRICE
--YOUR INPUT PRICE IS 400
--THE HIGHEST TICKET PRICE IS 4000.2