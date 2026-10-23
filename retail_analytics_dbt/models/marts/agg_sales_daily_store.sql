-- agg_sales_daily_store.sql
-- Daily sales KPIs per store

SELECT
    SALE_DATE,
    STORE_SK,
    STORE_NAME,
    COUNTRY,
    STORE_TYPE,
    COUNT(DISTINCT TRANSACTION_ID)                   AS TRANSACTIONS,
    SUM(QUANTITY)                                    AS UNITS_SOLD,
    SUM(LINE_TOTAL)                                  AS REVENUE,
    SUM(COST_TOTAL)                                  AS COST,
    SUM(GROSS_PROFIT)                                AS GROSS_PROFIT
FROM {{ ref('fct_sales') }}
GROUP BY SALE_DATE, STORE_SK, STORE_NAME, COUNTRY, STORE_TYPE
