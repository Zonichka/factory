-- Добавление записи в таблице COLOR
create or replace procedure ADD_COLOR(color varchar) as
$$
DECLARE
color_ID integer;
balance real;
begin
color_ID = seq_color.nextval();
balance = 0;
begin
insert into COLOR
values (color_ID, color, balance);
exception
when unique_violation then raise NOTICE 'Такой цвет и тип краски уже есть';
end;
end;
$$LANGUAGE plpgsql;

-- Добавление записи в таблицу WOOD:
create or replace procedure ADD_WOOD(wood varchar) as
$$
DECLARE
wood_ID integer;
balance real;
begin
wood_ID = seq_wood.nextval();
balance = 0;
begin
insert into WOOD
values (wood_ID, wood, balance);
exception
when unique_violation then raise NOTICE 'Такой вид дерева уже есть';
end;
end;
$$LANGUAGE plpgsql;

-- Обновление количества краски и дерева:
CREATE OR REPLACE PROCEDURE update_color_balance(p_color_id integer, p_new_balance real) as 
$$
BEGIN
UPDATE color
SET balance = p_new_balance
WHERE color_id = p_color_id;
END;
$$LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE update_wood_balance(p_wood_id integer, p_new_balance real) as 
$$
BEGIN
UPDATE wood
SET balance = p_new_balance
WHERE wood_id = p_wood_id;
END;
$$LANGUAGE plpgsql;

-- Добавление нового материала
create or replace procedure ADD_MATERIAL(color_ID integer, wood_ID integer, material varchar) as
$$
DECLARE
material_ID integer;
begin
material_ID = seq_material.nextval();
begin
insert into MATERIAL
values (material_ID, color_ID, wood_ID, material);
exception
when unique_violation then raise NOTICE 'Такой материал уже есть';
end;
end;
$$LANGUAGE plpgsql;

-- Добавление нового продукта
create or replace procedure ADD_PRODUCT(product_name varchar, product_category varchar, product_size varchar, price real, material_ID integer) as
$$
DECLARE
product_ID integer;
begin
product_ID = seq_prod.nextval();
begin
insert into PRODUCT
values (product_ID, product_name, product_category, 
product_size, price, material_ID);
exception
when unique_violation then raise NOTICE 'Такой продукт уже есть';
end;
end;
$$LANGUAGE plpgsql;
