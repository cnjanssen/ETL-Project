CREATE TABLE "precint" (
    "precint_id" int   NOT NULL,
    "borough" varchar   NOT NULL,
    CONSTRAINT "pk_precint" PRIMARY KEY (
        "precint_id"
     )
);

drop table borough;
create table borough(
	borough_name varchar,
	 CONSTRAINT "pk_borough" PRIMARY KEY (
        "borough_name"
     )
);

drop table zipborough;
CREATE TABLE "zipborough" (
    "borough_id" varchar   NOT NULL,
    "zipcode" int   NOT NULL
   
);

drop table parking_tickets;
CREATE TABLE "parking_tickets" (
	id int not null,
    "summons_number" float   NOT NULL,
    "plate_id" varchar   NOT NULL,
    "registration_state" varchar   NOT NULL,
    "plate_type" varchar   NOT NULL,
    "issue_date" varchar   NOT NULL,
    "violation_code" int   NOT NULL,
    "vehicle_body_type" varchar   NOT NULL,
    "vehicle_make" varchar   NOT NULL,
    "issuing_agency" varchar   NOT NULL,
    "issuer_precinct" int   NOT NULL,
    "violation_county" varchar   NOT NULL,
    "vehicle_year" int   NOT NULL,
    "violation_post_code" varchar   NOT NULL,
    "violation_description" varchar   NOT NULL,
    "is_date" timestamp   NOT NULL,
    "year" int   NOT NULL,
    CONSTRAINT "pk_parking_tickets" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "NYPD_Complaints" (
    "CMPLNT_NUM" integer   NOT NULL,
    "ADDR_PCT_CD" smallint   NOT NULL,
    "RPT_DT" date   NOT NULL,
    "KY_CD" smallint   NOT NULL,
    "OFNS_DESC" varchar   NOT NULL,
    "PD_CD" smallint   NOT NULL,
    "PD_DESC" varchar   NOT NULL,
    "CRM_ATPT_CPTD_CD" varchar   NOT NULL,
    "LAW_CAT_CD" varchar   NOT NULL,
    "BORO_NM" varchar   NOT NULL,
    "Latitude" float   NOT NULL,
    "Longitude" float   NOT NULL,
    "PATROL_BORO" varchar   NOT NULL,
    "RPT_YEAR" int   NOT NULL,
    CONSTRAINT "pk_NYPD_Complaints" PRIMARY KEY (
        "CMPLNT_NUM"
     )
);

drop table NYC_Restaurant_Inspection;
Create table NYC_Restaurant_Inspection(
dbm_num integer PRIMARY KEY,
DBA VARCHAR,
BORO VARCHAR,
BUILDING VARCHAR,
STREET VARCHAR,
ZIPCODE int,
PHONE VARCHAR,
CUISINE_DESCRIPTION VARCHAR,
INSPECTION_DATE date,
ACTN VARCHAR,
RECORD_DATE date,
INSPECTION_TYPE VARCHAR,
VIOLATION_CODE VARCHAR,
VIOLATION_DESCRIPTION text,
INSPECTION_DATETIME date,
INSPECTION_YEAR integer,
FOREIGN KEY (BORO) REFERENCES borough(borough_name) );

drop table pollution;
CREATE TABLE "pollution" (
    "pm" DECIMAL   NOT NULL,
    "units" varchar   NOT NULL,
    "daily_aqi_value" int   NOT NULL,
    "site_name" varchar   NOT NULL,
    "site_lat" float   NOT NULL,
    "site_long" float   NOT NULL,
    "borough" varchar   NOT NULL,
    "year" int   NOT NULL,
    "date" Date   NOT NULL,
    "month" int   NOT NULL,
	FOREIGN KEY (borough) REFERENCES borough(borough_name)
);

drop table nyccollisions;
create table nyccollisions (
	ACCIDENT_DATE date,
	ACCIDENT_TIME time,
	BOROUGH varchar,
	ZIPCODE FLOAT,
	LATITUDE FLOAT,
	LONGITUDE FLOAT,
	STREET VARCHAR,
	CROSS_STREET VARCHAR,
	PERSONS_INJURED float,
	PERSONS_KILLED float,
	PEDESTRIANS_INJURED float,
	PEDESTRIANS_KILLED  float,
	CYCLIST_INJURED float,
	CYCLIST_KILLED float,
	MOTORIST_INJURED float,
	MOTORIST_KILLED float,
	COLLISION_ID INTEGER PRIMARY KEY,
	YEAR INTEGER,
	FOREIGN KEY (BOROUGH) REFERENCES borough(borough_name)
);
drop table crime;
create table crime(
id serial PRIMARY KEY,
pct       INT,
crime     TEXT,
"2012"     float,
"2013"       INT,
"2014"       INT,
"2015"       INT,
"2016"       INT,
"2017"       INT,
"2018"       INT,
FOREIGN KEY (pct) REFERENCES precint(precint_id)
);

ALTER TABLE "parking_tickets" ADD CONSTRAINT "fk_parking_tickets_issuer_precinct" FOREIGN KEY("issuer_precinct")
REFERENCES "precint" ("precint_id");

ALTER TABLE "NYPD_Complaints" ADD CONSTRAINT "fk_NYPD_Complaints_ADDR_PCT_CD" FOREIGN KEY("ADDR_PCT_CD")
REFERENCES "precint" ("precint_id");

ALTER TABLE "NYC_Restaurant_Inspection" ADD CONSTRAINT "fk_NYC_Restaurant_Inspection_ADDR_PCT_CD" FOREIGN KEY("ADDR_PCT_CD")
REFERENCES "precint" ("precint_id");

ALTER TABLE "pollution" ADD CONSTRAINT "fk_pollution_borough" FOREIGN KEY("borough")
REFERENCES "zipborough" ("borough_name");


Drop Table NYC_Restaurant_Inspection;

select * from zipborough;
select * from borough;
