
--Task 1: Database Design
--Step 1: Define the Database Schema

--CREATE DATABASE
CREATE DATABASE COURIERMANAGEMENT
--USE DATABSE
USE COURIERMANAGEMENT
--CREATE TABLE USER
CREATE TABLE USERS (
    USERID INT PRIMARY KEY,
    NAME VARCHAR(255),
    EMAIL VARCHAR(255) UNIQUE,
    PASSWORD VARCHAR(255),
    CONTACTNUMBER VARCHAR(20),
    ADDRESS TEXT
);
CREATE TABLE COURIER (
    COURIERID INT PRIMARY KEY,
    SENDERNAME VARCHAR(255),
    SENDERADDRESS TEXT,
    RECEIVERNAME VARCHAR(255),
    RECEIVERADDRESS TEXT,
    WEIGHT DECIMAL(5, 2),
    STATUS VARCHAR(50),
    TRACKINGNUMBER VARCHAR(20) UNIQUE,
    DELIVERYDATE DATE
);
CREATE TABLE COURIERSERVICES (
    SERVICEID INT PRIMARY KEY,
    SERVICENAME VARCHAR(100),
    COST DECIMAL(8, 2)
);
CREATE TABLE EMPLOYEE (
    EMPLOYEEID INT PRIMARY KEY,
    NAME VARCHAR(255),
    EMAIL VARCHAR(255) UNIQUE,
    CONTACTNUMBER VARCHAR(20),
    ROLE VARCHAR(50),
    SALARY DECIMAL(10, 2)
);
CREATE TABLE LOCATION (
    LOCATIONID INT PRIMARY KEY,
    LOCATIONNAME VARCHAR(100),
    ADDRESS TEXT
);
CREATE TABLE PAYMENT (
    PAYMENTID INT PRIMARY KEY,
    COURIERID INT,
    LOCATIONID INT,
    AMOUNT DECIMAL(10, 2),
    PAYMENTDATE DATE,
    FOREIGN KEY (COURIERID) REFERENCES COURIER(COURIERID),
    FOREIGN KEY (LOCATIONID) REFERENCES LOCATION(LOCATIONID)
);

/*Step 2: Define Relationships

User to Courier: One-to-Many (Assuming one user can send multiple couriers)
Courier to CourierServices: Many-to-One (Each courier can have one service)
Courier to Location: Many-to-One (Each courier is associated with one location)
Employee to Courier: One-to-Many (Assuming each courier is handled by one employee)
Courier to Payment: One-to-One (Each courier has one payment)*/

SELECT *FROM COURIER

INSERT INTO Users (UserID, Name, Email, Password, ContactNumber, Address) VALUES
(1, 'Alice Johnson', 'alice@example.com', 'password123', '123-456-7890', '123 Main St.'),
(2, 'Bob Smith', 'bob@example.com', 'password456', '234-567-8901', '456 Oak St.'),
(3, 'Charlie Brown', 'charlie@example.com', 'password789', '345-678-9012', '789 Pine St.'),
(4, 'David Green', 'david@example.com', 'password012', '456-789-0123', '101 Maple St.'),
(5, 'Eva White', 'eva@example.com', 'password345', '567-890-1234', '202 Elm St.'),
(6, 'Frank Black', 'frank@example.com', 'password678', '678-901-2345', '303 Birch St.'),
(7, 'Grace Blue', 'grace@example.com', 'password901', '789-012-3456', '404 Cedar St.'),
(8, 'Hank Yellow', 'hank@example.com', 'password234', '890-123-4567', '505 Walnut St.'),
(9, 'Ivy Red', 'ivy@example.com', 'password567', '901-234-5678', '606 Chestnut St.'),
(10, 'Jack Orange', 'jack@example.com', 'password890', '012-345-6789', '707 Willow St.');

