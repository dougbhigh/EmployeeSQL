/**************************************************************
*  RUT-SOM-DATA-PT-06-2020-U-C                   Douglas High *
*   >SQL-Challenge                            August 10, 2020 *
*                    TABLE DEFINITION SQL                     *
***************************************************************
*/
-- **  drop all tables  **--
DROP TABLE IF EXISTS Titles, Employees, Departments, Dept_emp, Dept_manager, Salaries;

-- **  create tables  **--
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
	"dept_no" char(5) NOT NULL REFERENCES Departments ("dept_no"),
	CONSTRAINT "pk_Dept_emp" PRIMARY KEY ("emp_no","dept_no")	
	);

CREATE TABLE Dept_manager (
    "dept_no" char(4) NOT NULL,
    "emp_no" int NOT NULL,
	CONSTRAINT "pk_Dept_manager" PRIMARY KEY ("dept_no","emp_no")	
	);

CREATE TABLE Salaries (
    "emp_no" int NOT NULL PRIMARY KEY,
    "salary" int NOT NULL
	);