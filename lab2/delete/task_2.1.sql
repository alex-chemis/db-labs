BEGIN;

WITH unprofitable_balance AS (
    SELECT id
    FROM balance
    ORDER BY amount ASC
    LIMIT 1
)
DELETE FROM balance
WHERE id = (SELECT id FROM unprofitable_balance);

COMMIT;