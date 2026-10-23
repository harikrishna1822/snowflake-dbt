-- stg_product.sql
-- Standardized product attributes

SELECT
    CAST(PRODUCT_SK AS INTEGER)                      AS PRODUCT_SK,
    TRIM(PRODUCT_ID)                                 AS PRODUCT_ID,
    TRIM(PRODUCT_NAME)                               AS PRODUCT_NAME,
    COALESCE(NULLIF(TRIM(CATEGORY), ''), 'Unknown')  AS CATEGORY,
    COALESCE(NULLIF(TRIM(BRAND), ''), 'Unknown')     AS BRAND,
    CAST(COST_PRICE AS DECIMAL(12, 2))               AS COST_PRICE,
    CAST(RETAIL_PRICE AS DECIMAL(12, 2))             AS RETAIL_PRICE,
    CAST(MARGIN_PCT AS DECIMAL(9, 4))                AS MARGIN_PCT,
    TRIM(PRICE_TIER)                                 AS PRICE_TIER,
    COALESCE(IS_ACTIVE, FALSE)                       AS IS_ACTIVE,
    _UPDATED_AT                                      AS UPDATED_AT
FROM {{ source('core', 'dim_product') }}
