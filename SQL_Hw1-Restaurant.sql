-- open our database
.open restaurant.db
  CREATE TABLE IF NOT EXISTS customers (
    customerid INT UNIQUE,
    firstname TEXT,
    lastname TEXT,
    phonenumber TEXT
  );

  INSERT INTO customers VALUES
    (0001, 'Usula', 'Leguin', '0111111111'),
    (0002, 'Joe', 'Abercrombie', '0222222222'),
    (0003, 'Brandon', 'Sanderson', '0333333333'),
    (0004, 'Robin', 'Hobb', '04444444444'),
    (0005, 'Leigh', 'Bardugo', '0555555555');

  CREATE TABLE IF NOT EXISTS menu (
    menuid INT UNIQUE,
    name TEXT,
    price INT
  );

  INSERT INTO menu VALUES
    (01, 'steak', 200),
    (02, 'spagetthi', 150),
    (03, 'hamburger', 120),
    (04, 'cheesesandwich', 100),
    (05, 'salad', 125);

  CREATE TABLE IF NOT EXISTS employees (
    staffid INT,
    firstname TEXT,
    lastname TEXT,
    title TEXT,
    salary INT
  );

  INSERT INTO employees VALUES
    (0001, 'Ged', 'Sparrowhawk', 'Manager', 50000),
    (0002, 'Logan', 'Ninefinger', 'Waiter', 25000),
    (0003, 'Dalinah', 'Kholin', 'Waiter', 23000),
    (0004, 'Molly', 'Chandler', 'Waiter', 22000),
    (0005, 'Nikolai', 'Lantsov', 'Waiter', 21000);

  CREATE TABLE IF NOT EXISTS customerorders (
    orderid INT,
    customerid INT,
    menuid INT,
    staffid DATE,
    quantity INT
  );

  INSERT INTO customerorders VALUES
    (01, 0001, 01, 001, 1),
    (02, 0002, 02, 002, 2),
    (03, 0003, 03, 003, 1),
    (04, 0004, 04, 004, 1),
    (05, 0005, 05, 005, 1);

  CREATE TABLE IF NOT EXISTS transactions (
    transactionid INT,
    orderid INT,
    transactionmethod TEXT,
    transactiontime DATETIME
  );

  INSERT INTO transactions VALUES
    (00001, 01, 'cash', '2023-6-01 13:54:25'),
    (00002, 02, 'cash', '2023-6-02 15:24:33'),
    (00003, 03, 'debit card', '2023-6-04 20:02:18'),
    (00004, 04, 'credit card', '2023-6-05 19:28:40'),
    (00005, 05, 'credit card', '2023-6-06 11:39:58');


.table 

-- change how we display data in terminal/ shell
.mode box
  --subquery
  SELECT orderid from
    (SELECT * FROM transactions
      WHERE transactionmethod = 'credit card')
  WHERE transactiontime >= '2023-6-06';

  -- common table expression
  WITH a AS (
    SELECT * FROM customerorders
      WHERE staffid >= 3
    ), b AS (
    SELECT * FROM employees
    WHERE salary <= 22000
    )

  SELECT
    a.staffid,
    b.firstname
  FROM a
  JOIN b
  ON a.staffid = b.staffid;

  --aggregate functions
  SELECT 
    COUNT(menuid),
    SUM(price),
    MIN(price),
    MAX(price)
  FROM menu;

  -- JOIN
  SELECT
    customers.customerid,
    customerorders.orderid,
    menu.name,
    employees.staffid,
    transactions.*
  FROM customerorders
  JOIN customers
    ON customerorders.customerid = customers.customerid
  JOIN employees
    ON customerorders.staffid = employees.staffid
  JOIN menu
    ON customerorders.menuid = menu.menuid
  JOIN transactions
    ON customerorders.orderid = transactions.orderid;


DROP TABLE customers;
DROP TABLE menu;
DROP TABLE employees;
DROP TABLE customerorders;
DROP TABLE transactions;
