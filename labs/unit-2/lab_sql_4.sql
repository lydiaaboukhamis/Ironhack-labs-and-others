-- Get film ratings.

select distinct rating from sakila.film;

-- Get release years

select distinct release_year from sakila.film;

-- Get all films with ARMAGEDDON in the title.

select title from sakila.film
where title like '%ARMAGEDDON%';

-- Get all films with APOLLO in the title

select title from sakila.film
where title like '%APOLLO%';

-- Get all films which title ends with APOLLO.

-- option 1
select title from sakila.film
where title like '%APOLLO';

-- option 2
select title from sakila.film
where title REGEXP 'APOLLO$';

-- Get all films with word DATE in the title.

-- option 1
select title from sakila.film
where title like '%DATE%';

-- option 2
select title from sakila.film
where title regexp '[[:<:]]DATE[[:>:]]'

-- Get 10 films with the longest title.

select title from sakila.film
order by length(title) desc
limit 10;

-- Get 10 the longest films.

select title from sakila.film
order by length desc
limit 10;

-- How many films include Behind the Scenes content?

select count(*) from sakila.film
where special_features like '%Behind the Scenes%';

-- List films ordered by release year and title in alphabetical order.

select * from sakila.film
order by release_year, title;