--TEST DE CONTRAINTES DE TRIGGER INCRÉMENTATION
-- Incrémentation de idDepartement
INSERT INTO Departement(idDepartement, identifiant, nomDepartement, nomFaculte) VALUES (seqDepartement.nextval, 7316012019, 'Département de sociologie de l`UQAM', 'UQAM');
SELECT * FROM Departement;

-- Incrémentation de idEtudiant
SELECT * FROM Etudiant;

-- Incrémentation de idEnseignant
SELECT * FROM Enseignant

-- Incrémentation de idSessionCours
INSERT INTO SessionCours(idSessionCours, nomSession, dateDebut, dateFin, dateLimiteRemiseNotes) VALUES (seqSessionCours.nextval, 'Hiver2015', '2015-01-08 00:00:00', '2015-04-21 00:00:00', '2015-03-11 00:00:00');
SELECT * FROM SessionCours

-- Incrémentation de idCours
SELECT * FROM Cours

-- Incrémentation de idBaremeNoteGC
SELECT * FROM BaremeNoteGroupeCours

-- Incrémentation de idGroupeCours
SELECT * FROM GroupeCours

-- Incrémentation de idStatutInscription
SELECT * FROM StatutInscription

-- Incrémentation de idElementsEvaluation
INSERT INTO ElementsEvaluation(idElementsEvaluation, titreEvaluation, ordreApparition, resultatMax, ponderation, saisieEvaluation, transfertEvaluation, diffusion) VALUES (seqElementsEvaluation.nextval, 'INF3105 INTRA', 1, 92, 30, '2015-10-20 00:00:00', '2015-10-25 00:00:00', '2015-11-08 00:00:00');
SELECT * FROM ElementsEvaluation

-- Incrémentation de idProgramme
INSERT INTO Programme (idProgramme, codeNumerique, titreProgramme, typeProgramme, cycleProgramme, idDepartement) VALUES (idProgramme.nextval, '7008' , 'Biochimie', 1, seqDepartement.currval);
SELECT * FROM Programme

----------------------------------------------------------------
-- Creation du trigger pour interdire les modifications 
-- de la table BaremeConversionNoteFinale
----------------------------------------------------------------
INSERT INTO BaremeConversionNoteFinale(idBaremeNoteFinale, noteLettree, noteSeuil) VALUES (idBaremeNoteGC.nextval, 'R', 0);

--Tester la PROCEDURE genererNotesFinales
EXECUTE genererNotesFinales(seqGroupeCours.currval);

