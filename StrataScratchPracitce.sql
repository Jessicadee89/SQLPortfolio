/*Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
Output the host id and the guest id of matched pair.*/
select airbnb_hosts.host_id, airbnb_guests.guest_id
from airbnb_hosts
inner join airbnb_guests 
on airbnb_hosts.nationality = airbnb_guests.nationality
and airbnb_hosts.gender = airbnb_guests.gender
limit 12;

/*Find the average number of bathrooms and bedrooms for each city’s property types. Output the result along with the city name and the property type. */
select city,property_type, 
Sum(bedrooms)/count(bedrooms) as bedroom_avg, 
sum(bathrooms)/count(bathrooms) as bathroom_avg
from airbnb_search_details
group by city, property_type;

/*We have a table with employees and their salaries, however, some of the records are old and contain outdated salary information. 
kFind the current salary of each employee assuming that salaries increase each year. Output their id, first name, last name, department ID, and current salary. 
Order your list by employee ID in ascending order. */
select id,first_name, last_name, department_id, Max(salary) as Max
from ms_employee_salary
group by id, first_name, last_name, department_id
order by id asc;

/*Find the details of each customer regardless of whether the customer made an order. Output the customer's first name, last name, and the city along with the order details.
You may have duplicate rows in your results due to a customer ordering several of the same items. Sort records based on the customer's first name and the order details in ascending order. */
select customers.first_name, 
customers.last_name,
customers.city,
orders.order_details
from customers
inner join orders
on customers.id = orders.cust_id
order by customers.first_name asc, 
orders.order_details asc;
