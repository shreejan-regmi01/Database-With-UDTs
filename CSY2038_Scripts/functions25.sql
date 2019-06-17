/*
Group Number: 25
File Name: functions25.sql
Group Members:  Shreejan Regmi - 18417132
				Neetu Kumari Das - 18406487 
				Saurav Khatiwada - 18413649
				Hira Bahadur Rana Kauchha - 18413703
Module Name: Database 2
Module Code: CSY2038			
*/

--@E:\CSY2038_Scripts\functions25.sql;

--to display output on the screen
SET SERVEROUTPUT ON

--FUNCTION 1
--creating function func_count_festivals to count the number of festivals in festivals table
CREATE OR REPLACE FUNCTION func_count_festivals RETURN NUMBER IS
	vn_ct_festivals NUMBER(3);
	
	BEGIN
		SELECT COUNT(*)
		INTO vn_ct_festivals
		FROM festivals;
		
		RETURN vn_ct_festivals;
END func_count_festivals;
/
SHOW ERRORS;
--Function created
--No errors found

--creating procedure proc_count_festivals to use function func_count_festivals
CREATE OR REPLACE PROCEDURE proc_count_festivals IS
	vn_ct_festivals NUMBER(3);
	
	BEGIN 
		vn_ct_festivals:=func_count_festivals;
		DBMS_OUTPUT.PUT_LINE('The number of festivals in festivals table is '||vn_ct_festivals);
END proc_count_festivals;
/
SHOW ERRORS;
--Procedure Created
--No errors

--FUNCTION 2
--creating function func_make_username to create usernames using staff's first and lastname
CREATE OR REPLACE FUNCTION func_make_username
(in_staff_id NUMBER) RETURN VARCHAR2 IS
		vc_username VARCHAR2(10);
	BEGIN 
		SELECT CONCAT(SUBSTR(s.staff_fname,1,3),SUBSTR(s.staff_lname,1,4))
		INTO vc_username
		FROM staff s
		WHERE s.staff_id=in_staff_id ;
	
		RETURN vc_username;
END func_make_username;
/
SHOW ERRORS;
--function created
--no errors found

--creating procedure to output the username generated by function func_make_username
CREATE OR REPLACE PROCEDURE proc_output_username(in_staff_id NUMBER) IS
	vc_username VARCHAR2(10);

	BEGIN 
		vc_username:=func_make_username(in_staff_id);
		DBMS_OUTPUT.PUT_LINE('The username for staff ID '||in_staff_id||' is '||vc_username);
END proc_output_username;
/
SHOW ERRORS;
--procedure created
--no errors

--FUNCTION 3
--function to return full staff name that takes staff id as parameter
CREATE OR REPLACE FUNCTION func_staff_name(in_staff_id staff.staff_id%TYPE) RETURN VARCHAR2 IS
	vc_full_name VARCHAR2(30);
	
	BEGIN
		SELECT CONCAT(CONCAT(s.staff_fname, ' '), s.staff_lname)
		INTO vc_full_name
		FROM staff s
		WHERE staff_id=in_staff_id;
		
		RETURN vc_full_name;
END func_staff_name;
/
SHOW ERRORS;
--function created
--no errors

--FUNCTION 4
--function to return staff salary that takes staff id as parameter
CREATE OR REPLACE FUNCTION func_staff_salary(in_staff_id staff.staff_id%TYPE) RETURN NUMBER IS
	vn_salary staff.staff_salary%TYPE;
	
	BEGIN
		SELECT staff_salary
		INTO vn_salary
		FROM staff s
		WHERE staff_id=in_staff_id;
		
		RETURN vn_salary;
END func_staff_salary;
/
SHOW ERRORS;
--function created
--no errors

--procedure to output name and salary of the staff identified by staff id from parameter
CREATE OR REPLACE PROCEDURE proc_output_staff_data(in_staff_id NUMBER) IS
	vc_fullname VARCHAR2(30);
	vn_salary staff.staff_salary%TYPE;
	
	BEGIN 
		vc_fullname:= func_staff_name(in_staff_id);
		vn_salary := func_staff_salary(in_staff_id);
		DBMS_OUTPUT.PUT_LINE('The staff '||vc_fullname ||' has salary '||vn_salary);
END proc_output_staff_data;
/
SHOW ERRORS;
--procedure created
--no errors

--function to return highest ticket price festival
CREATE OR REPLACE FUNCTION func_highest_ticket_price RETURN NUMBER IS
	vn_price festivals.ticket_price%TYPE;
	
	BEGIN
		SELECT MAX(ticket_price)
		INTO vn_price
		FROM festivals f;
		
		RETURN vn_price;
END func_highest_ticket_price;
/
SHOW ERRORS;
--no errors
--function created

--procedure to output the highest ticket price festival
CREATE OR REPLACE PROCEDURE proc_output_ticket_price IS
	vn_price festivals.ticket_price%TYPE;
	
	BEGIN 
		vn_price := func_highest_ticket_price;
		DBMS_OUTPUT.PUT_LINE('The highest ticket price among registered festival is '||vn_price);
END proc_output_ticket_price;
/
SHOW ERRORS;
--procedure created
--no errors