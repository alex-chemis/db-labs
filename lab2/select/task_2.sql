SELECT a.name
FROM articles AS a
WHERE a.id NOT IN (
    SELECT DISTINCT o.article_id
    FROM operations AS o
    WHERE o.create_date BETWEEN '2023-10-01' AND '2023-10-02'
);
