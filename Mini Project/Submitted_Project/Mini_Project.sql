use idc_pizza;
# **Phase 1: Foundation & Inspection**

# 1. Install IDC_Pizza.dump as IDC_Pizza server

# create database IDC_pizza
# create tables(order_details, orders, pizza_types, pizzas).
# using the sql_script provided and Inserted values into the table usnin INsert into function

# 2. List all unique pizza categories (`DISTINCT`).

SELECT DISTINCT category FROM pizza_types;

# 3. Display `pizza_type_id`, `name`, and ingredients, replacing NULL ingredients 
#    with `"Missing Data"`. Show first 5 rows.

SELECT pizza_type_id, name, COALESCE(ingredients, 'Missing Data') AS ingredients FROM pizza_types LIMIT 5;


# 4. Check for pizzas missing a price (`IS NULL`).

SELECT * FROM pizzas WHERE price IS NULL;


# **Phase 2: Filtering & Exploration**
# 1. Orders placed on `'2015-01-01'` (`SELECT` + `WHERE`).

SELECT 	* FROM orders WHERE date = '2015-01-01';
	
# 2. List pizzas with `price` descending.

SELECT * FROM pizzas ORDER BY price DESC;

# 3. Pizzas sold in sizes `'L'` or `'XL'`.

SELECT *FROM pizzas p INNER JOIN order_details od ON p.pizza_id = od.pizza_id WHERE size IN ('L','XL');

# 4. Pizzas priced between $15.00 and $17.00.

SELECT * FROM pizzas WHERE price BETWEEN 15.00 AND 17.00 ORDER BY price DESC;

# 5. Pizzas with `"Chicken"` in the name.

SELECT * FROM pizza_types WHERE name LIKE '%Chicken%';

# 6. Orders on `'2015-02-15'` or placed after 8 PM.

SELECT * FROM orders WHERE `date` = '2015-01-01' OR time > '20:00:00' ORDER BY time;


# **Phase 3: Sales Performance**
# 1. Total quantity of pizzas sold (`SUM`).

SELECT pizza_id, SUM(quantity) AS total_quantity FROM order_details GROUP BY pizza_id ORDER BY total_quantity DESC;

# 2. Average pizza price (`AVG`).

SELECT pizza_id, size, ROUND(AVG(price), 2) AS avg_price FROM pizzas GROUP BY size, pizza_id ORDER BY avg_price DESC;

# 3. Total order value per order (`JOIN`, `SUM`, `GROUP BY`).
SELECT od.order_id, SUM(p.price) AS order_value FROM pizzas p LEFT JOIN order_details od ON p.pizza_id = od.pizza_id GROUP BY od.order_id, od.quantity ORDER BY order_value DESC, od.quantity ASC;

# 4. Total quantity sold per pizza category (`JOIN`, `GROUP BY`).

SELECT pt.category, SUM(od.quantity) AS total_quantity FROM pizzas p LEFT JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id LEFT JOIN order_details od ON p.pizza_id = od.pizza_id GROUP BY pt.category ORDER BY total_quantity DESC;
    
# 5. Categories with more than 5,000 pizzas sold (`HAVING`).

SELECT pt.category, SUM(od.quantity) AS total_quantity FROM pizzas p LEFT JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id 
LEFT JOIN order_details od ON p.pizza_id = od.pizza_id BY pt.category HAVING total_quantity > 5000 ORDER BY total_quantity ASC;

# 6. Pizzas never ordered (`LEFT/RIGHT JOIN`).

SELECT pt.name AS pizza_name, p.pizza_id, od.order_id FROM pizza_types pt LEFT JOIN pizzas p ON pt.pizza_type_id = p.pizza_type_id
LEFT JOIN order_details od ON p.pizza_id = od.pizza_id WHERE od.order_id IS NULL GROUP BY p.pizza_id, od.order_id, pizza_name;

# 7. Price differences between different sizes of the same pizza (`SELF JOIN`).

SELECT p1.pizza_type_id, p1.size AS size_1, p1.price AS price_1, p2.size AS size_2, p2.price AS prie_2, ABS(p2.price - p1.price) AS price_difference
FROM pizzas p1 JOIN pizzas p2 ON p1.pizza_type_id = p2.pizza_type_id AND p1.size < p2.size;

SELECT
	p1.pizza_type_id,
	p1.pizza_id,
	p1.size,
	p1.price AS price_1,
    COALESCE(LEAD(p1.price) OVER (PARTITION BY pizza_type_id ORDER BY size ),0) AS price_2,
    COALESCE((p1.price-LEAD(p1.price) OVER (PARTITION BY pizza_type_id ORDER BY size)),0) AS price_difference
FROM pizzas p1
GROUP BY p1.pizza_id, p1.size, p1.price 
ORDER BY pizza_id;

# 7. Price differences between different sizes of the same pizza (`SELF JOIN`).

