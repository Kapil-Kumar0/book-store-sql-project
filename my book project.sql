create database skill;
use skill;
select * from books;
select * from customers;
select * from orders;

SELECT DISTINCT
    (customer_id)
FROM
    orders;
select genre,round(sum(price),2)as total_sum from books 
group by genre order by total_sum desc;
drop table orders;
create table orders(order_id int,customer_id int,book_id int,order_date date
,quantity int,total_amount float);
select * from orders;
select * from customers;
select * from books;


-- reterive all books in the "fiction" genre
SELECT 
    *
FROM
    books
WHERE
    genre = 'fiction';
    
    
    
-- 2) Find books published after the year 1950:

SELECT 
    YEAR(order_date) year, SUM(total_amount) AS total_year_sum
FROM
    orders
GROUP BY year;


select * from orders join customers on orders.customer_id=customers.customer_id
join  books on orders.book_id=books.book_id;



-- 2) Find books published after the year 1950:


SELECT 
    *
FROM
    books
WHERE
    published_year > 1950;
    
    
-- 3) List all customers from the Canada:


SELECT 
    *
FROM
    customers
WHERE
    country = 'canada';
    
    
-- 4) Show orders placed in November 2023:

SELECT 
    *
FROM
    orders;
SELECT 
    *
FROM
    orders
WHERE
    order_date BETWEEN '2023-11-01' AND '2023-11-30';
    
    
-- 5) Retrieve the total stock of books available:

SELECT 
    *
FROM
    books;
SELECT 
    SUM(stock) AS total_stock
FROM
    books;
    
    
-- 6) Find the details of the most expensive book

SELECT 
    *
FROM
    books
ORDER BY price DESC
LIMIT 1;


-- 7) Show all customers who ordered more than 1 quantity of a book:

SELECT 
    *
FROM
    orders
WHERE
    quantity > 1;
    
    
-- 8) Retrieve all orders where the total amount exceeds $20:

SELECT 
    *
FROM
    orders
WHERE
    total_amount > 20;
    
    
-- 9) List all genres available in the Books table:

select distinct(genre) from books;


-- 10) Find the book with the lowest stock:

select * from books order by stock asc limit 1;


-- 11) Calculate the total revenue generated from all orders:

select sum(total_amount) as total_amount from orders;


-- 12) Retrieve the total number of books sold for each genre:

SELECT 
    b.genre, SUM(o.quantity) AS total_quantity
FROM
    books b
        JOIN
    orders o ON b.book_id = o.book_id
GROUP BY genre;


-- 13) Find the average price of books in the "Fantasy" genre:

SELECT 
    AVG(price) AS avg_price
FROM
    books
WHERE
    genre = 'fantasy';
    
    
-- 14) List customers who have placed at least 2 orders:

SELECT 
    o.customer_id, c.name, COUNT(o.order_id) AS order_count
FROM
    orders o
join customers c on o.customer_id=c.customer_id
group by o.customer_id,c.name having order_count>=2;


-- 4) Find the most frequently ordered book:

SELECT 
    o.book_id, b.title, COUNT(o.order_id) AS count_order
FROM
    orders o
        JOIN
    books b ON o.book_id = b.book_id
GROUP BY o.book_id , b.title
ORDER BY count_order DESC
LIMIT 1;


-- 16) Show the top 3 most expensive books of 'Fantasy' Genre :

SELECT 
    *
FROM
    books
WHERE
    genre = 'fantasy'
ORDER BY price DESC
LIMIT 3;


-- 17) Retrieve the total quantity of books sold by each author:

SELECT 
    b.author, SUM(o.quantity) AS total_quantity
FROM
    books b
        JOIN
    orders o ON o.book_id = b.book_id
GROUP BY b.author
ORDER BY total_quantity DESC;


-- 18) List the cities where customers who spent over $30 are located:

SELECT 
    c.city, o.total_amount
FROM
    customers c
        JOIN
    orders o ON o.customer_id = c.customer_id
WHERE
    o.total_amount > 30
ORDER BY total_amount DESC;


-- 8) Find the customer who spent the most on orders:

SELECT 
    c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM
    orders o
        JOIN
    customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id , c.name
ORDER BY Total_spent DESC
LIMIT 1;









