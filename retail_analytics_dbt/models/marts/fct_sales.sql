-- fct_sales.sql
-- Sales lines enriched with store and product attributes

SELECT
    s.SALE_SK,
    s.TRANSACTION_ID,
    s.SALE_DATE,
    s.SALE_MONTH,
    s.SALE_YEAR,
    s.STORE_SK,
    st.STORE_ID,
    st.STORE_NAME,
    st.CITY,
    st.COUNTRY,
    st.STORE_TYPE,
    s.PRODUCT_SK,
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    p.CATEGORY,
    p.BRAND,
    p.PRICE_TIER,
    s.PAYMENT_METHOD,
    s.QUANTITY,
    s.UNIT_PRICE,
    s.DISCOUNT_PCT,
    s.LINE_TOTAL,
    s.COST_TOTAL,
    s.GROSS_PROFIT,
    CASE WHEN s.LINE_TOTAL <> 0
         THEN ROUND(s.GROSS_PROFIT / s.LINE_TOTAL * 100, 2)
         ELSE 0
    END                                              AS GROSS_MARGIN_PCT
FROM {{ ref('stg_sales') }} s
LEFT JOIN {{ ref('stg_store') }} st
    ON s.STORE_SK = st.STORE_SK
LEFT JOIN {{ ref('stg_product') }} p
    ON s.PRODUCT_SK = p.PRODUCT_SK
