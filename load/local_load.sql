
-- Import raw CSV files from S3 into base tables
-- https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/PostgreSQL.Procedural.Importing.html

CREATE schema if not exists raw;
-- AUTHORIZATION template_app_user

-------------------------------------------------------------------------------
-- customers

drop table if exists raw.customers;

CREATE TABLE raw.customers (
	id text,
	first_name text null,
	last_name text null,
	email text null,
	gender text null,
	_row_ int null
);

COPY raw.customers FROM 'C:\Users\Public\data\template-data-pipeline\raw\customers.csv' CSV HEADER;

select *
from raw.customers
limit 100
;

-------------------------------------------------------------------------------
-- locations

drop table if exists raw.locations;

CREATE TABLE raw.locations (
	id text,
	city text null,
	state text null,
	zip text null,
	_row_ int null
);

COPY raw.locations FROM 'C:\Users\Public\data\template-data-pipeline\raw\locations.csv' CSV HEADER;

select *
from raw.locations
limit 100
;

-------------------------------------------------------------------------------
-- orders_2017

drop table if exists raw.orders_2017;

CREATE TABLE raw.orders_2017 (
	id text,
	"date" date null,
	amount text null,
	customer_id text null,
	location_id text null
);

copy raw.orders_2017 FROM 'C:\Users\Public\data\template-data-pipeline\raw\orders_2017.csv' CSV HEADER;

select *
from raw.orders_2017
limit 100
;

-------------------------------------------------------------------------------
-- orders_2018

drop table if exists raw.orders_2018;

CREATE TABLE raw.orders_2018 (
	id text,
	"date" date null,
	amount text null,
	customer_id text null,
	location_id text null
);

copy raw.orders_2018 FROM 'C:\Users\Public\data\template-data-pipeline\raw\orders_2018.csv' CSV HEADER;

select *
from raw.orders_2018
limit 100
;

-------------------------------------------------------------------------------
-- orders_2019

drop table if exists raw.orders_2019;

CREATE TABLE raw.orders_2019 (
	id text,
	"date" date null,
	amount text null,
	customer_id text null,
	location_id text null
);

copy raw.orders_2019 FROM 'C:\Users\Public\data\template-data-pipeline\raw\orders_2019.csv' CSV HEADER;

select *
from raw.orders_2019
limit 100
;
