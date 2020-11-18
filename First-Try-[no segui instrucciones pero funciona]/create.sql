/*NOTA: NO SE CONTEMPLO INDEX ID GENERICO (INCREMENT), Y SE ARMARON LAS RELACIONES
DESDE LA CREACION DE LA TABLA, POR LO CUAL SE ADAPTO EL EJERCICIO AL DISENO PRESENTA
PARA EVITAR MAS MODIFICACIONES*/

USE lab_mysql;
CREATE TABLE cars (
  vin varchar(30) NOT NULL,
  manufacturer varchar(20) DEFAULT NULL,
  model varchar(30) DEFAULT NULL,
  year year DEFAULT NULL,
  color varchar(20) DEFAULT NULL,
  PRIMARY KEY (vin),
  KEY idx_vin (vin),
  KEY idx_model (model)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE customers (
  cust_id int NOT NULL,
  name varchar(50) DEFAULT NULL,
  phone_number varchar(20) DEFAULT NULL,
  email varchar(20) DEFAULT NULL,
  address varchar(50) DEFAULT NULL,
  city varchar(30) DEFAULT NULL,
  state_or_province varchar(30) DEFAULT NULL,
  country varchar(30) DEFAULT NULL,
  zip_or_postalcode varchar(10) DEFAULT NULL,
  PRIMARY KEY (cust_id),
  KEY idx_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE salespersons (
  staff_id int NOT NULL,
  name varchar(50) DEFAULT NULL,
  store_id varchar(20) DEFAULT NULL,
  PRIMARY KEY (staff_id),
  KEY idx_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE invoices (
  invoice int NOT NULL,
  date_issued date DEFAULT NULL,
  car_id varchar(30) DEFAULT NULL,
  car varchar(30) DEFAULT NULL,
  customer_id int DEFAULT NULL,
  customer varchar(50) DEFAULT NULL,
  salesperson_id int DEFAULT NULL,
  salesperson varchar(50) DEFAULT NULL,
  PRIMARY KEY (invoice),
  KEY car_id (car_id),
  KEY car (car),
  KEY customer_id (customer_id),
  KEY salesperson_id (salesperson_id),
  KEY customer (customer),
  KEY salesperson (salesperson),
  CONSTRAINT invoices_ibfk_2 FOREIGN KEY (car_id) REFERENCES cars (vin),
  CONSTRAINT invoices_ibfk_3 FOREIGN KEY (car) REFERENCES cars (model),
  CONSTRAINT invoices_ibfk_4 FOREIGN KEY (customer_id) REFERENCES customers (cust_id),
  CONSTRAINT invoices_ibfk_5 FOREIGN KEY (salesperson_id) REFERENCES salespersons (staff_id),
  CONSTRAINT invoices_ibfk_6 FOREIGN KEY (customer) REFERENCES customers (name),
  CONSTRAINT invoices_ibfk_7 FOREIGN KEY (salesperson) REFERENCES salespersons (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;