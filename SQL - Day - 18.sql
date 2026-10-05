CREATE DATABASE IF NOT EXISTS Ecommerce;

USE Ecommerce;

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO Product
(product_id, product_name, category, price)
VALUES
(1, 'Samsung Galaxy S24', 'Mobile', 45000),
(2, 'iPhone 15', 'Mobile', 65000),
(3, 'OnePlus 12', 'Mobile', 48000),
(4, 'Redmi Note 13', 'Mobile', 22000),
(5, 'Realme 12 Pro', 'Mobile', 28000),
(6, 'Samsung Galaxy S24 Ultra', 'Mobile', 125000),
(7, 'HP Laptop', 'Laptop', 55000),
(8, 'Dell Laptop', 'Laptop', 70000),
(9, 'Boat Headphones', 'Accessories', 3000),
(10, 'Apple Watch', 'Watch', 45000);

CREATE TABLE Sale (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Sale
(sale_id, product_id, quantity, sale_date)
VALUES
(101, 1, 5, '2026-09-01'),
(102, 2, 3, '2026-09-02'),
(103, 3, 4, '2026-09-03'),
(104, 4, 10, '2026-09-04'),
(105, 5, 7, '2026-09-05'),
(106, 6, 2, '2026-09-06'),
(107, 7, 3, '2026-09-07'),
(108, 8, 2, '2026-09-08'),
(109, 9, 15, '2026-09-09'),
(110, 10, 5, '2026-09-10');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Orders
(order_id, product_id, order_date, quantity)
VALUES
(201, 1, '2026-09-01', 2),
(202, 2, '2026-09-02', 1),
(203, 3, '2026-09-03', 3),
(204, 4, '2026-09-04', 5),
(205, 5, '2026-09-05', 4),
(206, 6, '2026-09-06', 1),
(207, 7, '2026-09-07', 2),
(208, 8, '2026-09-08', 1),
(209, 9, '2026-09-09', 6),
(210, 10, '2026-09-10', 2);

CREATE TABLE Returns (
    return_id INT PRIMARY KEY,
    product_id INT,
    return_date DATE,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Returns
(return_id, product_id, return_date, quantity)
VALUES
(301, 1, '2026-09-11', 1),
(302, 2, '2026-09-12', 1),
(303, 4, '2026-09-13', 2),
(304, 5, '2026-09-14', 1),
(305, 9, '2026-09-15', 2);

SELECT p.product_id, p.product_name, p.category, p.price
FROM Product p
INNER JOIN Sale s
ON p.product_id = s.product_id
WHERE p.category = 'Mobile'
AND p.price < 50000;

SELECT COUNT(DISTINCT p.product_id) AS Total_Mobile_Phones
FROM Product p
INNER JOIN Sale s
ON p.product_id = s.product_id
WHERE p.category = 'Mobile'
AND p.price < 50000;