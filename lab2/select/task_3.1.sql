SELECT a.name AS article_name, o.id AS operation_id, o.debit, o.credit, o.create_date
FROM articles AS a
LEFT JOIN operations AS o ON a.id = o.article_id
ORDER BY a.name, o.create_date;