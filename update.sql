USE lab_mysql

SELECT *
FROM salespersons

UPDATE salespersons
SET store_id = 'Miami'
WHERE id = 5;

SELECT *
FROM customers;

UPDATE customers
SET email =
	CASE id
		WHEN 1 THEN 'ppicasso@gmail.com'
        WHEN 2 THEN 'lincoln@us.gov'
        WHEN 3 THEN 'hello@napoleon.me'
	END
WHERE id IN (1,2,3);

