CREATE DATABASE sales_analysis;
USE sales_analysis;
SELECT DATABASE();
SELECT COUNT(*) AS total_records
FROM sales_data;
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS unique_orders
FROM sales_data;
SELECT 
    order_id,
    COUNT(*) AS number_of_records
FROM sales_data
GROUP BY order_id
HAVING COUNT(*) > 1
LIMIT 20;
SELECT COUNT(*) AS total_rows
FROM sales_data;
SELECT COUNT(DISTINCT order_id) AS unique_orders
FROM sales_data;
SELECT 
    order_id,
    COUNT(*) AS occurrences
FROM sales_data
GROUP BY order_id
HAVING COUNT(*) > 1
LIMIT 10;
CREATE TABLE sales_data_backup AS
SELECT *
FROM sales_data;
SELECT COUNT(*) AS backup_rows
FROM sales_data_backup;
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS unique_orders
FROM sales_data;
SELECT
    order_id,
    COUNT(*) AS occurrences
FROM sales_data
GROUP BY order_id
HAVING COUNT(*) > 1
LIMIT 10;
CREATE TABLE sales_data_clean AS
SELECT *
FROM sales_data
WHERE 1 = 0;
CREATE TABLE sales_data_cleann AS
SELECT *
FROM sales_data
WHERE 1 = 0;
INSERT INTO sales_data_cleann
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY order_id
               ORDER BY order_id
           ) AS row_num
    FROM sales_data
) AS duplicates
WHERE row_num = 1;
DROP TABLE IF EXISTS sales_data_cleann;
CREATE TABLE sales_data_cleann AS
SELECT *
FROM sales_data
WHERE 1 = 0;
INSERT INTO sales_data_cleann (
    order_id,
    order_date,
    region,
    sales_channel,
    customer_segment,
    category,
    product,
    quantity,
    unit_price,
    discount_percent,
    revenue,
    cost,
    profit,
    profit_margin_percent,
    payment_method,
    salesperson
)
SELECT
    order_id,
    order_date,
    region,
    sales_channel,
    customer_segment,
    category,
    product,
    quantity,
    unit_price,
    discount_percent,
    revenue,
    cost,
    profit,
    profit_margin_percent,
    payment_method,
    salesperson
FROM (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY order_id
            ORDER BY order_id
        ) AS row_num
    FROM sales_data
) AS duplicates
WHERE row_num = 1;
SELECT COUNT(*) AS clean_records
FROM sales_data_cleann;
SELECT
    order_id,
    COUNT(*) AS occurrences
FROM sales_data_cleann
GROUP BY order_id
HAVING COUNT(*) > 1;
SELECT COUNT(*) AS clean_records
FROM sales_data_cleann;
SELECT COUNT(DISTINCT order_id) AS unique_orders
FROM sales_data_cleann;
SELECT *
FROM sales_data_cleann
LIMIT 10;
DESCRIBE sales_data_cleann;
SELECT
    order_id,
    COUNT(*) AS occurrences
FROM sales_data_cleann
GROUP BY order_id
HAVING COUNT(*) > 1;
SELECT
    COUNT(*) AS total_rows,
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(order_date IS NULL) AS missing_order_date,
    SUM(region IS NULL) AS missing_region,
    SUM(sales_channel IS NULL) AS missing_sales_channel,
    SUM(customer_segment IS NULL) AS missing_customer_segment,
    SUM(category IS NULL) AS missing_category,
    SUM(product IS NULL) AS missing_product,
    SUM(quantity IS NULL) AS missing_quantity,
    SUM(unit_price IS NULL) AS missing_unit_price,
    SUM(discount_percent IS NULL) AS missing_discount,
    SUM(revenue IS NULL) AS missing_revenue,
    SUM(cost IS NULL) AS missing_cost,
    SUM(profit IS NULL) AS missing_profit
FROM sales_data_cleann;
SELECT *
FROM sales_data_cleann
WHERE quantity <= 0;
SELECT *
FROM sales_data_cleann
WHERE unit_price <= 0;
SELECT *
FROM sales_data_cleann
WHERE discount_percent < 0
   OR discount_percent > 100;
   SELECT *
FROM sales_data_cleann
WHERE discount_percent < 0
   OR discount_percent > 100;
   SELECT *
