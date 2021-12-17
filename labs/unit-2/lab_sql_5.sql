-- Drop column picture from staff
ALTER TABLE staff
DROP COLUMN picture;

SELECT * FROM staff;

/* A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. 
Update the database accordingly*/
select * from customer
where first_name = 'TAMMY' and last_name = 'SANDERS';

insert into staff(first_name, last_name, email, address_id, store_id, username)
values('TAMMY','SANDERS', 'TAMMY.SANDERS@sakilacustomer.org', 79, 2, 'tammy');

select * from staff;


/* Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
You can use current date for the rental_date column in the rental table. Hint: 
Check the columns in the table rental and see what information you would need to add there. 
You can query those pieces of information. For eg., you would notice that you need customer_id information as well. 
To get that you can use the following query: */
select * from rental limit 5

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- customer_id = 130

select film_id from sakila.film where title = 'ACADEMY DINOSAUR';
-- film_id = 1

select inventory_id from sakila.inventory where film_id = 1;
-- inventory_id = 1

select * from sakila.staff;
-- staff_id = 1 

insert into sakila.rental(rental_date, inventory_id, customer_id, staff_id)
values (curdate(), 1, 130, 1);

select * from rental;


/* Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, 
and the date for the users that would be deleted. Follow these steps:*/

select * from customer limit 5;

-- Check if there are any non-active users

select * from sakila.customer
where active = 0;

-- Create a table backup table as suggested
-- Insert the non active users in the table backup table
-- Delete the non active users from the table customer

drop table if exists deleted_users;

CREATE TABLE deleted_users (
  customer_id int UNIQUE NOT NULL,
  email varchar(255) UNIQUE NOT NULL,
  delete_date date
)

insert into deleted_users
select customer_id, email, curdate()
from sakila.customer
where active = 0;

select * from deleted_users;

delete from sakila.customer where active = 0;

-- check how many inactive users there are now
select * from sakila.customer
where active = 0;