/*
Group Number: 25
File Name: cursors25.sql
Group Members:  Shreejan Regmi - 18417132
				Neetu Kumari Das- 18406487
				Saurav Khatiwada - 18413649
				Hira Bahadur Rana Kauchha - 18413703
Module Name: Database 2
Module Code: CSY2038			
*/

--@E:\CSY2038_Scripts\cursors25.sql;

--to display output on the screen
SET SERVEROUTPUT ON

--CURSOR USE 1
--using implicit cursors FOUND and NOTFOUND to display a message when a row is tried to be deleted
CREATE OR REPLACE PROCEDURE proc_imp_del_staff(in_fname staff.staff_fname%TYPE, in_lname staff.staff_lname%TYPE) IS
	BEGIN
			DELETE FROM staff
			WHERE staff_fname=in_fname
			AND staff_lname=in_lname;
		IF(SQL%FOUND) THEN
			DBMS_OUTPUT.PUT_LINE('You deleted '||in_fname||' '||in_lname);
		ELSIF(SQL%NOTFOUND) THEN
			RAISE_APPLICATION_ERROR(-20003, 'NO SUCH STAFF FOUND');
		END IF;
END proc_imp_del_staff;
/
SHOW ERRORS;
--Procedure created
--no errors

--CURSOR USE 2
--using explcit cursor to display the number of festivals having ticket price greater than argument using for loop
CREATE OR REPLACE PROCEDURE proc_exp_count_festivals(in_ticket_price festivals.ticket_price%TYPE) IS
	CURSOR cur_festivals IS 
	SELECT festival_name, ticket_price 
	FROM festivals
	WHERE ticket_price>in_ticket_price;
	
	rec_cur_festivals cur_festivals%ROWTYPE;
	vn_num_of_festivals NUMBER(3);
	BEGIN
		vn_num_of_festivals:=0;
		FOR rec_cur_festivals IN cur_festivals LOOP
			DBMS_OUTPUT.PUT_LINE('Festival Name : '|| rec_cur_festivals.festival_name||' Ticket Price: '||rec_cur_festivals.ticket_price);
			vn_num_of_festivals:=cur_festivals%ROWCOUNT;
		END LOOP;
		DBMS_OUTPUT.PUT_LINE('The number of festivals with ticket price greater than '||in_ticket_price ||' is '||vn_num_of_festivals);
END proc_exp_count_festivals;
/
SHOW ERRORS;
--procedure created
--no errors 

--CURSOR USE 3
--using explcit cursor to display staff having salary lesser than argument using while loop
CREATE OR REPLACE PROCEDURE proc_exp_show_staff(in_staff_salary staff.staff_salary%TYPE) IS
		CURSOR cur_staff IS
		SELECT staff_fname||' '||staff_lname AS staff_name, staff_salary
		FROM staff 
		WHERE staff_salary<in_staff_salary;

		rec_cur_staff cur_staff%ROWTYPE;
		BEGIN
			OPEN cur_staff;
			FETCH cur_staff INTO rec_cur_staff;
			IF cur_staff%NOTFOUND THEN
				RAISE_APPLICATION_ERROR(-20010, 'NO SUCH STAFF FOUND');
			END IF;
			WHILE cur_staff%FOUND LOOP
				DBMS_OUTPUT.PUT_LINE('Staff '||rec_cur_staff.staff_name||' has salary '||rec_cur_staff.staff_salary);
				FETCH cur_staff INTO rec_cur_staff;
			END LOOP;
			IF cur_staff%ISOPEN THEN
				CLOSE cur_staff;
			END IF;
END proc_exp_show_staff;
/
SHOW ERRORS;
--Procedure created
--No errors