{{
  config(
    materialized = 'table',
    )
}}

select *
from 's3://jaffle-shop-raw/raw_orders.csv'
