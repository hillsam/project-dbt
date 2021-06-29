with source as (
    select * from {{ ref('Payslips') }}
),

stage_payslips as (
    select
        payslip_id
        ,employee_code as employee
        ,code as ote_class
        ,amount
        ,date
    from source
),

select * from stage_payslips

