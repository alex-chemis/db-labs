DO $$
DECLARE
    article_name VARCHAR(50) := 'purpose2';
    increase_amount NUMERIC(18, 2) := 100.00;
BEGIN
    UPDATE operations AS o
    SET credit = credit + increase_amount
    WHERE o.article_id = (SELECT id FROM articles WHERE name = article_name);
e
    UPDATE balance AS b
    SET debit = COALESCE((
        SELECT SUM(o.debit)
        FROM operations AS o
        WHERE o.balance_id = b.id
    ), 0),
    credit = COALESCE((
        SELECT SUM(o.credit)
        FROM operations AS o
        WHERE o.balance_id = b.id
    ), 0);

    UPDATE balance AS b
    SET amount = debit - credit;

    COMMIT;
END$$;