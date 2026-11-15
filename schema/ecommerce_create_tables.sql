-- E-Commerce Sales Analysis: schema (MySQL 8)
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  customer_id   INT PRIMARY KEY AUTO_INCREMENT,
  customer_name VARCHAR(100) NOT NULL,
  email         VARCHAR(120) UNIQUE,
  city          VARCHAR(50),
  state         VARCHAR(50),
  segment       VARCHAR(30),
  signup_date   DATE
);

CREATE TABLE products (
  product_id   INT PRIMARY KEY AUTO_INCREMENT,
  product_name VARCHAR(120) NOT NULL,
  category     VARCHAR(50),
  unit_price   DECIMAL(10,2) NOT NULL,
  unit_cost    DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders (
  order_id       INT PRIMARY KEY AUTO_INCREMENT,
  customer_id    INT NOT NULL,
  order_date     DATE NOT NULL,
  status         VARCHAR(20),
  payment_method VARCHAR(30),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  item_id      INT PRIMARY KEY AUTO_INCREMENT,
  order_id     INT NOT NULL,
  product_id   INT NOT NULL,
  quantity     INT NOT NULL,
  discount_pct INT DEFAULT 0,
  FOREIGN KEY (order_id)   REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);