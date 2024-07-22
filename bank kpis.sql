use bank;
select * from loan;
select count(id) as total_loan_applications from loan ;

select count(id) as MTD_total_loan_applications from loan
 where month(issue_date)=12 and year(issue_date)= 2021;

select count(id) as PMTD_total_loan_applications from loan
 where month(issue_date)=11 and year(issue_date)= 2021;

# MOM = (MTD-PMTD)/PMTD

SELECT sum(loan_amount) as total_funded_amount from loan;
 
SELECT sum(loan_amount) as  MTD_total_funded_amount from loan
 where month(issue_date)=12 and year(issue_date)= 2021;
  
SELECT sum(loan_amount) as  PMTD_total_funded_amount from loan
  where month(issue_date)=11 and year(issue_date)= 2021;
  
SELECT sum(total_payment) as  total_funded_amount from loan;
   
SELECT sum(total_payment) as  MTD_total_funded_amount from loan
 where month(issue_date)=12 and year(issue_date)= 2021;
   
SELECT sum(total_payment) as PMTD_total_funded_amount from loan
 where month(issue_date)=11 and year(issue_date)= 2021;
   
select round(avg(int_rate) ,2)*100 as avg_int_rate from loan;
   
select round(avg(dti),2)*100 as avg_dti from loan;
   
select
	(count(case when loan_status ="Fully Paid" or loan_status="Current" then id end)*100)
	/
	count(id) as good_loan_percentage
from loan;
   
select count(id) as good_loan_application from loan
 where loan_status ="Fully Paid" or loan_status="Current";
   
select sum(loan_amount) as good_loan_funded_amount from loan
 where loan_status ="Fully Paid" or loan_status="Current";
   
select sum(total_payment) as good_loan_recieved_amount from loan
 where loan_status ="Fully Paid" or loan_status="Current"; 
   
select
	(count(case when loan_status ="Charged Off" then id end)*100)
	/
	count(id) as bad_loan_percentage
from loan;
   
select count(id) as bad_loan_application from loan
 where loan_status ="Charged Off";
   
select sum(loan_amount) as bad_loan_funded_amount from loan
 where loan_status ="Charged Off";
   
select sum(total_payment) as good_loan_recieved_amount from loan
 where loan_status ="Charged Off"; 
   
select
		loan_status,
        count(id) as loancount,
        sum(total_payment) as total_amount_received,
        sum(loan_amount) as total_funded_amount,
        round(avg(int_rate*100),2) as avg_int_rate,
        round(avg(dti*100),2) as avg_DTI
from loan group by loan_status;

select
		loan_status,
        sum(total_payment) as MTD_total_amount_received,
        sum(loan_amount) as MTD_total_funded_amount
from loan where month(issue_date) = 12
group by loan_status;
 
select 
        month(issue_date) as monthno ,
		monthname(issue_date) as monthname,
		count(id) as loancount,
        sum(total_payment) as total_amount_received,
        sum(loan_amount) as total_funded_amount
from loan
group by  month(issue_date), monthname(issue_date)
order by  month(issue_date);

select 
        address_state,
		count(id) as loancount,
        sum(total_payment) as total_amount_received,
        sum(loan_amount) as total_funded_amount
from loan
group by  address_state
order by count(id) desc;

select 
        term,
		count(id) as loancount,
        sum(total_payment) as total_amount_received,
        sum(loan_amount) as total_funded_amount
from loan
group by term
order by term;

select 
        emp_length,
		count(id) as loancount,
        sum(total_payment) as total_amount_received,
        sum(loan_amount) as total_funded_amount
from loan
group by emp_length
order by count(id) desc;
        

select 
        purpose,
		count(id) as loancount,
        sum(total_payment) as total_amount_received,
        sum(loan_amount) as total_funded_amount
from loan
group by purpose
order by purpose;

select 
        home_ownership,
		count(id) as loancount,
        sum(total_payment) as total_amount_received,
        sum(loan_amount) as total_funded_amount
from loan
group by home_ownership
order by home_ownership;
 
 
  

 



