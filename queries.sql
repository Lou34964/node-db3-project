-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
    SELECT p.ProductName, c.CategoryName
    FROM Product AS p
    JOIN Category AS c ON p.CategoryId = c.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
    SELECT o.Id, CompanyName
    FROM [Order] as O
    JOIN Shipper AS s ON O.ShipVia = s.Id
    WHERE OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
    SELECT ProductName, Quantity
    FROM [Order] AS o
    JOIN OrderDetail AS od ON o.Id = od.OrderId
    JOIN Product AS p ON od.ProductId = p.Id 
    WHERE o.Id = 10251
    ORDER BY ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
    SELECT o.Id AS OrderId, c.CompanyName AS Company, e.LastName AS Employee
    FROM [Order] AS o
    JOIN Customer AS c on o.CustomerId = c.Id
    JOIN Employee AS e ON o.EmployeeId = e.Id


-- ### Stretch SQL ###

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
    SELECT COUNT(ProductName) AS Count, CategoryName AS Category
    FROM Products AS p
    JOIN Categories AS c ON p.CategoryId = c.CategoryId
    GROUP BY p.CategoryId

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
    SELECT o.OrderID, SUM(Quantity) AS Quantity
    FROM [Orders] AS O
    JOIN OrderDetails AS od ON o.OrderID = od.OrderID
    GROUP BY o.OrderId