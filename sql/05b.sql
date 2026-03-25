/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 */

SELECT f.title
FROM film f
JOIN film_actor fa USING(film_id)
WHERE fa.actor_id IN (
    SELECT fa2.actor_id
    FROM film f2
    JOIN film_actor fa2 USING(film_id)
    WHERE f2.title = 'AMERICAN CIRCUS'
)
GROUP BY f.film_id, f.title
HAVING COUNT(*) >= 2
ORDER BY f.title;
