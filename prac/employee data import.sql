Create database Prac;
use prac;
 
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    FullName VARCHAR(101) GENERATED ALWAYS AS (CONCAT(FirstName, ' ', LastName)) STORED,
    BirthDate DATE,
    HireDate DATE,
    DepartmentID INT
);

INSERT INTO Employees (EmployeeID, FirstName, LastName,BirthDate, HireDate, DepartmentID) VALUES
(1, 'John', 'Doe', '1980-01-01', '2010-06-01', 1),
(2, 'Jane', 'Smith', '1985-02-14', '2012-09-23', 2),
(3, 'Mike', 'Johnson', '1978-11-10', '2008-03-15', 1),
(4, 'Emily', 'Davis', '1990-05-30', '2015-07-19', 3),
(5, 'Robert', 'Wilson', '1982-07-08', '2011-11-30', 2),
(6, 'Laura', 'Taylor', '1984-04-25', '2010-09-14', 1),
(7, 'James', 'Brown', '1988-09-19', '2013-05-17', 3),
(8, 'Linda', 'Anderson', '1991-12-22', '2016-02-29', 2),
(9, 'David', 'Thomas', '1983-07-11', '2009-11-01', 1),
(10, 'Sarah', 'Moore', '1986-08-15', '2011-03-10', 2);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing');

CREATE TABLE Salaries (
    EmployeeID INT,
    Salary DECIMAL(10, 2),
    EffectiveDate DATE,
    PRIMARY KEY (EmployeeID, EffectiveDate),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Salaries (EmployeeID, Salary, EffectiveDate) VALUES
(1, 60000, '2023-01-01'),
(2, 75000, '2023-01-01'),
(3, 55000, '2023-01-01'),
(4, 70000, '2023-01-01'),
(5, 80000, '2023-01-01'),
(6, 62000, '2023-01-01'),
(7, 68000, '2023-01-01'),
(8, 74000, '2023-01-01'),
(9, 56000, '2023-01-01'),
(10, 79000, '2023-01-01');

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE
);

INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate) VALUES
(1, 'Project Alpha', '2023-01-01', '2023-12-31'),
(2, 'Project Beta', '2023-06-01', '2023-11-30'),
(3, 'Project Gamma', '2023-03-01', '2023-09-30'),
(4, 'Project Delta', '2023-02-15', '2023-08-15'),
(5, 'Project Epsilon', '2023-04-01', '2023-10-31');

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    Role VARCHAR(50),
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, Role) VALUES
(1, 1, 'Manager'),
(2, 2, 'Developer'),
(3, 3, 'Tester'),
(4, 1, 'Developer'),
(5, 2, 'Manager'),
(6, 3, 'Tester'),
(7, 4, 'Developer'),
(8, 5, 'Manager'),
(9, 1, 'Tester'),
(10, 2, 'Developer');
