-- stg_store.sql
-- Standardized store attributes

SELECT
    CAST(STORE_SK AS INTEGER)                        AS STORE_SK,
    TRIM(STORE_ID)                                   AS STORE_ID,
    TRIM(STORE_NAME)                                 AS STORE_NAME,
    COALESCE(NULLIF(TRIM(CITY), ''), 'Unknown')      AS CITY,
    UPPER(TRIM(COUNTRY))                             AS COUNTRY,
    UPPER(TRIM(STORE_TYPE))                          AS STORE_TYPE,
    OPEN_DATE,
    CAST(SQ_FOOTAGE AS INTEGER)                      AS SQ_FOOTAGE,
    COALESCE(IS_ACTIVE, FALSE)                       AS IS_ACTIVE,
    _UPDATED_AT                                      AS UPDATED_AT
FROM {{ source('core', 'dim_store') }}
