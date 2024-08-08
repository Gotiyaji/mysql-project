use pizza_hut;

# 1. Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pizza_types.category,
    ROUND(SUM(orders_details.quantity * pizzas.price) / (SELECT 
                    ROUND(SUM(orders_details.quantity * pizzas.price),
                                2) AS Total_Sales
                FROM
                    orders_details
                        JOIN
                    pizzas ON pizzas.pizza_id = orders_details.pizza_id) * 100,
            2) AS Revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY Revenue DESC;


# 2. Analyze the cumulative revenue generated over time.
select order_date,Revenue,
sum(Revenue) over(order by order_date) as cum_revenue
from 
(SELECT 
    orders.order_date,
    ROUND(SUM(orders_details.quantity * pizzas.price),
            2) AS Revenue
FROM
    orders_details
        JOIN
    pizzas ON orders_details.pizza_id = pizzas.pizza_id
        JOIN
    orders ON orders.order_id = orders_details.order_id
GROUP BY orders.order_date) as Sales;


# 3. Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select category,Name,Revenue from 
(select category,Name,Revenue,
rank() over(partition by category order by Revenue desc) as Rn
from
(SELECT 
    pizza_types.category,
    pizza_types.Name,
    round(SUM(orders_details.quantity * pizzas.price),2) AS Revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category , pizza_types.Name)as a)as b
where rn <=3;
