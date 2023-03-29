WITH final AS (
    SELECT
        DBT_SCD_ID AS SCD_ID,
        CLIENT_ID,
        NAME,
        SURNAME,
        REGISTRATION_DATE,
        TST_REC,
        DBT_VALID_FROM AS VALID_FROM,
        DBT_VALID_TO AS VALID_TO
    FROM {{ ref('customer_dim') }}
)

SELECT * FROM final