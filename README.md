# 🎓 University Database Management System

A comprehensive **University Database System** designed to manage key academic and administrative functions. The system combines a robust **SQL Server** backend with a simple yet functional **Python GUI (Tkinter)** frontend to deliver a complete management tool.

---

## 📌 Project Overview

This project aims to support operations in a university by managing:

- ✅ Student data and academic history  
- ✅ Courses and departmental structure  
- ✅ Faculty profiles and salaries  
- ✅ Enrollments and grade tracking  

---

## 🛠 Key Features

### 🧑‍🎓 Student Management

- Store and manage student personal and academic data  
- Connect students to their respective departments  
- Assign unique registration numbers  

### 📚 Course System

- Maintain course catalog with credit hours  
- Track course prerequisites  
- Associate courses with departments  

### 👨‍🏫 Faculty Management

- Store instructor details (degree, department, manager)  
- Track employment hierarchy  
- Handle salary information securely  

### 📝 Enrollment and Grading

- Enroll students into courses  
- Assign instructors to teach courses  
- Record grades using A–F scale  

---

## 💻 Technical Stack

| Component   | Technology         |
|-------------|--------------------|
| Database    | SQL Server 2019+   |
| Interface   | Python 3.8+        |
| GUI Library | customtkinter      |
| DB Access   | pyodbc             |
| Security    | Login system, input validation, referential integrity |

---

## 🔐 User Roles

### 🎓 Students

- View personal profile  
- Register/drop courses  
- Check enrolled courses and grades  

### 👨‍🏫 Instructors

- View assigned courses  
- Track enrolled students  
- View/update teaching records  

---

## 🖥 System Requirements

- Windows OS  
- SQL Server 2019 or newer  
- Python 3.8+  
- Required Python packages:

```bash
pip install customtkinter pyodbc
```

## ⚙️ Installation Instructions
1. Setup Database
Open SQL Server Management Studio and run:

```
USE [master]
GO
CREATE DATABASE [PROJECT2]
```
Then execute the provided script:
```
-- Run this file:
```
DataBase2.sql
```
-- It will create tables and insert initial data.
```

2. Run the Application
Open your terminal or Python environment and run
```
python main.py
```

## 👩‍💻 Author
Habiba Mohamed Fathy
🎓 Data Science & Database Systems Student
🔗 GitHub: HabibaMohamed111

