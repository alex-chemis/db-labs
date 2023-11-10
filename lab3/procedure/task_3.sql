CREATE OR REPLACE FUNCTION get_article_with_highest_costs(
    IN balance_1d INT,
    OUT highest_cost_article VARCHAR(50)
)
AS $$
BEGIN
    SELECT
        a.name
    INTO
        highest_cost_article
    FROM
        operations o
    JOIN
        articles a ON o.article_id = a.id
    WHERE
        o.balance_id = balance_1d
    ORDER BY
        (o.debit - o.credit) DESC
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;