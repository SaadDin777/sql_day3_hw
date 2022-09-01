select * from order_;

select * from customer;

--inner join
select first_name, last_name, order_date, amount
from customer
inner join order_ ON order_.customer_id = customer.customer_id;

--left join
select first_name, last_name, order_date, amount
from customer
left join order_ On order_.customer_id = customer.customer_id
where order_.customer_id is NULL;

select first_name, last_name, order_date, amount
from customer
left join order_ On order_.customer_id = customer.customer_id
where order_date is not NULL;

select first_name, last_name, order_date, amount
from customer
left join order_ On order_.customer_id = customer.customer_id;

--right join
select first_name, last_name, order_date, amount
from customer
right join order_ ON order_.customer_id = customer.customer_id;

select first_name, last_name, order_date, amount
from customer
right join order_ ON order_.customer_id = customer.customer_id
where first_name is NULL;

select first_name, last_name, order_date, amount
from customer
right join order_ ON order_.customer_id = customer.customer_id
where first_name is not NULL;

--full join
select first_name, last_name, order_date, amount
from customer
full join order_ ON order_.customer_id = customer.customer_id;

select first_name, last_name, order_date, amount
from customer
full join order_ ON order_.customer_id = customer.customer_id
where last_name is NULL or amount is NULL;

select first_name, last_name, order_date, amount
from customer
full join order_ ON order_.customer_id = customer.customer_id
where last_name is not NULL or amount is not NULL;