INSERT INTO Courier (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate) VALUES
(1, 'Alice Johnson', '123 Main St.', 'Bob Smith', '456 Oak St.', 2.50, 'Delivered', 'TRK123', '2024-01-01'),
(2, 'Charlie Brown', '789 Pine St.', 'David Green', '101 Maple St.', 1.75, 'Pending', 'TRK456', '2024-02-01'),
(3, 'Eva White', '202 Elm St.', 'Frank Black', '303 Birch St.', 3.00, 'Delivered', 'TRK789', '2024-03-01'),
(4, 'Grace Blue', '404 Cedar St.', 'Hank Yellow', '505 Walnut St.', 1.50, 'Pending', 'TRK012', '2024-04-01'),
(5, 'Ivy Red', '606 Chestnut St.', 'Jack Orange', '707 Willow St.', 2.75, 'Delivered', 'TRK345', '2024-05-01'),
(6, 'Bob Smith', '456 Oak St.', 'Alice Johnson', '123 Main St.', 2.25, 'Pending', 'TRK678', '2024-06-01'),
(7, 'David Green', '101 Maple St.', 'Charlie Brown', '789 Pine St.', 3.50, 'Delivered', 'TRK901', '2024-07-01'),
(8, 'Frank Black', '303 Birch St.', 'Eva White', '202 Elm St.', 2.00, 'Pending', 'TRK234', '2024-08-01'),
(9, 'Grace Blue', '404 Cedar St.', 'Ivy Red', '606 Chestnut St.', 1.25, 'Delivered', 'TRK567', '2024-09-01'),
(10, 'Hank Yellow', '505 Walnut St.', 'Jack Orange', '707 Willow St.', 2.10, 'Pending', 'TRK890', '2024-10-01');

INSERT INTO CourierServices (ServiceID, ServiceName, Cost) VALUES
(1, 'Standard Delivery', 5.00),
(2, 'Express Delivery', 10.00),
(3, 'Overnight Delivery', 15.00),
(4, 'Two-Day Delivery', 7.50),
(5, 'International Delivery', 25.00),
(6, 'Same Day Delivery', 20.00),
(7, 'Economy Delivery', 3.00),
(8, 'Weekend Delivery', 12.00),
(9, 'Morning Delivery', 8.00),
(10, 'Afternoon Delivery', 8.00);


INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary) VALUES
(1, 'John Doe', 'john@example.com', '345-678-9012', 'Manager', 60000),
(2, 'Jane Doe', 'jane@example.com', '456-789-0123', 'Courier', 40000),
(3, 'Sam Green', 'sam@example.com', '567-890-1234', 'Dispatcher', 45000),
(4, 'Sally Blue', 'sally@example.com', '678-901-2345', 'Courier', 42000),
(5, 'Mark White', 'mark@example.com', '789-012-3456', 'Manager', 65000),
(6, 'Nina Black', 'nina@example.com', '890-123-4567', 'Clerk', 38000),
(7, 'Paul Red', 'paul@example.com', '901-234-5678', 'Courier', 41000),
(8, 'Olivia Yellow', 'olivia@example.com', '012-345-6789', 'Supervisor', 55000),
(9, 'Liam Orange', 'liam@example.com', '123-456-7890', 'Courier', 40000),
(10, 'Emma Pink', 'emma@example.com', '234-567-8901', 'Dispatcher', 46000);


INSERT INTO Location (LocationID, LocationName, Address) VALUES
(1, 'Warehouse 1', '111 Industrial Rd.'),
(2, 'Warehouse 2', '222 Business Ave.'),
(3, 'Warehouse 3', '333 Corporate Blvd.'),
(4, 'Warehouse 4', '444 Enterprise Dr.'),
(5, 'Warehouse 5', '555 Commerce St.'),
(6, 'Warehouse 6', '666 Market St.'),
(7, 'Warehouse 7', '777 Trade Ln.'),
(8, 'Warehouse 8', '888 Distribution Pl.'),
(9, 'Warehouse 9', '999 Logistics Ct.'),
(10, 'Warehouse 10', '1010 Shipment Way.');

INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate) VALUES
(1, 1, 1, 25.00, '2024-01-01'),
(2, 2, 2, 30.00, '2024-02-01'),
(3, 3, 3, 45.00, '2024-03-01'),
(4, 4, 4, 20.00, '2024-04-01'),
(5, 5, 5, 50.00, '2024-05-01'),
(6, 6, 6, 35.00, '2024-06-01'),
(7, 7, 7, 40.00, '2024-07-01'),
(8, 8, 8, 55.00, '2024-08-01'),
(9, 9, 9, 60.00, '2024-09-01'),
(10, 10, 10, 70.00, '2024-10-01');

-- used task 3 
INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate) VALUES  
(11, 6, 5, 400.00, '2024-06-01'), 
(12, 7, 5, 700.00, '2024-07-01');

INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate) VALUES  
(13, 11, 5, 400.00, '2024-06-01'), 
(14, 12, 5, 700.00, '2024-07-01');


INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate)
VALUES 
(15,1, 1, 600.00, '2024-01-10'),
(16,1, 1, 500.00, '2024-01-15'),
(17,5, 2, 3000.00, '2024-01-20');

