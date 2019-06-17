/*
Group Number: 25
File Name: functions_test25.sql
Group Members:  Shreejan Regmi - 18417132
				Neetu Kumari Das - 18406487 
				Saurav Khatiwada - 18413649
				Hira Bahadur Rana Kauchha - 18413703
Module Name: Database 2
Module Code: CSY2038			
*/

--@E:\CSY2038_Scripts\functions_test25.sql;

--to display output on the screen
SET SERVEROUTPUT ON

--executing the procedure proc_count_festivals to count the number of festivals
EXECUTE proc_count_festivals;
--OUTPUT: The number of festivals in festivals table is 9

--executing the procedure proc_output_username to display the username of staff id 1
EXECUTE proc_output_username(1);
--OUTPUT: The username for staff ID 1 is AAYMOKT

--executing the procedure proc_staff_data to display the username staff id 1
EXECUTE proc_output_staff_data(2);
--OUTPUT: The staff HIRA KAUCHHA has salary 2200.2

--executing the procedure proc_output_ticket_price to the highest ticket price
EXECUTE proc_output_ticket_price;
--OUTPUT: The highest ticket price among registered festival is 4000.2