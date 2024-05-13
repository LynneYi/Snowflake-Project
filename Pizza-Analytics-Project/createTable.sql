
create table pizza_sales as (
    pizza_id numeric(50,0),
    order_id numeric(50,0),
    pizza_name_id varchar(128),
    quantity numeric(50,0),
    order_date varchar(128),
    order_time varchar(128),
    unit_price numeric(50,2),
    total_price numeric(50,2),
    pizza_size varchar(128), 
    pizza_category varchar(128), 
    pizza_ingredients varchar(128), 
    pizza_name varchar(128)    
)
