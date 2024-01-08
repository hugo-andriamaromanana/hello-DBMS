--1.
CREATE DATABASE IF NOT EXISTS SomeCompany;

USE SomeCompany;

--2.
CREATE TABLE IF NOT EXISTS Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthdate DATE,
    position VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

--3.
CREATE TABLE IF NOT EXISTS Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    department_head INT,
    location VARCHAR(50),
    FOREIGN KEY (department_head) REFERENCES Employees(employee_id)
);

--4.
INSERT INTO
    Employees (
        employee_id,
        first_name,
        last_name,
        birthdate,
        position,
        department_id
    )
VALUES
    (
        5154,
        'Leo',
        'Carrey',
        '2004-11-12',
        'Software Engineer Apprentice',
        13
    ),
    (
        1651,
        'Harold',
        'Andria',
        '2001-06-15',
        'Scrum Master',
        93
    ),
    (
        1235,
        'Jean',
        'Doncic',
        '1998-11-22',
        'Data Engineer',
        92
    ),
    (
        3533,
        'Aurore',
        'Ferrari',
        '2000-07-05',
        'Product Owner',
        4
    ),
    (2315, 'Lebron', 'James', '1984-12-30', 'Goat', 1),
    (
        1531,
        'Alexandre',
        'Ossod',
        '2004-08-15',
        'Data Scientist',
        13
    ),
    --5.
SELECT
    first_name,
    last_name,
    position
FROM
    Employees;

--6.
UPDATE
    Employees
SET
    position = 'Senior Software Engineer'
WHERE
    employee_id = 2315;

--7.
DELETE FROM
    Employees
WHERE
    employee_id = 3533;

--8.
SELECT
    first_name,
    last_name,
    position
FROM
    Employees;

--9.
SELECT
    Employees.first_name,
    Employees.last_name,
    Departments.department_name,
    Departments.location
FROM
    Employees
    JOIN Departments ON Employees.department_id = Departments.department_id;

--10.
SELECT
    Departments.department_name,
    Employees.first_name AS manager_first_name,
    Employees.last_name AS manager_last_name
FROM
    Departments
    LEFT JOIN Employees ON Departments.department_head = Employees.employee_id
ORDER BY
    Departments.department_name;

--11.
INSERT INTO
    Departments (department_id, department_name, location)
VALUES
    (4, 'Marketing', 'Branch Office South') ON DUPLICATE KEY
UPDATE
    department_name =
VALUES
(department_name),
    location =
VALUES
(location);

INSERT INTO
    Employees (
        employee_id,
        first_name,
        last_name,
        birthdate,
        position,
        department_id
    )
VALUES
    (
        21,
        'Natalie',
        'Johnson',
        '1992-04-15',
        'Marketing Specialist',
        4
    ),
    (
        22,
        'Christopher',
        'Moore',
        '1988-11-28',
        'Marketing Manager',
        4
    ) ON DUPLICATE KEY
UPDATE
    first_name =
VALUES
(first_name),
    last_name =
VALUES
(last_name),
    birthdate =
VALUES
(birthdate),
    position =
VALUES
(position),
    department_id =
VALUES
(department_id);

--12.
CREATE TABLE IF NOT EXISTS Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    start_date DATE,
    end_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO
    Projects (
        project_id,
        project_name,
        start_date,
        end_date,
        department_id
    )
VALUES
    (1, 'ProjectA', '2022-01-01', '2022-02-01', 1),
    (2, 'ProjectB', '2022-02-15', '2022-03-15', 1),
    (3, 'ProjectC', '2022-03-01', '2022-04-01', 4);

SELECT
    department_id,
    COUNT(*) AS project_count
FROM
    Projects
WHERE
    department_id = 1;