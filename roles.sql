CREATE ROLE administrator WITH
LOGIN
SUPERUSER
CREATEDB
CREATEROLE
INHERIT
REPLICATION
CONNECTION LIMIT -1;
CREATE ROLE manager WITH
LOGIN
SUPERUSER
CREATEDB
CREATEROLE
INHERIT
REPLICATION
CONNECTION LIMIT -1;
CREATE ROLE supervisor WITH
LOGIN
SUPERUSER
CREATEDB
CREATEROLE
INHERIT
REPLICATION
CONNECTION LIMIT -1;
CREATE ROLE delivery WITH
LOGIN
SUPERUSER
CREATEDB
CREATEROLE
INHERIT
REPLICATION
CONNECTION LIMIT -1;
CREATE ROLE storekeeper WITH
LOGIN
SUPERUSER
CREATEDB
CREATEROLE
INHERIT
REPLICATION
CONNECTION LIMIT -1;
CREATE ROLE "read_only_role_supervisor";
CREATE ROLE "read_only_role_manager";
CREATE ROLE "read_only_role_storekeeper";
CREATE ROLE "read_only_role_delivery";
CREATE ROLE "read_write_role";
GRANT SELECT ON TABLE
product, warehouse, color, wood, material TO read_only_role_storekeeper;
GRANT SELECT ON TABLE
customer, product, delivery, sale TO read_only_role_manager;
GRANT SELECT ON TABLE
warehouse, sale, delivery TO read_only_role_delivery;
GRANT SELECT ON TABLE
warehouse, manufacturing, material, product TO read_only_role_supervisor;
GRANT SELECT, INSERT, UPDATE, DELETE on table
color, material, wood, product, manufacturing, warehouse, delivery, customer, sale TO read_write_role;
GRANT read_only_role_storekeeper TO storekeeper;
GRANT read_only_role_supervisor TO supervisor;
GRANT read_only_role_manager TO manager;
GRANT read_only_role_delivery TO delivery;
GRANT read_write_role TO administrator;

