-- Can't ingest because of unauthorized access
-- HTTP Error: HTTP GET error on 'https://jaffle-shop-raw.s3.amazonaws.com/raw_order_items.csv' (HTTP 403)

{{
  config(
    materialized = 'table',
    )
}}

select *
from 's3://jaffle-shop-raw/raw_order_items.csv'
