------------------------------------------------------------------------------------------
-- Creation des sequences et triggers de controle pour les cles primaires de chaque table
------------------------------------------------------------------------------------------
CREATE SEQUENCE seqBaremeNoteFinale
START WITH 1
INCREMENT BY 1
/

CREATE OR REPLACE TRIGGER trBaremeNoteFinale_BIR_PK
BEFORE INSERT ON BaremeNoteFinale
FOR EACH ROW
BEGIN
	:new.idBaremeNoteFinale := seqBaremeNoteFinale.nextVal;
END;
/

CREATE SEQUENCE seqDepartement
START WITH 1
INCREMENT BY 1
/

CREATE OR REPLACE TRIGGER trDepartement_BIR_PK
BEFORE INSERT ON Departement
FOR EACH ROW
BEGIN
	:new.idDepartement := seqDepartement.nextVal;
END;
/

CREATE SEQUENCE seqEtudiant
START WITH 1
INCREMENT BY 1
/

CREATE OR REPLACE TRIGGER trEtudiant_BIR_PK
BEFORE INSERT ON Etudiant
FOR EACH ROW
BEGIN
	:new.idEtudiant := seqEtudiant.nextVal;
END;
/

CREATE SEQUENCE seqEmployeDepartement
START WITH 1
INCREMENT BY 1
/

CREATE OR REPLACE TRIGGER trEmployeDpt_BIR_PK
BEFORE INSERT ON EmployeDepartement
FOR EACH ROW
BEGIN
	:new.idEmployeDepartement := seqEmployeDepartement.nextVal;
END;
/

CREATE SEQUENCE seqEnseignant
START WITH 1
INCREMENT BY 1
/

CREATE OR REPLACE TRIGGER trEnseignant_BIR_PK
BEFORE INSERT ON Enseignant
FOR EACH ROW
BEGIN
	:new.idEnseignant := seqEnseignant.nextVal;
END;
/

CREATE SEQUENCE seqSessionCours
START WITH 1
INCREMENT BY 1
/

CREATE OR REPLACE TRIGGER trSessionCours_BIR_PK
BEFORE INSERT ON SessionCours
FOR EACH ROW
BEGIN
	:new.idSessionCours := seqSessionCours.nextVal;
END;
/

CREATE SEQUENCE seqCours
START WITH 1
INCREMENT BY 1
/

CREATE OR REPLACE TRIGGER trCours_BIR_PK
BEFORE INSERT ON Cours
FOR EACH ROW
BEGIN
	:new.idCours := seqCours.nextVal;
END;
/

CREATE SEQUENCE seqBaremeNoteGC
START WITH 1
INCREMENT BY 1
/

CREATE OR REPLACE TRIGGER trBaremeNoteGC_BIR_PK
BEFORE INSERT ON BaremeNoteGroupeCours
FOR EACH ROW
BEGIN
	:new.idBaremeNoteGC := seqBaremeNoteGC.nextVal;
END;
/

CREATE SEQUENCE seqGroupeCours
START WITH 1
INCREMENT BY 1
/

CREATE OR REPLACE TRIGGER trGroupeCours_BIR_PK
BEFORE INSERT ON GroupeCours
FOR EACH ROW
BEGIN
	:new.idGroupeCours := seqGroupeCours.nextVal;
END;
/

CREATE SEQUENCE seqStatutInscription
START WITH 1
INCREMENT BY 1
/

CREATE OR REPLACE TRIGGER trStatutInscription_BIR_PK
BEFORE INSERT ON StatutInscription
FOR EACH ROW
BEGIN
	:new.idStatutInscription := seqStatutInscription.nextVal;
END;
/

CREATE SEQUENCE seqInscriptionGC
START WITH 1
INCREMENT BY 1
/

CREATE OR REPLACE TRIGGER trInscriptionGC_BIR_PK
BEFORE INSERT ON InscriptionGroupeCours
FOR EACH ROW
BEGIN
	:new.idInscriptionGC := seqInscriptionGC.nextVal;
END;
/

CREATE SEQUENCE seqElementsEvaluation
START WITH 1
INCREMENT BY 1
/

CREATE OR REPLACE TRIGGER trElementsEvaluation_BIR_PK
BEFORE INSERT ON ElementsEvaluation
FOR EACH ROW
BEGIN
	:new.idElementsEvaluation := seqElementsEvaluation.nextVal;
END;
/

CREATE SEQUENCE seqStatsEvaluation
START WITH 1
INCREMENT BY 1
/

CREATE OR REPLACE TRIGGER trStatsEvaluation_BIR_PK
BEFORE INSERT ON StatsEvaluation
FOR EACH ROW
BEGIN
	:new.idStatsEvaluation := seqStatsEvaluation.nextVal;
END;
/

CREATE SEQUENCE seqResultatEvaluation
START WITH 1
INCREMENT BY 1
/

CREATE OR REPLACE TRIGGER trResultatEvaluation_BIR_PK
BEFORE INSERT ON ResultatEvaluation
FOR EACH ROW
BEGIN
	:new.idResultatEvaluation := seqResultatEvaluation.nextVal;
END;
/

COMMIT
/