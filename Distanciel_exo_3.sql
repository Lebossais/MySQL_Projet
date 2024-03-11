Create database test_db;
use test_db;
-- table customer
Create table customers(
	customer_id BIGINT PRIMARY KEY, 
    customer_name VARCHAR(50), 
    `level` VARCHAR(50)) 
    ENGINE=INNODB;
Insert into customers (customer_id, customer_name, level )values('1','JOHN DOE','BASIC');
Insert into customers (customer_id, customer_name, level )values('2','MARY ROE','BASIC');
Insert into customers (customer_id, customer_name, level )values('3','JOHN DOE','VIP');

-- table customer_status
Create table customer_status(
	customer_id BIGINT PRIMARY KEY, 
    status_notes VARCHAR(50)) 
    ENGINE=INNODB;
    
-- table sales Cette table contiendra les données de vente (sales) relatives 
-- aux différents clients via la colonne customer_id :
Create table sales(
	sales_id BIGINT PRIMARY KEY, 
	customer_id BIGINT, 
    sales_amount DOUBLE)
    ENGINE=INNODB;
    
-- table audit_log pour enregistrer les mises à jour apportées 
-- à la table des ventes sales lorsque vous implémenterez le trigger AFTER UPDATE à l’étape 5
Create table audit_log(
	log_id BIGINT PRIMARY KEY AUTO_INCREMENT, 
    sales_id BIGINT, 
    previous_amount DOUBLE, 
    new_amount DOUBLE, 
	updated_by VARCHAR(50), 
    updated_on DATETIME) 
    ENGINE=INNODB;
    
delimiter $$
create trigger update_audit_log
after update on sales
for each row
begin
insert into audit_log values (null, old.sales_id, old.sales_amount, new.sales_amount, user() ,now());
end$$
delimiter ;

delimiter $$
create trigger suppression_sales
after delete on sales
for each row
begin
delete from customers where old.Customer_ID = customers.CustomerID;
end$$
delimiter ;