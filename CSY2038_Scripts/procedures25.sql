/*
Group Number: 25
File Name: procedures25.sql
Group Members:  Shreejan Regmi - 18417132
				Neetu Kumari Das - 18406487 
				Saurav Khatiwada - 18413649
				Hira Bahadur Rana Kauchha - 18413703
Module Name: Database 2
Module Code: CSY2038			
*/

--@E:\CSY2038_Scripts\procedures25.sql;

--to display output on the screen
SET SERVEROUTPUT ON


--PROCEDURE 1
--CREATING PROCEDURE 'proc_insert_f_natures' with parameters 'in_f_nature_name' to insert into festival_natures table
CREATE OR REPLACE PROCEDURE proc_insert_f_natures(in_f_nature_name IN festival_natures.f_nature_name%TYPE) IS
	BEGIN
		INSERT INTO festival_natures (f_nature_id, f_nature_name)
		VALUES (seq_f_nature_id.NEXTVAL, in_f_nature_name);
		DBMS_OUTPUT.PUT_LINE('INSERTION SUCCESSFUL');
	END proc_insert_f_natures;
/
SHOW ERRORS;
--procedure created 
--no errors

--PROCEDURE 2
--CREATING PROCEDURE proc_insert_locations to insert into locations table
CREATE OR REPLACE PROCEDURE proc_insert_locations IS
	vc_street VARCHAR2(20):='4128 WHITEMAN';
	vc_city locations.location_name.city%TYPE := 'PEMBERTON';
	vc_country locations.location_name.country%TYPE:='NEW ZEALAND';
	BEGIN 
		INSERT INTO locations(location_id, location_name)
		VALUES (seq_location_id.NEXTVAL, address_type(vc_street, vc_city, vc_country));
		DBMS_OUTPUT.PUT_LINE('INSERTION SUCCESSFUL');
END proc_insert_locations;
/
SHOW ERRORS;
--procedure created
--no errors

--PROCEDURE 3
--CREATING PROCEDURE 'proc_insert_staff' to insert into staff table
CREATE OR REPLACE PROCEDURE proc_insert_staff(in_fname staff.staff_fname%TYPE, in_lname staff.staff_lname%TYPE, in_l_id staff.leader_id%TYPE, in_salary staff.staff_salary%TYPE ,in_g staff.gender%TYPE, in_address_street addresses.street%TYPE) IS

	vc_contact contact_varray_type := contact_varray_type(contact_type('+9779877622432', 'LUPIN@GMAIL.COM'),
														  contact_type('+9778977654320', 'LUPIN@YAHOO.COM'));
	BEGIN 
		INSERT INTO staff(staff_id, staff_fname, staff_lname, leader_id, staff_salary ,gender, staff_contact, staff_address)
		SELECT seq_staff_id.NEXTVAL, in_fname , in_lname, in_l_id, in_salary ,in_g , vc_contact, REF(a)
		FROM addresses a
		WHERE a.street= in_address_street;
		DBMS_OUTPUT.PUT_LINE('INSERTION SUCCESSFUL');
END proc_insert_staff;
/
SHOW ERRORS;
--procedure created
--no errors

--PROCEDURE 4
--CITATION: (docs.oracle.com, 2019)
--CREATING PROCEDURE 'proc_update_staff_salary' with user_defined exception to update staff's salary
CREATE OR REPLACE PROCEDURE proc_update_staff_salary(in_gender staff.gender%TYPE) IS
vn_count NUMBER;
update_salary EXCEPTION;
no_update EXCEPTION;
BEGIN
	SELECT COUNT(staff_id)
	INTO vn_count
	FROM staff
	WHERE gender = in_gender;
	IF vn_count < 4 THEN
		RAISE update_salary;
	ELSE 
		RAISE no_update;
	END IF;
	EXCEPTION
	WHEN update_salary THEN
		UPDATE staff
		SET staff_salary = staff_salary * 1.1
		WHERE gender = in_gender;
		DBMS_OUTPUT.PUT_LINE('UPDATE SUCCESSFUL');
	WHEN OTHERS THEN 
		DBMS_OUTPUT.PUT_LINE('NO UPDATES EXECUTED');
	END;
/
SHOW ERRORS;
--procedure created 
--no errors found


--PROCEDURE 5
--CREATING PROCEDURE 'proc_delete_staff' to delete staff
CREATE OR REPLACE PROCEDURE proc_delete_staff(in_staff_id staff.staff_id%TYPE) IS
	BEGIN
		DELETE FROM staff 
		WHERE staff_id=in_staff_id;
		DBMS_OUTPUT.PUT_LINE('DELETION SUCCESSFUL');
END proc_delete_staff;
/
SHOW ERRORS;
--procedure created 
--no errors found

--PROCEDURE 6 
--CITATION: (docs.oracle.com, 2019)
--CREATING PROCEDURE WITH 'OUT' PARAMETER and PREDEFINED EXCEPTION supported by TimesTen to display set full name of staff identified by staff id provided as argument
CREATE OR REPLACE PROCEDURE proc_out_param(in_staff_id staff.staff_id%TYPE, out_staff_name OUT VARCHAR2) AS
	BEGIN 
		SELECT staff_fname||' '||staff_lname 
		INTO out_staff_name
		FROM staff
		WHERE staff_id=in_staff_id;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
        out_staff_name := '(NO ROWS FOUND)';
END proc_out_param;
/
SHOW ERRORS;
--procedure created
--no errors

--PROCEDURE 7
--CITATION: (docs.oracle.com, 2019)
--CREATING PROCEDURE WITH A PARAMETER THAT ACTS AS BOTH IN AND OUT. PROCEDURE TO GUESS THE HIGHEST TICKET PRICE OF FESTIVALS
CREATE OR REPLACE PROCEDURE proc_out_in_param(in_out_max_price IN OUT festivals.ticket_price%TYPE) AS
	BEGIN
		SELECT MAX(ticket_price)
		INTO in_out_max_price
		FROM festivals;
END proc_out_in_param;
/
SHOW ERRORS;
--procedure created
--no errors