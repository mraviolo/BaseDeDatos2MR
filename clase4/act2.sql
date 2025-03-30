-- 1. Mostrar título y special_features de películas que son PG-13
SELECT title, special_features 
FROM film 
WHERE rating = 'PG-13';

-- 2. Obtener una lista de todas las diferentes duraciones de películas
SELECT DISTINCT length 
FROM film;

-- 3. Mostrar título, rental_rate y replacement_cost de películas con replacement_cost entre 20.00 y 24.00
SELECT title, rental_rate, replacement_cost 
FROM film 
WHERE replacement_cost BETWEEN 20.00 AND 24.00;

-- 4. Mostrar título, categoría y rating de películas que tienen 'Behind the Scenes' en special_features
SELECT f.title, c.name AS category, f.rating 
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE f.special_features LIKE '%Behind the Scenes%';

-- 5. Mostrar nombre y apellido de los actores que actuaron en 'ZOOLANDER FICTION'
SELECT a.first_name, a.last_name 
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'ZOOLANDER FICTION';

-- 6. Mostrar la dirección, ciudad y país de la tienda con id 1
SELECT a.address, c.city, co.country 
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id
WHERE s.store_id = 1;

-- 7. Mostrar pares de títulos de películas y su rating si tienen el mismo rating
SELECT f1.title AS film1, f2.title AS film2, f1.rating 
FROM film f1
JOIN film f2 ON f1.rating = f2.rating AND f1.film_id <> f2.film_id
ORDER BY f1.rating;

-- 8. Obtener todas las películas disponibles en la tienda con id 2 y el nombre del gerente
SELECT f.title, m.first_name, m.last_name 
FROM inventory i
JOIN film f ON i.film_id = f.film_id
JOIN store s ON i.store_id = s.store_id
JOIN staff m ON s.manager_staff_id = m.staff_id
WHERE i.store_id = 2;
