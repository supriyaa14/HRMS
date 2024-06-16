-- Employees table
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Departments table
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- Salaries table
CREATE TABLE salaries (
    employee_id INT,
    salary DECIMAL(10, 2) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert sample data

-- Departments sample data
INSERT INTO departments (department_name) VALUES
('IT'),
('HR'),
('Finance'),
('Marketing');

-- Employees sample data
INSERT INTO employees (first_name, last_name, department_id, hire_date) VALUES
('John', 'Doe', 1, '2023-06-15'),
('Jane', 'Smith', 2, '2022-12-10'),
('Michael', 'Johnson', 3, '2024-01-20'),
('Emily', 'Williams', 4, '2023-08-05'),
('David', 'Brown', 1, '2023-04-25'),
('Sarah', 'Miller', 2, '2022-07-30'),
('Kevin', 'Davis', 3, '2023-03-12'),
('Jessica', 'Garcia', 4, '2022-11-08');

-- Salaries sample data
INSERT INTO salaries (employee_id, salary, from_date, to_date) VALUES
(1, 60000.00, '2023-06-15', '2024-06-14'),
(2, 70000.00, '2022-12-10', '2023-12-09'),
(3, 80000.00, '2024-01-20', '2025-01-19'),
(4, 55000.00, '2023-08-05', '2024-08-04'),
(5, 62000.00, '2023-04-25', '2024-04-24'),
(6, 72000.00, '2022-07-30', '2023-07-29'),
(7, 68000.00, '2023-03-12', '2024-03-11'),
(8, 75000.00, '2022-11-08', '2023-11-07');

-- Queries

-- 1. Find all employees who have been hired in the last year.
SELECT *
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 2. Calculate the total salary expenditure for each department.
SELECT d.department_name, SUM(s.salary) AS total_salary_expenditure
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
LEFT JOIN salaries s ON e.employee_id = s.employee_id
GROUP BY d.department_id;

-- 3. Find the top 5 highest-paid employees along with their department names.
SELECT e.first_name, e.last_name, d.department_name, s.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN salaries s ON e.employee_id = s.employee_id
ORDER BY s.salary DESC
LIMIT 5;
