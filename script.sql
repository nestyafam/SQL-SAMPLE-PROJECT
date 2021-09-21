DROP TABLE IF EXISTS payment
CREATE TABLE payment (
    payment_id INT NOT NULL,
    sales_tax CHAR(30) NOT NULL,
	payment_due_date DATE NOT NULL,
	VAT_in_price INT  NOT NULL,
	payment_terms CHAR (50) NOT NULL,
	order_number INT NOT NULL,
	customer_id BIGINT NOT NULL,
	customer_name CHAR (50),
	customer_address CHAR (50) NOT NULL,
	customer_city CHAR(50) NOT NULL,
	customer_state CHAR(50) NOT NULL,
	customer_zipcode INT NOT NULL,
	CONSTRAINT payment_payment_id_pk PRIMARY KEY (payment_id) 
   
);


ALTER TABLE payment  
ADD CONSTRAINT payment_customer_id_fk
	FOREIGN KEY (customer_id)
	REFERENCES customer(customer_id)
ALTER TABLE payment
	ADD CONSTRAINT payment_VAT_in_price_ck
		CHECK ( VAT_in_price = 0.075)
ALTER TABLE payment
	ADD CONSTRAINT payments_order_number_ck
	CHECK (order_number IS NULL)



/* CREATING EMPLOYEE TABLE*/
/*DROP TABLE IF EXISTS customer;*/

CREATE TABLE customer( 
	customer_id  BIGINT NOT NULL,
	customer_name CHAR(50) NOT NULL,
	customer_address CHAR(50) NOT NULL,
	customer_city CHAR(50) NOT NULL,
	customer_state CHAR(50) NOT NULL,
	customer_zipcode INT NOT NULL,
	CONSTRAINT customer_customer_id_pk PRIMARY KEY (customer_id) 
);
 
ALTER TABLE customer 
	ADD CONSTRAINT customer_city_ck
	CHECK (customer_city IN ('Lagos'));

INSERT INTO customer
	(customer_id,customer_name,customer_address,customer_city,customer_state,customer_zipcode)
VALUES(4110133960,'Corolla Sales Company','15 Cars Road Railway Compound','Ikeja','Lagos',124214)
INSERT INTO customer
	(customer_id,customer_name,customer_address,customer_city,customer_state,customer_zipcode)
VALUES(4130133915,'Alvin Clark','211 Chatter estate','Victoria','Lagos', 211411);
INSERT INTO customer
	(customer_id,customer_name,customer_address,customer_city,customer_state,customer_zipcode)
VALUES(5130133915, 'Matthew Ferdinand', '6, Church Street', 'Volks', 'Lagos', 554322);
INSERT INTO customer
	(customer_id,customer_name,customer_address,customer_city,customer_state,customer_zipcode)
VALUES(2130133915,'Tim Bernard and Sons LTD', 'Plot 2A, Ijora Drive', 'Orile', 'Lagos', 211112);
INSERT INTO customer
	(customer_id,customer_name,customer_address,customer_city,customer_state,customer_zipcode)
VALUES(2630133915, 'Apollo cars repair services', '8,Google Drive Island', 'GRA', 'Lagos', 242424);
INSERT INTO customer
	(customer_id,customer_name,customer_address,customer_city,customer_state,customer_zipcode)
VALUES(3133133915,'Chrome Cars Service company','20, Chrome Cars Estate','Ikeja', 'Lagos', 124124);
INSERT INTO customer
	(customer_id,customer_name,customer_address,customer_city,customer_state,customer_zipcode)
VALUES(3133133385,'Formular One Driving Academy','88,Chevron estate','Ikoyi','Lagos', 129219 );
INSERT INTO customer
	(customer_id,customer_name,customer_address,customer_city,customer_state,customer_zipcode)
VALUES(51301339134,'Mark Marson', '1010, Creeek Estate drive','VGC','Lagos', 122324);
INSERT INTO customer
	(customer_id,customer_name,customer_address,customer_city,customer_state,customer_zipcode)
VALUES(44301339134,'Gt_tyres global sales','772, groop estate','VGC','Lagos', 122324);
INSERT INTO customer
	(customer_id,customer_name,customer_address,customer_city,customer_state,customer_zipcode)
VALUES(4301339139,'John brew car training', '200, york new street','VGC','Lagos', 554322);
	/* Creating Customer Table */
DROP TABLE IF EXISTS invoice;

