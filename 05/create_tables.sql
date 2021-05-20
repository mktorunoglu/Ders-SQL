CREATE TABLE ClientMaster
(
	client_no VARCHAR(6) PRIMARY KEY NOT NULL,
	client_name VARCHAR(20),
	client_adress1 VARCHAR(30),
	client_adress2 VARCHAR(30),
	client_city VARCHAR(15),
	client_state VARCHAR(15),
	client_pin_code NUMERIC(6),
	client_bal_due NUMERIC(10,2)
)

CREATE TABLE ProductMaster
(
	product_no VARCHAR(6) PRIMARY KEY NOT NULL,
	product_description VARCHAR(100),
	product_profit_percent NUMERIC(6),
	product_unit_measure VARCHAR(6),
	product_qty_on_hand NUMERIC(8),
	product_reorder_level NUMERIC(6),
	product_sell_price NUMERIC(6),
	product_price NUMERIC(6)
)

CREATE TABLE SalesmanMaster
(
	salesman_no VARCHAR(6) PRIMARY KEY CHECK (salesman_no LIKE 'S%'),
	salesman_name VARCHAR(20) NOT NULL,
	salesman_adress VARCHAR(30) NOT NULL,
	salesman_city VARCHAR(20),
	salesman_state VARCHAR(20),
	salesman_pin_code NUMERIC(6),
	salesman_amt NUMERIC(8,2) NOT NULL CHECK (salesman_amt != 0),
	salesman_tgt_to_get NUMERIC(6,2) NOT NULL CHECK (salesman_tgt_to_get != 0),
	salesman_ytd_sales NUMERIC(6,2) NOT NULL CHECK (salesman_ytd_sales != 0),
	salesman_remarks VARCHAR(30)
)

CREATE TABLE SalesOrder
(
	sales_order_no VARCHAR(6) PRIMARY KEY CHECK (sales_order_no LIKE '0%'),
	sales_order_date DATE,
	sales_order_client_no VARCHAR(6) FOREIGN KEY REFERENCES ClientMaster(client_no),
	sales_order_dely_add VARCHAR(6),
	sales_order_salesman_no VARCHAR(6) FOREIGN KEY REFERENCES SalesmanMaster(salesman_no),
	sales_order_dely_type CHAR(1) DEFAULT 'f' CHECK (sales_order_dely_type = 'p' OR sales_order_dely_type = 'f'),
	sales_order_billed_yn CHAR(1),
	sales_order_dely_date DATE,
	CONSTRAINT check_sales_order_dely_date CHECK (sales_order_dely_date > sales_order_date),
	sales_order_status VARCHAR(10) CHECK (sales_order_status = 'in process' OR sales_order_status = 'fulfilled' OR sales_order_status = 'back order' OR sales_order_status = 'canceled')
)

CREATE TABLE SalesOrderDetails
(
	sales_order_details_order_no VARCHAR(6) FOREIGN KEY REFERENCES SalesOrder(sales_order_no),
	sales_order_details_product_no VARCHAR(6) FOREIGN KEY REFERENCES ProductMaster(product_no),
	sales_order_details_qty_order NUMERIC(8),
	sales_order_details_qty_disp NUMERIC(8),
	sales_order_details_product_rate NUMERIC(10,2)
)

