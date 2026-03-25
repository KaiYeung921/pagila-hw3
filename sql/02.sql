/*
 * Compute the country with the most customers in it. 
 */

select country from
(select country, count(first_name) from customer as c
join address as a using (address_id)
join city  using(city_id)
join country using(country_id)
group by country
order by count desc) as tl limit 1;
