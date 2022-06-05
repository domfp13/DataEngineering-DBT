-- -*- coding: utf-8 -*-
-- Created by Luis Enrique Fuentes Plata

-- creating schemas
create schema raw_data;

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

-- Creating stg schema for transformation 
create schema stg;

