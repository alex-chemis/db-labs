CREATE OR REPLACE FUNCTION get_last_balance_operations_and_amount()
RETURNS TABLE (
    operation_id INT,
    article_id INT,
    debit NUMERIC(18,2),
    credit NUMERIC(18,2),
    create_date TIMESTAMP(3),
    amount NUMERIC(18,2)
)
AS $$
DECLARE
    last_balance_id INT;
BEGIN
    RETURN QUERY
    SELECT
        o.id,
        o.article_id,
        o.debit,
        o.credit,
        o.create_date,
        (o.debit - o.credit)
    FROM
        operations o
    WHERE
        o.balance_id = (SELECT id
            FROM balance b
            ORDER BY b.create_date DESC
            LIMIT 1);
END;
$$ LANGUAGE plpgsql;