/*
Group Number: 25
File Name: insert25.sql
Group Members:  Shreejan Regmi - 18417132
				Neetu Kumari Das- 18406487
				Saurav Khatiwada - 18413649
				Hira Bahadur Rana Kauchha - 18413703
Module Name: Database 2
Module Code: CSY2038			
*/

--@E:\CSY2038_Scripts\insert25.sql;

--FESTIVAL_NATURES Table
--describing the structure of festival_natures
DESC festival_natures;

--testing before inserting rows in festival_natures table
--0 rows returned
SELECT f_nature_id, f_nature_name FROM festival_natures ORDER BY f_nature_id;

--inserting into festival_natures
INSERT INTO festival_natures
VALUES (seq_f_nature_id.NEXTVAL, 'RELIGIOUS');

INSERT INTO festival_natures
VALUES (seq_f_nature_id.NEXTVAL, 'MUSIC');

INSERT INTO festival_natures
VALUES (seq_f_nature_id.NEXTVAL, 'FOOD');

INSERT INTO festival_natures (f_nature_id, f_nature_name)
VALUES (seq_f_nature_id.NEXTVAL, 'FILM');

INSERT INTO festival_natures (f_nature_id, f_nature_name)
VALUES (seq_f_nature_id.NEXTVAL, 'SCIENCE');

--testing of insertion of 5 rows
--5 rows returned- correct
SELECT f_nature_id, f_nature_name FROM festival_natures ORDER BY f_nature_id;

--LOCATIONS Table
--describing the structure of locations table
DESC locations;
--describing address_type
DESC address_type;

--testing before inserting data into locations table
--0 rows returned
SELECT l.location_id, l.location_name.street Street, l.location_name.city City, l.location_name.country Country
FROM locations l;

--inserting into locations
INSERT INTO locations
VALUES (seq_location_id.NEXTVAL,address_type('JORPATI 4', 'KTM', 'NEPAL'));

INSERT INTO locations
VALUES (seq_location_id.NEXTVAL,address_type('OILNIGAM', 'BIRATNAGAR', 'NEPAL'));

INSERT INTO locations
VALUES (seq_location_id.NEXTVAL,address_type('BHARATPUR', 'CHITWAN', 'NEPAL'));

INSERT INTO locations(location_id, location_name)
VALUES (seq_location_id.NEXTVAL, address_type('22 GOLDEN GATE', 'LOS ANGELES', 'USA'));

INSERT INTO locations(location_id, location_name)
VALUES (seq_location_id.NEXTVAL, address_type('ALEXANDER STREET', 'TORONTO', 'CANADA'));

--after 5
INSERT INTO locations
VALUES(seq_location_id.NEXTVAL, address_type('333 SAN JUAN BLVD', 'SAN JUAN', 'PUERTO RICO'));

INSERT INTO locations
VALUES(seq_location_id.NEXTVAL, address_type('AVENUE CHAMPS 456', 'PARIS', 'FRANCE'));

INSERT INTO locations
VALUES(seq_location_id.NEXTVAL, address_type('7 STREET SAGL', 'LUGANO', 'SWITZERLAND'));

INSERT INTO locations
VALUES(seq_location_id.NEXTVAL, address_type('5567 KNIGHT COURT', 'LONDON', 'UK'));


--testing of insertion of 9 rows
--9 rows returned - correct
SELECT l.location_id, l.location_name.street Street, l.location_name.city City, l.location_name.country Country
FROM locations l;


--ADDRESSES Table
--describing the structure of addresses table
DESC addresses;

--testing before inserting data into addresses table
--0 rows returned
SELECT street, city, country FROM addresses;

--inserting into addresses
INSERT INTO addresses(street, city, country)
VALUES ('111 GREEN STATE ROAD', 'BOSTON' ,'USA');

INSERT INTO addresses
VALUES ('22 GOLDEN GATE', 'LOS ANGELES' ,'USA');

INSERT INTO addresses(street, city, country)
VALUES ('562 HOCKEY STREET', 'TORONTO' ,'CANADA');

INSERT INTO addresses
VALUES('12 SAINT ROAD', 'NEMS', 'UGANDA');

INSERT INTO addresses(street, city, country)
VALUES ('DURBAR MARG', 'KTM' ,'NEPAL');


--testing of insertion of 5 rows
--5 rows returned - correct
SELECT street, city, country FROM addresses;

--STAFF TABLE
--describing the structure of staff table
DESC staff;
--describing contact_type
DESC contact_type;
--describing contact_varray_type
DESC contact_varray_type;


