use sakila;

-- Q1
DELIMITER //
create procedure name_email() 
begin
select first_name, last_name, email
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = "Action"
  group by first_name, last_name, email;
end //
DELIMITER ;
call name_email();

-- Q2
DELIMITER //
create procedure name_email1(in param1 varchar(25)) 
begin
select first_name, last_name, email, name
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = param1
  group by first_name, last_name, email;
end //
DELIMITER ;
call name_email1("Drama");

-- Q3
DELIMITER //
create procedure movie_category_greaterthan(in param1 int) 
begin
select count(c.category_id), name from category c
join film_category fc on c.category_id = fc.category_id
join film f on f.film_id = fc.film_id
group by c.category_id
having count(c.category_id) > param1;
end //
DELIMITER ;
call movie_category_greaterthan(63);

