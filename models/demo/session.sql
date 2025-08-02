{{
    config(
        materialized = 'table'
    )
}}

with session_src as (
    select
        a.SESSION_ID,
        a.USER_ID,
        a.BROWSER,
        a.DEVICE_TYPE,
        b.COUNTRY_NAME as COUNTRY_NAME,
        b.CONTINENT as CONTINENT,
        b.CURRENCY as CURRENCY,
        START_TIME,
        END_TIME,
        PAGES_VISITED,
        CURRENT_TIMESTAMP AS INSERT_DTS
    from {{ source('country','SESSION_SRC') }} a
    left join {{ ref('country_code') }} b
        on a.COUNTRY_CODE = b.COUNTRY_CODE
)

select * from session_src