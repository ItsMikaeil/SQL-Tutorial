-- with limit we say how many row we want to see
SELECT * FROM payment
WHERE amount!= 0
ORDER BY payment_date DESC
LIMIT 5;


-- chalenge 1: identify first 10 cusromer that 
-- made payment
SELECT customer_id, payment_date FROM payment
ORDER BY payment_date
LIMIT 10;


-- challenge 2: what are the titles of the 5
-- shortest movie to watch during lunch time?
SELECT title, length FROM film
ORDER BY length
LIMIT 5;



-- If the previous customer can watch any movie
-- that is 50 minutes or less in run time, how
-- how many option does she have?
SELECT title, length FROM film
WHERE length <= 50
ORDER BY length;

-- BETWEEN: BETWEEN low AND high(value>= low AND value<= high) 
--  NOT BETWEEN low AND high

SELECT COUNT(*) FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT COUNT(*) FROM payment
WHERE amount NOT BETWEEN 8 AND 9;


SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' 
AND '2007-02-15';

-- IN Opereator: we can use IN instead of a bunch of or statement
-- syntax: value IN(option1, option2, option3, ...)

SELECT * FROM payment
LIMIT 2;

SELECT DISTINCT(amount) FROM payment
ORDER BY amount;

-- we want choose amount with 0.99, 1.99, 1.98
SELECT * FROM payment
WHERE amount IN (0.99, 1.98, 1.99)
ORDER BY amount;


SELECT COUNT(*) FROM payment
WHERE amount NOT IN (0.99, 1.98, 1.99);


SELECT * FROM customer
WHERE first_name IN ('John', 'Jake', 'Julie')


SELECT COUNT(*) FROM customer
WHERE first_name NOT IN ('John', 'Jake', 'Julie')

-- LIKE & ILIKE: we check to understand if a part of the name match with
-- what we have written like %a or a%. ILIKE IS LIKE LIKE but its not case sensitive

SELECT * FROM film
WHERE title LIKE '%a' -- end with a
       or
WHERE title LIKE 'a%' -- start with a not case sensitive
       or
WHERE title ILIKE '%a' --
       or
WHERE title ILIKE 'a%' -- start with a not case sensitive
       or
WHERE title LIKE 'Mission Impossible _'
       or
WHERE title LIKE 'Version# ___'  -- we can use multiple underscore
                                 -- we have the same number of underscore
								 -- searching number or alephabet

WHERE title LIKE '_her%' -- one charector before her and any charactor after that. start with a wild charector and end with any number of charector


SELECT * FROM customer
WHERE first_name LIKE 'J%'

SELECT COUNT(*) FROM customer
WHERE first_name LIKE 'J%'

SELECT * FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%'


SELECT * FROM customer
WHERE first_name LIKE 'j%' AND last_name LIKE 's%' -- return nothing


SELECT * FROM customer
WHERE first_name ILIKE 'J%' AND last_name ILIKE 'S%' -- becouse its not case sensitive return same as like


SELECT * FROM customer
WHERE first_name ILIKE '%er%' -- any one who has er somewhere in their first name


SELECT * FROM customer
WHERE first_name NOT ILIKE '%er%' -- any one who has NOT er somewhere in their first name
ORDER BY last_name;


------------------ challenge ----------------------------

-- challenge 1: Hoe many payment transaction were
-- greater than $ 5.00?
SELECT * FROM payment;

SELECT COUNT(amount) FROM payment
WHERE amount > 5;

-- CHALLENGE 2: How many actors have a first name that
-- starts with the letter P?

SELECT * FROM actor
WHERE first_name LIKE 'P%'

-- CHALLENGE 3: How many unique districts are our customers from?

SELECT * FROM address;

SELECT DISTINCT(district), address FROM address



-- challenge 3: How many films have a rating of R and a
-- replacement cost between $5 and $15?

SELECT * FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;


---------------------------------- END OF CHALLENGE  -----------------------------------------


-- Aggregate (MIN, MAX, COUNT, AVG, ROUND, SUM)function
SELECT * FROM film;

SELECT MIN(replacement_cost) FROM film;

SELECT MAX(replacement_cost) FROM film;

SELECT COUNT(*) FROM film;

SELECT AVG(replacement_cost) FROM film;

SELECT ROUND(AVG(replacement_cost), 3) FROM film;

SELECT SUM(replacement_cost) FROM film;


-- 	GROUP BY: It allow us to aggregate columns per some category.
-- GROUP BY statement appear right after FROM or WHERE statement.

-- in the actual SELECT	 statement, columns must either have an aggregate function, call on them, or be 
-- themselves in the group buy call.

-- WHERE statement should not refer to the aggregation result.

-- IF you want to sort results based on the aggregate, make sure to reference the entire function

SELECT customer_id FROM payment
GROUP BY customer_id
ORDER BY customer_id


SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
	
	
SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC	
	
	
SELECT customer_id, staff_id, SUM(amount) FROM payment -- any of column that came first we see that also first base group by
GROUP BY staff_id, customer_id -- here is not important which one came first
ORDER BY staff_id, customer_id	
	
	
SELECT customer_id, staff_id, SUM(amount) FROM payment -- any of column that came first we see that in table also first base group by
GROUP BY customer_id, staff_id -- here is not important which one came first
ORDER BY staff_id
	
-- imply group by on date column
SELECT DATE(payment_date) FROM payment
GROUP BY DATE(payment_date);
	
	
SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount);	
	
	
	
-- Challenge: we have two staff members, with staff ids 1 and 2. we want to give a bonus to the staff member
-- that handled the most payments(most in terms of number of payment process, not total dollar amount.)
-- haw many payment did each staff member handle and who gets the bonus?

SELECT * FROM payment;


SELECT staff_id, COUNT(payment_id) FROM payment
GROUP BY staff_id
LIMIT 2;




-- CHALLENGE: Corporate HQ is conducting a study on the relationship between replacement cost and a movie MPAA rating.
-- what is the average replacement cost per MPAA rating?

SELECT * FROM film;

SELECT AVG(replacement_cost), rating FROM film
GROUP BY rating;


-- CHALLENGE: we are running a promotion to reward our top 5 customers with coupons.
-- what are the customer ids of the top 5 customers by total spend?

SELECT * FROM payment;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY sum(amount) DESC
LIMIT 5;











	
	