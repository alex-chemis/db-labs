DO $$
DECLARE
    old_article_name VARCHAR(50) := 'purpose3';
    new_article_name VARCHAR(50) := 'purpose4';
BEGIN
    UPDATE operations AS o
    SET article_id = (SELECT id FROM articles WHERE name = new_article_name)
    WHERE o.article_id = (SELECT id FROM articles WHERE name = old_article_name);

    DELETE FROM articles WHERE name = old_article_name;

    ROLLBACK;
END$$;