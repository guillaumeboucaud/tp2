---------------------------------------------------------------------
-- DROP des sequences de chaque table puis de chaque table elle-meme
-- en respectant les contraintes d'integrite
---------------------------------------------------------------------
DROP SEQUENCE seqResultatEvaluation
/
DROP TABLE ResultatEvaluation
/

DROP SEQUENCE seqStatsEvaluation
/
DROP TABLE StatsEvaluation
/

DROP SEQUENCE seqElementsEvaluation
/
DROP TABLE ElementsEvaluation
/

DROP SEQUENCE seqInscriptionGC
/
DROP TABLE InscriptionGroupeCours
/

DROP SEQUENCE seqStatutInscription
/
DROP TABLE StatutInscription
/

DROP SEQUENCE seqGroupeCours
/
DROP TABLE GroupeCours
/

DROP SEQUENCE seqBaremeNoteGC
/
DROP TABLE BaremeNoteGroupeCours
/

DROP SEQUENCE seqCours
/
DROP TABLE Cours
/

DROP SEQUENCE seqSessionCours
DROP TABLE SessionCours
/

DROP SEQUENCE seqEnseignant
/
DROP TABLE Enseignant
/

DROP SEQUENCE seqEmployeDepartement
/
DROP TABLE EmployeDepartement
/

DROP SEQUENCE seqEtudiant
/
DROP TABLE Etudiant
/

DROP SEQUENCE seqDepartement
/
DROP TABLE Departement
/

DROP SEQUENCE seqBaremeNoteFinale
/
DROP TABLE BaremeNoteFinale
/

COMMIT
/DROP SEQUENCE seqStatsEvaluation
/
DROP TABLE StatsEvaluation
/

COMMIT
/