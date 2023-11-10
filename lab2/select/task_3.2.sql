SELECT COUNT(DISTINCT b.id) AS balance_count
FROM articles a
JOIN operations o ON a.id = o.article_id
JOIN balance b ON o.balance_id = b.id
WHERE a.name = 'purpose1';