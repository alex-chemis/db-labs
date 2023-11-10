DROP TABLE IF EXISTS operations;
DROP TABLE IF EXISTS articles;
DROP TABLE IF EXISTS balance;

CREATE TABLE operations
(
    id SERIAL,
    article_id INT,
    debit NUMERIC(18,2),
    credit NUMERIC(18,2),
    create_date TIMESTAMP(3),
    balance_id INT,
	PRIMARY KEY(id)
);

CREATE TABLE articles
(
	id SERIAL,
	name VARCHAR(50),
	PRIMARY KEY(id)
);

CREATE TABLE balance
(
	id SERIAL,
	create_date TIMESTAMP(3),
	debit NUMERIC(18,2),
	credit NUMERIC(18,2),
	amount NUMERIC(18,2),
	PRIMARY KEY(id)
);

ALTER TABLE operations
	ADD CONSTRAINT fk_operations_balance
		FOREIGN KEY(balance_id)
			REFERENCES balance(id)
				ON DELETE CASCADE;
			
ALTER TABLE operations
	ADD CONSTRAINT fk_operations_articles
		FOREIGN KEY(article_id)
			REFERENCES articles(id)
				ON DELETE CASCADE;
