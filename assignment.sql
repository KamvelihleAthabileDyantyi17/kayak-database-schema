assignment.sql

Question 2
/* ====================================================================
Project Name: Kayak Rental Database Schema
Author: Kamvelihle Athabile Dyantyi
Date: April 2026
Description: A relational database schema designed for a kayak 
             shop to manage inventory, customers, and upgrade services.
             Written in Oracle SQL.
==================================================================== */

-- 1. Create Kayaks Table
CREATE TABLE kayaks (
    kayak_id NUMBER PRIMARY KEY,
    kayak_type VARCHAR2(50),
    kayak_model VARCHAR2(50),
    manufacturer VARCHAR2(50)
);

-- 2. Create Customers Table
CREATE TABLE customers (
    cust_id NUMBER PRIMARY KEY,
    cust_fname VARCHAR2(50),
    cust_sname VARCHAR2(50),
    cust_address VARCHAR2(100),
    cust_contact VARCHAR2(50)
);

-- 3. Create Upgrades Table
CREATE TABLE upgrades (
    upgrade_id NUMBER PRIMARY KEY,
    upgrade_work VARCHAR2(100),
    upgrade_date DATE,
    upgrade_hrs NUMBER
);

-- 4. Create Junction Table (Kayak Upgrades)
CREATE TABLE kayak_upgrades (
    kayak_upgrade_num NUMBER PRIMARY KEY,
    kayak_upgrade_date DATE,
    kayak_upgrade_amt NUMBER,
    kayak_id NUMBER REFERENCES kayaks(kayak_id),
    cust_id NUMBER REFERENCES customers(cust_id),
    upgrade_id NUMBER REFERENCES upgrades(upgrade_id)
);

-- Commit the changes to save them permanently
COMMIT;

SELECT table_name
FROM user_tables
WHERE table_name IN ('KAYAKS', 'CUSTOMERS', 'UPGRADES', 'KAYAK_UPGRADES');



INSERT INTO kayaks VALUES (12345, 'Single Seater', 'K100', 'Feelfree');
INSERT INTO kayaks VALUES (12346, 'Tandem', 'Ocean-2', 'Perception');
INSERT INTO kayaks VALUES (12347, 'Fishing', 'Stealth-5', 'Viking');
INSERT INTO kayaks VALUES (12348, 'Racing', 'Sprint-X', 'Epic');
INSERT INTO kayaks VALUES (12349, 'Inflatable', 'Air-Row', 'Intex');

INSERT INTO customers VALUES (1, 'Bruce', 'Wayne', '1007 Mountain Drive, Gotham', '012-911-0000');
INSERT INTO customers VALUES (2, 'Clark', 'Kent', '344 Clinton St, Metropolis', '011-555-0100');
INSERT INTO customers VALUES (3, 'Diana', 'Prince', 'Themyscira Embassy, Paris', '033-777-1941');
INSERT INTO customers VALUES (4, 'Barry', 'Allen', '120 Central City St, Central City', '055-888-2014');
INSERT INTO customers VALUES (5, 'Arthur', 'Curry', '1 Lighthouse Point, Amnesty Bay', '021-444-1941');

INSERT INTO upgrades VALUES (101, 'Hull Reinforcement', '01-APR-2026', 5);
INSERT INTO upgrades VALUES (102, 'GPS Installation', '02-APR-2026', 2);
INSERT INTO upgrades VALUES (103, 'Rod Holder Mount', '03-APR-2026', 1);
INSERT INTO upgrades VALUES (104, 'Custom Paint Job', '04-APR-2026', 8);
INSERT INTO upgrades VALUES (105, 'Rudder System Fit', '05-APR-2026', 4);

