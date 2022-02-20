--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no, last_name, first_name, sex, salary
from employee as e
join salaries
on e.emp_no=salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employee
where hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dm.dept_no, d.dept_name, e.emp_no, last_name, first_name
from dept_manager as dm
join departments as d
on dm.dept_no=d.dept_no
join employee as e
on dm.emp_no=e.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select de.emp_no, last_name, first_name, dept_name
from dept_emp as de
join employee as e
on de.emp_no=e.emp_no
join departments as d
on de.dept_no=d.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employee
where first_name='Hercules'
and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, last_name, first_name, dept_name
from employee as e
join dept_emp as de
on e.emp_no=de.emp_no
join departments as d
on d.dept_no=de.dept_no
where dept_name='Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, last_name, first_name, dept_name
from employee as e
join dept_emp as de
on e.emp_no=de.emp_no
join departments as d
on d.dept_no=de.dept_no
where dept_name='Sales' or dept_name='Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as frequency_last_name
from employee
group by last_name
order by frequency_last_name desc
