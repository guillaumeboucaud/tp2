CREATE DATABASE resultats_tp2;
/
CREATE TABLE departement (
   id_dept INTEGER     PRIMARY KEY,
   nom     VARCHAR(15) NOT NULL
)
/
CREATE TABLE programme (
   code     INTEGER     PRIMARY KEY,
   titre    VARCHAR(30) NOT NULL,
   id_dept  VARCHAR(15) NOT NULL,
   type     VARCHAR(10),
   cycle    INTEGER,
   FOREIGN KEY (id_dept)
)
/
