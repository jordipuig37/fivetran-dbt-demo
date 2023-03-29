{% snapshot customer_dim %}

{{
    config(
      target_database='FIVETRAN_DATABASE',
      target_schema='SRC_SCD',
      unique_key='CLIENT_ID',

      strategy='timestamp',
      updated_at='TST_REC',
    )
}}

select * from {{ source('src_scd', 'SRC_M_CUSTOMER') }}

{% endsnapshot %}