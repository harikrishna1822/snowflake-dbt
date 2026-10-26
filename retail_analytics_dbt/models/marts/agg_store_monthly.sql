-- agg_store_monthly.sql
-- Monthly revenue per store

SELECT
    STORE_SK,
    DATE_TRUNC('month', SALE_DATE)              AS SALE_MONTH_START,
    SUM(LINE_TOTAL)                             AS REVENUE,
    SUM(QUANTITY)                               AS UNITS_SOLD,
    IFF(SUM(QUANTITY) > 100, 'HIGH', 'LOW')     AS VOLUME_BAND
FROM {{ ref('fct_sales') }}
GROUP BY 1, 2