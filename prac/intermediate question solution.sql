# 1. Count the total number of employees in each department.
SELECT 
    departments.DepartmentName,
    COUNT(employees.EmployeeID) AS Employees_Count
FROM
    departments
        JOIN
    employees ON departments.DepartmentID = employees.DepartmentID
GROUP BY departments.DepartmentName; 

# 2. List all employees along with their department names.
SELECT 
    employees.EmployeeID,employees.FullName,departments.DepartmentName
FROM
    employees
        LEFT JOIN
    departments ON employees.DepartmentID = departments.DepartmentID;

# 3. Find the average salary of employees in the Engineering department.
SELECT 
    departments.DepartmentName,
    ROUND(AVG(salaries.Salary), 2) AS Average_salary
FROM
    employees
        JOIN
    salaries ON employees.EmployeeID = salaries.EmployeeID
        JOIN
    departments ON employees.DepartmentID = departments.DepartmentID
WHERE
    departments.DepartmentName = 'Engineering';

# 4. List all projects along with their start and end dates.
SELECT 
    ProjectName, StartDate, EndDate
FROM
    projects
ORDER BY StartDate ASC;

# 5. Get the details of employees who are working on 'Project Alpha'.
SELECT 
    employees.EmployeeID,
    employees.FullName,
    projects.ProjectName
FROM
    employees
        JOIN
    employeeprojects ON employees.EmployeeID = employeeprojects.EmployeeID
        JOIN
    projects ON projects.ProjectID = employeeprojects.ProjectID
WHERE
    ProjectName = 'Project Alpha';
