CREATE OR REPLACE FUNCTION get_balances_with_profit_comparison(
    IN article1_id INT,
    IN article2_id INT
)
RETURNS TABLE (
    balance_id INT,
    profit_on_article1 NUMERIC(18, 2),
    profit_on_article2 NUMERIC(18, 2)
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        b.id AS balance_id,
        SUM(CASE WHEN o.article_id = article1_id THEN (o.debit - o.credit) ELSE 0 END) AS profit_on_article1,
        SUM(CASE WHEN o.article_id = article2_id THEN (o.debit - o.credit) ELSE 0 END) AS profit_on_article2
    FROM
        balance b
    LEFT JOIN
        operations o ON b.id = o.balance_id
    WHERE
        o.article_id = article1_id OR o.article_id = article2_id
    GROUP BY
        b.id
    HAVING
        SUM(CASE WHEN o.article_id = article1_id THEN (o.debit - o.credit) ELSE 0 END) >
        SUM(CASE WHEN o.article_id = article2_id THEN (o.debit - o.credit) ELSE 0 END);
END;
$$ LANGUAGE plpgsql;