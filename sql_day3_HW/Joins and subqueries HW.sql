--1. List all customers who live in Texas (use JOINs)
select first_name, last_name, district
from customer
full join address
ON address.address_id = customer.address_id
where district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, amount
from customer
Full join payment
ON payment.customer_id = customer.customer_id
where amount > 6.99
order by amount DESC;

--3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name
from customer 
where customer_id IN (
	select customer_id
	from payment
	group by customer_id
	having SUM(amount) > 175
)
group by first_name, last_name;

--4. List all customers that live in Nepal (use the city table)
select first_name, last_name, country
from customer
full join address
ON customer.address_id = address.address_id
full join city
ON address.city_id = city.city_id
full join country
ON city.country_id = country.country_id
where country = 'Nepal';

--5. Which staff member had the most transactions?
select first_name, last_name, COUNT(payment.staff_id)
from staff
FULL JOIN payment
ON payment.staff_id = staff.staff_id
group by first_name, last_name, payment.staff_id
order by payment.staff_id desc
limit 1;
--6. How many movies of each rating are there?

select DISTINCT rating, COUNT(rating)
from film
group by rating;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name, last_name
from customer 
where customer_id IN (
	select customer_id
	from payment
	where amount > 6.99
	group by payment.customer_id
	having COUNT(amount) = 1
)
group by first_name, last_name, customer_id;

--8. How many free rental did our store give away?
select rental.rental_id, amount
from rental 
FULL JOIN payment 
ON payment.rental_id = rental.rental_id
group by rental.rental_id, amount
having amount = 0.00;