create database customer_order;
use customer_order;

Create table Customers(
	CustomerID INT Primary key,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(100),
    Country VARCHAR(50)
);

CREATE TABLE Orders(
	OrderID INT Primary key,
    OrderDate DATE,
    CustomerID INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);

INSERT INTO Customers VALUES
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Germany'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Sweden');

INSERT INTO Orders (OrderID, OrderDate, CustomerID, Amount) VALUES
(101, '2023-01-15', 1, 250.00),
(102, '2023-01-17', 2, 150.00),
(103, '2023-01-19', 3, 300.00),
(104, '2023-01-21', 4, 450.00),
(105, '2023-01-23', 5, 200.00),
(106, '2023-01-25', 1, 350.00),
(107, '2023-01-27', 3, 400.00);

/*Q1. Retrieve all records from the Customers table.*/

Select * from Customers;

/*Q2. Retrieve all records from the Orders table.*/

Select * from Orders;

/*Q3. Find all customers who have placed an order.*/

Select Distinct c.* 
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID;

/*Q4. Find all orders along with the corresponding customer details.*/

SELECT Orders.*, Customers.CustomerName, Customers.ContactName, Customers.Country
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

/*Q5 Retrieve all customers and their orders, including customers who have not placed any orders.*/

SELECT * FROM Customers
Left Join Orders
On Customers.CustomerID=Orders.CustomerID;

SELECT Customers.*, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

/*Q6. Retrieve all orders and their corresponding customer details, including orders without a valid customer.*/

Select Orders.*, Customers.CustomerName, Customers.ContactName, Customers.Country 
FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

/*Q7. Find the total amount spent by each customer.*/

SELECT Customers.CustomerID,CustomerName, SUM(Orders.Amount)
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID Group BY Customers.CustomerID ;

/*Q8. Find customers who have not placed any orders.*/

Select Customers.*
FROM Customers
Left Join Orders ON Customers.CustomerID = Orders.CustomerID
Where Orders.OrderID IS NULL;

/*Q9. Find the details of customers along with the total amount they have spent, sorted by the total amount in descending order.*/

Select Customers.*, SUM(Orders.Amount) as TotalAmount
From Customers
Join Orders ON Customers.CustomerID = Orders.CustomerID 
Group BY (Customers.CustomerID) 
Order BY TotalAmount DESC;

Select Customers.*, COALESCE(SUM(Orders.Amount),0) as TotalAmount
From Customers
Left Join Orders ON Customers.CustomerID = Orders.CustomerID 
Group BY (Customers.CustomerID) 
Order BY TotalAmount DESC;

/*Q10. Retrieve the details of the most recent order placed by each customer.*/

select c.customerid,c.customername,o.orderid,o.orderdate,o.amount
FROM customers c JOIN orders o
ON c.customerid = o.customerid
WHERE o.orderdate IN(select MAX(orderdate) from orders where customerid=c.customerid);

/*Q11. Find the customers who have placed more than one order.*/

SELECT Customers.CustomerID, Customers.CustomerName, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.CustomerName
HAVING COUNT(Orders.OrderID) > 1;

/*Q12. Find the customers who have placed orders with an amount greater than $200.*/

Select DISTINCT Customers.*
FROM Customers
Join Orders ON Customers.CustomerID = Orders.CustomerID
Where Amount > 200;

/*Q13. Retrieve the list of customers and their orders, sorted by the order date.*/

Select Customers.CustomerID,Customers.CustomerName,Orders.OrderID, Orders.OrderDate
FROM Customers 
Join Orders ON Customers.CustomerID = Orders.CustomerID
Order BY Orders.OrderDate; 

/*Q14. Find the total number of orders placed by each customer.*/

Select Customers.CustomerID, Customers.CustomerName, Count(Orders.OrderID) As Num_Of_Order 
From Customers
Join Orders ON Customers.CustomerID = Orders.CustomerID
Group BY Customers.CustomerID, Customers.CustomerName;

/*Q15. Find the customers who have placed orders in January 2023.*/

Select distinct Customers.*
FROM Customers
Join Orders ON Customers.CustomerID = Orders.CustomerID
Where Orders.OrderDate Between '2023-01-01' AND '2023-01-31';

/*Q16. Retrieve the list of orders along with their customer details, sorted by customer name.*/

Select Orders.*, Customers.CustomerName
From Orders
Left Join Customers On Customers.CustomerID = Orders.CustomerID
Order By Customers.CustomerName;

/*Q17. Find the average order amount for each customer.*/

Select Customers.CustomerName, Orders.CustomerID, AVG(Orders.Amount)
From Orders 
Join Customers On Customers.CustomerID = Orders.CustomerID
Group By Orders.CustomerID, Customers.CustomerName;

/*Q18. Find the customer and order details for orders placed after January 20, 2023.*/

Select Customers.CustomerName, Orders.*
From Orders
Join Customers ON Orders.CustomerID = Customers.CustomerID
Where Orders.OrderDate > '2023-01-20';

/*Q19. Retrieve the list of customers along with their order details, including those who have not placed any orders, sorted by country.*/

Select Customers.*, Orders.*
From Customers
Left Join Orders ON Customers.CustomerID = Orders.CustomerID
Order By Customers.Country;

/*Q20. Find the highest order amount placed by each customer.*/

Select Orders.CustomerID, Customers.CustomerName, Max(Amount) As HighestOrderAmount
From Orders
Join Customers ON Orders.CustomerID = Customers.CustomerID
Group By Customers.CustomerID, Customers.CustomerName;

/*Q21. Retrieve the details of customers who have placed an order with an amount greater than $300.*/

SELECT DISTINCT Customers.*
From Orders
Join Customers ON Customers.CustomerID = Orders.CustomerID
Where Orders.Amount > 300;

/*Q22. Find the customers who have placed orders in the UK.*/

Select DISTINCT Customers.*
From Customers
Join Orders ON Customers.CustomerID = Orders.CustomerID
Where Customers.Country = 'UK';

/*Q23. Retrieve the list of customers and their orders, showing only those customers who have placed orders in the last 30 days.*/

Select Customers.*, Orders.*
From Customers
Join Orders On Customers.CustomerID = Orders.CustomerID
Where Orders.OrderDate >= Date_SUB(current_date(), INTERVAL 30 Day);

/*Q24. Find the total order amount for each country.*/

Select Customers.Country, Sum(Orders.Amount)
From Customers
Join Orders On Customers.CustomerID = Orders.CustomerID
Group By Customers.Country;

/*Q25. Retrieve the details of the top 3 customers based on the total amount spent.*/

Select Customers.CustomerName,Customers.CustomerID, Sum(Orders.Amount) As TotalAmount
From Customers
Join Orders On Customers.CustomerID = Orders.CustomerID
Group By Customers.CustomerID, Customers.CustomerName
Order By TotalAmount DESC
Limit 3;



