/*
Group Number: 25
File Name: packages25.sql
Group Members:  Shreejan Regmi - 18417132
				Neetu Kumari Das- 18406487
				Saurav Khatiwada - 18413649
				Hira Bahadur Rana Kauchha - 18413703
Module Name: Database 2
Module Code: CSY2038			
*/

--@E:\CSY2038_Scripts\packages25.sql;

--creating package pkg_leader_details
--Citation: (docs.oracle.com, 2019) 
CREATE OR REPLACE PACKAGE pkg_leader_details IS
	FUNCTION func_leader_id(in_staff_id staff.staff_id%TYPE) RETURN NUMBER;
	FUNCTION func_leader_name(in_staff_id staff.staff_id%TYPE) RETURN VARCHAR2;
	PROCEDURE proc_output_leader_name(in_staff_id staff.staff_id%TYPE);
END pkg_leader_details;
/
SHOW ERRORS;
--package created

--creating the body of package 
CREATE OR REPLACE PACKAGE BODY pkg_leader_details IS
	FUNCTION func_leader_id(in_staff_id staff.staff_id%TYPE) RETURN NUMBER IS
		vn_leader_id staff.leader_id%TYPE;
		BEGIN 
			SELECT leader_id 
			INTO vn_leader_id
			FROM staff
			WHERE staff_id=in_staff_id;
			
			RETURN vn_leader_id;
	END func_leader_id;
		
	FUNCTION func_leader_name(in_staff_id staff.staff_id%TYPE) RETURN VARCHAR2 IS
		vn_leader_id staff.leader_id%TYPE;
		vc_name VARCHAR2(30);
		BEGIN 
			vn_leader_id:=func_leader_id(in_staff_id);
			SELECT staff_fname||' '||staff_lname
			INTO vc_name
			FROM staff
			WHERE staff_id=vn_leader_id;
			
			RETURN vc_name;
	END func_leader_name;
	
	PROCEDURE proc_output_leader_name(in_staff_id staff.staff_id%TYPE) IS
		vc_name VARCHAR2(30);
		BEGIN
			vc_name:=func_leader_name(in_staff_id);
			DBMS_OUTPUT.PUT_LINE('The leader name of staff '||in_staff_id||' is '||vc_name);
	END proc_output_leader_name;
END pkg_leader_details;
/
SHOW ERRORS;
--package body created