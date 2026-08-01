USE superstore_db;
SHOW SESSION VARIABLES LIKE 'local_infile';
DROP TABLE IF EXISTS superstore;
CREATE TABLE superstore (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date VARCHAR(20),
    Ship_Date VARCHAR(20),
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name TEXT,
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(10,2),
    Profit DECIMAL(10,2)
);
LOAD DATA LOCAL INFILE 'C:/Users/ab886/OneDrive/Desktop/Superstore_Final.csv'
INTO TABLE superstore
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(Row_ID, Order_ID, Order_Date, Ship_Date, Ship_Mode,
 Customer_ID, Customer_Name, Segment, Country, City,
 State, Postal_Code, Region, Product_ID, Category,
 Sub_Category, Product_Name, Sales, Quantity,
 Discount, Profit);
 SELECT COUNT(*) FROM superstore;
SELECT *
FROM superstore
LIMIT 10;
SELECT Customer_Name, Sales
FROM superstore
LIMIT 10;
SELECT DISTINCT Category
FROM superstore;
SELECT DISTINCT Region
FROM superstore;
SELECT *
FROM superstore
WHERE Category = 'Technology';
SELECT *
FROM superstore
WHERE Region = 'West';
SELECT Customer_Name, Sales
FROM superstore
WHERE Sales > 1000;
SELECT Product_Name, Profit
FROM superstore
WHERE Profit < 0;
SELECT Customer_Name, Category
FROM superstore
WHERE Category = 'Furniture';
SELECT Customer_Name
FROM superstore
ORDER BY Customer_Name;
SELECT Customer_Name, Sales
FROM superstore
ORDER BY Sales;
SELECT Customer_Name, Sales
FROM superstore
ORDER BY Sales DESC;
SELECT Product_Name, Profit
FROM superstore
ORDER BY Profit DESC;
SELECT Product_Name, Profit
FROM superstore
ORDER BY Profit ASC;
SELECT Customer_Name, Sales
FROM superstore
ORDER BY Sales DESC
LIMIT 10;
SELECT Customer_Name
FROM superstore
WHERE Customer_Name LIKE 'A%';
SELECT Customer_Name
FROM superstore
WHERE Customer_Name LIKE 'S%';
SELECT Product_Name
FROM superstore
WHERE Product_Name LIKE '%Chair%';
SELECT City
FROM superstore
WHERE City LIKE '%New%';
SELECT Customer_Name
FROM superstore
WHERE Customer_Name LIKE '%son';
SELECT Customer_Name, Sales
FROM superstore
WHERE Sales BETWEEN 1000 AND 5000;
SELECT Product_Name, Profit
FROM superstore
WHERE Profit BETWEEN 100 AND 500;
SELECT Customer_Name, Region
FROM superstore
WHERE Region IN ('East', 'West');
SELECT Product_Name, Category
FROM superstore
WHERE Category IN ('Furniture', 'Technology');
SELECT Customer_Name, Sales, Region
FROM superstore
WHERE Sales > 1000
AND Region = 'West';
SELECT Customer_Name, Region
FROM superstore
WHERE Region = 'East'
OR Region = 'West';
SELECT Product_Name, Category
FROM superstore
WHERE Category NOT IN ('Furniture');
SELECT COUNT(*) AS Total_Records
FROM superstore;
SELECT SUM(Sales) AS Total_Sales
FROM superstore;
SELECT AVG(Sales) AS Average_Sales
FROM superstore;
SELECT MAX(Sales) AS Highest_Sales
FROM superstore;
SELECT MIN(Sales) AS Lowest_Sales
FROM superstore;
SELECT Category, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category;
SELECT Region, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Region;
SELECT Category, AVG(Sales) AS Average_Sales
FROM superstore
GROUP BY Category;
SELECT Region, COUNT(*) AS Total_Orders
FROM superstore
GROUP BY Region;
SELECT Region, COUNT(*) AS Total_Orders
FROM superstore
GROUP BY Region
HAVING COUNT(*) > 2500;
SELECT Category, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category
HAVING SUM(Sales) > 500000;
SELECT Region, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Region
HAVING SUM(Profit) > 80000;
SELECT Category, AVG(Sales) AS Average_Sales
FROM superstore
GROUP BY Category
HAVING AVG(Sales) > 200;
SELECT Customer_Name,
       Sales,
       CASE
           WHEN Sales > 500 THEN 'High Sales'
           WHEN Sales BETWEEN 100 AND 500 THEN 'Medium Sales'
           ELSE 'Low Sales'
       END AS Sales_Category
FROM superstore
LIMIT 20;
SELECT Product_Name,
       Profit,
       CASE
           WHEN Profit > 0 THEN 'Profit'
           ELSE 'Loss'
       END AS Status
FROM superstore
LIMIT 20;
SELECT Product_Name,
       Discount,
       CASE
           WHEN Discount = 0 THEN 'No Discount'
           ELSE 'Discount Available'
       END AS Discount_Status
FROM superstore
LIMIT 20;
SELECT UPPER(Customer_Name) AS Customer
FROM superstore
LIMIT 10;
SELECT LOWER(Customer_Name) AS Customer
FROM superstore
LIMIT 10;
SELECT Customer_Name,
       LENGTH(Customer_Name) AS Name_Length
FROM superstore
LIMIT 10;
SELECT CONCAT(Customer_Name, ' - ', Region) AS Customer_Details
FROM superstore
LIMIT 10;
SELECT CURDATE();
SELECT NOW();
SELECT Order_Date,
       YEAR(STR_TO_DATE(Order_Date, '%m/%d/%Y')) AS Order_Year
FROM superstore
LIMIT 10;
SELECT Order_Date,
       MONTH(STR_TO_DATE(Order_Date, '%m/%d/%Y')) AS Order_Month
FROM superstore
LIMIT 10;
SELECT Customer_Name, Sales
FROM superstore
WHERE Sales = (
    SELECT MAX(Sales)
    FROM superstore
);
SELECT Customer_Name, Sales
FROM superstore
WHERE Sales > (
    SELECT AVG(Sales)
    FROM superstore
);
SELECT Product_Name, Profit
FROM superstore
WHERE Profit = (
    SELECT MIN(Profit)
    FROM superstore
);
CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50)
);
INSERT INTO customers VALUES
(1, 'Rahul'),
(2, 'Amit'),
(3, 'Priya'),
(4, 'Neha');
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    amount INT
);
INSERT INTO orders VALUES
(101, 1, 500),
(102, 2, 800),
(103, 1, 300),
(104, 3, 900);
SELECT c.customer_name, o.order_id, o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;
SELECT c.customer_name, o.order_id, o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;
INSERT INTO customers
VALUES (5, 'Rohit');
SELECT c.customer_name, o.order_id, o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;
SELECT c.customer_name, o.order_id, o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
UNION
SELECT c.customer_name, o.order_id, o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;
SELECT Category, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT Region, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Region
ORDER BY Total_Profit DESC;
SELECT Customer_Name, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 5;
SELECT Sub_Category, SUM(Quantity) AS Total_Quantity
FROM superstore
GROUP BY Sub_Category
ORDER BY Total_Quantity DESC
LIMIT 5;
SELECT State, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT Customer_Name, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Customer_Name
ORDER BY Total_Profit DESC
LIMIT 10;
SELECT YEAR(STR_TO_DATE(Order_Date, '%m/%d/%Y')) AS Order_Year,
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Order_Year
ORDER BY Total_Sales DESC;
SELECT Region, COUNT(*) AS Total_Orders
FROM superstore
GROUP BY Region
ORDER BY Total_Orders DESC;