---------------------------------------------------------------------
-- DROP des sequences de chaque table puis de chaque table elle-meme
-- en respectant les contraintes d'integrite
---------------------------------------------------------------------
DROP TABLE ResultatEvaluation
/
DROP TABLE StatsEvaluation
/
DROP TABLE ElementsEvaluation
/
DROP TABLE InscriptionGroupeCours
/
DROP TABLE StatutInscription
/
DROP TABLE GroupeCours
/
DROP TABLE BaremeNoteGroupeCours
/
DROP TABLE Cours
/
DROP TABLE SessionCours
/
DROP TABLE Enseignant
/
DROP TABLE EmployeDepartement
/
DROP TABLE Etudiant
/
DROP TABLE Programme
/
DROP TABLE Departement
/

COMMIT
/

DROP SEQUENCE seqResultatEvaluation
/
DROP SEQUENCE seqStatsEvaluation
/
DROP SEQUENCE seqElementsEvaluation
/
DROP SEQUENCE seqInscriptionGC
/
DROP SEQUENCE seqStatutInscription
/
DROP SEQUENCE seqGroupeCours
/
DROP SEQUENCE seqBaremeNoteGC
/
DROP SEQUENCE seqCours
/
DROP SEQUENCE seqSessionCours
/
DROP SEQUENCE seqEnseignant
/
DROP SEQUENCE seqEmployeDepartement
/
DROP SEQUENCE seqEtudiant
/
DROP SEQUENCE seqDepartement
/
DROP SEQUENCE seqBaremeNoteFinale
/

COMMIT
/