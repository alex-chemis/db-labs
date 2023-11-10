DELETE FROM articles
WHERE id = (SELECT id FROM articles WHERE name = 'purpose6');