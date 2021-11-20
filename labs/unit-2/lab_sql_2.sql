-- use database
use sakila;

-- Select all the actors with the first name ‘Scarlett’
select * from sakila.actor
where first_name = 'SCARLETT';

-- Select all the actors with the last name ‘Johansson’
select * from sakila.actor
where last_name = 'JOHANSSON';

-- How many films (movies) are available for rent?
select count(*) from sakila.film;

-- How many films have been rented?
select count(*) from sakila.rental;

-- What is the shortest and longest rental period?
select max(rental_duration) as max_duration, min(rental_duration) as min_duration
from sakila.film;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration
select max(length) as max_duration, min(length) as min_duration
from sakila.film;

-- What's the average movie duration?
select avg(length) as avg_duration
from sakila.film;

-- What's the average movie duration expressed in format (hours, minutes)?
select floor(avg(length) / 60) as hours, round(avg(length) % 60) as minutes
from sakila.film;

-- How many movies longer than 3 hours?
select count(*) from sakila.film
where length > 180;

-- Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org
select concat(left(first_name,1), lower(substr(first_name,2)), ' ', last_name) as customer_name,
    lower(email) as email
from sakila.customer

-- What's the length of the longest film title?
select max(length(title)) as longest_title
from sakila.film
