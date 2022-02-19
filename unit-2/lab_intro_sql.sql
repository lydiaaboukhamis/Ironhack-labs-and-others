-- Review the tables in the database
use sakila;
show tables;

-- Explore tables by selecting all columns from each table or 
-- using the in built review features for your client
select * from actor;
select * from film;
select * from customer;

-- Select one column from a table. Get film titles
select title from film;

-- Select one column from a table and alias it
select name as language
from language;

select distinct name as language
from language;

-- Find out how many stores does the company have?
select count(*)
from store;

-- Find out how many employees staff does the company have?
select count(*) from staff;

-- Return a list of employee first names only
select first_name from staff;
