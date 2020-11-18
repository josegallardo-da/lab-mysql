/*Puesto que corregi los errores que se iban a modificar en el Bonus Challenge,
en este script crearemos los errores y luegos los corregiremos*/

USE lab_mysql

SELECT *
FROM cars

/*Creacion de ERROR*/

UPDATE cars
SET vin = 'DAM41UDN3CHU2WVF6'
WHERE id = 6;

/*Solucion de ERROR*/
DELETE FROM cars
WHERE id=5;
-- nota: puesto que en sql los ids se cuentan a partir de 1, en vez de ser 4 como en el ejercicio, es 5 --



