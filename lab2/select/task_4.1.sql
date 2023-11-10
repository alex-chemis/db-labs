SELECT
    a.name AS item_name,
    SUM(o.credit) AS total_expenses
FROM articles a
JOIN operations o ON a.id = o.article_id
JOIN balance b ON o.balance_id = b.id
WHERE
    a.name = 'purpose1'
    AND b.create_date >= '2023-09-01'
    AND b.create_date <= '2023-10-01'
GROUP BY a.name;