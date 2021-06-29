with paydat as (
    select 
        sum(ps.amount) as super_act
        ,ps.date
        ,ps.employee
        ,ps.ote_class
        ,
    from {{ ref('st_payslips')}} as ps
    left join {{ ref ('st_paycodes')}} as pc
        on ps.ote_class = pc.ote_class
    where ote_class == 'P001 - Co. Super 9.5%'
    group by ps.date, ps.employee, ps.ote_class
),

with disbursed as (
    select
        sum(superpaid) as tot_super
        ,employee
        ,date
    from {{ ref('st_disursements') }}
    group by employee, date
),

