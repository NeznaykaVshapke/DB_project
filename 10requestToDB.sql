/*   1 запрос:  Получение списка всех участников с их именами и датами рождения, отсортированных по рейтингу в порядке убывания:  */
SELECT full_name, birth_date, rating
FROM participants
ORDER BY rating DESC;

/*   2 запрос:  Получение среднего рейтинга всех участников:  */
SELECT AVG(rating) AS average_rating
FROM participants;

/*   3 запрос:  Получение списка всех продуктов и их общего веса, отсортированных по общему весу в порядке убывания:  */
SELECT title, SUM(weight) AS total_weight
FROM food
GROUP BY title
ORDER BY total_weight DESC;

/*   4 запрос:  Получение списка всех финансовых операций вместе с информацией о соответствующих продуктах и участниках:  */
SELECT f.finance_id, f.food_id, f.participant_id, fo.title AS food_title, p.full_name AS participant_name
FROM finance f
JOIN food fo ON f.food_id = fo.food_id
JOIN participants p ON f.participant_id = p.participant_id;

/*   5 запрос:  Получение списка всех участников вместе с информацией о снаряжении, которое они используют, отсортированных по имени участника в алфавитном порядке:  */
SELECT p.full_name, e.object AS equipment_object, e.weight
FROM participants p
JOIN equipment e ON p.participant_id = e.participant_id
ORDER BY p.full_name;


/*   6 запрос:  Получение списка всех продуктов с ценой выше средней цены, отсортированных по цене в порядке убывания:  */
SELECT title, price
FROM food
WHERE price > (SELECT AVG(price) FROM food)
ORDER BY price DESC;


/*   7 запрос:  Получение списка всех участников, у которых есть снаряжение весом более 1000, с информацией о снаряжении, отсортированных по весу снаряжения в порядке возрастания:  */
SELECT p.full_name, e.object AS equipment_object, e.weight
FROM participants p
JOIN equipment e ON p.participant_id = e.participant_id
WHERE e.weight > 1000
ORDER BY e.weight ASC;

/*   8 запрос:  Получение списка всех продуктов, объем которых превышает средний объем, вместе с общим количеством таких продуктов:  */
SELECT title, volume, COUNT(*) AS total_count
FROM food
WHERE volume > (SELECT AVG(volume) FROM food)
GROUP BY title, volume;


/*   9 запрос:  Получение списка всех участников вместе с информацией о продуктах, которые они приобрели, и суммарной стоимостью этих продуктов, отсортированных по суммарной стоимости в порядке убывания:  */
SELECT p.full_name, SUM(fo.price) AS total_cost
FROM participants p
JOIN finance f ON p.participant_id = f.participant_id
JOIN food fo ON f.food_id = fo.food_id
GROUP BY p.full_name
ORDER BY total_cost DESC;


/*   10 запрос:  Получение списка всех участников, у которых дата рождения позже 1990 года, с информацией о их должностях и рейтинге, отсортированных по дате рождения в порядке возрастания:
  */
SELECT p.full_name, ps.position, p.birth_date, p.rating
FROM participants p
JOIN positions ps ON p.participant_id = ps.participant_id
WHERE p.birth_date > '1990-01-01'
ORDER BY p.birth_date ASC;
