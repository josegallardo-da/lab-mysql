/* NOTA: ADAPTE LOS DATOS QUE VENIAN EN EL EJERCICIO A MI DISENO PUESTO QUE 
AL HACER LAS TABLAS EN CREATE.SQL PARTIENDO DE SQL COMMAND LINE, YO ESTABLECI LAS RELACIONES 
Y EN NINGUN MOMENTO INCLUI UN ID GENERAL (INCREMENT) PARA CADA RENGLON */

USE lab_mysql;

INSERT INTO cars
VALUES
	('3K096I98581DHSNUP','Volkswagen','Tiguan', 2019, 'Blue'),
    ('ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red'),
    ('RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White'),
    ('HKNDGS7CU31E9Z7JW','Toyota','RAV4',2018,'Silver'),
    ('DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Gray'),
    ('DAM41UDN3CHU2WVF7','Volvo','V60 Cross Country',2019,'Gray');

INSERT INTO customers
VALUES
	(10001, 'Pablo Picasso', '+34 636 17 63 82', null, 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', 28045),
    (20001, 'Abraham Lincoln', '+1 305 907 7086', null, '120 SW 8th St', 'Miami', 'Florida', 'United States', 33130),
    (30001, 'Napoléon Bonaparte', '+33 1 79 75 40 00', null, '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', 75008);

INSERT INTO salespersons
VALUES
	(00001,'Petey Cruiser','Madrid'),
    (00002,'Anna Sthesia','Barcelona'),
    (00003,'Paul Molive','Berlin'),
    (00004,'Gail Forcewind','Paris'),
    (00005,'Paige Turner','Mimia'),
    (00006,'Bob Frapples','Mexico City'),
    (00007,'Walter Melon','Amsterdam'),
    (00008,'Shonda Leer','São Paulo');
    
INSERT INTO invoices
VALUES
	(852399038,'2018-08-22', '3K096I98581DHSNUP', 'Tiguan', 20001, 'Abraham Lincoln', 3, 'Paul Molive'),
    (731166526,'2018-12-31', 'HKNDGS7CU31E9Z7JW', 'RAV4', 10001, 'Pablo Picasso', 5, 'Paige Turner'),
    (271135104,'2019-01-22', 'DAM41UDN3CHU2WVF7','V60 Cross Country', 30001, 'Napoléon Bonaparte', 7, 'Walter Melon');

SELECT invoices.invoice 'INVOICE', cars.vin 'CAR: VIN', cars.model 'CAR MODEL', customers.cust_id 'CUSTOMER ID', customers.name 'CUSTOMER', salespersons.staff_id 'STAFF ID', salespersons.name 'STAFF (SALES)'
FROM cars
LEFT JOIN  invoices
ON invoices.car_id = cars.vin
LEFT JOIN customers
ON customers.cust_id = invoices.customer_id
JOIN salespersons
ON salespersons.staff_id = invoices.salesperson_id
ORDER BY invoices.invoice;
