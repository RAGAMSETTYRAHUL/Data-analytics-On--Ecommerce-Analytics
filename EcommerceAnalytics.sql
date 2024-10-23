CREATE DATABASE EcommerceAnalytics;
USE EcommerceAnalytics;

-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    email VARCHAR(255),
    signup_date DATE,
    country VARCHAR(100)
);

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Reviews Table
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert Customers
INSERT INTO Customers (customer_id, customer_name, email, signup_date, country)
VALUES 
(1, 'John Doe', 'john@example.com', '2022-01-01', 'USA'),
(2, 'Jane Smith', 'jane@example.com', '2022-02-15', 'Canada'),
(3, 'David Johnson', 'david@example.com', '2022-03-20', 'UK'),
(4, 'Emily Brown', 'emily@example.com', '2022-05-25', 'Australia');

-- Insert Products
INSERT INTO Products (product_id, product_name, category, price)
VALUES 
(1, 'Laptop', 'Electronics', 1000.00),
(2, 'Smartphone', 'Electronics', 700.00),
(3, 'Tablet', 'Electronics', 400.00),
(4, 'Headphones', 'Accessories', 100.00);

-- Insert Orders
INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity, total_amount)
VALUES 
(1, 1, 1, '2022-06-01', 1, 1000.00),
(2, 2, 2, '2022-06-15', 2, 1400.00),
(3, 3, 3, '2022-07-10', 1, 400.00),
(4, 4, 4, '2022-07-22', 3, 300.00);

-- Insert Reviews
INSERT INTO Reviews (review_id, product_id, customer_id, rating, review_text, review_date)
VALUES 
(1, 1, 1, 5, 'Excellent Laptop!', '2022-06-10'),
(2, 2, 2, 4, 'Good Smartphone.', '2022-06-20'),
(3, 3, 3, 3, 'Average Tablet.', '2022-07-15'),
(4, 4, 4, 5, 'Great Headphones!', '2022-07-25');


