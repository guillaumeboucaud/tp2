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
--        JOIN Departement 				ON Etudiant.idProgramme = Programme.idProgramme
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
CREATE INDEX idx_Etudiant_Programme			ON Etudiant(idProgramme);
CREATE INDEX idx_InscriptionGC_Etudiant		ON InscriptionGroupeCours(idEtudiant);
CREATE INDEX idx_InscriptionGC_GC			ON InscriptionGroupeCours(idGroupeCours);
CREATE INDEX idx_GroupeCours_Cours			ON GroupeCours(idCours);
CREATE INDEX idx_GroupeCours_Enseignant		ON GroupeCours(idEnseignant);
CREATE INDEX idx_GroupeCours_SessionCours	ON GroupeCours(idSessionCours);
CREATE INDEX idx_ElementsEva_InscriptionGC	ON ElementsEvaluation(idInscriptionGC);
CREATE INDEX idx_ResultatEva_InscriptionGC	ON ResultatEvaluation(idInscriptionGC);
CREATE INDEX idx_StatsEva_ElementsEva		ON StatsEvaluation(idElementsEvaluation);
CREATE INDEX idx_StatsEva_GroupeCours		ON StatsEvaluation(idGroupeCours);

CREATE INDEX idx_Etudiant_nom_prenom_CP 	ON Etudiant(nom, prenom, codePermanent, nip);
CREATE INDEX idx_Enseignant_nom_prenom  	ON Enseignant(nom, prenom);
CREATE INDEX idx_Programme_codeNum_titre	ON Programme(titre, codeNumerique);
CREATE INDEX idx_Cours_sigle_titre			ON Cours(sigleCours, titreCours);
CREATE INDEX idx_ElementsEva_titre			ON ElementsEvaluation(titreEvaluation);
CREATE INDEX idx_StatsEva_moy_ecartType		ON StatsEvaluation(moyenne, ecartType);
CREATE INDEX idx_StatsEva_ElementsEva		ON StatsEvaluation(idElementsEvaluation);

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