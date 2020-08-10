/**************************************************************
*  RUT-SOM-DATA-PT-06-2020-U-C                    Douglas High*
*   >SQL-Challenge                            August 10, 2020 *
*                    TABLE DEFINITION SQL                     *
***************************************************************
*/
-- ** uncomment below lIne to drop all table  **--
--DROP TABLE Titles, Employees, Departments, Dept_emp, Dept_manager, Salaries;

CREATE TABLE Titles (
    "title_id" char(5) NOT NULL PRIMARY KEY,
    "title" varchar(30) NOT NULL
	);

CREATE TABLE Employees (
    "emp_no" int NOT NULL PRIMARY KEY,
    "emp_title" char(5) NOT NULL REFERENCES Titles ("title_id"),
    "birth_date" date NOT NULL,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL,
    "sex" char(1) NOT NULL,
    "hire_date" date NOT NULL
    );

CREATE TABLE Departments (
    "dept_no" char(4) NOT NULL PRIMARY KEY,
    "dept_name" varchar(30) NOT NULL
	);

CREATE TABLE Dept_emp (
    "emp_no" int NOT NULL REFERENCES Employees ("emp_no"),
    "dept_no" char(5) NOT NULL REFERENCES Departments ("dept_no")
	);

CREATE TABLE Dept_manager (
    "dept_no" char(4) NOT NULL,
    "emp_no" int NOT NULL
	);

CREATE TABLE Salaries (
    "emp_no" int NOT NULL,
    "salary" int NOT NULL
	);