FROM sales_data_cleann
WHERE revenue <= 0;
SELECT *
FROM sales_data_cleann
WHERE cost < 0;
CREATE TABLE sales_data_backupp AS
SELECT *
FROM sales_data;CREATE TABLE sales_data_backupp AS
SELECT *
FROM sales_data;
CREATE TABLE sales_data_cleann AS
SELECT *
FROM sales_data
WHERE 1 = 0;
INSERT INTO sales_data_clean
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY order_id
               ORDER BY order_id
           ) AS row_num
    FROM sales_data
) AS duplicates
WHERE row_num = 1;
SELECT
    COUNT(*) AS total_rows,
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(order_date IS NULL) AS missing_order_date,
    SUM(region IS NULL) AS missing_region,
    SUM(sales_channel IS NULL) AS missing_sales_channel,
    SUM(customer_segment IS NULL) AS missing_customer_segment,
    SUM(category IS NULL) AS missing_category,
    SUM(product IS NULL) AS missing_product,
    SUM(quantity IS NULL) AS missing_quantity,
    SUM(unit_price IS NULL) AS missing_unit_price,
    SUM(discount_percent IS NULL) AS missing_discount,
    SUM(revenue IS NULL) AS missing_revenue,
    SUM(cost IS NULL) AS missing_cost,
    SUM(profit IS NULL) AS missing_profit,
    SUM(payment_method IS NULL) AS missing_payment_method,
    SUM(salesperson IS NULL) AS missing_salesperson
FROM sales_data_cleann;
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS unique_orders
FROM sales_data_cleann;
SELECT
    order_id,
    COUNT(*) AS occurrences
FROM sales_data_cleann
GROUP BY order_id
HAVING COUNT(*) > 1;
SELECT
    COUNT(*) AS invalid_quantity
FROM sales_data_cleann
WHERE quantity <= 0;
SELECT
    MIN(quantity) AS minimum_quantity,
    MAX(quantity) AS maximum_quantity,
    AVG(quantity) AS average_quantity
FROM sales_data_cleann;
SELECT
    COUNT(*) AS invalid_prices
FROM sales_data_cleann
WHERE unit_price <= 0;
SELECT
    MIN(unit_price) AS minimum_price,
    MAX(unit_price) AS maximum_price,
    ROUND(AVG(unit_price), 2) AS average_price
FROM sales_data_cleann;
SELECT
    COUNT(*) AS invalid_discounts
FROM sales_data_cleann
WHERE discount_percent < 0
   OR discount_percent > 100;
   SELECT
    MIN(discount_percent) AS minimum_discount,
    MAX(discount_percent) AS maximum_discount,
    ROUND(AVG(discount_percent), 2) AS average_discount
FROM sales_data_cleann;
SELECT
    COUNT(*) AS invalid_revenue
FROM sales_data_cleann
WHERE revenue <= 0;
SELECT
    ROUND(MIN(revenue), 2) AS minimum_revenue,
    ROUND(MAX(revenue), 2) AS maximum_revenue,
    ROUND(AVG(revenue), 2) AS average_revenue
FROM sales_data_cleann;
SELECT
    COUNT(*) AS invalid_cost
FROM sales_data_cleann
WHERE cost < 0;
SELECT
    ROUND(MIN(cost), 2) AS minimum_cost,
    ROUND(MAX(cost), 2) AS maximum_cost,
    ROUND(AVG(cost), 2) AS average_cost
FROM sales_data_cleann;
SELECT
    COUNT(*) AS invalid_profit
FROM sales_data_cleann
WHERE profit IS NULL;
SELECT
    COUNT(*) AS loss_making_orders
FROM sales_data_cleann
WHERE profit < 0;
SELECT
    order_id,
    quantity,
    unit_price,
    discount_percent,
    revenue,
    ROUND(
        quantity * unit_price *
        (1 - discount_percent / 100),
        2
    ) AS calculated_revenue
FROM sales_data_cleann
LIMIT 20;
SELECT
    COUNT(*) AS revenue_errors
FROM sales_data_cleann
WHERE ABS(
    revenue -
    (
        quantity * unit_price *
        (1 - discount_percent / 100)
    )
) > 0.01;
SELECT
    COUNT(*) AS profit_errors
FROM sales_data_cleann
WHERE ABS(profit - (revenue - cost)) > 0.01;
SELECT
    COUNT(*) AS margin_errors
