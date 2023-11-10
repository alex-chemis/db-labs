SELECT SUM(debit - credit) AS profit
FROM operations
WHERE create_date = '2023-10-03';
