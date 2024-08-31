CREATE OR REPLACE VIEW v_path_way AS (
WITH RECURSIVE p(last_point, tour) AS (
    SELECT
        point1,
        ARRAY[point1]::VARCHAR[]::VARCHAR(1)[], 0 AS cost
    FROM nodes
    WHERE point1 = 'A'

    UNION

    SELECT
        nodes.point2 AS last_point,
        (p.tour || ARRAY[nodes.point2])::VARCHAR[]::VARCHAR(1)[],
        p.cost + nodes.cost
    FROM nodes, p
    WHERE nodes.point1 = p.last_point
    AND NOT nodes.point2 = ANY(p.tour)
), result_path AS (
    SELECT
        array_append(tour, 'A') AS tour,
        cost + (SELECT cost FROM nodes WHERE point1 = p.last_point AND point2 = 'A' ORDER BY cost LIMIT 1) as cost
    FROM p
    WHERE (SELECT array_length(p.tour, 1)) = 4
)
SELECT
    cost AS total_cost,
    tour
FROM result_path
);

SELECT tour, total_cost
FROM v_path_way
WHERE total_cost = (SELECT MIN(total_cost) FROM v_path_way)
ORDER BY total_cost, tour;
