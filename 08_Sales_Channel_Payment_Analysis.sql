use sales_analysis;
USE sales_analysis;

SELECT
    sales_channel,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(cost), 2) AS total_cost,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) * 100.0 / SUM(revenue),
        2
    ) AS profit_margin
FROM sales_data_cleann
GROUP BY sales_channel
ORDER BY total_revenue DESC;
SELECT
    sales_channel,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(
        SUM(revenue) * 100.0 /
        (SELECT SUM(revenue)
         FROM sales_data_clean),
        2
    ) AS revenue_contribution_percent
FROM sales_data_cleann
GROUP BY sales_channel
ORDER BY total_revenue DESC;
SELECT
    sales_channel,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) * 100.0 /
        (SELECT SUM(profit)
         FROM sales_data_clean),
        2
    ) AS profit_contribution_percent
FROM sales_data_cleann
GROUP BY sales_channel
ORDER BY total_profit DESC;
SELECT
    YEAR(order_date) AS sales_year,
    sales_channel,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) * 100.0 / SUM(revenue),
        2
    ) AS profit_margin
FROM sales_data_cleann
GROUP BY
    YEAR(order_date),
    sales_channel
ORDER BY
    sales_year,
    total_revenue DESC;
    SELECT
    payment_method,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) * 100.0 / SUM(revenue),
        2
    ) AS profit_margin
FROM sales_data_cleann
GROUP BY payment_method
ORDER BY total_revenue DESC;
SELECT
    payment_method,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(
        SUM(revenue) * 100.0 /
        (SELECT SUM(revenue)
         FROM sales_data_clean),
        2
    ) AS revenue_contribution_percent
FROM sales_data_cleann
GROUP BY payment_method
ORDER BY total_revenue DESC;
SELECT
    sales_channel,
    customer_segment,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data_cleann
GROUP BY
    sales_channel,
    customer_segment
ORDER BY total_revenue DESC;
SELECT
    region,
    sales_channel,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data_cleann
GROUP BY
    region,
    sales_channel
ORDER BY
    region,
    total_revenue DESC;
    WITH regional_channels AS (
    SELECT
        region,
        sales_channel,
        ROUND(SUM(revenue), 2) AS total_revenue
    FROM sales_data_cleann
    GROUP BY
        region,
        sales_channel
),

ranked_channels AS (
    SELECT
        region,
        sales_channel,
        total_revenue,
        RANK() OVER (
            PARTITION BY region
            ORDER BY total_revenue DESC
        ) AS channel_rank
    FROM regional_channels
)

SELECT
    region,
    sales_channel,
    total_revenue
FROM ranked_channels
WHERE channel_rank = 1
ORDER BY region;

    
    