FROM sales_data_cleann
WHERE ABS(
    profit_margin_percent -
    (profit / revenue * 100)
) > 0.01;
SELECT DISTINCT region
FROM sales_data_cleann
ORDER BY region;
SELECT DISTINCT category
FROM sales_data_cleann
ORDER BY category;
SELECT DISTINCT sales_channel
FROM sales_data_cleann
ORDER BY sales_channel;
SELECT DISTINCT customer_segment
FROM sales_data_cleann
ORDER BY customer_segment;
SELECT DISTINCT payment_method
FROM sales_data_cleann
ORDER BY payment_method;
SELECT
    MIN(order_date) AS first_order,
    MAX(order_date) AS last_order
FROM sales_data_cleann;
SELECT
    YEAR(order_date) AS year,
    COUNT(*) AS orders
FROM sales_data_cleann
GROUP BY YEAR(order_date)
ORDER BY year;
SELECT
    COUNT(*) AS total_rows,
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(order_date IS NULL) AS missing_order_date,
    SUM(revenue IS NULL) AS missing_revenue,
    SUM(profit IS NULL) AS missing_profit
FROM sales_data_cleann;
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS unique_orders
FROM sales_data_cleann;
SELECT
    COUNT(*) AS revenue_errors
FROM sales_data_cleann
WHERE ABS(
    revenue -
    (
        quantity * unit_price *
        (1 - discount_percent / 100)
    )
) > 0.01;
SELECT
    COUNT(*) AS profit_errors
FROM sales_data_cleann
WHERE ABS(profit - (revenue - cost)) > 0.01;
SELECT
    MIN(order_date) AS first_order,
    MAX(order_date) AS last_order
FROM sales_data_cleann;
USE sales_analysis;
SELECT COUNT(*) AS total_records
FROM sales_data_cleann;
SELECT
    ROUND(SUM(revenue), 2) AS total_revenue
FROM sales_data_cleann;
SELECT
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data_cleann;
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM sales_data_cleann;
SELECT
    SUM(quantity) AS total_units_sold
FROM sales_data_cleann;
SELECT
    ROUND(
        SUM(revenue) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM sales_data_cleann;
SELECT
    ROUND(
        SUM(profit) / COUNT(DISTINCT order_id),
        2
    ) AS average_profit_per_order
FROM sales_data_cleann;
SELECT
    ROUND(
        SUM(profit) / SUM(revenue) * 100,
        2
    ) AS overall_profit_margin
FROM sales_data_cleann;
SELECT
    ROUND(AVG(discount_percent), 2) AS average_discount
FROM sales_data_cleann;
SELECT
    ROUND(
        SUM(quantity) / COUNT(DISTINCT order_id),
        2
    ) AS average_units_per_order
FROM sales_data_cleann;
SELECT
    ROUND(
        SUM(revenue) / SUM(quantity),
        2
    ) AS revenue_per_unit
FROM sales_data_cleann;
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(cost), 2) AS total_cost,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(revenue) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value,
    ROUND(
        SUM(profit) / COUNT(DISTINCT order_id),
        2
    ) AS average_profit_per_order,
    ROUND(
        SUM(profit) / SUM(revenue) * 100,
        2
    ) AS profit_margin,
    ROUND(AVG(discount_percent), 2) AS average_discount,
    ROUND(
        SUM(quantity) / COUNT(DISTINCT order_id),
        2
    ) AS average_units_per_order
FROM sales_data_cleann;
-- =========================================================
-- Sales Performance Analysis
-- KPI Analysis
-- Author: Daniel Olasunkanmi Abey
-- Tool: MySQL
-- Dataset: 10,000 Sales Transactions
-- =========================================================

USE sales_analysis;

-- Overall Business KPIs

SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(cost), 2) AS total_cost,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(revenue) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value,
    ROUND(
        SUM(profit) / COUNT(DISTINCT order_id),
        2
    ) AS average_profit_per_order,
    ROUND(
        SUM(profit) / SUM(revenue) * 100,
        2
    ) AS profit_margin,
    ROUND(AVG(discount_percent), 2) AS average_discount,
    ROUND(
        SUM(quantity) / COUNT(DISTINCT order_id),
        2
    ) AS average_units_per_order
FROM sales_data_cleann;
USE sales_analysis;
USE sales_data_clean;
SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM sales_data_cleanN;
SELECT
    YEAR(order_date) AS sales_year,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(revenue) * 100,
        2
    ) AS profit_margin
FROM sales_data_cleann
GROUP BY YEAR(order_date)
ORDER BY sales_year;