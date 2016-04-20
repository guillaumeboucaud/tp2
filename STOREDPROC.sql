CREATE OR REPLACE PROCEDURE genererNotesFinales(id_groupe_cours IN NUMBER) AS
	note_lettree InscriptionGroupeCours.noteLettree%TYPE;
	note_num InscriptionGroupeCours.noteNumeriqueLettree%TYPE;
	CURSOR igc_cur IS
		SELECT idEtudiant 
		FROM InscriptionGroupeCours
		WHERE idGroupeCours = id_groupe_cours;
BEGIN
	FOR igc IN igc_cur
	LOOP
		SELECT SUM(ResultatEvaluation.noteNumerique*100/ElementsEvaluation.ponderation)
		INTO note_num
		FROM InscriptionGroupeCours JOIN ResultatEvaluation JOIN ElementsEvaluation 
			ON ElementsEvaluation.idElementsEvaluation = ResultatEvaluation.idElementsEvaluation 
				AND InscriptionGroupeCours.idGroupeCours = ElementsEvaluation.idGroupeCours
		WHERE InscriptionGroupeCours.idEtudiant = igc.idEtudiant;
		SELECT noteLettree INTO note_lettree
		FROM BaremeNoteGroupeCours 
		WHERE noteSeuil = (SELECT min(noteSeuil) 
								FROM BaremeNoteGroupeCours 
								WHERE noteSeuil >= note_num );
      UPDATE InscriptionGroupeCours
		SET noteLettree = note_lettree,
			 noteNumerique = note_num
		WHERE idEtudiant = igc.idEtudiant;
	END LOOP;
END;
/
