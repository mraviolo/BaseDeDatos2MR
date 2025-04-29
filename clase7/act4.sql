-- 1)
SELECT title, rating
  FROM film
 WHERE length = (SELECT MIN(length) FROM film);

-- 2)
SELECT title
  FROM film
 WHERE length = (SELECT MIN(length) FROM film)
HAVING COUNT(*) = 1;

-- 3)
SELECT c.customer_id, c.first_name, c.last_name,
       a.address,
       MIN(p.amount) AS lowest_payment
  FROM customer c
  JOIN address a ON c.address_id = a.address_id
  JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, a.address;

-- 3)
SELECT c.customer_id, c.first_name, c.last_name,
       a.address,
       p.amount AS lowest_payment
  FROM customer c
  JOIN address a ON c.address_id = a.address_id
  JOIN payment p ON c.customer_id = p.customer_id
 WHERE p.amount <= ALL (
           SELECT amount
             FROM payment
            WHERE customer_id = c.customer_id
     );

-- 4)
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       (SELECT MAX(amount)
          FROM payment
         WHERE customer_id = c.customer_id) AS highest_payment,
       (SELECT MIN(amount)
          FROM payment
         WHERE customer_id = c.customer_id) AS lowest_payment
  FROM customer c
ORDER BY highest_payment DESC, customer_id;
