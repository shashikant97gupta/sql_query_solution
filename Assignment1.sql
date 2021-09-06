create database sqlAssignment
use sqlAssignment;
create table SalesPeople (Snum int NOT NULL PRIMARY KEY,
 Sname varchar(40) UNIQUE ,
 City  varchar(100),
 Comm int
 ) ;
 
INSERT INTO SalesPeople VALUES (1001, "Peel", "London", 12);
INSERT INTO SalesPeople VALUES (1002, "Serres", "Sanjose", 13);
INSERT INTO SalesPeople VALUES (1004, "Motika", "London", 11);
INSERT INTO SalesPeople VALUES (1007, "Rifkin", "Barcelona", 15);
INSERT INTO SalesPeople VALUES (1003, "Axelrod", "Newyork", 10);

create table Orders (Onum int NOT NULL PRIMARY KEY ,
 Amt float4,
 Odate date,
 Cnum int,
 Snum int,
 FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),
 FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
 ) ;
 
 INSERT INTO Orders VALUES (3001, 18.69, "1990-3-10", 2008, 1007);
 INSERT INTO Orders VALUES (3003, 767.19, "1990-3-10", 2001, 1001);
 INSERT INTO Orders VALUES (3002, 1900.10, "1990-3-10", 2007, 1004);
 INSERT INTO Orders VALUES (3005,  5160.45, "1990-3-10", 2003, 1002);
 INSERT INTO Orders VALUES (3006,  1098.16, "1990-3-10", 2008, 1007);
 INSERT INTO Orders VALUES (3009, 1713.23, "1990-4-10", 2002, 1003);
 INSERT INTO Orders VALUES (3007,  75.75, "1990-4-10", 2004, 1002);
 INSERT INTO Orders VALUES (3008,  4273.00, "1990-5-10", 2006, 1001);
 INSERT INTO Orders VALUES (3010,  1309.95, "1990-6-10", 2004, 1002);
 INSERT INTO Orders VALUES (3011,  9891.88, "1990-6-10", 2006, 1001);
 
 create table Customers (Cnum int NOT NULL PRIMARY KEY ,
 Cname varchar(40),
 City  varchar(100) NOT NULL,
 Snum int,
 FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
 ) ;
 
 INSERT INTO Customers VALUES (2001,  "Hoffman", "London", 1001);
 INSERT INTO Customers VALUES (2002,  "Giovanni", "Rome", 1003);
 INSERT INTO Customers VALUES (2003,  "Liu", "Sanjose", 1002);
 INSERT INTO Customers VALUES (2004,  "Grass", "Berlin", 1002);
 INSERT INTO Customers VALUES (2006, "Clemens", "London", 1001);
 INSERT INTO Customers VALUES (2008, "Cisneros", "Sanjose", 1007);
 INSERT INTO Customers VALUES (2007, "Pereira", "Rome", 1004);
 
--  Answer 1. 
SELECT count(Sname) from SalesPeople as sp where sp.Sname LIKE 'A%' or'a%';


-- Answer 2.
SELECT SalesPeople.Sname, Orders.Amt
FROM SalesPeople
INNER JOIN Orders
ON SalesPeople.Snum = Orders.Snum
WHERE Orders.Amt > 2000;

-- Answer 3.
SELECT count(Sname) from SalesPeople as sp where sp.City = "Newyork";

-- Answer 4.
SELECT Sname from SalesPeople as sp where sp.City = "London" or sp.City = "Paris";

-- Answer 5.
SELECT SalesPeople.Sname, Orders.Odate, count(Sname)
FROM SalesPeople
INNER JOIN Orders
ON SalesPeople.Snum = Orders.Snum
GROUP BY SalesPeople.Sname,Orders.Odate 
 