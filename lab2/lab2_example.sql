TRUNCATE balance, articles, operations RESTART IDENTITY;

INSERT INTO articles VALUES (DEFAULT, 'purpose1');
INSERT INTO articles VALUES (DEFAULT, 'purpose2');
INSERT INTO articles VALUES (DEFAULT, 'purpose3');
INSERT INTO articles VALUES (DEFAULT, 'purpose4');
INSERT INTO articles VALUES (DEFAULT, 'purpose5');

INSERT INTO operations VALUES (DEFAULT, 1, 40, 20, '2023-09-05', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 1, 40, 20, '2023-09-10', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 1, 40, 20, '2023-09-15', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 1, 40, 20, '2023-09-20', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 2, 40, 20, '2023-09-25', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 2, 400, 300, '2023-10-02', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 3, 500, 400, '2023-10-03', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 4, 300, 200, '2023-10-03', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 1, 400, 300, '2023-10-03', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 2, 500, 400, '2023-10-04', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 3, 300, 200, '2023-10-04', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 4, 400, 300, '2023-10-04', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 1, 500, 400, '2023-10-04', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 5, 40, 10, '2023-11-04', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 5, 40, 10, '2023-11-04', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 5, 40, 10, '2023-11-04', DEFAULT);
INSERT INTO operations VALUES (DEFAULT, 5, 40, 10, '2023-11-04', DEFAULT);