--testing before inserting data into staff table
--0 rows returned
SELECT s.staff_id, s.staff_fname, s.staff_lname, s.leader_id, s.staff_salary, s.staff_address.street Street, s.staff_address.city City, s.staff_address.country Country
FROM staff s;

--describing addresses table
SELECT street, city, country FROM addresses;


--inserting into staff
INSERT INTO staff
SELECT seq_staff_id.NEXTVAL, 'AAYUSH', 'MOKTAN', 1, 2000.56, 'M', '2-JUN-1990' , NULL , contact_varray_type(contact_type('+9779866544321', 'AAYUSH@GMAIL.COM'),
																					 contact_type('+9771234567890', 'AAYUSH@YAHOO.COM')), REF(a)
FROM addresses a
WHERE a.street='562 HOCKEY STREET';

INSERT INTO staff
SELECT seq_staff_id.NEXTVAL, 'HIRA', 'KAUCHHA', 1, 2200.20, 'M', '5-MAY-1995' , NULL , contact_varray_type(contact_type('+9779866123456', 'HIRA@GMAIL.COM'),
																					 contact_type('+9771234566543', 'HIRA@YAHOO.COM')), REF(a)
FROM addresses a
WHERE a.street='22 GOLDEN GATE';

INSERT INTO staff
SELECT seq_staff_id.NEXTVAL, 'SALON', 'GURUNG', 2, 9000.79, 'M', '10-APR-1998' , NULL , contact_varray_type(contact_type('+9779866123332', 'SALON@GMAIL.COM'),
																					 contact_type('+9771234598767', 'SALON@YAHOO.COM')), REF(a)
FROM addresses a
WHERE a.street='111 GREEN STATE ROAD';

INSERT INTO staff(staff_id, staff_fname, staff_lname, leader_id, staff_salary, staff_dob , staff_contact, staff_address)
SELECT seq_staff_id.NEXTVAL, 'SHREYA', 'THAPA', 1, 8240.80, '27-MAY-1997', contact_varray_type(contact_type('+9779988776655', 'SHREYA@GMAIL.COM'),
																				  contact_type('+9779800935968', 'SHREYA@YAHOO.COM'),
																				  contact_type('+9779866523456', 'SHREYA@HOTMAIL.COM')), REF (a)
FROM addresses a
WHERE a.street='12 SAINT ROAD';	


INSERT INTO staff(staff_id, staff_fname, staff_lname, leader_id, staff_salary, staff_dob ,staff_contact, staff_address)
SELECT seq_staff_id.NEXTVAL, 'SAMI', 'ADHIKARI', 3, 5500.65, '20-JAN-1989'  , contact_varray_type(contact_type('+9779862076543', 'SAMI@GMAIL.COM'),
																						contact_type('+9779800936622', 'SAMI@YAHOO.COM')), REF (a)
FROM addresses a
WHERE a.street='DURBAR MARG';	
																			  

--testing of insertion of 5 rows
--5 rows returned - correct
SELECT s.staff_id, s.staff_fname, s.staff_lname, s.leader_id, s.staff_salary Salary, s.staff_address.street Street, s.staff_address.city City, s.staff_address.country Country
FROM staff s;

--testing insertion of staff with image
--SELECT s.staff_id, s.staff_fname, s.staff_lname, s.staff_image FROM staff s WHERE s.staff_fname='MILAN';
--BLOB data inserted
--OK

--FESTIVALS Table
--describing the structure of festivals table
DESC festivals;
--describing f_activities_varray_type
DESC f_activities_varray_type;
--DESC f_food_offerings_table_type
DESC f_food_offerings_table_type;

--testing before inserting data into festivals table
--0 rows returned
SELECT f_nature_id NatureID, location_id LocationID, festival_name Name, festival_date, a.COLUMN_VALUE Activities, f.festival_details.running_time, fo.COLUMN_VALUE Foods FROM festivals f, TABLE(f.festival_details.activities) a, TABLE(f.festival_details.food) fo;

--inserting
INSERT INTO festivals
VALUES(1, 1, 'SARASWATI PUJA', '2-JUL-2017', 4000.20,
festival_description_type( 
f_activities_varray_type('OFFERINGS', 'PRAYERS', 'EATING'),'3 HOURS', f_food_offerings_table_type('SWEETS', 'JUICE'))); 