CREATE TABLE invoice (
	invoice_no INT NOT NULL,
	order_no INT NOT NULL,
	posting_date  DATE NOT NULL,
	due_date  DATE NOT NULL,
	documentation_date  DATE NOT NULL,
	payment_terms CHAR(50) NOT NULL,
	payment_id INT NOT NULL,
	shipment_method CHAR (50) NOT NULL,
	vat_in_price INT NOT NULL,
	tyre_id INT NOT NULL,
	tyre_description CHAR (50) NOT NULL,
	tyre_manudfacture_date DATE NOT NULL,
	posted_shipment_date DATE NOT NULL,
	unit_of_measurement INT NOT NULL,
	unit_price INT NOT NULL,
	discount INT NOT NULL,
	vat_identifier_val INT NOT NULL,
	supplier_id INT NOT NULL,
	supplier_name CHAR(50) NOT NULL,
	supplier_address CHAR(50) NOT NULL,
	supplier_zipcode CHAR(50) NOT NULL,
	supplier_phone CHAR(50) NOT NULL,
	supplier_fax CHAR(50) NOT NULL,
	account_number INT NOT NULL,
	home_page VARCHAR (MAX),
	vat_reg_no INT NOT NULL,
	bank CHAR (50) NOT NULL,
	customer_id INT NOT NULL,
	customer_name CHAR(50) NOT NULL ,
	customer_address CHAR(50) NOT NULL ,
	customer_city CHAR(50) NOT NULL ,
	customer_state CHAR(50) NOT NULL ,
	customer_zipcode CHAR(50) NOT NULL ,
	CONSTRAINT invoice_invoice_no_pk PRIMARY KEY (invoice_no) 
	);
ALTER TABLE invoice 
ADD CONSTRAINT invoice_payment_id_fk
	FOREIGN KEY (payment_id)
	REFERENCES payment(payment_id)
ALTER TABLE payment  
ADD CONSTRAINT invoice_tyre_id_fk
	FOREIGN KEY (tyre_id)
	REFERENCES tyre(tyre_id)
ALTER TABLE payment  
ADD CONSTRAINT invoice_supplier_id_fk
	FOREIGN KEY (supplier_id)
	REFERENCES supplier(supplier_id)
ALTER TABLE invoice
	ADD CONSTRAINT CHK_invoice CHECK (posting_date <> due_date)


/* Creating Order Table*/
DROP TABLE IF EXISTS tyre;

CREATE TABLE tyre(
	tyre_id BIGINT NOT NULL,
	tyre_description CHAR(50) NOT NULL,
	tyre_manufacture_date INT  NOT NULL,
	warehouse_location CHAR (20),
	tyre_business_type CHAR(30) NOT NULL,
	tyre_business_line CHAR (20) NOT NULL,
	tyre_production_line CHAR (20) NOT NULL,
	tyre_weight BIGINT NOT NULL,
	tyre_price BIGINT NOT NULL,
	vat BIGINT NOT NULL,
	discount BIGINT NOT NULL,
	CONSTRAINT tyre_tyre_id_pk PRIMARY KEY (tyre_id) 
);
ALTER TABLE tyre
	ADD CONSTRAINT tyre_tyre_manufacture_date_range_ck
		CHECK (tyre_manufacture_date > 2014);
INSERT INTO tyre
	(tyre_id,tyre_description,tyre_manufacture_date,warehouse_location,tyre_business_type,tyre_business_line,tyre_production_line,tyre_weight,tyre_price,vat,discount)
VALUES(110218,'8.25 R 15 XZM TL 153 A5', 2019,'WH1R5L1-L3','B2B','OHT','GC', 50, 200, 7.5, 15);
INSERT INTO tyre
	(tyre_id,tyre_description,tyre_manufacture_date,warehouse_location,tyre_business_type,tyre_business_line,tyre_production_line,tyre_weight,tyre_price,vat,discount)
VALUES(123708,'405/70 R20 136G TL XM47', 2021, 'OS1','B2B','OHT','AG', 69,110, 7.5, 15);
INSERT INTO tyre
	(tyre_id,tyre_description,tyre_manufacture_date,warehouse_location,tyre_business_type,tyre_business_line,tyre_production_line,tyre_weight,tyre_price,vat,discount)
VALUES(313002,'205/65 R15 94V TL ENERGY XM2 + MI', 2021,'WH1R4L4-L6','B2C','AGB','TC', 9.7, 129, 7.5 , 15);
INSERT INTO tyre
	(tyre_id,tyre_description,tyre_manufacture_date,warehouse_location,tyre_business_type,tyre_business_line,tyre_production_line,tyre_weight,tyre_price,vat,discount)
VALUES(91877,'295/35 R21 107Y XL TL PILOT SPORT 4 SUV MI', 2020,'WH1R4L1-L3','B2C','AGB','TC', 15.992, 120, 7.5, 15);
INSERT INTO tyre
	(tyre_id,tyre_description,tyre_manufacture_date,warehouse_location,tyre_business_type,tyre_business_line,tyre_production_line,tyre_weight,tyre_price,vat,discount)
