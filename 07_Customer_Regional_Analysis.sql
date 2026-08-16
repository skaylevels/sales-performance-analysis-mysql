USE sales_analysis;
SELECT
    region,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) * 100.0 / SUM(revenue),
        2
    ) AS profit_margin
FROM sales_data_cleann
GROUP BY region
ORDER BY total_revenue DESC;
SELECT
    region,
    ROUND(SUM(revenue), 2) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(revenue) DESC
    ) AS revenue_rank
FROM sales_data_cleann
GROUP BY region
ORDER BY revenue_rank;
SELECT
    region,
    ROUND(SUM(revenue), 2) AS regional_revenue,
    ROUND(
        SUM(revenue) * 100.0 /
        (SELECT SUM(revenue)
         FROM sales_data_clean),
        2
    ) AS revenue_contribution_percent
FROM sales_data_cleann
GROUP BY region
ORDER BY regional_revenue DESC;
SELECT
    customer_segment,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) * 100.0 / SUM(revenue),
        2
    ) AS profit_margin
FROM sales_data_cleann
GROUP BY customer_segment
ORDER BY total_revenue DESC;
SELECT
    customer_segment,
    ROUND(SUM(revenue), 2) AS segment_revenue,
    ROUND(
        SUM(revenue) * 100.0 /
        (SELECT SUM(revenue)
         FROM sales_data_clean),
        2
    ) AS revenue_contribution_percent
FROM sales_data_cleann
GROUP BY customer_segment
ORDER BY segment_revenue DESC;
SELECT
    customer_segment,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) * 100.0 / SUM(revenue),
        2
    ) AS profit_margin
FROM sales_data_cleann
GROUP BY customer_segment
ORDER BY total_profit DESC;
SELECT
    region,
    customer_segment,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data_cleann
GROUP BY
    region,
    customer_segment
ORDER BY total_revenue DESC;
WITH regional_segments AS (
    SELECT
        region,
        customer_segment,
        ROUND(SUM(revenue), 2) AS total_revenue
    FROM sales_data_cleann
    GROUP BY
        region,
        customer_segment
),

ranked_segments AS (
    SELECT
        region,
        customer_segment,
        total_revenue,
        RANK() OVER (
            PARTITION BY region
            ORDER BY total_revenue DESC
        ) AS segment_rank
    FROM regional_segments
)

SELECT
    region,
    customer_segment,
    total_revenue
FROM ranked_segments
WHERE segment_rank = 1
ORDER BY region;
SELECT
    sales_channel,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) * 100.0 / SUM(revenue),
        2
    ) AS profit_margin
FROM sales_data_cleann
GROUP BY sales_channel
ORDER BY total_revenue DESC;
SELECT
    payment_method,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data_cleann
GROUP BY payment_method
ORDER BY total_revenue DESC;