INSERT INTO kayak_upgrades VALUES (5001, '06-APR-2026', 1500, 12345, 1, 101); -- Bruce upgrading his K100
INSERT INTO kayak_upgrades VALUES (5002, '07-APR-2026', 800, 12346, 2, 102);  -- Clark upgrading his Tandem
INSERT INTO kayak_upgrades VALUES (5003, '08-APR-2026', 300, 12347, 3, 103);  -- Diana upgrading her Fishing kayak
INSERT INTO kayak_upgrades VALUES (5004, '09-APR-2026', 2500, 12348, 4, 104); -- Barry upgrading his Racing kayak
INSERT INTO kayak_upgrades VALUES (5005, '10-APR-2026', 1200, 12349, 5, 105); -- Arthur upgrading his Inflatable

SELECT * FROM kayaks;
SELECT * FROM customers;
SELECT * FROM upgrades;mah mcma
SELECT * FROM kayak_upgrades;

Question 3.1

naming issue

ALTER SESSION SET "_ORACLE_SCRIPT"=true;

CREATE USER Tshepo IDENTIFIED BY tmphooabc2023;
CREATE USER Mya IDENTIFIED BY mrobertabc2023;

//just to check if they were created , Had to do these Twice
GRANT CREATE SESSION TO Tshepo, Mya;
GRANT SELECT ANY TABLE TO Tshepo, Mya;

-- This is to check if the users are saved and to visually see them 
SELECT username FROM all_users WHERE username IN ('TSHEPO', 'MYA');


Question 3.2
The Theory: User Permissions & Separation of Duties
When writing this up for your assignment, here is how to explain these concepts like an enterprise-level developer.

What are User Permissions?
Think of user permissions as the digital bouncers of your database. They define exactly who can access the system and what they are allowed to do once inside. Without permissions, anyone who logs in would have the power of a superuser (like the SYSTEM account you are using), which is a massive security risk. We use the Principle of Least Privilege, meaning a user is only given the exact permissions they need to do their job, and absolutely nothing more.

What is Separation of Duties (SoD)?
Separation of Duties is a core security principle where critical tasks are split up among multiple people or roles. The rule is simple: No single person should have total control over a process from start to finish.

Why is it so important?

Preventing Fraud: Imagine an e-commerce or banking system. If the same person has the permission to create a vendor account and the permission to authorize a payment to that vendor, they could easily steal money. By separating those duties, it forces two different people to authorize the transaction, making fraud much harder.

Preventing Disasters: In a development environment, if a junior dev has the power to write database scripts and run them on the live production server, one typo could delete the entire customer table. SoD means the dev writes the code, but a separate Database Administrator reviews and executes it. It acts as a safety net.

-- Question 4 



-- had to put the data back it coz SELECT was working 
INSERT INTO kayaks VALUES (12345, 'Single Seater', 'K100', 'Feelfree');
INSERT INTO kayaks VALUES (12346, 'Tandem', 'Ocean-2', 'Perception');
INSERT INTO kayaks VALUES (12347, 'Fishing', 'Stealth-5', 'Viking');
INSERT INTO kayaks VALUES (12348, 'Racing', 'Sprint-X', 'Epic');
INSERT INTO kayaks VALUES (12349, 'Inflatable', 'Air-Row', 'Intex');

INSERT INTO customers VALUES (1, 'Bruce', 'Wayne', '1007 Mountain Drive, Gotham', '012-911-0000');
INSERT INTO customers VALUES (2, 'Clark', 'Kent', '344 Clinton St, Metropolis', '011-555-0100');
INSERT INTO customers VALUES (3, 'Diana', 'Prince', 'Themyscira Embassy, Paris', '033-777-1941');
INSERT INTO customers VALUES (4, 'Barry', 'Allen', '120 Central City St, Central City', '055-888-2014');
INSERT INTO customers VALUES (5, 'Arthur', 'Curry', '1 Lighthouse Point, Amnesty Bay', '021-444-1941');

INSERT INTO upgrades VALUES (101, 'Hull Reinforcement', '01-APR-2026', 5);
INSERT INTO upgrades VALUES (102, 'GPS Installation', '02-APR-2026', 2);
INSERT INTO upgrades VALUES (103, 'Rod Holder Mount', '03-APR-2026', 1);
INSERT INTO upgrades VALUES (104, 'Custom Paint Job', '04-APR-2026', 8);
INSERT INTO upgrades VALUES (105, 'Rudder System Fit', '05-APR-2026', 4);

