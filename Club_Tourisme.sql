/*------------------------------------------*/
/* NOM DE SGBD : TOURISME ET LOISIRS		*/
/* DATE DE CREATION : 02/10/2023			*/
/* AUTEUR : BENJAMIN						*/
/*------------------------------------------*/

CREATE DATABASE IF NOT EXISTS CLUB_TOURISME;

USE CLUB_TOURISME;

DROP table if exists RESERVER;
DROP table if exists OFFRIR;
DROP table if exists PROPOSER;
DROP table if exists SEMAINE;
DROP table if exists VILLAGE;
DROP table if exists PERIODE;
DROP table if exists PAYS;
DROP table if exists ADHERENT;
DROP table if exists ACTIVITE;

/*------------------------------------------*/
/* TABLE : ACTIVITE							*/
/*------------------------------------------*/
create table ACTIVITE (
ACT_ID	INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
ACT_NOM		CHAR(20),
	PRIMARY KEY (ACT_ID)
);

/*------------------------------------------*/
/* TABLE : ADHERENT 						*/
/*------------------------------------------*/
create table ADHERENT (
ADH_ID	INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
ADH_PRENOM	CHAR(50),
ADH_NOM		CHAR(50),
ADH_ADRESSE CHAR(50),
ADH_DATE 	DATE,
	PRIMARY KEY	(ADH_ID)
);

/*------------------------------------------*/
/* TABLE : PAYS								*/
/*------------------------------------------*/
create table PAYS (
PAY_ID	integer UNSIGNED NOT NULL AUTO_INCREMENT,
PAY_NOM long varchar,
PRIMARY KEY	(PAY_ID)
);

/*------------------------------------------*/
/* TABLE PERIODE							*/
/*------------------------------------------*/
create table PERIODE (
PER_ID	integer UNSIGNED NOT NULL AUTO_INCREMENT,
PER_ANNEE	numeric(4),
PER_DEBUT	integer,
PER_FIN		integer,
PER_LABEL	char(25),
	PRIMARY KEY (PER_ID)
);

/*------------------------------------------*/
/* TABLE : VILLAGE 							*/
/*------------------------------------------*/
create table VILLAGE (
VIL_ID	INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
PAY_ID 	INTEGER UNSIGNED NOT NULL,	
VIL_NOM	varchar(50),
VIL_PLACES	NUMERIC(4),
	PRIMARY KEY (VIL_ID),
CONSTRAINT FK_VILLAGE_SITUER_PAYS
	FOREIGN KEY (PAY_ID)
    REFERENCES PAYS(PAY_ID)
);

/*------------------------------------------*/
/* TABLE : SEMAINE 							*/
/*------------------------------------------*/
create table SEMAINE (
SEM_ID	int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
PER_ID 	INTEGER UNSIGNED NOT NULL,
	PRIMARY KEY (SEM_ID),
CONSTRAINT FK_SEMAINE_APPARTENI_PERIODE
	FOREIGN KEY (PER_ID)
	REFERENCES PERIODE(PER_ID)
);

/*------------------------------------------*/
/* TABLE : PROPOSER							*/
/*------------------------------------------*/
create table PROPOSER(
ACT_ID INTEGER UNSIGNED NOT NULL,
VIL_ID INTEGER UNSIGNED NOT NULL,
	PRIMARY KEY (ACT_ID, VIL_ID),
CONSTRAINT FK_PROPOSER_PROPOSER_ACTIVITE
	FOREIGN KEY (ACT_ID)
	REFERENCES ACTIVITE(ACT_ID),
CONSTRAINT FK_PROPOSER_PROPOSER2_VILLAGE
	FOREIGN KEY (VIL_ID)
    REFERENCES VILLAGE(VIL_ID)
);

