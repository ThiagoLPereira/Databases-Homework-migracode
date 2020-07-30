-- select name of the product and the number of units in stock sorted by units in stock from highest to lowest. --
SELECT product_name, units_in_stock FROM products order by units_in_stock desc;

-- select the id for category 'Beverages'. --
SELECT category_id, category_name, description FROM public.categories WHERE category_id=1;

-- retrieve all the products which category is 'Beverages' and price is either between 10 and 20 or between 200 and 300. --
SELECT * FROM public.products where category_id = 1 and unit_price between 10 and 20 or unit_price between  200 and 300

-- get the id for the customer which company_name is 'Cactus Comidas para llevar'. --
SELECT customer_id, company_name FROM public.customers where company_name like 'Cactus%'

-- Units in stock is less than the quantity on order--
SELECT product_name, units_on_order, units_in_stock FROM public.products WHERE (((discontinued)=0) AND ((units_in_stock)<units_on_order));


