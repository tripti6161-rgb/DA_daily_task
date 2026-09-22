-- day 04
-- 1. Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT,
    city VARCHAR(50),
    phone VARCHAR(15)
);

INSERT INTO Customer VALUES
(1, 'Rahul', 'rahul@gmail.com', 21, 'Delhi', '9876543210'),
(2, 'Aman', 'aman@gmail.com', 22, 'Meerut', '9876543211'),
(3, 'Priya', 'priya@gmail.com', 20, 'Noida', '9876543212');

-- 2. Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT DEFAULT 0
);

INSERT INTO Product VALUES
(101, 'Laptop', 'Electronics', 55000, 10),
(102, 'Mouse', 'Accessories', 800, 50),
(103, 'Keyboard', 'Accessories', 1500, 30);

-- 3. Shipment Table
CREATE TABLE Shipment (
    shipment_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    quantity INT,
    address VARCHAR(200),
    shipment_date DATE,

    FOREIGN KEY (product_id)
    REFERENCES Product(product_id),

    FOREIGN KEY (customer_id)
    REFERENCES Customer(customer_id)
);

INSERT INTO Shipment VALUES
(1001, 101, 1, 1, 'Delhi', '2026-09-20'),
(1002, 102, 2, 2, 'Meerut', '2026-09-21'),
(1003, 103, 1, 1, 'Delhi', '2026-09-21');

SELECT
    Customer.name,
    Product.product_name,
    Product.price,
    Shipment.quantity
FROM Customer
INNER JOIN Shipment
ON Customer.customer_id = Shipment.customer_id
INNER JOIN Product
ON Shipment.product_id = Product.product_id;

SELECT
    Customer.name,
    Product.product_name,
    Shipment.quantity,
    Product.price,
    Shipment.quantity * Product.price AS total_amount
FROM Customer
JOIN Shipment
ON Customer.customer_id = Shipment.customer_id
JOIN Product
ON Shipment.product_id = Product.product_id;

SELECT
    Customer.name,
    Shipment.shipment_id
FROM Customer
LEFT JOIN Shipment
ON Customer.customer_id = Shipment.customer_id;

SELECT
    Customer.name,
    Product.product_name,
    Product.price
FROM Customer
JOIN Shipment
ON Customer.customer_id = Shipment.customer_id
JOIN Product
ON Shipment.product_id = Product.product_id
WHERE Product.price > 1000;

-- day 05
SELECT *
FROM Product
WHERE price = (
    SELECT MAX(price)
    FROM Product
);

SELECT *
FROM Product
WHERE price > (
    SELECT AVG(price)
    FROM Product
);

SELECT
    product_name,
    price,
    CASE
        WHEN price >= 5000 THEN 'Premium'
        WHEN price >= 2000 THEN 'Standard'
        ELSE 'Basic'
    END AS product_type
FROM Product;

SELECT
    product_name,
    stock,
    CASE
        WHEN stock = 0 THEN 'Out of Stock'
        WHEN stock <= 10 THEN 'Low Stock'
        ELSE 'Available'
    END AS stock_status
FROM Product;

SELECT
    Customer.name,
    SUM(Product.price * Shipment.quantity) AS total_spending
FROM Customer
JOIN Shipment
ON Customer.customer_id = Shipment.customer_id
JOIN Product
ON Shipment.product_id = Product.product_id
GROUP BY Customer.customer_id, Customer.name;

SELECT *
FROM Product
ORDER BY price DESC
LIMIT 5;

CREATE VIEW Sales_View AS
SELECT
    Customer.name AS customer_name,
    Product.product_name,
    Shipment.quantity,
    Product.price,
    Shipment.quantity * Product.price AS total_amount
FROM Customer
JOIN Shipment
ON Customer.customer_id = Shipment.customer_id
JOIN Product
ON Shipment.product_id = Product.product_id;

SELECT *
FROM Sales_View;

SELECT
    Customer.name,
    COUNT(Shipment.shipment_id) AS total_orders,
    SUM(Shipment.quantity) AS total_quantity,
    SUM(Product.price * Shipment.quantity) AS total_spending,
    AVG(Product.price * Shipment.quantity) AS average_order_value
FROM Customer
JOIN Shipment
ON Customer.customer_id = Shipment.customer_id
JOIN Product
ON Shipment.product_id = Product.product_id
GROUP BY Customer.customer_id, Customer.name;