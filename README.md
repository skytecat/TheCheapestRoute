# The cheapest route SQL

Описание на русском [тут](./README_RUS.md).

![graph](misc/images/graph.png)

# Technical assignment

Please take a look at the Graph on the left. There are 4 cities (a, b, c and d) and arcs between them with cost (or taxination). Actually the cost (a,b) = (b,a). 

Please write one SQL statement using Recursive Query that returns all tours (aka paths) with minimal traveling cost if we will start from city "a".
You need to find the cheapest way of visiting all the cities and returning to your starting point. For example, the tour looks like that a -> b -> c -> d -> a. 
Please sort data by total_cost and then by tour.
