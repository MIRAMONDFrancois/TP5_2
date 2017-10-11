CREATE TRIGGER insertItem AFTER INSERT ON Item
	REFERENCING NEW ROW AS newrow
	FOR EACH ROW
		UPDATE Invoice 
		SET Total = Total + (newrow.Cost * newrow.Quantity) 
		WHERE ID = newrow.InvoiceID;

CREATE TRIGGER updateItem AFTER UPDATE ON Item
	REFERENCING NEW ROW AS newrow OLD ROW as oldrow
	FOR EACH ROW			
		UPDATE Invoice 
		SET Total = SELECT SUM(Cost*Quantity) FROM Item WHERE InvoiceID=Invoice.ID 
		WHERE (ID = oldrow.InvoiceID) OR (ID = newrow.InvoiceID);


CREATE TRIGGER deleteItem AFTER DELETE ON Item
	REFERENCING OLD ROW AS oldrow
	FOR EACH ROW
		UPDATE Invoice 
		SET Total = Total - (oldrow.Cost * oldrow.Quantity) 
		WHERE ID = oldrow.InvoiceID;

COMMIT;