INSERT INTO Payment (PaymentID,CourierID, LocationID, Amount, PaymentDate)
VALUES 
(18,1, 1, 3000.00, '2023-12-31'),
(19,2, 2, 1500.00, '2023-12-30'),
(20,3, 3, 7000.00, '2023-12-25');

INSERT INTO Courier (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate, EmployeeID)
VALUES 
(11, 'John Doe', '123 Sender St, City', 'Jane Smith', '456 Receiver St, City', 5.50, 'In Transit', 'TRACK123', '2023-04-15', 10),
(12, 'Alice Brown', '789 Sender Ave, City', 'Bob White', '321 Receiver Ave, City', 3.75, 'Delivered', 'TRACK456', '2023-04-10', 10);


ALTER TABLE Courier
ADD SentDate DATE;

UPDATE Courier
SET SentDate = '2023-04-10';


UPDATE Courier
SET SentDate = '2023-04-05';

ALTER TABLE Courier
ADD CONSTRAINT FK_Couriers_Employee
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

-- task2
--1. List all customers:
SELECT * FROM USERS;

--2. List all orders for a specific customer:

SELECT * FROM COURIER
WHERE SENDERNAME = 'Alice Johnson';

--3List all couriers:

SELECT * FROM COURIER;

--4List all packages for a specific order:

SELECT * FROM COURIER
WHERE COURIERID = 1;

--5List all deliveries for a specific courier:

SELECT * FROM COURIER
WHERE TRACKINGNUMBER = 'TRK123';

--6List all undelivered packages:

SELECT * FROM COURIER
WHERE NOT STATUS = 'Delivered';


--7List all packages that are scheduled for delivery today:

SELECT * FROM COURIER
WHERE DELIVERYDATE = CAST(GETDATE() AS DATE);


--8 List all packages with a specific status:

SELECT * FROM COURIER
WHERE STATUS = 'Delivered';

--9 Calculate the total number of packages for each courier:

SELECT COURIERID, COUNT(*) AS TOTALPACKAGES
FROM COURIER
GROUP BY COURIERID;

--10Find the average delivery time for each courier:
SELECT CourierID, DATEDIFF(day, SentDate, DeliveryDate) AS AvgDeliveryTime FROM Courier;


--11  List all packages with a specific weight range:

SELECT * FROM COURIER
WHERE WEIGHT BETWEEN 1.00 AND 2.00;

--12Retrieve employees whose names contain 'John':

SELECT * FROM EMPLOYEE
WHERE NAME LIKE '%John%';

--13 Retrieve all courier records with payments greater than $50:


SELECT * FROM PAYMENT
WHERE AMOUNT > 50.00;

--task 3
--14Find the total number of couriers handled by each employee.
ALTER TABLE Courier
ADD EmployeeID INT;

ALTER TABLE Courier
ADD CONSTRAINT fk_Employee
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);


SELECT EMPLOYEEID, COUNT(COURIERID) AS TOTALCOURIERS
FROM COURIER
GROUP BY EMPLOYEEID;


--15Calculate the total revenue generated by each location.

SELECT   L.LOCATIONID,  L.LOCATIONNAME,  
    SUM(P.AMOUNT) AS TOTALREVENUE  
FROM   
    LOCATION L  
JOIN   
    PAYMENT P ON L.LOCATIONID = P.LOCATIONID  
GROUP BY   
    L.LOCATIONID, L.LOCATIONNAME  
ORDER BY   
    TOTALREVENUE;
--16 Find the total number of couriers delivered to each location. 
SELECT   
    L.LOCATIONID,  
    L.LOCATIONNAME,  
    COUNT(P.COURIERID) AS TOTALCOURIERSDELIVERED  
FROM   
    LOCATION L  
LEFT JOIN   
    PAYMENT P ON L.LOCATIONID = P.LOCATIONID   
GROUP BY   
    L.LOCATIONID, L.LOCATIONNAME  
ORDER BY   
    TOTALCOURIERSDELIVERED;


--17Find the courier with the highest average delivery time: 


SELECT MAX(DATEDIFF(DAY, SENTDATE, DELIVERYDATE)) AS HIGHESTDELIVERY
FROM COURIER;


--18. Find Locations with Total Payments Less Than a Certain Amount 
  
SELECT  L.LOCATIONID,   L.LOCATIONNAME,  
    SUM(P.AMOUNT) AS TOTALPAYMENTS  
FROM   
    LOCATION L  