INSERT INTO kayak_upgrades VALUES (5001, '06-APR-2026', 1500, 12345, 1, 101); 
INSERT INTO kayak_upgrades VALUES (5002, '07-APR-2026', 800, 12346, 2, 102); 
INSERT INTO kayak_upgrades VALUES (5003, '08-APR-2026', 300, 12347, 3, 103); 
INSERT INTO kayak_upgrades VALUES (5004, '09-APR-2026', 2500, 12348, 4, 104); 
INSERT INTO kayak_upgrades VALUES (5005, '10-APR-2026', 1200, 12349, 5, 105); 

COMMIT;

-- resize 
SET LINESIZE 200;
SET PAGESIZE 100;

--Select works now
SELECT 
    ku.kayak_id AS kyid, 
    ku.cust_id AS customerid, 
    u.upgrade_hrs AS upgrade_hours, 
    ku.kayak_upgrade_amt AS kayak_upgrade_amount,
    (u.upgrade_hrs * ku.kayak_upgrade_amt) AS total_sales_amount
FROM 
    kayak_upgrades ku
JOIN 
    upgrades u ON ku.upgrade_id = u.upgrade_id;

--Question 5
-- As always need to resize your table , just to make your table easier , run this first
SET LINESIZE 200;
SET PAGESIZE 100;
COLUMN customer_full_name FORMAT A20;
COLUMN kayak_type FORMAT A15;
COLUMN upgrade_work FORMAT A25;


-- THen run this
SELECT 
    c.cust_fname || ' ' || c.cust_sname AS customer_full_name, 
    k.kayak_type, 
    u.upgrade_hrs AS upgrade_hours, 
    u.upgrade_work, 
    ku.kayak_upgrade_amt AS kayak_upgrade_amount
FROM 
    kayak_upgrades ku
JOIN 
    customers c ON ku.cust_id = c.cust_id
JOIN 
    kayaks k ON ku.kayak_id = k.kayak_id
JOIN 
    upgrades u ON ku.upgrade_id = u.upgrade_id;


-- Question 6
--so here I jjst changed the amounts so that they wi=ould be probperly abble to do this query

UPDATE kayak_upgrades SET kayak_upgrade_amt = 75 WHERE kayak_upgrade_num = 5001;
UPDATE kayak_upgrades SET kayak_upgrade_amt = 30 WHERE kayak_upgrade_num = 5002;
UPDATE kayak_upgrades SET kayak_upgrade_amt = 75 WHERE kayak_upgrade_num = 5003;
UPDATE kayak_upgrades SET kayak_upgrade_amt = 50 WHERE kayak_upgrade_num = 5004;
UPDATE kayak_upgrades SET kayak_upgrade_amt = 30 WHERE kayak_upgrade_num = 5005;

COMMIT;

-- this si the SELECRT statement to show the total sales amount for each upgrade, which is the product of upgrade hours and kayak upgrade amount
/* Q2: CURSOR IDENTIFICATION & SUSTAINABILITY
   Type of Cursor: Implicit Cursor
   
   Reasons for Sustainability:
   1. Efficiency: Implicit cursors are automatically managed by Oracle for single SQL statements, 
      reducing overhead and making the code cleaner and easier to maintain for simple filters.
   2. Resource Management: Since this query only fetches specific rows (WHERE > 50), an 
      implicit cursor handles the memory allocation and closing automatically, preventing 
      memory leaks in the database session.
*/

SELECT 
    ku.cust_id, 
    u.upgrade_work, 
    ku.kayak_upgrade_amt
FROM 
    kayak_upgrades ku
JOIN 
    upgrades u ON ku.upgrade_id = u.upgrade_id
WHERE 
    ku.kayak_upgrade_amt > 50;
    c:\Users\Student\Pictures\Screenshots\Screenshot 2026-04-10 125543.png