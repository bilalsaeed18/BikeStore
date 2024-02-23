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
		pp.product_name
FROM sales.orders ord
JOIN sales.customers cus
ON ord.customer_id =  cus.customer_id
JOIN sales.order_items it
ON ord.order_id = it.order_id
JOIN production.products pp 
ON it.product_id = pp.product_id
GROUP BY  
		ord.order_id,
		CONCAT(cus.first_name, ' ',cus.last_name),
		cus.city,
		cus.state,
		ord.order_date,
		pp.product_name
ORDER BY 1 asc


select * from sales.order_items
