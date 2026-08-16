use sales_analysis;
SELECT
    customer_segment,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(
        SUM(revenue) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data_cleann
GROUP BY customer_segment
ORDER BY average_order_value DESC;
SELECT
    customer_segment,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / COUNT(DISTINCT order_id),
        2
    ) AS profit_per_order
FROM sales_data_cleann
GROUP BY customer_segment
ORDER BY profit_per_order DESC;
SELECT
    CASE
        WHEN discount_percent = 0 THEN 'No Discount'
        WHEN discount_percent <= 5 THEN '1-5%'
        WHEN discount_percent <= 10 THEN '6-10%'
        WHEN discount_percent <= 15 THEN '11-15%'
        WHEN discount_percent <= 20 THEN '16-20%'
        ELSE '20%+'
    END AS discount_band,

    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(discount_percent), 2) AS average_discount,
    ROUND(
        SUM(profit) * 100.0 / SUM(revenue),
        2
    ) AS profit_margin

FROM sales_data_cleann

GROUP BY
    CASE
        WHEN discount_percent = 0 THEN 'No Discount'
        WHEN discount_percent <= 5 THEN '1-5%'
        WHEN discount_percent <= 10 THEN '6-10%'
        WHEN discount_percent <= 15 THEN '11-15%'
        WHEN discount_percent <= 20 THEN '16-20%'
        ELSE '20%+'
    END

ORDER BY average_discount;
SELECT
    discount_percent,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) * 100.0 / SUM(revenue),
        2
    ) AS profit_margin
FROM sales_data_cleann
GROUP BY discount_percent
ORDER BY discount_percent;
SELECT
    order_id,
    product,
    category,
    discount_percent,
    ROUND(revenue, 2) AS revenue,
    ROUND(profit, 2) AS profit
FROM sales_data_cleann
WHERE discount_percent >= 20
ORDER BY discount_percent DESC;
SELECT
    customer_segment,

    CASE
        WHEN discount_percent = 0 THEN 'No Discount'
        WHEN discount_percent <= 5 THEN '1-5%'
        WHEN discount_percent <= 10 THEN '6-10%'
        WHEN discount_percent <= 15 THEN '11-15%'
        WHEN discount_percent <= 20 THEN '16-20%'
        ELSE '20%+'
    END AS discount_band,

    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit

FROM sales_data_cleann

GROUP BY
    customer_segment,
    CASE
        WHEN discount_percent = 0 THEN 'No Discount'
        WHEN discount_percent <= 5 THEN '1-5%'
        WHEN discount_percent <= 10 THEN '6-10%'
        WHEN discount_percent <= 15 THEN '11-15%'
        WHEN discount_percent <= 20 THEN '16-20%'
        ELSE '20%+'
    END

ORDER BY customer_segment, total_revenue DESC;
SELECT
    customer_segment,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_sold,

    ROUND(SUM(revenue), 2) AS total_revenue,

    ROUND(SUM(profit), 2) AS total_profit,

    ROUND(
        SUM(revenue) /
        COUNT(DISTINCT order_id),
        2
    ) AS average_order_value,

    ROUND(
        SUM(profit) /
        COUNT(DISTINCT order_id),
        2
    ) AS profit_per_order,

    ROUND(
        SUM(profit) * 100.0 /
        SUM(revenue),
        2
    ) AS profit_margin

FROM sales_data_cleann

GROUP BY customer_segment

ORDER BY total_profit DESC;
SELECT
    customer_segment,
    product,
    category,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data_cleann
GROUP BY
    customer_segment,
    product,
    category
ORDER BY total_profit DESC
LIMIT 20;
SELECT
    customer_segment,
    category,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) * 100.0 /
        SUM(revenue),
        2
    ) AS profit_margin
FROM sales_data_cleann
GROUP BY
    customer_segment,
    category
ORDER BY total_revenue DESC;
