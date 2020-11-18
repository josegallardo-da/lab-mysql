USE lab_mysql;

INSERT INTO cars (vin, manufacturer, model, year, color)
VALUES
	('3K096I98581DHSNUP','Volkswagen','Tiguan', 2019, 'Blue'),
    ('ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red'),
    ('RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White'),
    ('HKNDGS7CU31E9Z7JW','Toyota','RAV4',2018,'Silver'),
    ('DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Gray'),
    ('DAM41UDN3CHU2WVF7','Volvo','V60 Cross Country',2019,'Gray');

INSERT INTO customers (cust_id, name, phone_number, email, address, city, state_or_province, country, zip_or_postalcode)
VALUES
	(10001, 'Pablo Picasso', '+34 636 17 63 82', null, 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', 28045),
    (20001, 'Abraham Lincoln', '+1 305 907 7086', null, '120 SW 8th St', 'Miami', 'Florida', 'United States', 33130),
    (30001, 'Napoléon Bonaparte', '+33 1 79 75 40 00', null, '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', 75008);

INSERT INTO salespersons (staff_id, name, store_id)
VALUES
	(00001,'Petey Cruiser','Madrid'),
    (00002,'Anna Sthesia','Barcelona'),
    (00003,'Paul Molive','Berlin'),
    (00004,'Gail Forcewind','Paris'),
    (00005,'Paige Turner','Mimia'),
    (00006,'Bob Frapples','Mexico City'),
    (00007,'Walter Melon','Amsterdam'),
    (00008,'Shonda Leer','São Paulo');

INSERT INTO invoices (invoice, date_issued, cars_id, customers_id, salespersons_id)
VALUES
	(852399038,'2018-08-22', 1, 2, 4),
    (731166526,'2018-12-31', 4, 1, 6),
    (271135104,'2019-01-22', 3, 3, 8);

SELECT invoices.date_issued 'DATE', invoices.invoice 'INVOICE', cars.vin 'CAR: VIN', cars.model 'CAR MODEL', customers.name 'CUSTOMER', salespersons.name 'STAFF (SALES)'
FROM invoices
LEFT JOIN  cars
ON cars.id = invoices.cars_id
JOIN customers
ON customers.id = invoices.customers_id
JOIN salespersons
ON salespersons.id = invoices.salespersons_id
GROUP BY invoices.date_issued
ORDER BY invoices.date_issued;
