{{
    config(
        enable = true,
        tags = ['staging']
    )
}}

with source as (

    select * 
    from {{ source(var('raw_source_schema'), 'raw_netflix_titles') }}

),

transformation as (

    select show_id
    from source

)
select * 
from transformation