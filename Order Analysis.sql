-- select * from production.products

--Customer Details against Orders
SELECT	
		ord.order_id,
		CONCAT(cus.first_name, ' ',cus.last_name) AS 'Customer Name',
		cus.city,
		cus.state,
		ord.order_date
		SUM(ite.quantity) AS 'Total Units',
		SUM(ite.quantity * ite.list_price) AS 'Revenue'
FROM sales.orders ord
JOIN sales.customers cus
ON ord.customer_id =  cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
GROUP BY  
		ord.order_id,
		CONCAT(cus.first_name, ' ',cus.last_name) AS 'Customer Name',
		cus.city,
		cus.state,
		ord.order_date
ORDER BY 1 asc