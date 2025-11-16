create or replace view SALES.SALES_DETAILS.BILL_DETAILS(
	FIRST_NAME,
	LAST_NAME,
	EMAIL,
	TOTAL_AMOUNT,
	CAMPAIGN_NAME,
	SALESPERSON_NAME
) as(


with t1 as(

select customer_sk,first_name,last_name,email
from SALES.SALES_DETAILS.SALES_CUSTOMER
),

t2 as (
select campaign_sk,campaign_name
from SALES.SALES_DETAILS.dim_campaigns

),
t3 as (
select salesperson_sk,salesperson_name
from SALES.SALES_DETAILS.SALES_PERSONS

)
select t1.first_name,
t1.last_name,
t1.email,
total_amount,
campaign_name,
salesperson_name
from SALES.SALES_DETAILS.DIM_DIMENSION a
left join t1
on a.customer_sk = t1.customer_sk
left join t2
on a.campaign_sk = t2.campaign_sk
left join t3
on a.salesperson_sk = t3.salesperson_sk



);