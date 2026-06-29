-- Inserts sample data into the Sales Revenue SQL Analysis database.
USE sales_revenue;

INSERT INTO customers (
    customer_id,
    first_name,
    last_name,
    city,
    state,
    customer_type
)
VALUES
    (1, 'SAM', 'SMITH', 'TEXAS CITY', 'TX', 'RETAIL'),
    (2, 'KEITH', 'JOHN', 'HOUSTON', 'TX', 'ONLINE'),
    (3, 'RIVER', 'NORTH', 'CHICAGO', 'IL', 'WHOLESALE'),
    (4, 'ADAM', 'LOVE', 'BELIOT', 'WI', 'BUSINESS'),
    (5, 'SAMANTHA', 'CLARK', 'MIAMI', 'FL', 'ONLINE'),
    (6, 'AMY', 'DOVE', 'NEW YORK', 'NY', 'VIP'),
    (7, 'TAYLOR', 'DAVIS', 'ATLANTA', 'GA', 'VIP'),
    (8, 'ROSE', 'LEE', 'SMYRNA', 'GA', 'RETAIL');

INSERT INTO products (
    product_id,
    product_name,
    category,
    price
)
VALUES
    (20, 'Wireless Mouse', 'Electronics', 13.00),
    (21, 'Office Chair', 'Furniture', 200.00),
    (22, 'HP Laptop', 'Electronics', 500.00),
    (23, 'Laptop Stand', 'Accessories', 13.00),
    (24, 'Set of 10 Notepads', 'Office Supplies', 31.00),
    (25, 'Electric Powered Desk', 'Furniture', 321.00);

INSERT INTO orders (
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    order_status
)
VALUES
    (11, 1, 20, '2026-05-11', 5, 'Completed'),
    (12, 3, 21, '2026-05-11', 4, 'PENDING'),
    (13, 2, 25, '2026-05-10', 1, 'CANCELLED'),
    (14, 4, 22, '2026-05-09', 2, 'REFUNDED'),
    (15, 8, 23, '2026-05-08', 3, 'SHIPPED'),
    (16, 7, 23, '2026-05-06', 4, 'PROCESSING'),
    (17, 5, 22, '2026-05-07', 10, 'Completed'),
    (18, 6, 20, '2026-05-08', 6, 'SHIPPED'),
    (19, 5, 24, '2026-05-01', 3, 'PROCESSING'),
    (20, 4, 24, '2026-05-01', 1, 'PENDING');

INSERT INTO payments (
    payment_id,
    order_id,
    payment_date,
    payment_amount,
    payment_status
)
VALUES
    (101, 11, '2026-05-12', 156.00, 'Paid'),
    (102, 12, '2026-05-13', 400.00, 'Incomplete'),
    (103, 13, '2026-05-14', 321.00, 'Cancelled'),
    (104, 14, '2026-05-10', 1000.00, 'Refund'),
    (105, 15, '2026-05-18', 39.00, 'Paid'),
    (106, 16, '2026-05-29', 52.00, 'Paid'),
    (107, 17, '2026-05-15', 5000.00, 'Paid'),
    (108, 18, '2026-05-18', 78.00, 'Paid'),
    (109, 19, '2026-05-19', 93.00, 'Paid'),
    (110, 20, '2026-05-24', 0.00, 'Incomplete');
