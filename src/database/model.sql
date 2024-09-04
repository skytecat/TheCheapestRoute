CREATE TABLE IF NOT EXISTS nodes (
    point1 VARCHAR(1) NOT NULL,
    point2 VARCHAR(1) NOT NULL,
    cost INT NOT NULL
);

INSERT INTO nodes
VALUES
('A', 'B', 10),
('B', 'A', 10),
('A', 'C', 15),
('C', 'A', 15),
('C', 'B', 35),
('B', 'C', 35),
('B', 'D', 25),
('D', 'B', 25),
('A', 'D', 20),
('D', 'A', 20),
('C', 'D', 30),
('D', 'C', 30);
