SET ECHO ON
SET SERVEROUTPUT ON

//On vide puis on recreer quelques donnees 

TRUNCATE TABLE BaremeConversionNoteFinale;
TRUNCATE TABLE Departement;
TRUNCATE TABLE Programme;
TRUNCATE TABLE Etudiant;
TRUNCATE TABLE EmployeDepartement;
TRUNCATE TABLE Enseignant;
TRUNCATE TABLE SessionCours;
TRUNCATE TABLE Cours;
TRUNCATE TABLE BaremeNoteGroupeCours;
TRUNCATE TABLE GroupeCours;
TRUNCATE TABLE StatutInscription;
TRUNCATE TABLE InscriptionGroupeCours;
TRUNCATE TABLE ElementsEvaluatation;
TRUNCATE TABLE StatsEvaluation;
TRUNCATE TABLE ResultatEvaluation;

INSERT INTO Departement(idDepartement, identifiant, nomDepartement, nomFaculte) VALUES (seqDepartement.nextval, 7316012015, 'Département d`informatique de l`UQAM', 'UQAM');

INSERT INTO Etudiant(idEtudiant, codePermanent,  nip, nom, prenom, telephone, courriel, nbConnexionsInfructueuses, dateDerniereConnexion, idDepartement)VALUES(seqEtudiant.nextval, 'MANR02519207', '123456', 'Manori', 'Raymond', '5142270935', 'raymondM@uqam.ca', 0, SYSDATE, seqDepartement.currval);
INSERT INTO Etudiant(idEtudiant, codePermanent,  nip, nom, prenom, telephone, courriel, nbConnexionsInfructueuses, dateDerniereConnexion, idDepartement)VALUES(seqEtudiant.nextval, 'TREL02519207', '113446', 'Tremblay', 'Lara', '5142298765', 'lara021@uqam.ca', 0, SYSDATE, seqDepartement.currval);

INSERT INTO EmployeDepartement(idEmploye, codeMS,  motDePasse, nom, prenom, telephone, courriel, idDepartement)VALUES(seqEmployeDepartement.nextval, 'hg9912423111', '00123456', 'Chieze', 'Emmanuel', '5149264532', 'chiezeEmmanuel@uqam.ca', seqDepartement.currval);
INSERT INTO EmployeDepartement(idEmploye, codeMS,  motDePasse, nom, prenom, telephone, courriel, idDepartement)VALUES(seqEmployeDepartement.nextval, 'ml9912098911', '00120996', 'Berger', 'Jacques', '5149269880', 'jacquesBerger@uqam.ca', seqDepartement.currval);

INSERT INTO SessionCours(idSessionCours, nomSession, dateDebut, dateFin, dateLimiteRemiseNotes) VALUES (seqSessionCours.nextval, Automne2015, '2015-09-08 00:00:00', '2015-12-21 00:00:00', '2015-11-11 00:00:00');

INSERT INTO Cours(idCours, sigleCours, titre, description, idDepartement) VALUES (seqCours.nextval,'INF3105', 'Structures de données et algorithmes', 'Graphes, arbres, tables..',seqDepartement.currval);
INSERT INTO Cours(idCours, sigleCours, titre, description, idDepartement) VALUES (seqCours.nextval,'INF4170', 'Architecture des ordinateurs', 'Mémoires: architecture,fonctionnement,types..',seqDepartement.currval);

--ICI 
INSERT INTO GroupeCours(idGroupeCours, numeroGroupe, dateConfirmation, dateApprobation, transfertNotes, diffusionNotesFinales, idCours, idSessionCours, idBaremeNoteGC, idDepartement) VALUES (seqGroupeCours.nextval, 20, '2015-05-15 00:00:00', '2015-05-01 00:00:00', transfertNotes, '2016-01-05 00:00:00', seqCours.currval, seqSessionCours.currval, seqBaremeNoteGC.currval, seqDepartement.currval);
INSERT INTO GroupeCours(idGroupeCours, numeroGroupe, dateConfirmation, dateApprobation, transfertNotes, diffusionNotesFinales, idCours, idSessionCours, idBaremeNoteGC, idDepartement) VALUES (seqGroupeCours.nextval, 30, '2015-05-15 00:00:00', '2015-05-01 00:00:00', transfertNotes, '2016-01-05 00:00:00', seqCours.currval, seqSessionCours.currval, seqBaremeNoteGC.currval, seqDepartement.currval);

--ICI 
INSERT INTO StatutInscription(idStatutInscription, typeInscription, libelleExplicatif) VALUES (seqStatutInscription.nextval, );

INSERT INTO ElementsEvaluatation(idElementsEvaluation, titreEvaluation, ordreApparition, resultatMax, ponderation, saisieEvaluation, transfertEvaluation, diffusion) VALUES (seqElementsEvaluation.nextval, 'INF3105 TP1', 1, 89, 15, '2015-10-08 00:00:00', '2015-10-08 00:00:00', '2015-10-08 00:00:00');

INSERT INTO Programme (idProgramme, codeNumerique, titre, typeProgramme, cycleProgramme, idDepartement) VALUE (idProgramme.nextval, '7316' , 'Génie Logiciel', 1, seqDepartement.currval);

COMMIT;
