-- agg_product_performance.sql
-- Product-level performance with revenue rank inside each category

WITH product_totals AS (
    SELECT
        PRODUCT_SK,
        PRODUCT_NAME,
        CATEGORY,
        BRAND,
        PRICE_TIER,
        SUM(QUANTITY)                                AS UNITS_SOLD,
        SUM(LINE_TOTAL)                              AS REVENUE,
        SUM(GROSS_PROFIT)                            AS GROSS_PROFIT
    FROM {{ ref('fct_sales') }}
    GROUP BY PRODUCT_SK, PRODUCT_NAME, CATEGORY, BRAND, PRICE_TIER
)

SELECT
    *,
    RANK() OVER (PARTITION BY CATEGORY ORDER BY REVENUE DESC) AS REVENUE_RANK_IN_CATEGORY
FROM product_totals
