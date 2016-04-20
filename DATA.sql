
--Recommencer a neuf
TRUNCATE TABLE Departement;

TRUNCATE TABLE Programme;

TRUNCATE TABLE Etudiant;

TRUNCATE TABLE EmployeDepartement;

TRUNCATE TABLE Enseignant;

TRUNCATE TABLE SessionCours;

TRUNCATE TABLE Cours;

TRUNCATE TABLE BaremeNoteGroupeCours;

TRUNCATE TABLE GroupeCours;

TRUNCATE TABLE InscriptionGroupeCours;

TRUNCATE TABLE ElementsEvaluation;

TRUNCATE TABLE StatsEvaluation;

TRUNCATE TABLE ResultatEvaluation;

/*
INSERT INTO StatutInscription(idStatutInscription, typeInscription, libelleExplicatif) VALUES (1, '##', 'Suspension de la notation en raison d''une infraction de nature academique');
INSERT INTO StatutInscription(idStatutInscription, typeInscription, libelleExplicatif) VALUES (2, 'XE', 'Nombre d''abandons autorises depasse');
INSERT INTO StatutInscription(idStatutInscription, typeInscription, libelleExplicatif) VALUES (3, 'XX', 'Abandon sans remboursement');
INSERT INTO StatutInscription(idStatutInscription, typeInscription, libelleExplicatif) VALUES (4, 'FX', 'Abandon pour defaut de paiement');
INSERT INTO StatutInscription(idStatutInscription, typeInscription, libelleExplicatif) VALUES (5, 'RX', 'Abandon suite a un prealable non satisfait');
INSERT INTO StatutInscription(idStatutInscription, typeInscription, libelleExplicatif) VALUES (6, 'UX', 'Annulation par l''universite');
INSERT INTO StatutInscription(idStatutInscription, typeInscription, libelleExplicatif) VALUES (7, 'W', 'Auditeur libre non credite');
INSERT INTO StatutInscription(idStatutInscription, typeInscription, libelleExplicatif) VALUES (8, 'V', 'Inscription Valide');
*/

INSERT INTO Departement(idDepartement, identifiant, nomDepartement, nomFaculte) VALUES (seqDepartement.nextval, 7316012439, 'Département d`informatique de l`UQAM', 'UQAM');

INSERT INTO Programme(idProgramme, codeNumerique, titreProgramme, typeProgramme, cycleProgramme, idDepartement) VALUES(seqProgramme.nextval, 7316, 'Titre du programme', 'Type programme', 1, seqDepartement.currval);

INSERT INTO Etudiant(idEtudiant, codePermanent,  nip, nom, prenom, telephone, courriel, nbConnexionsInfructueuses, dateDerniereConnexion, idProgramme)VALUES(seqEtudiant.nextval, 'MANR02519207', '123456', 'Manori', 'Raymond', '5142270935', 'raymondM@uqam.ca', 0, SYSDATE, seqProgramme.currval);
INSERT INTO Etudiant(idEtudiant, codePermanent,  nip, nom, prenom, telephone, courriel, nbConnexionsInfructueuses, dateDerniereConnexion, idProgramme)VALUES(seqEtudiant.nextval, 'TREL02519207', '113446', 'Tremblay', 'Lara', '5142298765', 'lara021@uqam.ca', 0, SYSDATE, seqProgramme.currval);

--INSERT INTO EmployeDepartement(idEmploye, codeMS,  motDePasse, nom, prenom, telephone, courriel, idDepartement)VALUES(seqEmployeDepartement.nextval, 'hg9912423111', '00123456', 'Chieze', 'Emmanuel', '5149264532', 'chiezeEmmanuel@uqam.ca', seqDepartement.currval);
--INSERT INTO EmployeDepartement(idEmploye, codeMS,  motDePasse, nom, prenom, telephone, courriel, idDepartement)VALUES(seqEmployeDepartement.nextval, 'ml9912098911', '00120996', 'Berger', 'Jacques', '5149269880', 'jacquesBerger@uqam.ca', seqDepartement.currval);

INSERT INTO Enseignant(idEnseignant, codeMS,  motDePasse, nom, prenom, telephone, courriel) VALUES(seqEnseignant.nextval, 'hg9912423227', '12344456', 'Privat', 'Jean', '5142668929', 'privatJean@uqam.ca');
INSERT INTO Enseignant(idEnseignant, codeMS,  motDePasse, nom, prenom, telephone, courriel) VALUES(seqEnseignant.nextval,'ml9912022917', '00120996', 'Berger', 'Jacques', '5149269880', 'jacquesBerger@uqam.ca');

INSERT INTO SessionCours(idSessionCours, nomSession, dateDebut, dateFin, dateLimiteRemiseNotes) VALUES (seqSessionCours.nextval, 'Automne2012', '2015-09-08 00:00:00', '2015-12-21 00:00:00', '2015-11-11 00:00:00');

