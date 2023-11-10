DO $$
DECLARE 
	n_amount NUMERIC(18,2);
	n_current_date TIMESTAMP(3) := '2023-10-30';
BEGIN
	WITH cop AS (
	SELECT *
		FROM operations
		WHERE balance_id IS NULL AND create_date < n_current_date
	), nbl AS (
	INSERT INTO balance (create_date, debit, credit, amount)
		SELECT n_current_date, SUM(debit), SUM(credit), SUM(debit - credit) FROM cop
		RETURNING id, amount
	), upd AS (
	UPDATE operations 
		SET (balance_id) = (SELECT id FROM nbl) 
		WHERE EXISTS(SELECT 1 FROM cop WHERE id = operations.id)
	)
	SELECT amount INTO n_amount FROM nbl;
	
    IF n_amount >= 100 THEN
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END $$;