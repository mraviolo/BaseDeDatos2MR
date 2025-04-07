-- 1)
SELECT first_name, last_name
FROM actor
WHERE last_name IN (
    SELECT last_name
    FROM actor
    GROUP BY last_name
    HAVING COUNT(*) > 1
)
ORDER BY last_name, first_name;

-- 2)
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id NOT IN (
    SELECT DISTINCT actor_id
    FROM film_actor
);

-- 3)
SELECT customer_id
FROM rental
GROUP BY customer_id
HAVING COUNT(DISTINCT inventory_id) = 1;

-- 4)
SELECT customer_id
FROM rental
GROUP BY customer_id
HAVING COUNT(DISTINCT inventory_id) > 1;

-- 5)
SELECT DISTINCT a.actor_id, a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title IN ('BETRAYED REAR', 'CATCH AMISTAD');

-- 6)
SELECT DISTINCT a.actor_id, a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'BETRAYED REAR'
AND a.actor_id NOT IN (
    SELECT fa.actor_id
    FROM film_actor fa
    JOIN film f ON fa.film_id = f.film_id
    WHERE f.title = 'CATCH AMISTAD'
);

-- 7)
SELECT DISTINCT a.actor_id, a.first_name, a.last_name
FROM actor a
WHERE a.actor_id IN (
    SELECT fa.actor_id
    FROM film_actor fa
    JOIN film f ON fa.film_id = f.film_id
    WHERE f.title = 'BETRAYED REAR'
)
AND a.actor_id IN (
    SELECT fa.actor_id
    FROM film_actor fa
    JOIN film f ON fa.film_id = f.film_id
    WHERE f.title = 'CATCH AMISTAD'
);

-- 8)
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id NOT IN (
    SELECT DISTINCT fa.actor_id
    FROM film_actor fa
    JOIN film f ON fa.film_id = f.film_id
    WHERE f.title IN ('BETRAYED REAR', 'CATCH AMISTAD')
);