/*------------------------------------------*/
/* TABLE : OFFRIR 							*/
/*------------------------------------------*/
create table OFFRIR (
VIL_ID 	INTEGER UNSIGNED NOT NULL,
SEM_ID 	int(2) UNSIGNED NOT NULL,
PER_ID	INTEGER UNSIGNED NOT NULL,
PRIX 	numeric(8.2),
	PRIMARY KEY (VIL_ID, SEM_ID,  PER_ID),
CONSTRAINT	FK_OFFRIR_OFFRIR_VILLAGE
		FOREIGN KEY (VIL_ID)
		REFERENCES VILLAGE(VIL_ID),
CONSTRAINT FK_OFFRIR_OFFRIR2_PERIODE
		FOREIGN KEY (SEM_ID)
		REFERENCES SEMAINE(SEM_ID),
CONSTRAINT FK_OFFRIR_OFFRIR3_PERIODE
		FOREIGN KEY (PER_ID)
		REFERENCES PERIODE(PER_ID)
);

/*------------------------------------------*/
/* TABLE : RESERVER							*/
/*------------------------------------------*/
create table RESERVER (
VIL_ID	INTEGER UNSIGNED NOT NULL,
ADH_ID	INTEGER UNSIGNED NOT NULL,
SEM_ID	int(2) UNSIGNED NOT NULL,
RES_PLACES	NUMERIC(4),
	PRIMARY KEY (VIL_ID, ADH_ID, SEM_ID),
CONSTRAINT FK_RESERVER_RESERVER_VILLAGE
	FOREIGN KEY	(VIL_ID)
	REFERENCES	VILLAGE(VIL_ID),
CONSTRAINT	FK_RESERVER_RESERVER2_ADHERENT
	FOREIGN KEY	(ADH_ID)
	REFERENCES	ADHERENT(ADH_ID),
CONSTRAINT	FK_RESERVER_RESERVER3_SEMAINE
	FOREIGN KEY	(SEM_ID)
	REFERENCES	SEMAINE(SEM_ID)
);

INSERT into activite (ACT_NOM)
VALUES
	("kayak"),
    ("escalade"),
    ("trec"),
    ("randonnée"),
    ("pêche"),
    ("camping");

INSERT INTO adherent (ADH_Prenom,ADH_Nom,ADH_adresse,ADH_date)
VALUES
  ("House","Aquila","499-4387 Interdum. Rd.","2024-03-24"),
  ("Finley","Nomlanga","906-3448 Faucibus Rd.","2022-10-03"),
  ("Simmons","Duncan","Ap #994-368 Nec St.","2022-04-26"),
  ("Mcleod","Warren","561-7320 Risus Av.","2023-12-14"),
  ("Harmon","Porter","Ap #893-1200 Velit. Rd.","2021-05-11");

INSERT INTO PAYS (PAY_NOM)
VALUES
  ("Turkey"),
  ("Nigeria"),
  ("South Africa"),
  ("Chile"),
  ("Spain");
  
INSERT INTO periode (PER_ANNEE, PER_DEBUT,PER_FIN)
VALUES
  ("2023","22","27"),
  ("2024","27","29"),
  ("2025","18","23"),
  ("2026","11","18"),
  ("2027","29","35");

INSERT INTO village (PAY_ID,VIL_NOM,VIL_PLACES)
VALUES
  ("3","Hérouville-Saint-Clair",3046),
  ("1","Thionville",4065),
  ("5","Arras",1981),
  ("4","Dole",8345),
  ("2","Troyes",9353);

INSERT INTO semaine (PER_ID)
	(select per_id from periode);

INSERT INTO offrir (VIL_ID,PER_ID,SEM_ID,PRIX)
VALUES
  (4,1,2,"1016.11"),
  (2,2,1,"1466.37"),
  (5,3,3,"1585.09"),
  (3,4,4,"1437.44"),
  (1,5,5,"1015.19");

INSERT INTO reserver (VIL_ID,ADH_ID,SEM_ID,RES_PLACES)
	VALUES
	("4","3","4","1525"),
    ("2","4","3","8547"),
    ("5","2","5","8596"),
    ("1","5","2","5236"),
    ("3","1","1","1258");