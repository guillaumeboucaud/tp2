-----------------------------------------------------
-- INDEX.sql
-----------------------------------------------------

-----------------------------------------------------
-- Cas 2.2:  
-----------------------------------------------------
--
-- Requetes SQL:
--
-- Requete 1 = affichage des informations relatives a l'etudiant, le groupe cours, la session et l'enseignant 
-- SELECT Etudiant.nom, 
--		  Etudiant.prenom,
--        codePermanent,
--		  codeNumerique,
--        titreProgramme,
--        sigleCours,
--        titreCours,
--        numeroGroupe,
--        Enseignant.nom,
--        Enseignant.prenom
-- FROM   Etudiant
--        JOIN Departement 				ON Etudiant.idProgramme = Departement.idProgramme
--        JOIN InscriptionGroupeCours 	ON Etudiant.idEtudiant = InscriptionGroupeCours.idEtudiant
--        JOIN GroupeCours 				ON InscriptionGroupeCours.idGroupeCours = GroupeCours.idGroupeCours
--        JOIN Cours 					ON GroupeCours.idCours = Cours.idCours
--        JOIN Enseignant 				ON GroupeCours.idEnseignant = Enseignant.idEnseignant
--        JOIN SessionCours 			ON GroupeCours.idSessionCours = SessionCours.idSessionCours
-- WHERE  codePermanent = 'cpEtudiant1' AND 
--        nip = 'nipEtudiant1' 			AND
--        groupeCours = 'gcEtudiant1'
--
-- Requete 2 = affichage des notes de l'etudiant dans le groupe cours
-- SELECT titreEvaluation,
--        noteNumerique,
--        moyenne,
--        ecartType
-- FROM   Etudiant
--        JOIN InscriptionGroupeCours 	ON InscriptionGroupeCours.idEtudiant = Etudiant.idEtudiant
--        JOIN ElementsEvaluation 		ON ElementsEvaluation.idInscriptionGC = InscriptionGroupeCours.idInscriptionGC
--        JOIN ResultatEvaluation 		ON ElementsEvaluation.idElementsEvaluation = ResultatEvaluation.idInscriptionGC AND
--                                   	   InscriptionGroupeCours.idInscriptionGC =  ResultatEvaluation.idInscriptionGC
--        JOIN StatsEvaluation 			ON StatsEvaluation.idElementsEvaluation = ElementsEvaluation.idElementsEvaluation AND
--                              		   StatsEvaluation.idGroupeCours = GroupeCours.idGroupeCours
-- WHERE  codePermanent = 'cpEtudiant1' AND
--        nip = 'nipEtudiant1'			
--     
-- Requete 3 = affichage du total pondere de l'etudiant et sa note finale
-- SELECT SUM(notePonderee),
--        noteFinaleNumerique,
--        noteFinaleLettree
-- FROM   Etudiant
-- 		  JOIN InscriptionGroupeCours 	ON InscriptionGroupeCours.idEtudiant = Etudiant.idEtudiant 
--        JOIN ResultatEvaluation 		ON ElementsEvaluation.idElementsEvaluation = ResultatEvaluation.idInscriptionGC 
--        JOIN GroupeCours				ON InscriptionGroupeCours.idGroupeCours = GroupeCours.idGroupeCours
--        JOIN StatsEvaluation 			ON StatsEvaluation.idElementsEvaluation = ElementsEvaluation.idElementsEvaluation AND
--                              		   StatsEvaluation.idGroupeCours = GroupeCours.idGroupeCours
-- WHERE  codePermanent = 'cpEtudiant1' AND
--        nip = 'nipEtudiant1' 			AND
--		  diffusionNotesFinales = 'O'   
-----------------------------------------------------

-----------------------------------------------------
-- Cas 2.5
-----------------------------------------------------
--
-- Requete SQL:
--
-- SELECT codePermanent,
--        Etudiant.nom,
--        Etudiant.prenom,
--        typeInscription,
--        codeNumerique,
--        noteNumerique,
--        noteFinaleLettree
-- FROM   GroupeCours
--        JOIN InscriptionGroupeCours	ON InscriptionGroupeCours.idGroupeCours = GroupeCours.idGroupeCours AND
--										   InscriptionGroupeCours.idEtudiant = Etudiant.idEtudiant
--        JOIN StatutInscription		ON StatutInscription.idStatutInscription = InscriptionGroupeCours.idStatutInscription
--		  JOIN Etudiant					ON Etudiant.idEtudiant = InscriptionGroupeCours.idEtudiant
--        JOIN Programme				ON InscriptionGroupeCours.idProgramme = Programme.idProgramme
--        JOIN ResultatEvaluation 		ON ResultatEvaluation.idInscriptionGC = InscriptionGroupeCours.idInscriptionGC 
-- WHERE  idGroupeCours = 'idGroupeCours1' 
-- ORDER BY codePermanent
-----------------------------------------------------