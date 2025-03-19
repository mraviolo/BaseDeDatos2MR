CREATE DATABASE imdb;

USE imdb;

CREATE TABLE film (
    film_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    release_year INT,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE actor (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE film_actor (
    actor_id INT,
    film_id INT,
    PRIMARY KEY (actor_id, film_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id) ON DELETE CASCADE,
    FOREIGN KEY (film_id) REFERENCES film(film_id) ON DELETE CASCADE
);

INSERT INTO actor (first_name, last_name) 
VALUES 
('Ricardo', 'Darín'),
('Elena', 'Roger'),
('Juan', 'Minujín');

INSERT INTO film (title, description, release_year)
VALUES 
('El Secreto de Sus Ojos', 'Un consejero legal retirado escribe una novela en un intento por resolver el caso que no pudo resolver durante su carrera, mientras revive su relación con una colega.', 2009),
('El Hijo de la Novia', 'Un hombre intenta reconectar con su madre y con su esposa distante mientras enfrenta su propia crisis existencial.', 2001),
('Coche Polaco', 'Un joven viaja por un desafiante viaje para encontrar su identidad y confronta su pasado.', 2003);

INSERT INTO film_actor (actor_id, film_id)
VALUES 
(1, 1),
(2, 2),
(3, 3);

