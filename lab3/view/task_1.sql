CREATE OR REPLACE VIEW unaccounted_operations_view AS
SELECT
    a.id AS article_id,
    a.name AS article_name,
    COALESCE(SUM(o.debit), 0) AS total_debit,
    COALESCE(SUM(o.credit), 0) AS total_credit
FROM
    articles a
LEFT JOIN
    operations o ON a.id = o.article_id
WHERE
    o.balance_id IS NULL
GROUP BY
    a.id, a.name;
