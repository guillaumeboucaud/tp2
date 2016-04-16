
--TEST DE CONTRAINTES CHECK 

-- nomDepartement >= 2
INSERT INTO Departement(idDepartement, identifiant, nomDepartement, nomFaculte) VALUES (seqDepartement.nextval, 7316012015, 'D', 'UQAM');

-- nomFaculte >= 2
INSERT INTO Departement(idDepartement, identifiant, nomDepartement, nomFaculte) VALUES (seqDepartement.nextval, 7316012015, 'Département d`informatique de l`UQAM', 'U');

--un_Departement_identifiant		UNIQUE
INSERT INTO Departement(idDepartement, identifiant, nomDepartement, nomFaculte) VALUES (seqDepartement.nextval, 7316012015, 'Département d`informatique de l`UQAM', 'UQAM');


-- REGEXP_LIKE (codePermanent, '[A-Z]{4}\d{8}')
-- Seulement 3 lettres
INSERT INTO Etudiant(idEtudiant, codePermanent,  nip, nom, prenom, telephone, courriel, nbConnexionsInfructueuses, dateDerniereConnexion, idDepartement)VALUES(seqEtudiant.nextval, 'MAN002519207', '123456', 'Manori', 'Raymond', '5142270935', 'raymondM@uqam.ca', 0, SYSDATE, seqDepartement.currval);
-- Plus que 4 lettres
INSERT INTO Etudiant(idEtudiant, codePermanent,  nip, nom, prenom, telephone, courriel, nbConnexionsInfructueuses, dateDerniereConnexion, idDepartement)VALUES(seqEtudiant.nextval, 'MANRRR519207', '123456', 'Manori', 'Raymond', '5142270935', 'raymondM@uqam.ca', 0, SYSDATE, seqDepartement.currval);
-- Plus que 8 chiffres
INSERT INTO Etudiant(idEtudiant, codePermanent,  nip, nom, prenom, telephone, courriel, nbConnexionsInfructueuses, dateDerniereConnexion, idDepartement)VALUES(seqEtudiant.nextval, 'MANR025990019207', '123456', 'Manori', 'Raymond', '5142270935', 'raymondM@uqam.ca', 0, SYSDATE, seqDepartement.currval);


-- REGEXP_LIKE(nip, '[0-9]{5}')
-- Nip avec une lettre
INSERT INTO Etudiant(idEtudiant, codePermanent,  nip, nom, prenom, telephone, courriel, nbConnexionsInfructueuses, dateDerniereConnexion, idDepartement)VALUES(seqEtudiant.nextval, 'TREL02519207', '1134k6', 'Tremblay', 'Lara', '5142298765', 'lara021@uqam.ca', 0, SYSDATE, seqDepartement.currval);

-- LENGTH(nom) >= 2
INSERT INTO Etudiant(idEtudiant, codePermanent,  nip, nom, prenom, telephone, courriel, nbConnexionsInfructueuses, dateDerniereConnexion, idDepartement)VALUES(seqEtudiant.nextval, 'TREL02519207', '113446', 'T', 'Lara', '5142298765', 'lara021@uqam.ca', 0, SYSDATE, seqDepartement.currval);

-- LENGTH(prenom) >= 2
INSERT INTO Etudiant(idEtudiant, codePermanent,  nip, nom, prenom, telephone, courriel, nbConnexionsInfructueuses, dateDerniereConnexion, idDepartement)VALUES(seqEtudiant.nextval, 'MANR02519207', '123456', 'Manori', 'R', '5142270935', 'raymondM@uqam.ca', 0, SYSDATE, seqDepartement.currval);

-- REGEXP_LIKE(telephone, '[0-9]{10}')
-- Plus que 10 chiffres
INSERT INTO Etudiant(idEtudiant, codePermanent,  nip, nom, prenom, telephone, courriel, nbConnexionsInfructueuses, dateDerniereConnexion, idDepartement)VALUES(seqEtudiant.nextval, 'TREL02519207', '113446', 'Tremblay', 'Lara', '51422987658888', 'lara021@uqam.ca', 0, SYSDATE, seqDepartement.currval);
-- Moins que 10 chiffres
INSERT INTO Etudiant(idEtudiant, codePermanent,  nip, nom, prenom, telephone, courriel, nbConnexionsInfructueuses, dateDerniereConnexion, idDepartement)VALUES(seqEtudiant.nextval, 'MANR02519207', '123456', 'Manori', 'Raymond', '5142935', 'raymondM@uqam.ca', 0, SYSDATE, seqDepartement.currval);

-- REGEXP_LIKE(courriel, '[^@!#$%?&*()+=:;",]+@[^@!#$%?&*()+=:;"S,]+')
-- Pas de @
INSERT INTO Etudiant(idEtudiant, codePermanent,  nip, nom, prenom, telephone, courriel, nbConnexionsInfructueuses, dateDerniereConnexion, idDepartement)VALUES(seqEtudiant.nextval, 'MANR02519207', '123456', 'Manori', 'Raymond', '5142270935', 'raymondMuqam.ca', 0, SYSDATE, seqDepartement.currval);

-- nbConnexionsInfructueuses BETWEEN 0 AND 5
-- Plus que 5
INSERT INTO Etudiant(idEtudiant, codePermanent,  nip, nom, prenom, telephone, courriel, nbConnexionsInfructueuses, dateDerniereConnexion, idDepartement)VALUES(seqEtudiant.nextval, 'TREL02519207', '113446', 'Tremblay', 'Lara', '5142298765', 'lara021@uqam.ca', 9, SYSDATE, seqDepartement.currval);

