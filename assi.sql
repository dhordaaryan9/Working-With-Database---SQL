use hr_db;

-- 1. write a SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100.
--  Return customer_id, cust_name, city, grade, and salesman_id.

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE city = 'New York' OR grade <= 100;

-- 2. write a SQL query to find all the customers in ‘New York’ city who have a grade
-- value above 100. Return customer_id, cust_name, city, grade, and salesman_id.

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE city = 'New York' AND grade > 100;

-- 3. Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%)
-- for those orders that exceed 50% of the target value of 6000.

SELECT ord_no, 
       purch_amt, 
       (purch_amt / 6000) * 100 AS achieved_percentage, 
       ((6000 - purch_amt) / 6000) * 100 AS unachieved_percentage
FROM orders
WHERE purch_amt > (6000 * 0.5);

-- 4. Write a SQL query to calculate the total purchase amount of all orders. Return total purchase amount.

SELECT SUM(purch_amt) AS total_purchase_amount 
FROM orders;

-- 5. Write a SQL query to find the highest purchase amount ordered by each customer.
--  Return customer ID, maximum purchase amount.

SELECT customer_id, MAX(purch_amt) AS maximum_purchase_amount 
FROM orders 
GROUP BY customer_id;

-- 6. Write a SQL query to calculate the average product price. Return average product price.

SELECT AVG(PRO_PRICE) AS average_product_price 
FROM item_mast;

-- 7. Write a SQL query to find those employees whose department is located at Toronto.
--  Return first name, last name, employee ID, job ID.

SELECT e.first_name, e.last_name, e.employee_id, e.job_id 
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE l.city = 'Toronto';

-- 8. Write a SQL query to find those employees whose salary is lower than that of employees
-- whose job title is "MK_MAN". Exclude employees of the Job title 'MK_MAN'.
-- Return employee ID, first name, last name, job ID.

SELECT employee_id, first_name, last_name, job_id 
FROM employees 
WHERE salary < (SELECT MIN(salary) FROM employees WHERE job_id = 'MK_MAN') 
AND job_id != 'MK_MAN';

-- 9. Write a SQL query to find all those employees who work in department ID 80 or 40.
-- Return first name, last name, department number and department name.

SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE e.department_id IN (40,80);

-- 10. Write a SQL query to calculate the average salary, the number of employees receiving commissions in that department.
--  Return department name, average salary and number of employees.

SELECT d.department_name, 
       AVG(e.salary) AS average_salary, 
       COUNT(e.commission_pct) AS employees_receiving_commission
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

-- 11. Write a SQL query to find out which employees have the same designation as the employee whose ID is 169.
--  Return first name, last name, department ID and job ID.

SELECT first_name, last_name, department_id, job_id 
FROM employees 
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 169) 
AND employee_id != 169;

-- 12. Write a SQL query to find those employees who earn more than the average salary.
--  Return employee ID, first name, last name.

SELECT employee_id, first_name, last_name 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 13. Write a SQL query to find all those employees who work in the Finance department. 
-- Return department ID, name (first), job ID and department name.

SELECT e.department_id, e.first_name AS name, e.job_id, d.department_name 
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

-- 14. From the following table, write a SQL query to find the employees who earn less than the employee of ID 182.
--  Return first name, last name and salary.

SELECT first_name, last_name, salary 
FROM employees 
WHERE salary < (SELECT salary FROM employees WHERE employee_id = 182);

-- 15. Create a stored procedure CountEmployeesByDept that returns the number of employees in each department

DELIMITER //
CREATE PROCEDURE CountEmployeesByDept()
BEGIN
    SELECT department_id, COUNT(*) AS employee_count 
    FROM employees 
    GROUP BY department_id;
END;

-- 16. Create a stored procedure AddNewEmployee that adds a new employee to the database.

DELIMITER //
CREATE PROCEDURE AddNewEmployee(
    IN p_emp_id INT, 
    IN p_fname VARCHAR(20), 
    IN p_lname VARCHAR(25), 
    IN p_email VARCHAR(25), 
    IN p_hire_date DATE, 
    IN p_job_id VARCHAR(10), 
    IN p_salary DECIMAL(8,2)
)
BEGIN
    INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
    VALUES (p_emp_id, p_fname, p_lname, p_email, p_hire_date, p_job_id, p_salary);
END;

-- 17. Create a stored procedure DeleteEmployeesByDept that removes all employees from a specific department

DELIMITER //
CREATE PROCEDURE DeleteEmployeesByDept(IN p_dept_id INT)
BEGIN
    DELETE FROM employees WHERE department_id = p_dept_id;
END //
DELIMITER;

-- 18. Create a stored procedure GetTopPaidEmployees that retrieves the highest-paid employee in each department.

DELIMITER //
CREATE PROCEDURE GetTopPaidEmployees()
BEGIN
    SELECT department_id, MAX(salary) AS highest_salary 
    FROM employees 
    GROUP BY department_id;
END //
DELIMITER;

-- 19. Create a stored procedure PromoteEmployee that increases an employee's salary and changes their job role.

DELIMITER //
CREATE PROCEDURE PromoteEmployee(
    IN p_emp_id INT, 
    IN p_new_job_id VARCHAR(10), 
    IN p_salary_increase DECIMAL(8,2)
)
BEGIN
    UPDATE employees 
    SET job_id = p_new_job_id, salary = salary + p_salary_increase 
    WHERE employee_id = p_emp_id;
END //
DELIMITER;

-- 20. Create a stored procedure AssignManagerToDepartment that assigns a new manager to all employees in a specific department.

DELIMITER //
CREATE PROCEDURE AssignManagerToDepartment(
    IN p_dept_id INT, 
    IN p_manager_id INT
)
BEGIN
    UPDATE employees 
    SET manager_id = p_manager_id 
    WHERE department_id = p_dept_id;
END;

