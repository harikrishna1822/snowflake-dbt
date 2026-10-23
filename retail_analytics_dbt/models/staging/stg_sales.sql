-- stg_sales.sql
-- Standardized sales lines

SELECT
    CAST(SALE_SK AS INTEGER)                         AS SALE_SK,
    TRIM(TRANSACTION_ID)                             AS TRANSACTION_ID,
    CAST(STORE_SK AS INTEGER)                        AS STORE_SK,
    CAST(PRODUCT_SK AS INTEGER)                      AS PRODUCT_SK,
    SALE_DATE,
    TRIM(SALE_MONTH)                                 AS SALE_MONTH,
    CAST(SALE_YEAR AS INTEGER)                       AS SALE_YEAR,
    CAST(QUANTITY AS INTEGER)                        AS QUANTITY,
    CAST(UNIT_PRICE AS DECIMAL(12, 2))               AS UNIT_PRICE,
    CAST(COALESCE(DISCOUNT_PCT, 0) AS DECIMAL(9, 4)) AS DISCOUNT_PCT,
    CAST(LINE_TOTAL AS DECIMAL(14, 2))               AS LINE_TOTAL,
    CAST(COST_TOTAL AS DECIMAL(14, 2))               AS COST_TOTAL,
    CAST(GROSS_PROFIT AS DECIMAL(14, 2))             AS GROSS_PROFIT,
    UPPER(TRIM(PAYMENT_METHOD))                      AS PAYMENT_METHOD
FROM {{ source('core', 'fact_sales') }}
