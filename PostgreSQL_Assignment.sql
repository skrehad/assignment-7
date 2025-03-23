-- Active: 1742584543688@@127.0.0.1@5432@bookstore_db@public

-- Create books table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) CHECK (price >= 0),
    stock INT NOT NULL,
    published_year INT NOT NULL
);


-- Create customers table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);


-- Create orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    book_id INT REFERENCES books(id) ON DELETE CASCADE,
    quantity INT CHECK (quantity > 0),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Insert data into books table
INSERT INTO books (title, author, price, stock, published_year) VALUES
('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
('Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
('You Do not Know JS', 'Kyle Simpson', 30.00, 8, 2014),
('Refactoring', 'Martin Fowler', 50.00, 3, 1999),
('Database Design Principles', 'Jane Smith', 20.00, 0, 2018);

-- SELECT * FROM books




-- Insert  data into customers table
INSERT INTO customers (name, email, joined_date) VALUES
('Alice', 'alice@email.com', '2023-01-10'),
('Bob', 'bob@email.com', '2022-05-15'),
('Charlie', 'charlie@email.com', '2023-06-20');

-- SELECT * FROM customers



-- Insert sample data into orders table
INSERT INTO orders (customer_id, book_id, quantity, order_date) VALUES
(1, 2, 1, '2024-03-10'),
(2, 1, 1, '2024-02-20'),
(1, 3, 2, '2024-03-05');

-- SELECT * FROM orders



           --      *** PostgreSQL Problems & Sample Outputs ***

-- 1. Find books that are out of stock
SELECT title FROM books WHERE stock = 0;


-- 2. Retrieve the most expensive book
SELECT * FROM books ORDER BY price DESC LIMIT 1;


-- 3. Find the total number of orders placed by each customer
SELECT customers.name, COUNT(orders.id) AS total_orders
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name;


-- 4. Calculate the total revenue generated from book sales
SELECT SUM(books.price * orders.quantity) AS total_revenue
FROM orders
JOIN books ON orders.book_id = books.id;


-- 5. List all customers who have placed more than one order
SELECT customers.name, COUNT(orders.id) AS orders_count
FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name
HAVING COUNT(orders.id) > 1;


-- 6. Find the average price of books in the store
SELECT AVG(price) AS avg_book_price FROM books;


-- 7. Increase the price of all books published before 2000 by 10%
UPDATE books SET price = price * 1.10 WHERE published_year < 2000;
SELECT * FROM books


-- 8. Delete customers who haven't placed any orders
DELETE FROM customers WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders);
SELECT * FROM customers

