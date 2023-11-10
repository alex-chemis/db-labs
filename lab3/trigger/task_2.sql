CREATE OR REPLACE FUNCTION prevent_update_operation()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.balance_id IS NOT NULL THEN
        RAISE EXCEPTION 'Cannot update a operation recorded in the balance sheet';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS check_update_operation ON operations;

CREATE TRIGGER check_update_operation
BEFORE UPDATE ON operations
FOR EACH ROW
EXECUTE FUNCTION prevent_update_operation();