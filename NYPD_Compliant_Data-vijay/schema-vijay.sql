CREATE TABLE precincts_boroughs(
   precinct_id SMALLINT PRIMARY KEY,
   borough varchar);
   
 Create table NYPD_Complaints(
CMPLNT_NUM integer PRIMARY KEY,
ADDR_PCT_CD smallint REFERENCES precincts_boroughs(precinct_id),
RPT_DT date,
KY_CD smallint,
OFNS_DESC VARCHAR,
PD_CD smallint,
PD_DESC varchar,
CRM_ATPT_CPTD_CD varchar,
LAW_CAT_CD varchar,
BORO_NM VARCHAR,
Latitude float,
Longitude float,
PATROL_BORO VARCHAR,
RPT_YEAR integer);