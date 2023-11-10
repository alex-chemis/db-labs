CREATE OR REPLACE VIEW balance_operations_count_view AS
SELECT
    b.id AS balance_id,
    b.create_date AS balance_create_date,
    b.debit AS balance_debit,
    b.credit AS balance_credit,
    b.amount AS balance_amount,
    COALESCE(COUNT(o.id), 0) AS operation_count
FROM
    balance b
LEFT JOIN
    operations o ON b.id = o.balance_id
GROUP BY
    b.id, b.create_date, b.debit, b.credit, b.amount;
