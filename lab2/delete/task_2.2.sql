DO $$
DECLARE action text;
BEGIN
	WITH unprofitable_balance AS (
		SELECT id, amount
		FROM balance
		ORDER BY amount ASC
		LIMIT 1
	)
	, articles_used_in_balance AS (
		SELECT DISTINCT o.article_id
		FROM operations AS o
		WHERE o.balance_id = (SELECT id FROM unprofitable_balance)
	)
	, unused_articles AS (
		SELECT a.id
		FROM articles AS a
		WHERE a.id IN (SELECT article_id FROM articles_used_in_balance)
		AND NOT EXISTS (
			SELECT 1
			FROM operations AS o2
			WHERE o2.article_id = a.id
		)
	)
	, del AS (
		DELETE FROM balance
		WHERE id = (SELECT id FROM unprofitable_balance)
	)
	SELECT CASE
		WHEN EXISTS (SELECT 1 FROM unused_articles) THEN 'rollback'
		ELSE 'delete'
	END INTO action;

	IF action = 'delete' THEN
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END $$;