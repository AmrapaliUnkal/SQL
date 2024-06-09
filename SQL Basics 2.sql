create database Products_Info;
Use Products_Info;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT,
    Supplier VARCHAR(100),
    AddedDate DATE
);

INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 800.00, 50, 'TechCorp', '2022-01-15'),
(2, 'Smartphone', 'Electronics', 600.00, 120, 'MobileInc', '2022-03-23'),
(3, 'Desk Chair', 'Furniture', 150.00, 200, 'FurnitureCo', '2021-12-01'),
(4, 'Coffee Table', 'Furniture', 85.00, 80, 'FurnitureCo', '2021-07-19'),
(5, 'LED TV', 'Electronics', 400.00, 40, 'ScreenMasters', '2022-02-05'),
(6, 'Blender', 'Appliances', 70.00, 150, 'HomeGoods', '2021-09-17'),
(7, 'Microwave', 'Appliances', 90.00, 60, 'HomeGoods', '2022-04-10'),
(8, 'Refrigerator', 'Appliances', 1200.00, 20, 'CoolingExperts', '2021-11-25'),
(9, 'Bookshelf', 'Furniture', 110.00, 90, 'FurnitureCo', '2022-05-14'),
(10, 'Tablet', 'Electronics', 300.00, 75, 'TechCorp', '2022-06-01');


/* Q1. Retrieve all records from the Products table.*/

Select * from Products;

/*Q2. Find all products in the 'Electronics' category.*/

Select * 
FROM Products
WHERE Category = "Electronics";

/*Q3. List all products sorted by their price in descending order.*/

Select ProductName, Price 
FROM Products
Order By Price DESC;

/*Q4. Find the average price for each category.*/

Select Category, AVG(Price)
FROM Products
GROUP BY Category;

/*Q5. Retrieve the names and prices of products that have
a stock quantity greater than 50, sorted by their stock quantity in ascending order.*/

Select ProductName, Price, StockQuantity
FROM Products
WHERE StockQuantity > 50
Order By StockQuantity;

/*Q6. Find categories with an average price greater than $100.*/

Select Category, AVG(Price) > 100
FROM Products
GROUP BY Category;

/*Q7. Retrieve the names and suppliers of all products. */

SELECT ProductName, Supplier
FROM Products;

/*Q8. Find products that are in the 'Furniture' 
category and have a price less than $100.*/

SELECT ProductName
FROM Products
WHERE Category = "Furniture" and Price < 100;

/*Q9. List all products sorted by category and then by price within each category.*/

SELECT ProductName, Category, Price
FROM Products
Order By Category , Price;

/*Q10. Count the number of products in each category.*/

SELECT Category, COUNT(ProductID)
FROM Products
GROUP BY Category;

/*Q11. Find all products that were added after January 1, 2022.*/

Select ProductName 
FROM Products
WHERE AddedDate > "2022-01-01";

/*Q12. Find the total stock quantity for each category.*/

SELECT Category, COUNT(StockQuantity) As StockQuantity
FROM Products
Group By Category;

/*Q13. Retrieve the names of products supplied by 'HomeGoods', 
sorted by their added date.*/

SELECT ProductName, AddedDate
FROM Products
Where Supplier = "HomeGoods"
ORDER BY AddedDate;

/*Q14. Find categories with more than 2 products and show the total
number of products in those categories.*/

SELECT Category, COUNT(ProductID) As TOtal_Count_Of_Product
FROM Products
Group BY Category
Having COUNT(ProductID) > 2;

/*Q15. Find products whose name starts with 'B'.*/

Select * FROM 
Products
WHERE ProductName Like "B%";

/*Q16. Find products that are in the 'Appliances' or 'Furniture' category. */

SELECT ProductName, Category
FROM Products
WHERE Category in ("Furniture","Appliances");

/*Q17. Retrieve the names and prices of products that have a price less than $100. */

SELECT ProductName, Price
FROM Products
WHERE Price < 100;

/*Q18. Find the product with the highest price.*/

SELECT ProductName, Price
FROM Products
Order BY Price DESC
LIMIT 1;

/*Q19. Retrieve the full details of products whose stock quantity is between 50 and 100.*/

SELECT * FROM Products
WHERE StockQuantity 
Between 50 and 100;

/*Q20. List all products sorted by their added date in ascending order.*/

SELECT * FROM Products
ORDER BY AddedDate ASC;

/*Q21. Update the price of the product with ProductID 1 to $850.00.*/

Update Products
SET Price = "850.00"
Where ProductID = "1";

SELECT * FROM Products;

/*Q22. Delete the product with ProductID 10.*/

 DELETE From Products
WHERE ProductID = 10;

SELECT * FROM Products;

/*Q23. Add a new column WarrantyPeriod of type INT to the Products table*/

ALTER Table Products
Add Column WarrantyPeriod INT;

SELECT * FROM Products;

/*Q24. Change the Supplier of the product with ProductID 5 to 'TechSuppliers'.*/

UPDATE Products
SET Supplier= "TechSuppliers"
Where ProductID= "5";

SELECT * FROM Products
Where ProductID= "5";

/*Q25 Modify the ProductName of the product with ProductID 3 to 'Ergonomic Desk Chair'.*/

UPDATE Products
SET ProductName = "Ergonomic Desk Chair"
WHERE ProductID= "3";

SELECT * FROM Products
Where ProductID= "3";

/*Q26 Change the data type of the StockQuantity column to BIGINT.*/

ALTER Table Products
Modify  StockQuantity  BIGINT;

Describe Products;

/*Q27. Drop the Supplier column from the Products table.*/

ALTER Table Products
DROP Column Supplier;

SELECT * FROM Products;

/*Q28. Rename the column Price to UnitPrice in the Products table. */

ALTER Table Products
CHANGE Price UnitPrice DECIMAL(10, 2);

SELECT * FROM Products;

/*Q29. Change the data type of the UnitPrice column to DECIMAL(12, 2).*/

ALTER Table Products
Modify UnitPrice DECIMAL(12,2);

Describe Products;