VALUES(666924,'195/80 R 15C 108/106S TL AGILIS 3  RC MI', 2021,'WH1R3L1L2','B2B','URB','TC', 13.3 ,2100, 7.5, 15);
INSERT INTO tyre
	(tyre_id,tyre_description,tyre_manufacture_date,warehouse_location,tyre_business_type,tyre_business_line,tyre_production_line,tyre_weight,tyre_price,vat,discount)
VALUES(52151,'195 R 15C 106/104R TL AGILIS MI', 2020,'WH1R1L1-L3','B2B','URB','TC', 13.5, 700, 7.5, 15);
INSERT INTO tyre
	(tyre_id,tyre_description,tyre_manufacture_date,warehouse_location,tyre_business_type,tyre_business_line,tyre_production_line,tyre_weight,tyre_price,vat,discount)
VALUES(777386,'205/55 R16 91V TL PRIMACY 4 MI', 2021,'WH2R3L7','B2C','AGB','TC', 8.4, 150, 7.5, 15);
INSERT INTO tyre
	(tyre_id,tyre_description,tyre_manufacture_date,warehouse_location,tyre_business_type,tyre_business_line,tyre_production_line,tyre_weight,tyre_price,vat,discount)
VALUES(744945,'245/35 ZR18 92Y XL TL PILOT SPORT 3 ZP GRNX MI', 2021,'WH1R2L4L5','B2C','AGB','TC', 11.3,300, 7.5, 15);
INSERT INTO tyre
	(tyre_id,tyre_description,tyre_manufacture_date,warehouse_location,tyre_business_type,tyre_business_line,tyre_production_line,tyre_weight,tyre_price,vat,discount)
VALUES(756060,'7.00 R 16 LT ROUTE CONTROL 117/116L GO', 2021,'WH1R5L7-L10','B2B','URB','PL', 20.1,1200, 7.5, 15);
INSERT INTO tyre
	(tyre_id,tyre_description,tyre_manufacture_date,warehouse_location,tyre_business_type,tyre_business_line,tyre_production_line,tyre_weight,tyre_price,vat,discount)
VALUES(757584,'11R24.5 X LINE ENERGY Z TL LRH VB MI', 2021,'WH1R5L7-L10','B2B','TLD','PL', 57.8, 150, 7.5, 15);

/* Creating Supplier Table*/
DROP TABLE IF EXISTS supplier;

CREATE TABLE supplier (
	supplier_id INT  NOT NULL,
	supplier_name CHAR(30) NOT NULL,
	supplier_address CHAR(50) NOT NULL,
	supplier_zipcode INT NOT NULL,
	supplier_phone INT NOT NULL,
	supplier_fax INT NOT NULL,
	supplier_business_line CHAR(50) NOT NULL,
	supplier_production_line CHAR(50) NOT NULL,
	supplier_sourcing CHAR(50) NOT NULL,
	supplier_business_type CHAR(50) NOT NULL,
	tyre_id INT NOT NULL,
	CONSTRAINT supplier_supplier_id_pk PRIMARY KEY (supplier_id) 
);
ALTER TABLE supplier  
ADD CONSTRAINT supplier_tyre_id_fk
	FOREIGN KEY (tyre_id)
	REFERENCES tyre(tyre_id)


/* Creating Stock Table */
DROP TABLE IF EXISTS inventory;

CREATE TABLE inventory (
	inventory_id INT NOT NULL,
	tyre_id INT NOT NULL,
	tyre_quantity INT NOT NULL,
	tyre_location CHAR(50) NOT NULL,
	tyre_manufacturer CHAR (50),
	supplier_id INT NOT NULL,
	supplier_address CHAR(50)
	CONSTRAINT inventory_inventory_id_pk PRIMARY KEY (inventory_id) 
);
ALTER TABLE inventory  
ADD CONSTRAINT inventory_tyre_id_fk
	FOREIGN KEY (tyre_id)
	REFERENCES tyre(tyre_id)
ALTER TABLE supplier  
ADD CONSTRAINT inventory_supplier_id_fk
	FOREIGN KEY (supplier_id)
	REFERENCES supplier(supplier_id)


CREATE TABLE customer_location(
	customer_city CHAR (20) NOT NULL,
	customer_state CHAR (20) NOT NULL,
	customer_zipcode INT NOT NULL
)
INSERT INTO customer_location
	(customer_city, customer_state, customer_zipcode)
VALUES('Ikeja','Lagos', 124214);
INSERT INTO customer_location
	(customer_city, customer_state, customer_zipcode)
VALUES('Victoria','Lagos', 211411);
INSERT INTO customer_location
	(customer_city, customer_state, customer_zipcode)
VALUES('Volks','Lagos', 554322);
INSERT INTO customer_location
	(customer_city, customer_state, customer_zipcode)
