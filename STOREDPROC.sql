CREATE OR REPLACE PROCEDURE genererNotesFinales(id_groupe_cours IN NUMBER) AS
	note_lettree InscriptionGroupeCours.noteLettree%TYPE;
	note_num InscriptionGroupeCours.noteNumeriqueLettree%TYPE;
   
	CURSOR idEtudiant_cur IS
		SELECT idEtudiant 
		FROM InscriptionGroupeCours
		WHERE idGroupeCours = id_groupe_cours;

BEGIN
	FOR id_etudiant in idEtudiant_cur
	LOOP
		
		note_num := (
			SELECT SUM(ResultatEvaluation.noteNumerique*100/ElementsEvaluation.ponderation) 
			FROM InscriptionGroupeCours JOIN ResultatEvaluation JOIN ElementsEvaluation 
				ON ElementsEvaluation.idElementsEvaluation = ResultatEvaluation.idElementsEvaluation 
					AND InscriptionGroupeCours.idGroupeCours = ElementsEvaluation.idGroupeCours
			WHERE IncriptionGroupeCours.idEtudiant = id_etudiant
		);

		note_lettree := (
			SELECT noteLettree
			FROM BaremeNoteGroupeCours 
			WHERE noteSeuil = (SELECT min(noteSeuil) 
									FROM BaremeNoteGroupeCours 
									WHERE noteSeuil >= note_num ) 
		);

      UPDATE InscriptionGroupeCours
		SET noteLettree = note_lettree,
			 noteNumerique = note_num
		WHERE idEtudiant = id_etudiant
	END LOOP;

	SELECT noteLettree, noteNumeriqueLettree INTO (:noteLettree,:noteNum) 
   FROM InscriptionGroupeCours 
	WHERE idEtudiant = id_etudiant
END;
/
