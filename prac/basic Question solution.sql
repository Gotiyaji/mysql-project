# 1. Retrieve all employees' full names and their birth dates.
SELECT 
    FullName,BirthDate
FROM
    employees;
   
# 2. Find the names and hire dates of employees who were hired after January 1, 2010.
SELECT 
    FullName, HireDate
FROM
    employees
WHERE
    HireDate >'2010-01-01'
ORDER BY HireDate ASC;

# 3. Get a list of all departments.
SELECT 
    employees.EmployeeID,employees.FullName,departments.DepartmentName
FROM
    employees
        JOIN
    departments ON employees.DepartmentID = departments.DepartmentID;

# 4. List the names of employees working in the 'HR' department.
SELECT 
    employees.EmployeeID,employees.FullName,departments.DepartmentName
FROM
    employees
        JOIN
    departments ON employees.DepartmentID = departments.DepartmentID
WHERE
    DepartmentName = 'HR';