VALUES('Orile','Lagos', 211112);
INSERT INTO customer_location
	(customer_city, customer_state, customer_zipcode)
VALUES('GRA','Lagos', 242424);
INSERT INTO customer_location
	(customer_city, customer_state, customer_zipcode)
VALUES('Ikeja','Lagos', 124124);
INSERT INTO customer_location
	(customer_city, customer_state, customer_zipcode)
VALUES('Ikoyi','Lagos', 129219);
INSERT INTO customer_location
	(customer_city, customer_state, customer_zipcode)
VALUES('VGC','Lagos', 122324);
INSERT INTO customer_location
	(customer_city, customer_state, customer_zipcode)
VALUES('VGC','Lagos', 122324);
INSERT INTO customer_location
	(customer_city, customer_state, customer_zipcode)
VALUES('VGC','Lagos', 554322);
 
 DROP TABLE IF EXISTS report

 CREATE TABLE report (
 customer_id BIGINT NOT NULL,
 tyre_id INT NOT NULL,
 quantity INT NOT NULL,
 invoice_number CHAR (50),
 order_number CHAR (50),
 posting DATE NOT NULL,
 due_date DATE NOT NULL,
 document DATE NOT NULL,
 total_price INT NOT NULL
 )
INSERT INTO report
	(customer_id,tyre_id,quantity,invoice_number,order_number,posting,due_date,document,total_price)
VALUES(4110133960, 110218, 20, 'IN21-11221','OR21-14221','06-27-2021','07-21-2021','06-27-2021', 3655.0);
INSERT INTO report
	(customer_id,tyre_id,quantity,invoice_number,order_number,posting,due_date,document,total_price)
VALUES(4110133960, 313002, 25,'IN21-11221','OR21-14221','06-28-2021','07-22-2021','06-22-2021', 2946.8);
INSERT INTO report
	(customer_id,tyre_id,quantity,invoice_number,order_number,posting,due_date,document,total_price)
VALUES(4110133960, 123708, 40,'IN21-11221','OR21-14221','06-23-2021','07-22-2021','06-23-2021', 4020.5);
INSERT INTO report
	(customer_id,tyre_id,quantity,invoice_number,order_number,posting,due_date,document,total_price)
VALUES(4130133960, 313002, 15,'IN21-11231','OR21-14233','05-28-2021','06-22-2021','05-22-2021', 1768.1);
INSERT INTO report
	(customer_id,tyre_id,quantity,invoice_number,order_number,posting,due_date,document,total_price)
VALUES(4130133960, 91877, 21,'IN21-11231','OR21-14233','06-18-2021','07-12-2021','06-12-2021',2302.7);
INSERT INTO report
	(customer_id,tyre_id,quantity,invoice_number,order_number,posting,due_date,document,total_price)
VALUES(4130133960, 666924, 3,'IN21-11111','OR21-12111','02-28-2021','03-22-2021','02-22-2021', 5756.6);
INSERT INTO report
	(customer_id,tyre_id,quantity,invoice_number,order_number,posting,due_date,document,total_price)
VALUES(4130133915, 52151, 4,'IN21-12311','OR21-22112','06-18-2021','07-21-2021','06-12-2021',2558.5);
INSERT INTO report
	(customer_id,tyre_id,quantity,invoice_number,order_number,posting,due_date,document,total_price)
VALUES(4130133915, 777386, 2,'IN21-12311','OR21-22112','06-22-2021','07-02-2021','06-21-2021',274.1);
INSERT INTO report
	(customer_id,tyre_id,quantity,invoice_number,order_number,posting,due_date,document,total_price)
VALUES(5130133915, 744945, 10,'IN21-13211','OR21-21221','06-21-2021','07-21-2021','06-12-2021',2741.3);
INSERT INTO report
	(customer_id,tyre_id,quantity,invoice_number,order_number,posting,due_date,document,total_price)
VALUES(5130133915, 756060, 10,'IN21-13211','OR21-21221','06-21-2021','07-12-2021','06-22-2021',10965.0);


SELECT customer_id,tyre_id,quantity, invoice_number,order_number,posting,due_date,document,total_price FROM report 

SELECT tyre.tyre_id,tyre_description,tyre_manufacture_date,warehouse_location,tyre_business_type,tyre_business_line,
tyre_production_line,tyre_weight,tyre_price,vat,discount FROM tyre LEFT JOIN report ON tyre.tyre_id = report.tyre_id WHERE 
report.tyre_id IS NULL ORDER BY tyre_id

SELECT customer.customer_id,customer_name,customer_address,customer_city,customer_state,customer_zipcode FROM customer
LEFT JOIN report ON customer.customer_id = report.customer_id WHERE report.customer_id IS NULL ORDER BY customer_id
