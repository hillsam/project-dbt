with source as (
    select * from {{ ref('Disbursements') }}
),

 stage_disbursements as (
    select
        sgc_amount as superpaid
        ,payment_made as payment_date
        ,employee_code as employee
        ,date
from source
),

select * from stage_disbursements