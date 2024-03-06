-- select * from production.products

--Complete Orders and Customer Details   
SELECT	
		ord.order_id,
		CONCAT(cus.first_name, ' ',cus.last_name) AS 'Customer Name',
		cus.city,
		cus.state,
		ord.order_date,
		SUM(it.quantity) AS 'Total Units',
		SUM(it.quantity * it.list_price) AS 'Revenue',
		pp.product_name,
		cat.category_name,
		ss.store_name,
		CONCAT(sals.first_name, ' ', sals.last_name) AS 'Sales Representative'
FROM sales.orders ord
JOIN sales.customers cus
ON ord.customer_id =  cus.customer_id
JOIN sales.order_items it
ON ord.order_id = it.order_id
JOIN production.products pp 
ON it.product_id = pp.product_id
JOIN production.categories cat 
ON pp.category_id = cat.category_id
JOIN sales.stores ss
ON ss.store_id = ord.store_id
JOIN sales.staffs sals
ON sals.staff_id = ord.staff_id
GROUP BY  
		ord.order_id,
		CONCAT(cus.first_name, ' ',cus.last_name),
		cus.city,
		cus.state,
		ord.order_date,
		pp.product_name,
		cat.category_name,
		CONCAT(sals.first_name, ' ', sals.last_name),
		ss.store_name
ORDER BY 1 asc


select * from sales.order_items


SELECT *
FROM  sales.orders


SELECt COUNT(Distinct customer_id) AS 'Total Orders'
FROM  sales.orders


SELECT COUNT(order_id) AS 'Total Orders'
FROM  sales.orders


SELECT *
FROM [production].[products]

SELECT count(product_id) as 'Total Product'
FROM [production].[products]