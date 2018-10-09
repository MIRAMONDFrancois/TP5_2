/*
 *  $Id: sampledata.sql 3348 2009-12-15 14:24:19Z unsaved $
 *
 *  Creates and populates database objects with sample data.
 *  This file was created by grabbing the commands made by creating
 *  sample data with the DatabaseManager utility.
 */

DROP TABLE Item IF EXISTS;
DROP TABLE Invoice IF EXISTS;
DROP TABLE Product IF EXISTS;
DROP TABLE Customer IF EXISTS;

CREATE TABLE Customer(ID INTEGER IDENTITY,FirstName VARCHAR(20),LastName VARCHAR(30),Street VARCHAR(50),City VARCHAR(25));
CREATE TABLE Product(ID INTEGER IDENTITY,Name VARCHAR(30),Price DECIMAL(10,2));
CREATE TABLE Invoice(ID INTEGER IDENTITY,CustomerID INTEGER,Total DECIMAL(10,2) DEFAULT 0, FOREIGN KEY (CustomerId) REFERENCES Customer(ID) ON DELETE CASCADE);
CREATE TABLE Item(InvoiceID INTEGER,Item INTEGER,ProductID INTEGER,Quantity INTEGER,Cost DECIMAL(10,2),PRIMARY KEY(InvoiceID,Item), FOREIGN KEY (InvoiceId) REFERENCES Invoice (ID) ON DELETE CASCADE, FOREIGN KEY (ProductId) REFERENCES Product(ID) ON DELETE CASCADE);

-- Contrainte d'intégrité : le prix d'un article doit être positif ou nul
ALTER TABLE Product ADD CONSTRAINT PositivePrice CHECK (Price >= 0.0);

-- Contrainte d'intégrité : le coût d'un item doit être positif ou nul
ALTER TABLE Item ADD CONSTRAINT PositiveCost CHECK ( Cost >= 0.0);

-- Contrainte d'intégrité : les quantités d'item doivent être positives
ALTER TABLE Item ADD CONSTRAINT PositiveQuantity CHECK ( Quantity > 0);

COMMIT;
