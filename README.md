Company X's Business Intelligence team is developing a web application. One of the features of this application is categorizing the company’s customers by sales volume (qty sold). The application developers reached out to you to develop a stored procedure that the application can call on the user's request. 

Based on your discussion with the developer, the logic for categorizing customers is as follows: 
IF Total Quantity Sold to a Customer < 30, THEN set the Customer Tier to “Low-tier” IF Total Quantity Sold to a Customer < 60, THEN set the Customer Tier to “Mid-tier” ELSE set the Customer Tier to “High-tier.” 

1) Develop a stored procedure with the name “custtier”, which generates the following information to the application: Customername, TotalQtySold, CustTier 
Using the mini database, insert the sample data. This database is used to create the  stored procedure. 

2) Please create a call statement to show that your procedure works. 

3) Perform the following SQL Data Control Language (DCL) activities:
a) Created a new user with the name “Isaac Asimov” to the local host and identify the user with the password “iRobot2016”. 
b) Granted this user the privilege to SELECT and UPDATE the Customer table in the database. 

c) As the third and final step, show that all privileges are properly granted.
