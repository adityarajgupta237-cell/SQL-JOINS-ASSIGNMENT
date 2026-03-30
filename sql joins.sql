SQL JOINS ASSIGNMENTS QUES./ ANS.

TABLE 1 - use company_db;
CREATE TABLE CUSTOMERS (
CustomerID INT ,
CustomerName VARCHAR(50),
 City VARCHAR(50));
 
 select * from customers;
 
INSERT INTO CUSTOMERS (CustomerID,CustomerName,City) VALUES (1,'John Smith','New York');
INSERT INTO CUSTOMERS (CustomerID,CustomerName,City) VALUES (2,'Mary Johnson','Chicago');
INSERT INTO CUSTOMERS (CustomerID,CustomerName,City) VALUES (3,'Peter Adams','Los Angeles');
INSERT INTO CUSTOMERS (CustomerID,CustomerName,City) VALUES (4,'Nancy Miller','Houston');
INSERT INTO CUSTOMERS (CustomerID,CustomerName,City) VALUES (5,'Robert White','Miami');


TABLE 2. 

CREATE TABLE Orders(
OrderID INT ,
CustomerID INT ,
OrderDate DATE ,
Amount INT );

SELECT * FROM Orders;

INSERT INTO Orders (OrderID,CustomerID,OrderDate,Amount) VALUES (101,1,20241001,250);
INSERT INTO Orders (OrderID,CustomerID,OrderDate,Amount) VALUES (102,2,20241005,300);
INSERT INTO Orders (OrderID,CustomerID,OrderDate,Amount) VALUES (103,1,20241007,150);
INSERT INTO Orders (OrderID,CustomerID,OrderDate,Amount) VALUES (104,3,20241010,450);
INSERT INTO Orders (OrderID,CustomerID,OrderDate,Amount) VALUES (105,6,20241012,400);

TABLE 3.

CREATE TABLE Payments(
PaymentID VARCHAR(50),
CustomerID INT,
PaymentsDate DATE,
Amount INT );

SELECT * FROM Payments;

INSERT INTO Payments (PaymentID,CustomerID,PaymentsDate,Amount)
 VALUES
 ('P001',1,20241002,250),
 ('P002',2,20241006,300),
 ('P003',3,20241011,450),
 ('P004',4,20241015,200);
 
 select * from employees;
 
TABLE 4.

 CREATE TABLE DUMMYEMPLOYEE
(EMPLOYEEID VARCHAR(50),
EmployeeName VARCHAR(50),
ManagerID VARCHAR(50));

select * from DUMMYEMPLOYEE;

INSERT INTO DUMMYEMPLOYEE(
EMPLOYEEID,EmployeeName,ManagerID) VALUES 
(1,'Alex Green','NULL'),
(2,'Brian Lee',1),
(3,'Carol Ray',1),
(4,'David Kim',2),
(5,'Eva Smith',2);


Question 1. Retrieve all customers who have placed at least one order.

ANS:-

SELECT * FROM customers as c
INNER JOIN orders as o
ON c.CustomerID = o.CustomerID;

Question 2. Retrieve all customers and their orders, including customers who have not placed any orders.

ANS.-

SELECT * FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMERID = O.CUSTOMERID;

Question 3. Retrieve all orders and their corresponding customers, including orders placed by unknown
customers.

ANS.-

SELECT * FROM CUSTOMERS C
RIGHT JOIN ORDERS O
ON C.CUSTOMERID = O.CUSTOMERID;

Question 4. Display all customers and orders, whether matched or not.

ANS.-

SELECT * FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMERID = O.CUSTOMERID
UNION
SELECT * FROM CUSTOMERS C
RIGHT JOIN ORDERS O
ON C.CUSTOMERID = O.CUSTOMERID;

Question 5. Find customers who have not placed any orders.

ANS.-

SELECT * FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMERID = O.CUSTOMERID
WHERE O.CUSTOMERID IS NULL;

Question 6. Retrieve customers who made payments but did not place any orders.

ANS.-

SELECT * FROM customers as c
INNER JOIN payments as p
ON c.CustomerID = p.CustomerID
LEFT JOIN Orders as o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;

Question 7. Generate a list of all possible combinations between Customers and Orders.

ANS.-

SELECT * FROM Customers as c
CROSS JOIN Orders o;

Question 8. Show all customers along with order and payment amounts in one table

ANS.-

SELECT c.CustomerName,o.Amount as OrderAmount,p.Amount as PaymentAmount
from Customers as c
LEFT JOIN Orders o
on c.CustomerID = o.CustomerID
LEFT JOIN payments p 
on c.CustomerID = p.CustomerID;

Question 9. Retrieve all customers who have both placed orders and made payments.

ANS.- 

SELECT *
from Customers as c
INNER JOIN Orders o
on c.CustomerID = o.CustomerID
INNER JOIN Payments p
on c.CustomerID = p.CustomerID;
   

