# 1. Find the highest-paid employee in each department.
SELECT 
    employees.EmployeeID,
    employees.FullName,
    departments.DepartmentName,
    salaries.Salary
FROM
    employees
        JOIN
    salaries ON employees.EmployeeID = salaries.EmployeeID
        JOIN
    departments ON employees.DepartmentID = departments.DepartmentID
WHERE
    salaries.Salary = (SELECT 
            MAX(salaries.Salary)
        FROM
            Salaries
                JOIN
            Employees ON salaries.EmployeeID = employees.EmployeeID
        WHERE
            employees.DepartmentID = departments.DepartmentID);

# 2. List employees who are not assigned to any projects.
SELECT 
    employees.EmployeeID,
    employees.FullName,
    employees.DepartmentID
FROM
    employees
	 left JOIN
    employeeprojects ON employees.EmployeeID = employeeprojects.EmployeeID
WHERE
    employeeprojects.EmployeeID is null;

# 3. List employees who are assigned to any projects.    
SELECT 
    employees.EmployeeID,
    employees.FullName,
    employeeprojects.Role,
    projects.ProjectName
FROM
    employeeprojects
        JOIN
    projects ON employeeprojects.ProjectID = projects.ProjectID
        JOIN
    employees ON employeeprojects.EmployeeID = employees.EmployeeID;

# 4. Get the total salary of all employees in each department.
SELECT 
    departments.DepartmentName, SUM(salaries.Salary)
FROM
    employees
        JOIN
    departments ON employees.DepartmentID = departments.DepartmentID
        JOIN
    salaries ON employees.EmployeeID = salaries.EmployeeID
GROUP BY departments.DepartmentName;
   
# 5. Retrieve the names of employees who are working as 'Manager' on any project.
SELECT 
    employees.EmployeeID,
    employees.FullName,
    employeeprojects.Role,
    projects.ProjectName
FROM
    employeeprojects
        JOIN
    employees ON employeeprojects.EmployeeID = employees.EmployeeID
        JOIN
    projects ON employeeprojects.ProjectID = projects.ProjectID
WHERE
    employeeprojects.Role = 'Manager';

# 6. Retrieve the details of employees who have a salary higher than the average salary of all employees.
SELECT 
    employees.EmployeeID, employees.FullName, salaries.salary
FROM
    employees
        JOIN
    salaries ON employees.EmployeeID = salaries.EmployeeID
WHERE
    salaries.Salary > (SELECT 
            ROUND(AVG(salaries.Salary), 0)
        FROM
            salaries
                JOIN
            employees ON salaries.EmployeeID = employees.EmployeeID);

# 7. Get the names and roles of employees who are working on more than one project.
SELECT 
    EmployeeID, FullName, project_count
FROM
    (SELECT 
        employees.EmployeeID,
            employees.FullName,
            COUNT(projects.ProjectName) AS project_count
    FROM
        employees
    JOIN employeeprojects ON employees.EmployeeID = employeeprojects.EmployeeID
    JOIN projects ON projects.ProjectID = employeeprojects.ProjectID
    GROUP BY employees.EmployeeID , employees.FullName) AS a
WHERE
    project_count > 1
;

# 8. List the names of employees and their corresponding project names, where the project end date is after December 31, 2023.
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
    projects.EndDate > '2023-12-31'
;

# 9. Retrieve the details of the employee who has been hired the earliest
SELECT 
    EmployeeID, FullName, HireDate
FROM
    employees
ORDER BY HireDate
LIMIT 1; 