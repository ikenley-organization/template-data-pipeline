
-- Import raw CSV files from S3 into base tables
-- https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/PostgreSQL.Procedural.Importing.html

CREATE extension if not exists aws_s3 CASCADE;

CREATE schema if not exists raw;
-- AUTHORIZATION template_app_user

-------------------------------------------------------------------------------
-- customers

drop table if exists raw.customers;

CREATE TABLE raw.customers (
	id uuid,
	first_name text null,
	last_name text null,
	email text null,
	gender text null,
	_row_ int null
);

SELECT aws_s3.table_import_from_s3(
   'raw.customers',
   '',
   'CSV HEADER ENCODING ''WIN1252''',
   aws_commons.create_s3_uri('924586450630-data-lake', 'template-data-pipeline/raw/customers.csv', 'us-east-1')
);

select *
from raw.customers
limit 100
;


/*
upload: data\template-data-pipeline\raw\customers.csv to s3://924586450630-data-lake/
upload: data\template-data-pipeline\raw\locations.csv to s3://924586450630-data-lake/template-data-pipeline/raw/locations.csv
upload: data\template-data-pipeline\raw\orders_2018.csv to s3://924586450630-data-lake/template-data-pipeline/raw/orders_2018.csv
upload: data\template-data-pipeline\raw\orders_2019.csv to s3://924586450630-data-lake/template-data-pipeline/raw/orders_2019.csv
upload: data\template-data-pipeline\raw\orders_2017.csv to s3://924586450630-data-lake/template-data-pipeline/raw/orders_2017.csv
*/