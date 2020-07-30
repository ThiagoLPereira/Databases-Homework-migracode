--1. Retrieve all the customers names and addresses who lives in United States--
select * from public.customers where country  = 'United States'

--2. Retrieve all the customers ordered by ascending name--
select * from orders a join public.customers b on b.id = a.customer_id  order by name asc 

--3. Retrieve all the products which cost more than 100--
select  * from products p where unit_price > 100

--4. Retrieve all the products whose name contains the word `socks`--
select * from public.products where product_name like '%socks'

--5. Retrieve the 5 most expensive products--
select * from public.products order by unit_price desc limit 5

--6. Retrieve all the products with their corresponding suppliers. The result should only contain the columns `product_name`, `unit_price` and `supplier_name`--
select product_name, unit_price, supplier_name from products p join suppliers s on p.supplier_id = s.id

--7. Retrieve all the products sold by suppliers based in the United Kingdom. The result should only contain the columns `product_name` and `supplier_name`.--
select product_name, supplier_name from products p  join suppliers s on p.supplier_id = s.id where country like 'United Kingdom'

--8. Retrieve all orders from customer ID `1`--
select * from orders o join customers c on o.customer_id = c.id where c.id = 1

--9. Retrieve all orders from customer named `Hope Crosby`--
select * from orders o join customers c on o.customer_id = c.id where c.name = 'Hope Crosby'

--10. Retrieve all the products in the order `ORD006`. The result should only contain the columns `product_name`, `unit_price` and `quantity`.--
select product_name, p.unit_price, oi.quantity from orders o join products p on oi.product_id = p.id
    join products p on oi.product_id = p.id where o.order_reference = 'ORD006'

--11. Retrieve all the products with their supplier for all orders of all customers. The result should only contain the columns `name` (from customer), `order_reference` `order_date`, `product_name`, `supplier_name` and `quantity`.--
select c."name" , o2.order_reference , o2.order_date , p.product_name , s.supplier_name , oi.quantity
from products p
join order_items oi on oi.product_id = p.id
join orders o2 on oi.order_id = o2.id
join suppliers s on s.id = p.supplier_id
join customers c on o2.customer_id = c.id ;

--

SELECT customers.name,order_reference, order_date, products.product_name, suppliers.supplier_name, order_items.quantity 
FROM orders  
INNER JOIN customers ON customer_id=customers.id 
INNER JOIN order_items ON orders.id=order_items.order_id  
INNER JOIN products ON products.id=order_items.product_id 
INNER JOIN suppliers ON suppliers.id=products.supplier_id

--12. Retrieve the names of all customers who bought a product from a supplier from China.--
select distinct c.name
from customers customers
join orders o on o.customer_id = c.id
join order_items oi on oi.order_id = o.id
join products p on p.id = oi.product_id
join suppliers s on s.id = p.supplier_id
where s.country = 'China';