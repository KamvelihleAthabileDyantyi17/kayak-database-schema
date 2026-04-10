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

Question 3

naming issue

ALTER SESSION SET "_ORACLE_SCRIPT"=true;

CREATE USER Tshepo IDENTIFIED BY tmphooabc2023;
CREATE USER Mya IDENTIFIED BY mrobertabc2023;

//just to check if they were created , Had to do these Twice
GRANT CREATE SESSION TO Tshepo, Mya;
GRANT SELECT ANY TABLE TO Tshepo, Mya;

-- This is to check if the users are saved and to visually see them 
SELECT username FROM all_users WHERE username IN ('TSHEPO', 'MYA');