JOIN   
    PAYMENT P ON L.LOCATIONID = P.LOCATIONID  
GROUP BY   
    L.LOCATIONID, L.LOCATIONNAME  
HAVING   
    SUM(P.AMOUNT) < 1000;


--19 Calculate Total Payments per Location
SELECT   
    L.LOCATIONID,  
    L.LOCATIONNAME,  
    SUM(P.AMOUNT) AS TOTALPAYMENTS  
FROM   
    LOCATION L  
LEFT JOIN   
    PAYMENT P ON L.LOCATIONID = P.LOCATIONID  
GROUP BY   
    L.LOCATIONID, L.LOCATIONNAME;

--20Retrieve couriers who have received payments totaling more than $1000 in a specific location (LocationID = X): 
SELECT P.COURIERID,  
    SUM(P.AMOUNT) AS TOTALPAYMENTS  
FROM   
    PAYMENT P  
WHERE   
    P.LOCATIONID = 5 
GROUP BY   
    P.COURIERID  
HAVING   
    SUM(P.AMOUNT) > 1000;

--21Retrieve Couriers Who Have Received Payments Totaling More Than $1000 After a Certain Date

SELECT COURIER.COURIERID
FROM COURIER
JOIN PAYMENT ON COURIER.COURIERID = PAYMENT.COURIERID
WHERE PAYMENT.PAYMENTDATE > '2024-01-01'
GROUP BY COURIER.COURIERID
HAVING SUM(PAYMENT.AMOUNT) > 1000;


--22Retrieve locations where the total amount received is more than $5000 before a certain date (PaymentDate > 'YYYY-MM-DD')

SELECT LOCATION.LOCATIONID, LOCATION.LOCATIONNAME, SUM(PAYMENT.AMOUNT) AS TOTALAMOUNT
FROM LOCATION
JOIN PAYMENT ON LOCATION.LOCATIONID = PAYMENT.LOCATIONID
WHERE PAYMENT.PAYMENTDATE < '2024-01-01'
GROUP BY LOCATION.LOCATIONID, LOCATION.LOCATIONNAME
HAVING SUM(PAYMENT.AMOUNT) > 5000;


--Task 4: Inner Join,Full Outer Join, Cross Join, Left Outer Join,Right Outer Join 
--23. Retrieve Payments with Courier Information 

SELECT PAYMENT.*, COURIER.*
FROM PAYMENT
INNER JOIN COURIER ON PAYMENT.COURIERID = COURIER.COURIERID;

--24. Retrieve Payments with Location Information 

SELECT PAYMENT.PAYMENTID, PAYMENT.AMOUNT, PAYMENT.PAYMENTDATE,
       LOCATION.LOCATIONNAME, LOCATION.ADDRESS
FROM PAYMENT
JOIN LOCATION ON PAYMENT.LOCATIONID = LOCATION.LOCATIONID;

--25. Retrieve Payments with Courier and Location Information 
SELECT PAYMENT.PAYMENTID, PAYMENT.AMOUNT,
       COURIER.SENDERNAME, COURIER.RECEIVERNAME,
       LOCATION.LOCATIONNAME, LOCATION.ADDRESS
FROM PAYMENT
JOIN COURIER ON PAYMENT.COURIERID = COURIER.COURIERID
JOIN LOCATION ON PAYMENT.LOCATIONID = LOCATION.LOCATIONID;


-- 26List all payments with courier details 
SELECT PAYMENT.PAYMENTID, PAYMENT.AMOUNT, PAYMENT.PAYMENTDATE,
       COURIER.SENDERNAME, COURIER.RECEIVERNAME, COURIER.TRACKINGNUMBER, COURIER.STATUS
FROM PAYMENT
JOIN COURIER ON PAYMENT.COURIERID = COURIER.COURIERID;


--27. Total payments received for each courier 
SELECT COURIER.COURIERID, COURIER.SENDERNAME, SUM(PAYMENT.AMOUNT) AS TOTALPAYMENTS
FROM COURIER
JOIN PAYMENT ON COURIER.COURIERID = PAYMENT.COURIERID
GROUP BY COURIER.COURIERID, COURIER.SENDERNAME;

--28. List payments made on a specific date
SELECT PAYMENT.PAYMENTID, PAYMENT.AMOUNT, PAYMENT.PAYMENTDATE,
       COURIER.SENDERNAME, COURIER.RECEIVERNAME
