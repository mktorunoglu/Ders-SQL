CREATE VIEW on_gun_gecen_siparisler_view AS SELECT * FROM SalesOrder WHERE DATEDIFF(day, sales_order_date, sales_order_dely_date) >= 10