-- LENGTH(nom) >= 2
INSERT INTO EmployeDepartement(idEmploye, codeMS,  motDePasse, nom, prenom, telephone, courriel, idDepartement)VALUES(seqEmployeDepartement.nextval, 'ml9912098911', '00120996', 'B', 'Jacques', '5149269880', 'jacquesBerger@uqam.ca', seqDepartement.currval);

-- LENGTH(prenom) >= 2
INSERT INTO EmployeDepartement(idEmploye, codeMS,  motDePasse, nom, prenom, telephone, courriel, idDepartement)VALUES(seqEmployeDepartement.nextval, 'ml9912098911', '00120996', 'Berger', 'J', '5149269880', 'jacquesBerger@uqam.ca', seqDepartement.currval);

-- REGEXP_LIKE(telephone, '[0-9]{10}')
-- Plus que 10 chiffres
INSERT INTO EmployeDepartement(idEmploye, codeMS,  motDePasse, nom, prenom, telephone, courriel, idDepartement)VALUES(seqEmployeDepartement.nextval, 'ml9912098911', '00120996', 'Berger', 'Jacques', '5149269000880', 'jacquesBerger@uqam.ca', seqDepartement.currval);
-- Moins que 10 chiffres
INSERT INTO EmployeDepartement(idEmploye, codeMS,  motDePasse, nom, prenom, telephone, courriel, idDepartement)VALUES(seqEmployeDepartement.nextval, 'ml9912098911', '00120996', 'Berger', 'Jacques', '5149880', 'jacquesBerger@uqam.ca', seqDepartement.currval);

-- REGEXP_LIKE(courriel, '[^@!#$%?&*()+=:;",]+@[^@!#$%?&*()+=:;"S,]+')
-- Pas de @
INSERT INTO EmployeDepartement(idEmploye, codeMS,  motDePasse, nom, prenom, telephone, courriel, idDepartement)VALUES(seqEmployeDepartement.nextval, 'ml9912098911', '00120996', 'Berger', 'Jacques', '5149269880', 'jacquesBergeruqam.ca', seqDepartement.currval);

-- dateFin > dateDebut
INSERT INTO SessionCours(idSessionCours, nomSession, dateDebut, dateFin, dateLimiteRemiseNotes) VALUES (seqSessionCours.nextval, Automne2015, '2015-12-21 00:00:00', '2015-09-08 00:00:00', '2015-11-11 00:00:00');
INSERT INTO SessionCours(idSessionCours, nomSession, dateDebut, dateFin, dateLimiteRemiseNotes) VALUES (seqSessionCours.nextval, Automne2015, '2015-09-08 00:00:00', '2015-09-08 00:00:00', '2015-11-11 00:00:00');

-- dateLimiteRemiseNotes > dateDebut
INSERT INTO SessionCours(idSessionCours, nomSession, dateDebut, dateFin, dateLimiteRemiseNotes) VALUES (seqSessionCours.nextval, Automne2015, '2015-09-08 00:00:00', '2015-12-21 00:00:00', '2015-09-08 00:00:00');

-- noteSeuil BETWEEN 0 AND 100
-- Plus grand que 100
INSERT INTO BaremeNoteGroupeCours(idBaremeNoteGC, noteLettree, noteSeuil) VALUES (seqBaremeNoteGC.nextval, 'D', 788);

-- noteSeuil BETWEEN 0 AND 100
-- Plus grand que 100
-- seqBaremeNoteFinale.nextval incrementé par un trigger
INSERT INTO BaremeConversionNoteFinale(idBaremeNoteFinale, noteLettree, noteSeuil) VALUES (seqBaremeNoteFinale.nextval,'D+',102);

-- resultatMax BETWEEN 0 AND 100
INSERT INTO ElementsEvaluatation(idElementsEvaluation, titreEvaluation, ordreApparition, resultatMax, ponderation, saisieEvaluation, transfertEvaluation, diffusion) VALUES (seqElementsEvaluation.nextval, 'INF3105 TP1', 1, 1000, 15, '2015-10-08 00:00:00', '2015-10-08 00:00:00', '2015-10-08 00:00:00');
--transfertEvaluation >= saisieEvaluation
INSERT INTO ElementsEvaluatation(idElementsEvaluation, titreEvaluation, ordreApparition, resultatMax, ponderation, saisieEvaluation, transfertEvaluation, diffusion) VALUES (seqElementsEvaluation.nextval, 'INF3105 TP1', 1, 98, 15, '2015-10-08 00:00:00', '2015-10-08 00:00:00', '2015-10-06 00:00:00');

--moyenne BETWEEN 0 AND 100
-- Plus grand que 100
INSERT INTO StatsEvaluation (idStatsEvaluation, moyenne, ecartType, idElementsEvaluation, idGroupeCours) VALUES (seqStatsEvaluation.nextval, 300, 9, seqElementsEvaluation.currval ,seqElementsEvaluation.currval);

--un_Programme_codeNum				UNIQUE
INSERT INTO Programme (idProgramme, codeNumerique, titre, typeProgramme, cycleProgramme, idDepartement) VALUE (idProgramme.nextval, '7316' , 'Génie Logiciel', 1, seqDepartement.currval);