FROM PAYMENT
JOIN COURIER ON PAYMENT.COURIERID = COURIER.COURIERID
WHERE PAYMENT.PAYMENTDATE = '2024-01-10';


--29Get Courier Information for Each Payment

SELECT PAYMENT.PAYMENTID, PAYMENT.AMOUNT, PAYMENT.PAYMENTDATE,
       COURIER.COURIERID, COURIER.SENDERNAME, COURIER.RECEIVERNAME, COURIER.TRACKINGNUMBER, COURIER.STATUS
FROM PAYMENT
JOIN COURIER ON PAYMENT.COURIERID = COURIER.COURIERID;

--30 Get Payment Details with Location 
SELECT PAYMENT.PAYMENTID, PAYMENT.AMOUNT, PAYMENT.PAYMENTDATE,
       LOCATION.LOCATIONNAME, LOCATION.ADDRESS
FROM PAYMENT
JOIN LOCATION ON PAYMENT.LOCATIONID = LOCATION.LOCATIONID;

--31 Calculating Total Payments for Each Courier 
SELECT COURIER.COURIERID, COURIER.SENDERNAME, SUM(PAYMENT.AMOUNT) AS TOTALPAYMENTS
FROM COURIER
JOIN PAYMENT ON COURIER.COURIERID = PAYMENT.COURIERID
GROUP BY COURIER.COURIERID, COURIER.SENDERNAME;

--32 List Payments Within a Date Range 
SELECT PAYMENT.PAYMENTID, PAYMENT.AMOUNT
FROM PAYMENT
JOIN COURIER ON PAYMENT.COURIERID = COURIER.COURIERID
WHERE PAYMENT.PAYMENTDATE BETWEEN '2024-01-01' AND '2024-01-31';


--33 .Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side 
SELECT USERS.USERID, USERS.NAME,  COURIER.STATUS
FROM USERS
LEFT JOIN PAYMENT ON USERS.USERID = PAYMENT.COURIERID
LEFT JOIN COURIER ON PAYMENT.COURIERID = COURIER.COURIERID;


--34Retrieve a List of All Couriers and Their Corresponding Services including cases where there are no matches on either side

SELECT C.COURIERID, C.TRACKINGNUMBER, CS.SERVICEID, CS.SERVICENAME
FROM COURIER AS C
RIGHT JOIN COURIERSERVICES AS CS
ON C.SERVICEID = CS.SERVICEID;

--35  

--36. List all users and all courier services, showing all possible combinations

SELECT USERS.USERID, USERS.NAME, USERS.EMAIL, USERS.CONTACTNUMBER,
       COURIERSERVICES.SERVICEID, COURIERSERVICES.SERVICENAME, COURIERSERVICES.COST
FROM USERS
CROSS JOIN COURIERSERVICES;


--37List all employees and all locations, showing all possible combinations: 
SELECT EMPLOYEE.EMPLOYEEID, EMPLOYEE.NAME, 
       LOCATION.LOCATIONID, LOCATION.LOCATIONNAME, LOCATION.ADDRESS
FROM EMPLOYEE
CROSS JOIN LOCATION;


--38Retrieve a list of couriers and their corresponding sender information (if available)

SELECT COURIER.COURIERID, COURIER.SENDERNAME, COURIER.SENDERADDRESS
FROM COURIER
LEFT JOIN USERS ON COURIER.SENDERNAME = USERS.NAME;


--39 Retrieve a list of couriers and their corresponding receiver information (if available)
SELECT COURIER.COURIERID,
       COURIER.RECEIVERNAME, COURIER.RECEIVERADDRESS
FROM COURIER 
LEFT JOIN USERS ON COURIER.RECEIVERNAME = USERS.NAME;



-- 40. Retrieve a list of couriers along with the courier service details (if available)
ALTER TABLE Courier
ADD ServiceID INT;

UPDATE Courier
SET ServiceID = 1
WHERE CourierID = 1;

UPDATE Courier
SET ServiceID = 2
WHERE CourierID = 2;

SELECT 
    c.CourierID, 
    c.SenderName, 
    c.SenderAddress, 
    c.ReceiverName, 
    c.ReceiverAddress, 
    c.Weight, 
    c.Status, 
    c.TrackingNumber, 
    c.DeliveryDate, 
    cs.ServiceID, 
    cs.ServiceName, 
    cs.Cost
FROM 
    Courier c
LEFT JOIN 
    CourierServices cs ON c.ServiceID = cs.ServiceID;



--41Retrieve a list of employees and the number of couriers assigned to each employee

