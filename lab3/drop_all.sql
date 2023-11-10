DROP VIEW IF EXISTS unaccounted_operations_view;
DROP VIEW IF EXISTS balance_operations_count_view;

DROP FUNCTION IF EXISTS get_last_balance_operations_and_amount();
DROP FUNCTION IF EXISTS get_balances_with_profit_comparison(INT, INT);
DROP FUNCTION IF EXISTS get_article_with_highest_costs(INT);

DROP TRIGGER IF EXISTS check_balance ON balance;
DROP FUNCTION IF EXISTS prevent_invalid_balance();
DROP TRIGGER IF EXISTS check_update_operation ON operations;
DROP FUNCTION IF EXISTS prevent_update_operation();
DROP TRIGGER IF EXISTS check_delete_operation ON operations;
DROP FUNCTION IF EXISTS prevent_delete_operation();

DROP FUNCTION IF EXISTS calculate_percentage_by_item(TIMESTAMP, TIMESTAMP, INT[], VARCHAR);