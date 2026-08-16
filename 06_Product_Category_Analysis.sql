USE sales_analysis;
-- =========================================================
-- Sales Performance Analysis
-- Stage 5: Product & Category Analysis
-- Author: Daniel Olasunkanmi Abey
-- Tool: MySQL Workbench
-- =========================================================
SELECT
    category,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(revenue) * 100,
        2
    ) AS profit_margin
FROM sales_data_cleann
GROUP BY category
ORDER BY total_revenue DESC;
SELECT
    category,
    ROUND(SUM(revenue), 2) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(revenue) DESC
    ) AS revenue_rank
FROM sales_data_cleanN
GROUP BY category
ORDER BY revenue_rank;
SELECT
    category,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(cost), 2) AS total_cost,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(revenue) * 100,
        2
    ) AS profit_margin
FROM sales_data_cleanN
GROUP BY category
ORDER BY total_profit DESC;
SELECT
    product,
    category,
    SUM(quantity) AS units_sold,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(revenue) * 100,
        2
    ) AS profit_margin
FROM sales_data_cleanN
GROUP BY
    product,
    category
ORDER BY total_revenue DESC
LIMIT 10;
SELECT
    product,
    category,
    SUM(quantity) AS units_sold,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(revenue) * 100,
        2
    ) AS profit_margin
FROM sales_data_cleanN
GROUP BY
    product,
    category
ORDER BY total_revenue ASC
LIMIT 10;
SELECT
    product,
    category,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(revenue) * 100,
        2
    ) AS profit_margin
FROM sales_data_cleanN
GROUP BY
    product,
    category
ORDER BY total_profit DESC
LIMIT 10;
SELECT
    product,
    category,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(revenue) * 100,
        2
    ) AS profit_margin
FROM sales_data_cleanN
GROUP BY
    product,
    category
HAVING SUM(revenue) > 0
ORDER BY profit_margin DESC
LIMIT 10;
SELECT
    product,
    category,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(revenue) * 100,
        2
    ) AS profit_margin
FROM sales_data_cleanN
GROUP BY
    product,
    category
HAVING SUM(revenue) > 500000
ORDER BY profit_margin ASC;
SELECT
    product,
    category,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(revenue) * 100,
        2
    ) AS profit_margin
FROM sales_data_cleann
GROUP BY
    product,
    category
HAVING SUM(revenue) < 500000
ORDER BY profit_margin DESC;
SELECT
    product,
    category,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data_cleann
GROUP BY
    product,
    category
ORDER BY units_sold DESC
LIMIT 10;
SELECT
    product,
    category,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(revenue) * 100,
        2
    ) AS profit_margin
FROM sales_data_cleann
GROUP BY
    product,
    category
ORDER BY units_sold DESC
LIMIT 10;
SELECT
    category,
    ROUND(SUM(revenue), 2) AS category_revenue,
    ROUND(
        SUM(revenue) /
        (SELECT SUM(revenue) FROM sales_data_clean) * 100,
        2
    ) AS revenue_contribution_percent
FROM sales_data_cleann
GROUP BY category
ORDER BY category_revenue DESC;
SELECT
    category,
    ROUND(SUM(profit), 2) AS category_profit,
    ROUND(
        SUM(profit) /
        (SELECT SUM(profit) FROM sales_data_clean) * 100,
        2
    ) AS profit_contribution_percent
FROM sales_data_cleann
GROUP BY category
ORDER BY category_profit DESC;
