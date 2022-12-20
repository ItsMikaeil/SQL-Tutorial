-------------------------------------  INTERMEDIATE  --------------------------------------------

-------------------------------------  HAVING  -------------------------------------------------
-- HAVING clause allows us to filter after an aggregation has already taken place.
-- we can not use aggregation with WHERE
-- we use the HAVING after GROUP BY

SELECT customer_id, SUM(amount) FROM payment
WHERE customer_id NOT IN (87, 477, 273)
GROUP BY customer_id
HAVING SUM(amount) > 100;


SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 200

-- CHALLENGE: we are launching a platinum service for our most loyal customers. we will assign
-- platinum status to customers that have had 40 or more transaction payments.
-- what customer_ids are eligible for platinum status?

SELECT customer_id, COUNT(*) FROM payment
GROUP BY customer_id
HAVING count(*) >= 40
ORDER BY customer_id DESC;


-- CHALLENGE: what are the customer ids of customers who have spent more than 
-- $100 in payment transaction with our staff_id member 2?
SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;



----------------------------------- ASSESSMENT 1  ---------------------------------------------
-- COMPLETE THE FOLLOWING TASKS!

-- 1. Return the customer IDs of customers who have spent at least $110 with the staff member 
--who has an ID of 2.
SELECT * FROM payment


SELECT customer_id,SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 110;




-- 2. How many films begin with the letter J?

SELECT COUNT(*) FROM film
WHERE title LIKE 'J%'



-- 3. What customer has the highest customer ID number whose name starts with an 'E' 
-- and has an address ID lower than 500?

SELECT * FROM customer
WHERE first_name LIKE 'E%' AND address_id <= 500
ORDER BY customer_id DESC



--------------------------------------  AS  -------------------------------------------
-- AS make a alias for a column or result. Keep in mind that alias get asign at the very end nso we cant
-- use that to filter that
SELECT column AS new_name FROM table

SELECT SUM(column) AS new_name FROM table








