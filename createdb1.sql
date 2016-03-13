CREATE TABLE FENCES
("FENCE_ID" NUMBER, 
"FENCE_SHAPE" "SDO_GEOMETRY", 
"EXPIRATIONTIME" TIMESTAMP (6), 
"VALIDITY" NUMBER, 
"INFO" VARCHAR2(250 BYTE), 
"SECURITY_LEVEL" NUMBER,
constraint pk_fence_id PRIMARY KEY(FENCE_ID)
);
 
INSERT INTO USER_SDO_GEOM_METADATA (TABLE_NAME, COLUMN_NAME, DIMINFO, SRID) 
VALUES ('FENCES', 'FENCE_SHAPE', 
SDO_DIM_ARRAY 
(SDO_DIM_ELEMENT('Longitude', -180, 180, 10), 
SDO_DIM_ELEMENT('Latitude', -90, 90, 10)), 
4326);


CREATE INDEX fences_ind
ON FENCES(FENCE_SHAPE)
INDEXTYPE IS mdsys.spatial_index;


Create sequence fences_sequence start with 1
increment by 1
minvalue 1
maxvalue 500000;