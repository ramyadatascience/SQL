
Select e.emp_no,last_name,first_name,sex,s.salary
 FROM employees.employees e JOIN employees.salaries s 
 ON e.emp_no = s.emp_no;

Select last_name,first_name,hire_date
 FROM employees.employees 
 where EXTRACT(YEAR FROM hire_date) = 1986;

Select d.dept_no,d.dept_name,e.emp_no,e.last_name AS Manager_last_name ,e.first_name AS Manager_first_name
 FROM employees.departments d inner JOIN employees.dept_manager dp
 ON dp.dept_no = d.dept_no
 inner JOIN employees.employees e 
 ON dp.emp_no = e.emp_no;
 
 Select e.emp_no,e.last_name AS Employee_last_name ,e.first_name AS Employee_first_name,de.dept_no,d.dept_name
 FROM employees.departments d inner JOIN employees.dept_emp de
 ON de.dept_no = d.dept_no
 inner JOIN employees.employees e 
 ON de.emp_no = e.emp_no;
 
 
 Select first_name , last_name , sex
 from employees.employees
 where first_name = 'Hercules'
 AND last_name like 'B%';
 
 
  Select emp_no ,first_name ,last_name
 FROM employees.employees
 where emp_no IN (Select emp_no from employees.dept_emp where dept_no =
				 (Select dept_no from employees.departments where dept_name='Sales' ))
 
 Select emp_no ,first_name ,last_name
 FROM employees.employees
 where emp_no IN (Select emp_no from employees.dept_emp where dept_no IN
				 (Select dept_no from employees.departments where dept_name='Sales' or dept_name='Development'))
 
 
 select last_name,count(*) as number_of_employees
 FROM employees.employees
 group by last_name
 Order by number_of_employees desc;
