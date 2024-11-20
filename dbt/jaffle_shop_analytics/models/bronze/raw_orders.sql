{{
    config(
        materialized = 'incremental',
        unique_key = 'id',
    )
}}

select *
from 's3://jaffle-shop-raw/raw_orders.csv'


{% if is_incremental() %}
  where id not in (select id from {{ this }})
{% endif %}
