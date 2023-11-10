CREATE OR REPLACE FUNCTION prevent_invalid_balance()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.debit = 0 AND NEW.credit = 0 THEN
        RAISE EXCEPTION 'Cannot create a balance with zero debit and credit';
    END IF;
    
    IF NEW.create_date IS NULL THEN
        RAISE EXCEPTION 'Cannot create a balance with an unspecified date';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS check_balance ON balance;

CREATE TRIGGER check_balance
BEFORE INSERT ON balance
FOR EACH ROW
EXECUTE FUNCTION prevent_invalid_balance();