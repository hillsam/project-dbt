with source as (
    select * from {{ ref('PayCodes') }}
),

stage_paycodes as (
    select
        paycode as PayCodes
        ,ote_treatment as ote_class
    from source
),

select * from stage_paycodes