INSERT INTO BaremeNoteGroupeCours VALUES (1 , 'A+', 95);

INSERT INTO Cours(idCours, sigleCours, titreCours, descriptionCours, idDepartement) VALUES (seqCours.nextval,'INF3105', 'Structures de données et algorithmes', 'Graphes, arbres, tables..',seqDepartement.currval);
INSERT INTO Cours(idCours, sigleCours, titreCours, descriptionCours, idDepartement) VALUES (seqCours.nextval,'INF4170', 'Architecture des ordinateurs', 'Memoires: architecture,fonction...',seqDepartement.currval);

--INSERT INTO BaremeNoteGroupeCours(idBaremeNoteGC, noteLettree, noteSeuil) VALUES (seqBaremeNoteGC.nextval, 'A+', 95);
--INSERT INTO BaremeNoteGroupeCours(idBaremeNoteGC, noteLettree, noteSeuil) VALUES (seqBaremeNoteGC.nextval, 'A', 90);
--INSERT INTO BaremeNoteGroupeCours(idBaremeNoteGC, noteLettree, noteSeuil) VALUES (seqBaremeNoteGC.nextval, 'A-', 85);
--INSERT INTO BaremeNoteGroupeCours(idBaremeNoteGC, noteLettree, noteSeuil) VALUES (seqBaremeNoteGC.nextval, 'B+', 82);
--INSERT INTO BaremeNoteGroupeCours(idBaremeNoteGC, noteLettree, noteSeuil) VALUES (seqBaremeNoteGC.nextval, 'B', 78);
--INSERT INTO BaremeNoteGroupeCours(idBaremeNoteGC, noteLettree, noteSeuil) VALUES (seqBaremeNoteGC.nextval, 'B-', 75);
--INSERT INTO BaremeNoteGroupeCours(idBaremeNoteGC, noteLettree, noteSeuil) VALUES (seqBaremeNoteGC.nextval, 'C+', 72);
--INSERT INTO BaremeNoteGroupeCours(idBaremeNoteGC, noteLettree, noteSeuil) VALUES (seqBaremeNoteGC.nextval, 'C', 68);
--INSERT INTO BaremeNoteGroupeCours(idBaremeNoteGC, noteLettree, noteSeuil) VALUES (seqBaremeNoteGC.nextval, 'C-', 65);
--INSERT INTO BaremeNoteGroupeCours(idBaremeNoteGC, noteLettree, noteSeuil) VALUES (seqBaremeNoteGC.nextval, 'D+', 62);
--INSERT INTO BaremeNoteGroupeCours(idBaremeNoteGC, noteLettree, noteSeuil) VALUES (seqBaremeNoteGC.nextval, 'D', 60);
--INSERT INTO BaremeNoteGroupeCours(idBaremeNoteGC, noteLettree, noteSeuil) VALUES (seqBaremeNoteGC.nextval, 'E', 0);

INSERT INTO GroupeCours(idGroupeCours, numeroGroupe, dateConfirmation, dateApprobation, transfertNotes, diffusionNotesFinales, idCours, idSessionCours, idBaremeNoteGC, idEnseignant) VALUES (seqGroupeCours.nextval, 20, '2015-05-15 00:00:00', '2015-05-01 00:00:00', 'O', 'O', seqCours.currval, seqSessionCours.currval, 1 , seqEnseignant.currval);
INSERT INTO GroupeCours(idGroupeCours, numeroGroupe, dateConfirmation, dateApprobation, transfertNotes, diffusionNotesFinales, idCours, idSessionCours, idBaremeNoteGC, idEnseignant) VALUES (seqGroupeCours.nextval, 30, '2015-05-15 00:00:00', '2015-05-01 00:00:00', 'O', 'O', seqCours.currval, seqSessionCours.currval, 1, seqEnseignant.currval);

INSERT INTO InscriptionGroupeCours(idInscriptionGC, ordre, noteNumerique, noteLettree, idProgramme, idEtudiant, idStatutInscription, idGroupeCours) VALUES (seqInscriptionGC.nextval, 1, 95, 'A+', seqProgramme.currval, seqEtudiant.currval, 1, seqGroupeCours.currval);

INSERT INTO ElementsEvaluation(idElementsEvaluation, titreEvaluation, ordreApparition, resultatMax, ponderation, saisieEvaluation, transfertEvaluation, diffusion, idGroupeCours, idIncriptionGC) VALUES (seqElementsEvaluation.nextval, 'INF3105 TP1', 1, 89, 15, '2015-10-08 00:00:00', '2015-10-08 00:00:00', 'O', seqGroupeCours.currval, seqInscriptionGC.currval);

COMMIT;
