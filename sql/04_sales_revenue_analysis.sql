-- Sales Revenue SQL Analysis
-- Reporting and business analysis queries

USE sales_revenue;

-- 1. View all customer records
SELECT *
FROM customers;

-- 2. View products from highest to lowest price
SELECT *
FROM products
ORDER BY price DESC;

-- 3. View completed orders
SELECT *
FROM orders
WHERE order_status = 'Completed';

-- 4. Identify orders that are pending or cancelled
SELECT *
FROM orders
WHERE order_status = 'PENDING'
   OR order_status = 'CANCELLED';

-- 5. Count customers by customer type
SELECT
    customer_type,
    COUNT(*) AS customer_total
FROM customers
GROUP BY customer_type;

-- 6. Count orders by customer state
SELECT
    c.state,
    COUNT(o.order_id) AS order_total
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.state
ORDER BY order_total DESC;

-- 7. Count total quantities ordered by customer
SELECT
    c.first_name,
    c.last_name,
    SUM(o.quantity) AS order_total
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY order_total DESC;

-- 8. Calculate revenue by product based on quantity ordered
SELECT
    p.product_name,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- 9. Calculate product revenue using price and payment amount
SELECT
    p.product_name,
    p.price,
    SUM(p.price * pay.payment_amount) AS total_revenue
FROM products p
JOIN orders o
    ON p.product_id = o.product_id
JOIN payments pay
    ON o.order_id = pay.order_id
GROUP BY p.product_name, p.price
ORDER BY total_revenue DESC;

-- 10. Count products by category
SELECT
    category,
    COUNT(*) AS product_total
FROM products
GROUP BY category;

-- 11. Calculate average product price by category
SELECT
    category,
    AVG(price) AS average_price
FROM products
GROUP BY category;

-- 12. Count orders by order status
SELECT
    order_status,
    COUNT(order_id) AS status_total
FROM orders
GROUP BY order_status
ORDER BY status_total DESC;

-- 13. Calculate total quantity ordered by product
SELECT
    p.product_name,
    p.product_id,
    SUM(o.quantity) AS total_products
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product_name, p.product_id
ORDER BY total_products DESC;

-- 14. Rank orders by quantity
SELECT
    order_id,
    quantity
FROM orders
ORDER BY quantity DESC;

-- 15. Count payments by payment status
SELECT
    payment_status,
    COUNT(*) AS status_total
FROM payments
GROUP BY payment_status;

-- 16. Calculate total paid revenue
SELECT
    payment_status,
    SUM(payment_amount) AS total_revenue
FROM payments
WHERE payment_status = 'Paid'
GROUP BY payment_status;

-- 17. Calculate total refunded amount
SELECT
    payment_status,
    SUM(payment_amount) AS refund_total
FROM payments
WHERE payment_status = 'Refund'
GROUP BY payment_status;

-- 18. Identify incomplete-payment or pending-order records
SELECT
    p.payment_status,
    o.order_status,
    o.order_id
FROM orders o
LEFT JOIN payments p
    ON o.order_id = p.order_id
WHERE p.payment_status = 'Incomplete'
   OR o.order_status = 'PENDING';

-- 19. Calculate revenue by product category excluding refunds
SELECT
    p.category,
    SUM(
        CASE
            WHEN pay.payment_status = 'Refund' THEN 0
            ELSE pay.payment_amount
        END
    ) AS total_revenue
FROM products p
JOIN orders o
    ON o.product_id = p.product_id
JOIN payments pay
    ON o.order_id = pay.order_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- 20. Calculate total paid spending by customer
SELECT
    c.first_name,
    c.last_name,
    SUM(p.payment_amount) AS spending_total
FROM payments p
JOIN orders o
    ON p.order_id = o.order_id
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE p.payment_status = 'Paid'
GROUP BY c.first_name, c.last_name
ORDER BY spending_total DESC;

-- 21. Classify orders by quantity
SELECT
    order_id,
    quantity,
    CASE
        WHEN quantity > 5 THEN 'Large Order'
        WHEN quantity BETWEEN 3 AND 5 THEN 'Medium Order'
        WHEN quantity < 3 THEN 'Small Order'
    END AS order_size
FROM orders;
