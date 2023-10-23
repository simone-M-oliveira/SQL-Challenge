-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/5yQ63Y
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Title" (
    "Title_ID" varchar(10)   NOT NULL,
    "Title" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Title" PRIMARY KEY (
        "Title_ID"
     )
);

CREATE TABLE "Employees" (
    "Emp_Number" Int   NOT NULL,
    "Emp_Title_ID" varchar(10)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(15)   NOT NULL,
    "last_name" varchar(15)   NOT NULL,
    "sex" chart(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_Number"
     )
);

CREATE TABLE "Departaments" (
    "Dept_number" varchar(20)   NOT NULL,
    "Dept_name" varchar(20)   NOT NULL,
    CONSTRAINT "pk_Departaments" PRIMARY KEY (
        "Dept_number"
     )
);

CREATE TABLE "Dept_employees" (
    "Emp_number" int   NOT NULL,
    "Dept_number" varchar(4)   NOT NULL,
    CONSTRAINT "pk_Dept_employees" PRIMARY KEY (
        "Emp_number"
     )
);

CREATE TABLE "Dept_manager" (
    "Dept_number" varchar(20)   NOT NULL,
    "Emp_number" int   NOT NULL,
    CONSTRAINT "pk_Dept_manager" PRIMARY KEY (
        "Dept_number","Emp_number"
     )
);

CREATE TABLE "Salaries" (
    "Emp_number" int   NOT NULL,
    "Salary" decimal(8,2)   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Emp_number"
     )
);

ALTER TABLE "Title" ADD CONSTRAINT "fk_Title_Title" FOREIGN KEY("Title")
REFERENCES "Employees" ("Emp_Number");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_Title_ID" FOREIGN KEY("Emp_Title_ID")
REFERENCES "Dept_employees" ("Emp_number");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_sex" FOREIGN KEY("sex")
REFERENCES "Dept_manager" ("Emp_number");

ALTER TABLE "Departaments" ADD CONSTRAINT "fk_Departaments_Dept_number" FOREIGN KEY("Dept_number")
REFERENCES "Dept_manager" ("Dept_number");

ALTER TABLE "Dept_employees" ADD CONSTRAINT "fk_Dept_employees_Emp_number" FOREIGN KEY("Emp_number")
REFERENCES "Departaments" ("Dept_number");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_number" FOREIGN KEY("Emp_number")
REFERENCES "Employees" ("birth_date");

