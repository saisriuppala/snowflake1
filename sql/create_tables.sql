CREATE OR REPLACE TABLE employees (
    employee_id INT,
    first_name STRING,
    last_name STRING,
    department STRING,
    salary NUMBER(10,2),
    hire_date DATE
);

INSERT INTO employees VALUES
(1, 'John', 'Smith', 'Engineering', 85000, '2023-01-15'),
(2, 'Emma', 'Johnson', 'Finance', 72000, '2022-11-10'),
(3, 'Michael', 'Brown', 'HR', 65000, '2021-08-01'),
(4, 'Sophia', 'Williams', 'Engineering', 95000, '2020-05-12'),
(5, 'Daniel', 'Miller', 'Sales', 70000, '2024-02-20');

CREATE OR REPLACE TABLE employee_audit (
    audit_id INTEGER AUTOINCREMENT,
    employee_id INT,
    action_taken STRING,
    action_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);