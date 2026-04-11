# 🚣 Kayak Upgrade Management System
### Oracle SQL Database Project

## 📌 Project Overview
This project was developed as part of my Software Development diploma at Rosebank College. It focuses on designing and implementing a relational database for a kayak service provider to track customers, equipment, and technical upgrades.

## 🛠️ Technical Stack
* **Database:** Oracle SQL
* **Version Control:** Git & GitHub
* **Editor:** Visual Studio Code (VS Code)

## 📊 Database Schema
The system utilizes a relational schema consisting of four core tables:
1.  **KAYAKS:** Stores information about kayak types and manufacturers.
2.  **CUSTOMERS:** Manages client personal and contact details.
3.  **UPGRADES:** Catalogs specific technical work (e.g., GPS Installation, Hull Reinforcement).
4.  **KAYAK_UPGRADES (Junction Table):** Resolves the many-to-many relationship between Customers and Upgrades, tracking specific transaction dates and amounts.

## 🚀 Key SQL Features Implemented
* **Multi-Table Joins:** Successfully performed complex JOINs across 4 tables to generate comprehensive customer receipts and upgrade logs.
* **Calculated Fields:** Implemented logic for financial reporting, including total sales calculations and 10% discount applications for specific clients.
* **Data Integrity:** Enforced Primary Key and Foreign Key constraints to ensure relational consistency.
* **Database Views:** Created `vwCustUpgrades` to provide a simplified, virtual interface for tracking specific customer segments based on geographic filtering (`LIKE` operators).
* **Implicit Cursors:** Utilized implicit cursors for efficient row processing and resource management.

## 🧠 Problem-Solving & Learnings
During development, I managed several real-world technical challenges:
* **Session Persistence:** Navigated Oracle's transaction protocols (`COMMIT`/`ROLLBACK`) to ensure data integrity during session timeouts.
* **Git Workflow:** Mastered the standard CLI workflow (add, commit, push) and resolved "Everything up-to-date" sync errors by improving file-save discipline.
* **Troubleshooting:** Resolved ORA-00904 (invalid identifier) and ORA-00001 (unique constraint) errors through schema auditing and table description.

---
**Developed by:** Kamvelihle Dyantyi
