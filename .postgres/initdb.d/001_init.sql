-- -*- coding: utf-8 -*-
-- Created by Luis Enrique Fuentes Plata

-- creating schemas
create schema raw_data;
create schema staging;

-- Creating tables
create table raw_data.raw_netflix_titles
( 
	show_id text null,
	show_type text null,
	title text null,
	director text null,
	show_cast text null,
	country text null,
	date_added text null,
	release_year text null,
	rating text null,
	duration text null,
	listed_in text null,
	description text null  
);



-- create table staging.TECHNOLOGY_CAPABILITY (
-- 	technology_capability_id serial not null primary key, 
-- 	technology_capability_name varchar(50) not null
-- );
    
-- create table staging.TECHNOLOGY_STACK
-- ( 
--   technology_stack_id serial not null primary key,
--   technology_stack_name varchar(40) not null,
--   technology_capability_id integer not null, 
--   constraint fk_technology_cap_id foreign key (technology_capability_id) REFERENCES staging.TECHNOLOGY_CAPABILITY (technology_capability_id)
-- );

-- Inserting data
-- BEGIN;

--     INSERT INTO staging.TECHNOLOGY_CAPABILITY (technology_capability_name) 
--      VALUES ('Backend'),('Infrastructure'),('Data');
    
-- COMMIT;

-- BEGIN;

--     INSERT INTO staging.TECHNOLOGY_STACK (technology_stack_name, technology_capability_id) 
--      VALUES ('Docker',2),('AWS',2),('Nginx',2);
    
-- COMMIT;
