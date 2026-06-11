CREATE DATABASE CustAnalytics;
USE CustAnalytics;

CREATE TABLE customer
(	customerID CHAR(5), 
	customername	VARCHAR(15) NOT NULL,  
    customerzip	CHAR(5)	NOT NULL,  
	PRIMARY KEY (CustomerID));
    
CREATE TABLE sales
( tid INT AUTO_INCREMENT,
  customerID CHAR(5) NOT NULL,
  tdate DATE NOT NULL,
  qty INT NOT NULL,
  PRIMARY KEY (tid),
  FOREIGN KEY (customerID) REFERENCES customer(customerID));
  

# Let's insert the data
INSERT INTO customer(customerID,customername,customerzip) VALUES ('C0001','Jane','79911');
INSERT INTO customer(customerID,customername,customerzip) VALUES ('C0002','Jorge','88003');
INSERT INTO customer(customerID,customername,customerzip) VALUES ('C0003','Mary','79932');
INSERT INTO customer(customerID,customername,customerzip) VALUES ('C0004','David','88001');
INSERT INTO customer(customerID,customername,customerzip) VALUES ('C0005','Ali','88003');

# Now let's insert the sales data
INSERT INTO sales(customerID,tdate,qty) VALUES ('C0001','2021-03-01',10);
INSERT INTO sales(customerID,tdate,qty) VALUES ('C0002','2021-03-01',15);
INSERT INTO sales(customerID,tdate,qty) VALUES ('C0002','2021-03-01',11);
INSERT INTO sales(customerID,tdate,qty) VALUES ('C0003','2021-04-02',14);
INSERT INTO sales(customerID,tdate,qty) VALUES ('C0003','2021-04-02',20);
INSERT INTO sales(customerID,tdate,qty) VALUES ('C0003','2021-04-01',30);
INSERT INTO sales(customerID,tdate,qty) VALUES ('C0004','2021-04-01',43);
INSERT INTO sales(customerID,tdate,qty) VALUES ('C0004','2021-05-03',23);
INSERT INTO sales(customerID,tdate,qty) VALUES ('C0004','2021-05-04',18);
INSERT INTO sales(customerID,tdate,qty) VALUES ('C0005','2021-05-02',50);
INSERT INTO sales(customerID,tdate,qty) VALUES ('C0005','2021-05-05',35);






# Deliverable 1 Stored Procedure:
DELIMITER $$

CREATE PROCEDURE custtier()
BEGIN
    SELECT 
        c.customername AS CustomerName,
        SUM(s.qty) AS TotalQtySold,
        IF(SUM(s.qty) < 30, 'Low-tier',
           IF(SUM(s.qty) < 60, 'Mid-tier',
              'High-tier')) AS CustTier
    FROM customer c, sales s
    WHERE c.customerID = s.customerID
    GROUP BY c.customername;
END $$

DELIMITER ;


# Deliverable 2 Call Statement:
CALL custtier();


# Deliverable 3 User Access Control:
# 3a Create User
CREATE USER 'Isaac Asimov'@'localhost'
IDENTIFIED BY 'iRobot2016';

# 3b Grant Privileges
GRANT SELECT, UPDATE
ON CustAnalytics.customer
TO 'Isaac Asimov'@'localhost';

# 3c Show Granted Privileges
SHOW GRANTS FOR 'Isaac Asimov'@'localhost';
