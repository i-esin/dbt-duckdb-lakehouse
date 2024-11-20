-- Can't ingest because of unauthorized access
-- HTTP Error: HTTP GET error on 'https://jaffle-shop-raw.s3.amazonaws.com/raw_order_items.csv' (HTTP 403)
-- Solution: reference raw_items.csv instead (inferred by peeking into jaffle_shop/models/staging/__sources.yml)

{{
    config(
        materialized = 'incremental',
        unique_key = 'id',
    )
}}

select *
from 's3://jaffle-shop-raw/raw_items.csv'


{% if is_incremental() %}
  where id not in (select id from {{ this }})
{% endif %}