INSERT INTO festivals
VALUES(2, 2, 'METALLICA REUNION', '2-OCT-2019', 2000.90,
festival_description_type( 
f_activities_varray_type('SINGING', 'DANCING'),'6 HOURS', f_food_offerings_table_type('BEER', 'PIZZA'))); 

INSERT INTO festivals
VALUES(3, 3, 'FOOD HUNT FEST', '2-MAY-2012', 900.50,
festival_description_type( 
f_activities_varray_type('LUNCH', 'PHOTOGRAPHY'),'6 HOURS', f_food_offerings_table_type('MOMO', 'PIZZA', 'CHOW MEIN'))); 

INSERT INTO festivals(f_nature_id, location_id, festival_name, festival_date, ticket_price, festival_details) 
VALUES(4, 4, 'HORROR FILM FESTIVAL', '8-OCT-2012', 1100.55,
festival_description_type( 
f_activities_varray_type('THEATRE SHOW', 'INTERVIEW'),'4 HOURS', f_food_offerings_table_type('JUICE', 'CHICKEN', 'DESSERT'))); 

INSERT INTO festivals(f_nature_id, location_id, festival_name, festival_date, ticket_price, festival_details) 
VALUES(5, 5, 'ROCKET SCIENCE FEST', '12-DEC-2018', 420.69,
festival_description_type( 
f_activities_varray_type('EXHIBITION'),'3 HOURS', f_food_offerings_table_type('SANDWICH', 'DESSERT'))); 

--after 5
INSERT INTO festivals
VALUES(2, 6, 'METALLICA REUNION', '2-NOV-2019', 1400.80,
festival_description_type( 
f_activities_varray_type('SINGING', 'DANCING'),'6 HOURS', f_food_offerings_table_type('BEER', 'PIZZA'))); 

INSERT INTO festivals
VALUES(2, 7, 'METALLICA REUNION', '2-DEC-2019', 1105.50,
festival_description_type( 
f_activities_varray_type('SINGING', 'DANCING'),'6 HOURS', f_food_offerings_table_type('BEER', 'PIZZA'))); 

INSERT INTO festivals
VALUES(3, 8, 'FOOD HUNT FEST', '2-JUN-2012', 1200.50,
festival_description_type( 
f_activities_varray_type('LUNCH', 'PHOTOGRAPHY'),'6 HOURS', f_food_offerings_table_type('MOMO', 'PIZZA', 'CHOW MEIN'))); 

INSERT INTO festivals(f_nature_id, location_id, festival_name, festival_date, ticket_price, festival_details) 
VALUES(4, 9, 'HORROR FILM FESTIVAL', '8-NOV-2012', 1800.55,
festival_description_type( 
f_activities_varray_type('THEATRE SHOW', 'INTERVIEW'),'4 HOURS', f_food_offerings_table_type('JUICE', 'CHICKEN', 'DESSERT'))); 



--testing of insertion of rows into festivals table
SELECT f_nature_id NatureID, location_id LocationID, festival_name Name, festival_date, a.COLUMN_VALUE Activities, f.festival_details.running_time, fo.COLUMN_VALUE Foods FROM festivals f, TABLE(f.festival_details.activities) a, TABLE(f.festival_details.food) fo;

--FESTIVAL_STAFF Table
--describing festival_staff table
DESC festival_staff;

--testing before inserting data into festival_staff table
--0 rows returned
SELECT staff_id ,f_nature_id, location_id FROM festival_staff;

--inserting
INSERT INTO festival_staff(staff_id, f_nature_id, location_id)
VALUES (1, 1 ,1);

INSERT INTO festival_staff
VALUES (2, 2 ,2);

INSERT INTO festival_staff
VALUES (3, 3 ,3);

INSERT INTO festival_staff(staff_id, f_nature_id, location_id)
VALUES (4, 4 ,4);

INSERT INTO festival_staff(staff_id, f_nature_id, location_id)
VALUES (5, 5 ,5);

INSERT INTO festival_staff(staff_id, f_nature_id, location_id)
VALUES (2, 2 ,6);

INSERT INTO festival_staff(staff_id, f_nature_id, location_id)
VALUES (2, 2 ,7);

INSERT INTO festival_staff(staff_id, f_nature_id, location_id)
VALUES (3, 3 ,8);

INSERT INTO festival_staff(staff_id, f_nature_id, location_id)
VALUES (4, 4 ,9);

--testing of insertion of rows into festival_staff table
--9 rows returned -correct
SELECT staff_id, f_nature_id, location_id FROM festival_staff;