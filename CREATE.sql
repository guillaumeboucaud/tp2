-- Ajout des TRIGGER
-- Ajout ON UPDATE CASCADE sur PRIMARY KEY -> pas besoin car utilisation de sequences

-- -----------------------------------------------------
-- BaremeConversionNoteFinale:
-- 		{read only} -> trigger pour empecher la modification des valeurs inserees
-- -----------------------------------------------------
CREATE TABLE BaremeConversionNoteFinale (
	idBaremeNoteFinale			NUMBER
								CONSTRAINT nn_BareNoteFinale_id				NOT NULL
								CONSTRAINT pk_BaremeNoteFinale				PRIMARY KEY,
	noteLettree					VARCHAR2(2) 
								CONSTRAINT nn_BaremeNoteFinale_noteLettree	NOT NULL
								CONSTRAINT un_BaremeNoteFinale_noteLettree	UNIQUE,
	noteSeuil 					NUMBER 
								CONSTRAINT nn_BaremeNoteFinale_noteSeuil	NOT NULL
								CONSTRAINT un_BaremeNoteFinale_noteSeuil	UNIQUE
								CONSTRAINT ck_BaremeNoteFinale_noteSeuil	CHECK (noteSeuil BETWEEN 0 AND 100)
)
/

-- -----------------------------------------------------
-- Departement:
-- -----------------------------------------------------
CREATE TABLE Departement (
	idDepartement 				NUMBER
								CONSTRAINT nn_Departement_id				NOT NULL
								CONSTRAINT pk_Departement_id				PRIMARY KEY,
	identifiant	 				NUMBER(10)
								CONSTRAINT un_Departement_identifiant		UNIQUE,
								CONSTRAINT nn_Departement_identifiant		NOT NULL,
	nomDepartement 				VARCHAR2(45) 
								CONSTRAINT nn_Departement_nom				NOT NULL
								CONSTRAINT ck_Department_nom				CHECK (LENGTH(nomDepartment) >= 2,
	nomFaculte 					VARCHAR2(45)
								CONSTRAINT nn_Departement_nomFaculte		NOT NULL
								CONSTRAINT ck_Departement_nomFaculte		CHECK(LENGTH(nomFaculte) >= 2),
)
/

-- -----------------------------------------------------
-- Programme:
-- -----------------------------------------------------
CREATE TABLE Programme (
	idProgramme 				NUMBER 
								CONSTRAINT nn_Programme_id					NOT NULL
								CONSTRAINT pk_Programme						PRIMARY KEY,
	codeNumerique 				CHAR(4) 
								CONSTRAINT nn_Programme_codeNum				NOT NULL
								CONSTRAINT un_Programme_codeNum				UNIQUE,
	titre 						VARCHAR2(45) 
								CONSTRAINT nn_Programme_titre				NOT NULL,
	typeProgramme				VARCHAR2(45) 
								CONSTRAINT nn_Programme_type				NOT NULL,
	cycleProgramme				NUMBER		
								CONSTRAINT nn_Programme_cycle				NOT NULL,
	idDepartement				NUMBER
								CONSTRAINT nn_Programme_idDepartement		NOT NULL
								CONSTRAINT fk_Programme_idDepartement		FOREIGN KEY REFERENCES Departement(idDepartement)
)
/

-- -----------------------------------------------------
-- Etudiant:
-- -----------------------------------------------------
CREATE TABLE Etudiant (
	idEtudiant					NUMBER 
								CONSTRAINT nn_Etudiant_id			NOT NULL
								CONSTRAINT pk_Etudiant				PRIMARY KEY,
	codePermanent 				CHAR(12)	
								CONSTRAINT nn_Etudiant_CP			NOT NULL
								CONSTRAINT un_Etudiant_CP			UNIQUE,
								CONSTRAINT ck_Etudiant_CP			CHECK (REGEXP_LIKE (codePermanent, '[A-Z]{4}\d{8}')),
	nip							CHAR(6)	
								CONSTRAINT nn_Etudiant_nip			NOT NULL
								CONSTRAINT ck_Etudiant_nip			CHECK (REGEXP_LIKE(nip, '[0-9]{5}')),
	nom	 						VARCHAR2(30) 
								CONSTRAINT nn_Etudiant_nom 			NOT NULL
								CONSTRAINT ck_Etudiant_nom			CHECK (LENGTH(nom) >= 2),
	prenom 						VARCHAR2(30) 
								CONSTRAINT nn_Etudiant_prenom 		NOT NULL
								CONSTRAINT ck_Etudiant_prenom		CHECK (LENGTH(nom) >= 2),
	telephone 					CHAR(10) 
								CONSTRAINT nn_Etudiant_telephone 	NOT NULL
								CONSTRAINT ck_Etudiant_telephone	CHECK (REGEXP_LIKE(telephone, '[0-9]{10}')),
	courriel 					VARCHAR2(45) 
								CONSTRAINT nn_Etudiant_courriel		NOT NULL
								CONSTRAINT ck_Etudiant_courriel		CHECK (REGEXP_LIKE(courriel, '[^@!#$%?&*()+=:;",]+@[^@!#$%?&*()+=:;"S,]+')),
	nbConnexionsInfructueuses	NUMBER
								CONSTRAINT nn_Etudiant_nbConn		NOT NULL
								CONSTRAINT ck_Etudiant_nbConn		CHECK (nbConnexionsInfructueuses BETWEEN 0 AND 5),
	dateDerniereConnexion		TIMESTAMP,
	idDepartement				NUMBER
								CONSTRAINT nn_Etudiant_idDpt		NOT NULL
								CONSTRAINT fk_Etudiant_id			FOREIGN KEY REFERENCES Departement(idDepartement)
)
/

-- -----------------------------------------------------
-- EmployeDepartement:
-- -----------------------------------------------------
CREATE TABLE EmployeDepartement (
	idEmploye					NUMBER
								CONSTRAINT nn_Employe_id			NOT NULL
								CONSTRAINT pk_Employe				PRIMARY KEY,
	codeMS 						CHAR(12) 
								CONSTRAINT nn_Employe_codeMS		NOT NULL
								CONSTRAINT un_EmployeDpt_codeMS		UNIQUE,
	motDePasse					CHAR(8) 
								CONSTRAINT nn_Employe_motDePasse	NOT NULL,
	nom	 						VARCHAR2(30) 
								CONSTRAINT nn_Employe_nom 			NOT NULL
								CONSTRAINT ck_Employe_nom			CHECK (LENGTH(nom) >= 2),
	prenom 						VARCHAR2(30) 
								CONSTRAINT nn_Employe_prenom 		NOT NULL
								CONSTRAINT ck_Employe_prenom		CHECK (LENGTH(nom) >= 2),
	telephone 					CHAR(10) 
								CONSTRAINT nn_Employe_telephone 	NOT NULL
								CONSTRAINT ck_Employe_telephone		CHECK (REGEXP_LIKE(telephone, '[0-9]{10}')),
	courriel 					VARCHAR2(45) 
								CONSTRAINT nn_Employe_courriel		NOT NULL
								CONSTRAINT ck_Employe_courriel		CHECK(REGEXP_LIKE(courriel, '[^@!#$%?&*()+=:;",]+@[^@!#$%?&*()+=:;"S,]+')),
	idDepartement				NUMBER
								CONSTRAINT nn_EmployeDpt_idDpt		NOT NULL
								CONSTRAINT fk_Employe_idDepartement	FOREIGN KEY REFERENCES Departement(idDepartement)
)
/

-- -----------------------------------------------------
-- Enseignant:
-- -----------------------------------------------------
CREATE TABLE Enseignant (
	idEnseignant				NUMBER
								CONSTRAINT nn_Enseignant_id				NOT NULL
								CONSTRAINT pk_Enseignant				PRIMARY KEY,
	codeMS 						CHAR(12) 
								CONSTRAINT nn_Enseignant_codeMS			NOT NULL
								CONSTRAINT un_Enseignant_codeMS			UNIQUE,
	motDePasse					CHAR(8) 
								CONSTRAINT nn_Enseignant_motDePasse		NOT NULL,
	nom	 						VARCHAR2(30) 
								CONSTRAINT nn_Enseignant_nom 			NOT NULL
								CONSTRAINT ck_Enseignant_nom			CHECK (LENGTH(nom) >= 2),
	prenom 						VARCHAR2(30) 
								CONSTRAINT nn_Enseignant_prenom 		NOT NULL
								CONSTRAINT ck_Enseignant_prenom			CHECK (LENGTH(nom) >= 2),
	telephone 					CHAR(10) 
								CONSTRAINT nn_Enseignant_telephone 		NOT NULL
								CONSTRAINT ck_Enseignant_telephone		CHECK (REGEXP_LIKE(telephone, '[0-9]{10}')),
	courriel 					VARCHAR2(45) 
								CONSTRAINT nn_Enseignant_courriel		NOT NULL
								CONSTRAINT ck_Enseignant_courriel		CHECK(REGEXP_LIKE(courriel, '[^@!#$%?&*()+=:;",]+@[^@!#$%?&*()+=:;"S,]+'))
)
/

-- -----------------------------------------------------
-- SessionCours:
-- 		date a verifier avec un trigger
-- -----------------------------------------------------
CREATE TABLE SessionCours (
	idSessionCours				NUMBER
								CONSTRAINT nn_SessionCours_id				NOT NULL
								CONSTRAINT pk_SessionCours					PRIMARY KEY,
	nomSession 					VARCHAR(45) 
								CONSTRAINT nn_SessionCours_nomSession		NOT NULL,
	dateDebut 					TIMESTAMP
								CONSTRAINT nn_SessionCours_dateDebut		NOT NULL,
	dateFin 					TIMESTAMP 
								CONSTRAINT nn_SessionCours_dateFin			NOT NULL
								CONSTRAINT ck_SessionCours_dateFin			CHECK (dateFin > dateDebut),
	dateLimiteRemiseNotes 		TIMESTAMP
								CONSTRAINT nn_SessionCours_dateLimite		NOT NULL
								CONSTRAINT ck_SessionCours_dateLimite		CHECK (dateLimiteRemiseNotes > dateDebut)
)
/

-- -----------------------------------------------------
-- Cours:
-- -----------------------------------------------------
CREATE TABLE Cours(
	idCours						NUMBER
								CONSTRAINT nn_Cours_id				NOT NULL
								CONSTRAINT pk_Cours					PRIMARY KEY,
	sigleCours	 				CHAR(7) 
								CONSTRAINT nn_Cours_sigle			NOT NULL
								CONSTRAINT un_Cours_sigle			UNIQUE,
	titre 						VARCHAR(45) 
								CONSTRAINT nn_Cours_titre			NOT NULL
								CONSTRAINT ck_Cours_titre			CHECK (LENGTH(titre >= 2)),
	description 				VARCHAR(45) 
								CONSTRAINT nn_Cours_description		NOT NULL
								CONSTRAINT ck_Cours_description		CHECK (LENGTH(description >= 2)),
	idDepartement				NUMBER
								CONSTRAINT nn_Cours_idDepartemnt	NOT NULL
								CONSTRAINT fk_Cours_idDepartement	FOREIGN KEY REFERENCES Departement(idDepartement)
)
/

-- -----------------------------------------------------
-- BaremeNoteGroupeCours:
-----------------------------------------------------
CREATE TABLE BaremeNoteGroupeCours (
	idBaremeNoteGC				NUMBER
								CONSTRAINT nn_BaremeNoteGC_id				NOT NULL
								CONSTRAINT pk_BaremeNoteGC					PRIMARY KEY,
	noteLettree					VARCHAR(2) 
								CONSTRAINT nn_BaremeNoteGC_noteLettree		NOT NULL
								CONSTRAINT un_BaremeNoteGC_noteLettree		UNIQUE,
	noteSeuil 					NUMBER 
								CONSTRAINT nn_BaremeNoteGC_noteSeuil		NOT NULL
								CONSTRAINT un_BaremeNoteGC_noteSeuil		UNIQUE,
								CONSTRAINT ck_BaremeNoteGC_noteSeuil		CHECK (noteSeuil BETWEEN 0 AND 100)
)
/

-- -----------------------------------------------------
-- GroupeCours:
-- -----------------------------------------------------
CREATE TABLE GroupeCours (
	idGroupeCours				NUMBER
								CONSTRAINT nn_GroupeCours_id				NOT NULL
								CONSTRAINT pk_GroupeCours					PRIMARY KEY,
	numeroGroupe 				NUMBER(2) 
								CONSTRAINT nn_GroupeCours_numeroGroupe		NOT NULL,
	dateConfirmation 			TIMESTAMP
								CONSTRAINT nn_GroupeCours_dateConfirmation	NOT NULL,
	dateApprobation 			TIMESTAMP
								CONSTRAINT nn_GroupeCours_dateApprobation	NOT NULL,
	transfertNotes 				CHAR(1) 
								CONSTRAINT nn_GroupeCours_transfertNotes	NOT NULL,
	diffusionNotesFinales 		TIMESTAMP
								CONSTRAINT nn_GroupeCours_diffusion			NOT NULL,
	idCours						NUMBER
								CONSTRAINT nn_GroupeCours_idCours			NOT NULL
								CONSTRAINT fk_GroupeCours_idCours			FOREIGN KEY REFERENCES Cours(idCours),
	idSessionCours				NUMBER
								CONSTRAINT nn_GroupeCours_idSessionCours	NOT NULL	
								CONSTRAINT fk_GroupeCours_idSessionCours	FOREIGN KEY REFERENCES SessionCours(idSessionCours),
	idBaremeNoteGC				NUMBER
								CONSTRAINT n_GroupeCours_idBaremeNoteGC		NULL
								CONSTRAINT fk_GroupeCours_idBaremeNoteGC	FOREIGN KEY REFERENCES BaremeNoteGC(idBaremeNoteGC),
	idDepartement				NUMBER
								CONSTRAINT nn_GroupeCours_idDepartement		NOT NULL
								CONSTRAINT fk_GroupeCours_idEnseignant		FOREIGN KEY REFERENCES Enseignant(idEnseignant)
)
/

-- -----------------------------------------------------
-- StatutInscription:
--		enumeration pour le type d'inscription ou classe pour eviter une enumeration?
-- -----------------------------------------------------
CREATE TABLE StatutInscription (
	idStatutInscription 		NUMBER
								CONSTRAINT nn_StatutInscription_id 			NOT NULL
								CONSTRAINT pk_StatutInscription				PRIMARY KEY,
	typeInscription				VARCHAR2(45) 
								CONSTRAINT nn_StatutInscription_type		NOT NULL
								CONSTRAINT un_StatutInscription_type		UNIQUE,
	libelleExplicatif 			VARCHAR2(100) 
								CONSTRAINT nn_StatutInscription_libelle		NOT NULL
)
/

-- -----------------------------------------------------
-- InscriptionGroupeCours:
-- -----------------------------------------------------
CREATE TABLE InscriptionGroupeCours (
	idInscriptionGC				NUMBER
								CONSTRAINT nn_InscriptionGC_id				NOT NULL
								CONSTRAINT pk_InscriptionGC					PRIMARY KEY,
	ordre						NUMBER
								CONSTRAINT nn_InscriptionGC_ordre			NOT NULL,
	noteNumerique 				NUMBER 
								CONSTRAINT nn_InscriptionGC_noteNum			NOT NULL,
	noteLettree 				VARCHAR2(2),
	idProgramme					NUMBER
								CONSTRAINT nn_InscriptionGC_idProgramme		NOT NULL
								CONSTRAINT fk_InscriptionGC_idProgramme		FOREIGN KEY REFERENCES Programme(idProgramme),
	idEtudiant					NUMBER
								CONSTRAINT nn_InscriptionGC_idEtudiant		NOT NULL
								CONSTRAINT fk_InscriptionGC_idEtudiant		FOREIGN KEY REFERENCES Etudiant(idEtudiant),
	idStatutInscription			NUMBER
								CONSTRAINT nn_InscriptionGC_idStatutIns		NOT NULL
								CONSTRAINT fk_InscriptionGC_idStatutIns		FOREIGN KEY REFERENCES StatutInscription(idStatutInscription)
)
/

-- -----------------------------------------------------
-- ElementsEvaluatation:
-- -----------------------------------------------------
CREATE TABLE ElementsEvaluatation (
	idElementsEvaluation		NUMBER
								CONSTRAINT nn_ElementsEvaluation_id			NOT NULL
								CONSTRAINT pk_ElementsEvaluation			PRIMARY KEY,
	titreEvaluation				VARCHAR2(45) 
								CONSTRAINT nn_ElementsEvaluation_titre		NOT NULL,
	ordreApparition 			NUMBER 
								CONSTRAINT nn_ElementsEvaluation_ordre		NOT NULL,
	resultatMax 				NUMBER
								CONSTRAINT ck_ElementsEvaluation_resMax		CHECK (resultatMax BETWEEN 0 AND 100),
	ponderation 				NUMBER,
	saisieEvaluation 			TIMESTAMP 
								CONSTRAINT nn_ElementsEvaluation_saisie		NOT NULL,
	transfertEvaluation		    TIMESTAMP
								CONSTRAINT nn_ElementsEvaluation_transfert	NOT NULL
								CONSTRAINT ck_ElementsEvaluation_transfert	CHECK (transfertEvaluation >= saisieEvaluation),
	diffusion 					TIMESTAMP
)
/

-- -----------------------------------------------------
-- StatsEvaluation:
--		ON DELETE CASCADE pour les FOREIGN KEY?	
--		Attributs derives = moyenne + ecartType
-- -----------------------------------------------------
CREATE TABLE StatsEvaluation (
	idStatsEvaluation			NUMBER
								CONSTRAINT nn_StatsEvaluation_id			NOT NULL,
	moyenne 					NUMBER
								CONSTRAINT ck_StatsEvaluation_moyenne		CHECK (moyenne BETWEEN 0 AND 100),
	ecartType 					NUMBER	
								CONSTRAINT nn_StatsEvaluation_ecartType		NOT NULL,
	idElementsEvaluation		NUMBER
								CONSTRAINT fk_StatsEvaluation_idElemEva		FOREIGN KEY REFERENCES ElementsEvaluation(idElementsEvaluation),
	idGroupeCours				NUMBER
								CONSTRAINT fk_StatsEvaluation_idGC			FOREIGN KEY REFERENCES GroupeCours(idGroupeCOurs)
)
/

-- -----------------------------------------------------
-- ResultatEvaluation:
--		ON DELETE CASCADE pour les FOREIGN KEY?	
-- -----------------------------------------------------
CREATE TABLE ResultatEvaluation (
	idResultatEvaluation		NUMBER
								CONSTRAINT nn_ResultatEvaluation_id			NOT NULL,
	noteNumerique 				NUMBER 
								CONSTRAINT nn_ResultatEvaluation_noteNum	NOT NULL,
	noteLettree 				VARCHAR2(2) 
								CONSTRAINT nn_ResultatEvaluation_noteL		NOT NULL,
	idInscriptionGC				NUMBER
								CONSTRAINT fk_ResEva_idInscriptionGC		FOREIGN KEY REFERENCES InscriptionGroupeCours(idInscriptionGC),
	idElemEva					NUMBER
								CONSTRAINT fk_ResEva_idElemeEva				FOREIGN KEY REFERENCES ElementsEvaluation(idElementsEvaluation)
)
/

COMMIT
/