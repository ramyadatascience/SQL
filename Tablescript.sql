




-- Table: employees.departments

-- DROP TABLE IF EXISTS employees.departments;

CREATE TABLE IF NOT EXISTS employees.departments
(
    dept_no character varying COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying COLLATE pg_catalog."default",
    CONSTRAINT departments_pkey PRIMARY KEY (dept_no)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS employees.departments
    OWNER to postgres;

-- Table: employees.dept_emp

-- DROP TABLE IF EXISTS employees.dept_emp;

CREATE TABLE IF NOT EXISTS employees.dept_emp
(
    emp_no integer NOT NULL,
    dept_no character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no)
        REFERENCES employees.departments (dept_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES employees.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS employees.dept_emp
    OWNER to postgres;

-- Table: employees.dept_manager

-- DROP TABLE IF EXISTS employees.dept_manager;

CREATE TABLE IF NOT EXISTS employees.dept_manager
(
    dept_no character varying COLLATE pg_catalog."default" NOT NULL,
    emp_no integer NOT NULL,
    CONSTRAINT dept_manager_pkey PRIMARY KEY (dept_no, emp_no),
    CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no)
        REFERENCES employees.departments (dept_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES employees.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS employees.dept_manager
    OWNER to postgres;
-- Table: employees.employees

-- DROP TABLE IF EXISTS employees.employees;

CREATE TABLE IF NOT EXISTS employees.employees
(
    emp_no integer NOT NULL,
    emp_title_id character varying COLLATE pg_catalog."default",
    birth_date date,
    first_name character varying COLLATE pg_catalog."default",
    last_name character varying COLLATE pg_catalog."default",
    sex character varying COLLATE pg_catalog."default",
    hire_date date,
    CONSTRAINT employees_pkey PRIMARY KEY (emp_no)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS employees.employees
    OWNER to postgres;
-- Table: employees.salaries

-- DROP TABLE IF EXISTS employees.salaries;

CREATE TABLE IF NOT EXISTS employees.salaries
(
    emp_no integer NOT NULL,
    salary integer,
    CONSTRAINT salaries_pkey PRIMARY KEY (emp_no),
    CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES employees.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS employees.salaries
    OWNER to postgres;
-- Table: employees.titles

-- DROP TABLE IF EXISTS employees.titles;

CREATE TABLE IF NOT EXISTS employees.titles
(
    title_id character varying COLLATE pg_catalog."default" NOT NULL,
    title character varying COLLATE pg_catalog."default",
    CONSTRAINT titles_pkey PRIMARY KEY (title_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS employees.titles
    OWNER to postgres;