SELECT E.EMPLOYEEID, E.NAME, COUNT(C.COURIERID) AS TOTALCOURIERS
FROM EMPLOYEE E
LEFT JOIN COURIER C ON E.EMPLOYEEID = C.EMPLOYEEID
GROUP BY E.EMPLOYEEID, E.NAME;


--42 Retrieve a list of locations and the total payment amount received at each location: 
SELECT L.LOCATIONID, L.LOCATIONNAME, SUM(P.AMOUNT) AS TOTALPAYMENTS
FROM LOCATION L
INNER JOIN PAYMENT P ON L.LOCATIONID = P.LOCATIONID
GROUP BY L.LOCATIONID, L.LOCATIONNAME;


--43Retrieve all couriers sent by the same sender (based on SenderName).
SELECT *
FROM COURIER;
SELECT *
FROM COURIER
WHERE SENDERNAME = 'BOB SMITH';


--44List all employees who share the same role. 
SELECT E1.ROLE, E1.NAME AS EMPLOYEE1, E2.NAME AS EMPLOYEE2
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON E1.ROLE = E2.ROLE AND E1.EMPLOYEEID < E2.EMPLOYEEID
ORDER BY E1.ROLE, E1.NAME, E2.NAME;


--45Retrieve all payments made for couriers sent from the same location. 


SELECT L.LOCATIONNAME, COUNT(L.LOCATIONID) AS NUMBEROFCOURIERS
FROM PAYMENT AS P
INNER JOIN LOCATION AS L
ON P.LOCATIONID = L.LOCATIONID
GROUP BY L.LOCATIONID, L.LOCATIONNAME;


--46 Retrieve all couriers sent from the same location (based on SenderAddress).

ALTER TABLE Courier
ALTER COLUMN SenderAddress VARCHAR(255);


SELECT C1.COURIERID, C1.SENDERNAME, C1.RECEIVERNAME, C1.SENDERADDRESS, C1.RECEIVERADDRESS, C1.TRACKINGNUMBER, C1.STATUS, C1.DELIVERYDATE
FROM COURIER C1
JOIN COURIER C2 ON C1.SENDERADDRESS = C2.SENDERADDRESS
WHERE C1.COURIERID <> C2.COURIERID; 



--47List employees and the number of couriers they have delivered

SELECT E.EMPLOYEEID, COUNT(C.COURIERID) AS NUMBEROFCOURIERS
FROM EMPLOYEE AS E
INNER JOIN COURIER AS C
ON E.EMPLOYEEID = C.EMPLOYEEID
GROUP BY E.EMPLOYEEID
ORDER BY E.EMPLOYEEID;


--48 Find couriers that were paid an amount greater than the cost of their respective courier services 
SELECT C.COURIERID, C.SENDERNAME, C.RECEIVERNAME, P.AMOUNT, CS.COST
FROM COURIER C
JOIN PAYMENT P ON C.COURIERID = P.COURIERID
JOIN COURIERSERVICES CS ON C.COURIERID = CS.SERVICEID
WHERE P.AMOUNT > CS.COST;


--Scope: Inner Queries, Non Equi Joins, Equi joins,Exist,Any,All 

--49 Find couriers that have a weight greater than the average weight of all couriers 

SELECT COURIERID, SENDERNAME, RECEIVERNAME, WEIGHT
FROM COURIER
WHERE WEIGHT > (SELECT AVG(WEIGHT) FROM COURIER);

--50 Find the names of all employees who have a salary greater than the average salary:

SELECT NAME
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE);

--51Find the total cost of all courier services where the cost is less than the maximum cost 

SELECT SUM(COST) AS TOTALCOST
FROM COURIERSERVICES
WHERE COST < (SELECT MAX(COST) FROM COURIERSERVICES);

--52Find all couriers that have been paid for
SELECT * FROM Courier WHERE CourierID IN (SELECT CourierID FROM Payment);

--53Find the locations where the maximum payment amount was made

SELECT L.LOCATIONID, L.LOCATIONNAME, L.ADDRESS
FROM LOCATION L
JOIN PAYMENT P ON L.LOCATIONID = P.LOCATIONID
WHERE P.AMOUNT = (SELECT MAX(AMOUNT) FROM PAYMENT);

--54Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName'): 

SELECT COURIERID, SENDERNAME, RECEIVERNAME, WEIGHT
FROM COURIER
WHERE WEIGHT > (SELECT MAX(WEIGHT) 
FROM COURIER 
 WHERE SENDERNAME = 'Charlie Brown');



















