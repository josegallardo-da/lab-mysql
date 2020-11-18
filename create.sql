/*Nota: Este script es la version final que si contempla los ID con AUTOINCREMENT
ya que en el primer intento, no se contemplo esto sino se establecieron los keys sobre las
columnas que se iban estableciendo.*/

USE lab_mysql;
CREATE TABLE cars (
  id int NOT NULL AUTO_INCREMENT,
  vin varchar(30) DEFAULT NULL,
  manufacturer varchar(20) DEFAULT NULL,
  model varchar(30) DEFAULT NULL,
  year year DEFAULT NULL,
  color varchar(20) DEFAULT NULL,
  PRIMARY KEY (id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE customers (
  id int NOT NULL AUTO_INCREMENT,
  cust_id int DEFAULT NULL,
  name varchar(50) DEFAULT NULL,
  phone_number varchar(20) DEFAULT NULL,
  email varchar(20) DEFAULT NULL,
  address varchar(50) DEFAULT NULL,
  city varchar(30) DEFAULT NULL,
  state_or_province varchar(30) DEFAULT NULL,
  country varchar(30) DEFAULT NULL,
  zip_or_postalcode varchar(10) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE salespersons (
  id int NOT NULL AUTO_INCREMENT,
  staff_id int DEFAULT NULL,
  name varchar(50) DEFAULT NULL,
  store_id varchar(20) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE invoices (
  id int NOT NULL AUTO_INCREMENT,
  invoice int DEFAULT NULL,
  date_issued date DEFAULT NULL,
  cars_id int NOT NULL,
  customers_id int NOT NULL,
  salespersons_id int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cars_id) REFERENCES cars (id),
  FOREIGN KEY (customers_id) REFERENCES customers (id),
  FOREIGN KEY (salespersons_id) REFERENCES salespersons (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;