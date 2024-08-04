create table CUSTOMER(
customer_ID integer not null primary key,
customer_name varchar,
customer_surname varchar,
customer_birthdate date,
street_address varchar(100),
house_address varchar(10),
postal_code integer,
flat_address integer
);

create table WOOD(
wood_ID integer not null primary key,
wood varchar,
balance real
);

create table COLOR(
color_ID integer not null primary key,
color varchar,
balance real
);

create table MATERIAL(
material_ID integer not null primary key,
color_ID integer not null unique,
wood_ID integer not null unique,
material varchar,
CONSTRAINT fk_color foreign key (color_ID) references COLOR (color_ID),
CONSTRAINT fk_wood foreign key (wood_ID) references WOOD (wood_ID)
);

create table PRODUCT(
product_ID integer not null primary key,
product_name varchar,
product_category varchar,
product_size varchar,
price real,
material_ID integer not null unique,
CONSTRAINT fk_material foreign key (material_ID) references MATERIAL (material_ID)
);



create table MANUFACTURING(
manufacturing_ID integer not null primary key,
manufacturing_date date,
quantity integer,
product_ID integer not null unique,
CONSTRAINT fk_product foreign key (product_ID) references PRODUCT (product_ID)
);

create table WAREHOUSE(
warehouse_ID integer not null primary key,
manufactoring_id integer not null unique,
CONSTRAINT fk_manufacturing foreign key (manufactoring_id) references MANUFACTURING (manufactoring_id)
);

create table DELIVERY(
delivery_ID integer not null primary key,
warehouse_ID integer not null unique,
CONSTRAINT fk_warehouse foreign key (warehouse_ID) references WAREHOUSE (warehouse_ID),
customer_ID integer not null unique,
CONSTRAINT fk_customer foreign key (customer_ID) references CUSTOMER (customer_ID),
status varchar
);

create table SALE(
sale_ID integer not null primary key,
product_ID integer not null unique,
CONSTRAINT fk_product foreign key (product_ID) references PRODUCT (product_ID),
sale_date date,
quantity integer,
status varchar,
customer_ID integer not null unique,
CONSTRAINT fk_customer foreign key (customer_ID) references CUSTOMER (customer_ID)
);
