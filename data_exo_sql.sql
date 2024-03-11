  /* exo 5 */

CREATE DATABASE IF NOT EXISTS formation;
USE formation;

drop table if exists note;
drop table if exists etudiant;
drop table if exists enseignant;
drop table if exists matiere;


CREATE TABLE IF NOT EXISTS Etudiant(
CodeEt SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
NomEt VARCHAR(60) NOT NULL,
DatnEt DATE NOT NULL,
PRIMARY KEY (CodeEt)
);

INSERT INTO Etudiant (NomEt,DatnEt)
VALUES
  ("Griffith Cline","2005-11-22"),
  ("Ainsley Ball","2005-09-08"),
  ("Avye Blair","2006-04-03"),
  ("Walker Hughes","2005-08-09"),
  ("Hedy Massey","2007-08-20"),
  ("Colorado Butler","2007-07-17"),
  ("Alden Levine","2008-05-24"),
  ("Cody Ellison","2005-02-12"),
  ("Jeanette Kim","2007-04-24"),
  ("Rowan Richmond","2006-11-08"),
  ("Ishmael Witt","2005-09-07"),
  ("Ivor Donaldson","2007-06-22"),
  ("Megan Pickett","2006-05-05"),
  ("Brenna Cain","2006-02-11"),
  ("Chadwick Watts","2008-08-12"),
  ("Kuame Galloway","2006-04-17"),
  ("Darryl Johns","2007-11-25"),
  ("Cain Guzman","2006-11-21"),
  ("Erich Potter","2006-12-19"),
  ("Merritt Wynn","2008-04-01"),
  ("Brody Hughes","2005-11-22"),
  ("Azalia Weeks","2008-03-22"),
  ("Kylie Johnson","2007-12-11"),
  ("Raymond Trevino","2007-08-01"),
  ("Kermit Beach","2006-05-31"),
  ("Walter Miranda","2006-09-22"),
  ("Cadman Beard","2008-04-10"),
  ("Lana O'donnell","2007-11-28"),
  ("Alika Whitfield","2007-05-26"),
  ("Neve Woodward","2008-01-21"),
  ("Katelyn Beach","2005-02-20"),
  ("Medge Perry","2008-03-15"),
  ("Todd Gentry","2007-12-30"),
  ("Elton Mccarthy","2007-04-27"),
  ("Quamar Richards","2008-02-07"),
  ("Charde Chambers","2006-12-20"),
  ("Zahir Munoz","2005-03-02"),
  ("Jamal Adams","2008-07-09"),
  ("Noelani Vega","2007-02-24"),
  ("Beck Wells","2007-12-03"),
  ("Donovan Alvarado","2008-02-25"),
  ("Tatyana Cash","2005-08-10"),
  ("Jeanette Morrison","2006-04-28"),
  ("Guinevere Bullock","2008-04-14"),
  ("April Spencer","2006-03-25"),
  ("Xander Weber","2007-11-05"),
  ("Renee Juarez","2006-10-21"),
  ("Halee Macias","2007-01-29"),
  ("Halee Justice","2008-05-06"),
  ("Shad Pierce","2005-04-12");

CREATE TABLE IF NOT EXISTS Matiere(
CodeMat SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
NomMat VARCHAR(30) NOT NULL,
CoefMat SMALLINT NOT NULL,
PRIMARY KEY (CodeMat)
);

INSERT INTO Matiere (`NomMat`,`CoefMat`)
VALUES
  ("BD",3),
  ("math",2),
  ("physique",4),
  ("histoire",1),
  ("francais",2);
  
CREATE TABLE IF NOT EXISTS Enseignant(
CodeEns SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
NomEns VARCHAR(50) NOT NULL,
GradeEns VARCHAR(4) NOT NULL,
CodeMat SMALLINT UNSIGNED NOT NULL,
PRIMARY KEY(CodeEns),
CONSTRAINT FK_Matiere FOREIGN KEY(CodeMat) REFERENCES Matiere(CodeMat)
);

INSERT INTO Enseignant (`NomEns`,`GradeEns`,`CodeMat`)
VALUES
  ("Anjolie Camacho","Grd3",2),
  ("Unity Sawyer","Grd1",3),
  ("Deirdre Lott","Grd3",1),
  ("Nadine Vaughan","Grd2",4),
  ("Whitney Roy","Grd4",3);

CREATE TABLE IF NOT EXISTS Note(
CodeEt SMALLINT UNSIGNED NOT NULL,
CodeMat SMALLINT UNSIGNED NOT NULL,
note SMALLINT UNSIGNED NOT NULL,
CONSTRAINT FK_Mat FOREIGN KEY(CodeMat) REFERENCES Matiere(CodeMat),
CONSTRAINT FK_Etudiant FOREIGN KEY(CodeEt) REFERENCES Etudiant(CodeEt)
);

INSERT INTO Note (`CodeEt`,`CodeMat`,`note`)
VALUES
  (3,4,7),
  (15,5,2),
  (34,1,5),
  (7,3,7),
  (20,4,8),
  (32,3,8),
  (21,3,5),
  (6,4,14),
  (49,4,9),
  (23,5,8),
  (36,4,14),
  (33,4,2),
  (44,2,11),
  (37,2,16),
  (4,1,6),
  (18,5,9),
  (17,3,7),
  (13,4,19),
  (47,2,8),
  (30,3,4),
  (34,2,2),
  (20,2,11),
  (34,3,5),
  (10,1,19),
  (10,2,17),
  (19,4,16),
  (11,1,9),
  (32,2,8),
  (41,3,17),
  (18,4,9),
  (24,4,16),
  (47,4,10),
  (2,1,5),
  (48,5,11),
  (11,5,16),
  (14,3,10),
  (31,1,10),
  (6,3,11),
  (33,3,11),
  (40,4,9),
  (47,2,9),
  (13,5,1),
  (4,3,7),
  (8,4,13),
  (19,2,19),
  (42,4,19),
  (42,2,15),
  (48,3,13),
  (38,5,14),
  (20,4,16),
  (19,5,14),
  (46,2,2),
  (36,1,11),
  (9,2,17),
  (2,3,19),
  (14,4,1),
  (42,1,6),
  (3,2,20),
  (34,2,9),
  (27,2,12),
  (33,4,16),
  (39,4,18),
  (24,1,1),
  (35,5,13),
  (25,5,6),
  (49,1,1),
  (1,2,11),
  (19,3,7),
  (26,3,14),
  (33,3,17),
  (30,2,5),
  (33,5,6),
  (36,2,4),
  (2,3,11),
  (40,2,19),
  (38,2,16),
  (26,5,1),
  (1,3,1),
  (41,4,17),
  (49,4,8),
  (3,4,8),
  (9,5,8),
  (9,4,12),
  (32,4,11),
  (36,3,10),
  (41,2,7),
  (48,2,3),
  (14,4,7),
  (12,2,5),
  (16,3,12),
  (27,4,12),
  (26,3,1),
  (42,1,10),
  (23,2,3),
  (35,4,1),
  (9,3,19),
  (15,2,17),
  (44,5,16),
  (23,4,15),
  (36,4,7),
  (20,3,2),
  (38,1,1),
  (36,3,9),
  (30,4,3),
  (48,2,8),
  (29,2,17),
  (47,2,0),
  (15,3,18),
  (25,5,15),
  (46,3,18),
  (4,4,17),
  (33,5,18),
  (48,5,9),
  (39,1,16),
  (38,3,16),
  (49,4,17),
  (44,3,3),
  (6,2,2),
  (17,2,10),
  (20,5,6),
  (17,5,12),
  (12,3,10),
  (34,5,5),
  (3,2,16),
  (3,4,14),
  (50,1,4),
  (12,4,13),
  (43,5,3),
  (47,2,7),
  (49,3,8),
  (17,2,16),
  (42,2,12),
  (7,4,20),
  (18,1,12),
  (34,1,13),
  (5,2,16),
  (11,3,9),
  (32,4,15),
  (46,2,12),
  (33,3,13),
  (35,3,3),
  (47,4,15),
  (37,5,4),
  (30,2,6),
  (3,1,10),
  (29,2,18),
  (18,2,3),
  (30,4,19),
  (10,5,6),
  (7,2,19),
  (26,5,12),
  (30,2,3),
  (4,4,9),
  (27,4,9),
  (25,5,4),
  (8,2,7),
  (38,4,8),
  (38,2,18),
  (29,3,12),
  (43,2,2),
  (24,1,17),
  (41,4,9),
  (23,2,4),
  (29,1,18),
  (27,4,19),
  (30,3,10),
  (47,4,8),
  (20,2,14),
  (41,5,18),
  (9,5,7),
  (28,3,8),
  (5,2,12),
  (4,1,19),
  (37,4,19),
  (22,1,14),
  (2,1,15),
  (26,2,16),
  (25,5,5),
  (29,4,17),
  (15,2,4),
  (9,2,3),
  (50,5,17),
  (45,5,7),
  (35,4,10),
  (36,4,9),
  (29,4,14),
  (40,4,10),
  (45,3,13),
  (17,4,10),
  (5,2,10),
  (39,2,16),
  (22,4,3),
  (24,4,11),
  (46,4,9),
  (1,3,10),
  (42,3,18),
  (33,2,9),
  (12,4,9),
  (28,4,0),
  (4,3,15);

  /* exo 6 */ 
CREATE DATABASE IF NOT EXISTS BD_AIR_MAROC;
USE BD_AIR_MAROC;

drop table if exists vol;
drop table if exists avion;
drop table if exists pilote;

CREATE TABLE IF NOT EXISTS PILOTE (
NUMPIL SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
NOMPIL VARCHAR(50) NOT NULL,
VILLE VARCHAR(50) NOT NULL,
SALAIRE INT UNSIGNED NOT NULL,
PRIMARY KEY(NUMPIL)
);

INSERT INTO PILOTE (NOMPIL,VILLE,SALAIRE)
VALUES
  ("Maxwell Whitney","Maroc",19261),
  ("Leroy Cooley","Marrakech",28530),
  ("Scott Wilkerson","Rabat",13390),
  ("Ariana Sears","Fès",31491),
  ("Brent Langley","Meknès",14949);

CREATE TABLE IF NOT EXISTS AVION (
NUMAV SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
NOMAV VARCHAR(50) NOT NULL,
CAPACITE INT UNSIGNED NOT NULL,
VILLE VARCHAR(50) NOT NULL,
PRIMARY KEY(NUMAV)
);

INSERT INTO AVION (NOMAV,VILLE,CAPACITE)
VALUES
  ("Craig","Meknès",413),
  ("Porter","Meknès",326),
  ("Illana","Meknès",487),
  ("Jasper","Fès",208),
  ("Cynthia","Fès",395),
  ("Donna","Marrakech",516),
  ("Kathleen","Meknès",504),
  ("Idona","Fès",171),
  ("Macy","Fès",366),
  ("Amanda","Marrakech",161);

CREATE TABLE IF NOT EXISTS VOL (
NUMVOL SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
NUMPIL SMALLINT UNSIGNED NOT NULL,
NUMAV SMALLINT UNSIGNED NOT NULL,
VILLE_DEP VARCHAR(50) NOT NULL,
VILLE_ARR VARCHAR(50) NOT NULL,
H_DEP TIME NOT NULL,
H_ARR TIME NOT NULL,
CONSTRAINT FK_Pilote FOREIGN KEY (NUMPIL) REFERENCES PILOTE(NUMPIL),
CONSTRAINT FK_Avion FOREIGN KEY (NUMAV) REFERENCES AVION(NUMAV),
PRIMARY KEY(NUMVOL)
);

INSERT INTO VOL (NUMAV,VILLE_DEP,NUMPIL,VILLE_ARR,H_DEP,H_ARR)
VALUES
  (8,"Marrakech",5,"Rabat","08:16:09","02:44:51"),
  (10,"Maroc",2,"Meknès","08:53:26","10:40:25"),
  (3,"Marrakech",3,"Meknès","07:47:39","02:01:26"),
  (4,"Meknès",4,"Marrakech","04:55:49","10:30:08"),
  (1,"Marrakech",1,"Rabat","02:30:11","04:24:16");

/* exo 7 */

DROP DATABASE if exists entreprise_exercice_7;
CREATE DATABASE IF NOT EXISTS entreprise_exercice_7;
USE entreprise_exercice_7;

CREATE TABLE Employe (
  Matricule mediumint(2) unsigned NOT NULL auto_increment,
  Nom varchar(255) default NULL,
  Prenom varchar(255) default NULL,
  DateNaissance varchar(255),
  Adresse varchar(255) default NULL,
  Salaire mediumint default NULL,
  N_Dep mediumint,
  superieur mediumint(2) unsigned default NULL,
  
  CONSTRAINT FK_Superieur FOREIGN KEY (superieur) REFERENCES Employe(Matricule),
  PRIMARY KEY (Matricule)
) AUTO_INCREMENT=1;

  
CREATE TABLE Departement (
NomD VARCHAR(30)  NOT NULL,
N_Dep mediumint NOT NULL AUTO_INCREMENT,
Directeur MEDIUMINT(2) UNSIGNED DEFAULT NULL,
CONSTRAINT FK_Directeur FOREIGN KEY (Directeur) REFERENCES Employe(Matricule),
PRIMARY KEY (N_Dep)
) ;

ALTER TABLE Employe
ADD CONSTRAINT FK_Departement FOREIGN KEY (N_Dep) REFERENCES Departement(N_Dep);

INSERT INTO Employe (Nom,Prenom,DateNaissance,Adresse,Salaire,N_Dep,superieur)
VALUES
  ("Lamharchi","Taha","1993-05-20","313-8225 Sodales. Road",1827,null,null),
  ("Mejia","Sawyer","1980-05-15","300-9104 Aliquam Rd.",1452,null,null),
  ("Black","Dane","1988-06-05","Ap #109-9549 Quam Avenue",1961,null,null);
INSERT INTO Departement (NomD,Directeur)
VALUES
  ("Comptabilite",2),
  ("Recherche",3),
  ("Ressource Humaine",1);
INSERT INTO Employe (Nom,Prenom,DateNaissance,Adresse,Salaire,N_Dep,superieur)
VALUES
  ("Dickson","August","1994-06-13","9022 Felis St.",1699,2,2),
  ("Daugherty","Kennedy","1994-05-10","475 Luctus Rd.",1484,1,1),
  ("Dean","Duncan","1986-06-26","589-2179 Nulla. Road",1746,1,2),
  ("Wiley","Evan","1988-07-25","208-1491 Metus. Ave",1984,2,4),
  ("Greer","Astra","1993-09-25","P.O. Box 795, 596 Eu, Avenue",1823,2,1),
  ("Estes","Ryder","1979-06-17","P.O. Box 592, 2951 Primis Av.",1855,3,3),
  ("Neal","Kamal","1986-09-30","285-5531 Et Rd.",1463,2,2);


CREATE TABLE Projet (
  N_Proj mediumint(8) unsigned NOT NULL auto_increment,
  NomP TEXT default NULL,
  Lieu varchar(255),
  N_Dep mediumint default NULL,
  CONSTRAINT FK_DepProjet FOREIGN KEY (N_Dep) REFERENCES Departement(N_Dep),
  PRIMARY KEY (N_Proj)
);

INSERT INTO Projet (NomP,Lieu,N_Dep)
VALUES
  ("Mega Lavage Informatique","Sachs Harbour",1),
  ("Cool Zero","Saskatoon",2),
  ("Lavage Informatique Zero","Périgueux",3),
  ("Restaurant","Paradise",2),
  ("Super Cool Mega","Mount Pearl",3);
  
CREATE TABLE Travaille (
  id mediumint(8) unsigned NOT NULL auto_increment,
  Matricule mediumint default NULL,
  N_Proj mediumint default NULL,
  Heures mediumint default NULL,
  PRIMARY KEY (id)
) AUTO_INCREMENT=1;

INSERT INTO Travaille (Matricule,N_Proj,Heures)
VALUES
  (8,5,5),
  (4,2,23),
  (10,3,7),
  (6,4,22),
  (9,2,2),
  (9,2,5),
  (9,3,5),
  (4,2,18),
  (9,4,17),
  (9,2,17),
  (4,4,26),
  (9,5,17),
  (5,2,8),
  (1,5,15),
  (5,1,27),
  (3,4,3),
  (9,2,21);
  /* exo 8 */

Drop database if exists exercice_8;
CREATE DATABASE IF NOT EXISTS exercice_8;
USE exercice_8;

/*DROP TABLE IF EXISTS Client;*/

CREATE TABLE IF NOT EXISTS Client (
  NumCli mediumint(8) unsigned NOT NULL auto_increment,
  Nom varchar(255) default NULL,
  Prenom varchar(255) default NULL,
  e_mail varchar(255) default NULL,
  NumCB varchar(255),
  PRIMARY KEY (NumCli)
) AUTO_INCREMENT=1;

INSERT INTO Client (Nom,Prenom,e_mail,NumCB)
VALUES
  ("Vance","Cadman","vance_cadman@hotmail.net","343153554214532"),
  ("Alexander","Wallace","alexander.wallace7732@icloud.fr","514668 941642 7354"),
  ("Nelson","Pandora","pandora-nelson2236@protonmail.fr","201485272363757"),
  ("Casey","Suki","s-casey5818@outlook.couk","402 64969 15818 215"),
  ("Burns","Thor","tburns5573@outlook.ca","490542 744738 4331"),
  ("Velez","Thor","v.thor@icloud.net","3722 393145 63443"),
  ("Mcdonald","Flynn","m-flynn@google.couk","2014 447558 72511"),
  ("Mclean","Mikayla","m_mclean6737@yahoo.couk","3024 375272 57457"),
  ("Henson","Arthur","arthur-henson@google.ca","5741 463417 65321"),
  ("Gallegos","Barry","g_barry4245@yahoo.net","556263 5283329764");
  
/*  DROP TABLE IF EXISTS Voyage;*/

CREATE TABLE IF NOT EXISTS Voyage (
  CodeVoyage mediumint(8) unsigned NOT NULL auto_increment,
  Destination varchar(100) default NULL,
  Duree mediumint default NULL,
  Prix mediumint default NULL,
  PRIMARY KEY (CodeVoyage)
) AUTO_INCREMENT=1;

INSERT INTO Voyage (Destination,Duree,Prix)
VALUES
  ("Singapore",4,449),
  ("Turkey",4,1833),
  ("New Zealand",11,1067),
  ("Norway",14,1627),
  ("Italy",9,1260),
  ("Brazil",6,52),
  ("France",8,1289),
  ("China",5,600),
  ("Belgium",4,1560),
  ("Turkey",1,740),
  ("Italy",12,1112),
  ("Philippines",11,1448),
  ("Belgium",10,1829),
  ("United Kingdom",6,780),
  ("Nigeria",7,1433),
  ("China",13,1792),
  ("China",12,310),
  ("Belgium",8,738),
  ("Turkey",9,352),
  ("Poland",10,1252);
  
  DROP TABLE IF EXISTS Reservation;

CREATE TABLE IF NOT EXISTS Reservation (
  NumCli mediumint(8) unsigned NOT NULL,
  CodeVoyage mediumint(8) unsigned NOT NULL,
  DateRes varchar(255),
  CONSTRAINT FK_Client FOREIGN KEY(NumCli) REFERENCES Client(NumCli),
  CONSTRAINT FK_Voyage FOREIGN KEY(CodeVoyage) REFERENCES Voyage(CodeVoyage)
) ;

INSERT INTO Reservation (NumCli,CodeVoyage,DateRes)
VALUES
  (7,10,"2023-03-16"),
  (5,8,"2022-03-05"),
  (6,5,"2023-05-22"),
  (8,9,"2022-08-16"),
  (3,5,"2022-10-22"),
  (6,17,"2023-04-15"),
  (7,6,"2022-05-24"),
  (2,16,"2022-07-17");

  /* exo 9 */ 

DROP DATABASE IF EXISTS exercice_9;
CREATE DATABASE IF NOT EXISTS exercice_9;
USE exercice_9;

DROP TABLE IF EXISTS Ville;

CREATE TABLE IF NOT EXISTS Ville (
  CodePostal varchar(10) NOT NULL,
  NomVille varchar(255),
  PRIMARY KEY (CodePostal)
);

INSERT INTO Ville (CodePostal,NomVille)
VALUES
  ("54000","Nancy"),
  ("33600","Pessac"),
  ("52100","Saint-Dizier"),
  ("80100","Abbeville"),
  ("25000","Besançon"),
  ("03000","Moulins"),
  ("20000","Ajaccio"),
  ("76200","Dieppe"),
  ("06800","Cagnes-sur-Mer"),
  ("83500","La Seyne-sur-Mer");
  
  DROP TABLE IF EXISTS Cinema;

CREATE TABLE IF NOT EXISTS Cinema (
  NumCine mediumint(8) unsigned NOT NULL auto_increment,
  NomCine TEXT default NULL,
  Adresse varchar(255) default NULL,
  CodePostal varchar(10) NOT NULL,
  PRIMARY KEY (NumCine),
  CONSTRAINT FK_Ville FOREIGN KEY (CodePostal) REFERENCES Ville(CodePostal)
) AUTO_INCREMENT=1;

INSERT INTO Cinema (NomCine,Adresse,CodePostal)
VALUES
  ("HAULIHOUD","P.O. Box 514, 8604 At Avenue","54000"),
  ("CINAIMA","Ap #533-9934 Aliquam Ave","33600"),
  ("SPILBERG","P.O. Box 621, 5667 Libero. Av.","52100"),
  ("KANE","P.O. Box 986, 4600 Accumsan Rd.","80100"),
  ("LABAS","5974 Massa. Avenue","25000"),
  ("ICI","P.O. Box 611, 7910 Purus. Rd.","03000"),
  ("WTF","3591 Nulla St.","20000"),
  ("COUSCOUS","8456 Aliquet Ave","76200"),
  ("RETRO","Ap #164-3903 Sem St.","06800"),
  ("THEATRE","228-2345 Eleifend Avenue","83500");
  
  DROP TABLE IF EXISTS Salle;

CREATE TABLE IF NOT EXISTS Salle (
  NumSalle mediumint(8) unsigned NOT NULL auto_increment,
  Capacite mediumint default NULL,
  NumCine mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (NumSalle),
  CONSTRAINT FK_Cine FOREIGN KEY(NumCine) REFERENCES Cinema(NumCine)
) AUTO_INCREMENT=1;

INSERT INTO Salle (Capacite,NumCine)
VALUES
  (218,2),
  (175,4),
  (388,3),
  (364,3),
  (269,3),
  (276,8),
  (240,6),
  (177,10),
  (218,7),
  (455,10),
  (391,5),
  (306,7),
  (294,4),
  (318,5),
  (428,10),
  (249,2),
  (482,6),
  (177,10),
  (159,3),
  (333,4),
  (427,4),
  (357,7),
  (243,3),
  (314,4),
  (414,9),
  (300,5),
  (393,5),
  (166,7),
  (298,4),
  (409,3),
  (287,4),
  (341,4),
  (450,1),
  (407,9),
  (152,6),
  (367,7),
  (343,3),
  (323,5),
  (158,8),
  (486,3),
  (421,4),
  (436,7),
  (161,7),
  (209,4),
  (465,6),
  (363,5),
  (471,5),
  (494,4),
  (196,8),
  (388,3),
  (246,6),
  (282,6),
  (456,2),
  (296,2),
  (183,9),
  (443,5),
  (299,4),
  (468,4),
  (181,2),
  (329,7);
  
  DROP TABLE IF EXISTS Film;

CREATE TABLE IF NOT EXISTS Film (
  NumExploit mediumint(8) unsigned NOT NULL auto_increment,
  Titre TEXT default NULL,
  Duree mediumint default NULL,
  PRIMARY KEY (NumExploit)
) AUTO_INCREMENT=1;

INSERT INTO Film (Titre,Duree)
VALUES
  ("REVENGE SUPERMAN",112),
  ("WORLD FANTASY",113),
  ("DEAD ALIVE BACK",106),
  ("BATMAN WORLD",137),
  ("DEAD",139),
  ("Hypnose",144),
  ("ALIVE BACK",118),
  ("ALIVE BACK RETURN",119);
  
  DROP TABLE IF EXISTS Projection;

CREATE TABLE IF NOT EXISTS Projection (
  NumExploit mediumint(8) unsigned NOT NULL,
  NumSalle mediumint(8) unsigned NOT NULL,
  NumSemaine mediumint default NULL,
  Nbentrees mediumint default NULL,
  CONSTRAINT FK_Film FOREIGN KEY (NumExploit) REFERENCES Film(NumExploit),
  CONSTRAINT FK_Salle FOREIGN KEY (NumSalle) REFERENCES Salle(NumSalle)
) ;

INSERT INTO Projection (NumExploit,NumSalle,NumSemaine,Nbentrees)
VALUES
  (5,18,19,265),
  (3,14,19,65),
  (3,49,26,66),
  (2,43,17,33),
  (3,31,3,51),
  (7,35,38,278),
  (6,33,48,154),
  (5,17,31,313),
  (7,50,22,168),
  (8,16,50,199),
  (2,50,7,293),
  (3,21,18,227),
  (5,12,37,321),
  (6,5,19,65),
  (8,25,9,161),
  (6,59,41,230),
  (6,23,50,294),
  (6,48,36,286),
  (3,21,2,164),
  (4,35,28,373),
  (7,53,17,235),
  (3,55,41,107),
  (3,50,27,39),
  (5,41,26,190),
  (7,58,25,221),
  (8,48,41,254),
  (3,34,45,261),
  (7,59,41,240),
  (8,30,45,221),
  (5,44,35,91),
  (5,32,50,247),
  (5,52,40,307),
  (8,20,40,203),
  (3,17,43,40),
  (5,7,7,138),
  (4,20,9,91),
  (4,21,26,170),
  (7,45,31,23),
  (6,7,51,103),
  (4,44,26,304);

  /* exo 10 */

DROP DATABASE IF EXISTS exercice10;

CREATE DATABASE IF NOT EXISTS exercice10;

USE exercice10;

CREATE TABLE EQUIPE (
  EQU_ID mediumint(8) unsigned NOT NULL auto_increment,
  EQU_NOM TEXT default NULL,
  EQUI_DIR varchar(255) default NULL,
  PRIMARY KEY (EQU_ID)
) AUTO_INCREMENT=1;

INSERT INTO EQUIPE (EQU_NOM,EQUI_DIR)
VALUES
  ("Festina","Maxwell Erickson"),("Union_Postal","Unity Valenzuela"),("T_telekom","Hayden Hammond"),("Rabobank","Maia Gardner"),("Saeco","Harlan Kerr");
  
  DROP TABLE IF EXISTS PAYS;

CREATE TABLE PAYS (
  PAY_ID mediumint(8) unsigned NOT NULL auto_increment,
  PAY_NOM varchar(100) default NULL,
  PRIMARY KEY (PAY_ID)
) AUTO_INCREMENT=1;

INSERT INTO PAYS (PAY_NOM)
VALUES
  ("Ukraine"),("Turkey"),("Columbia"),("Australia"),("Austria"),("Canada"),("Nigeria"),("South Korea"),("Canada"),("France");
  
  DROP TABLE IF EXISTS COUREUR;

CREATE TABLE COUREUR (
  COU_ID mediumint(8) unsigned NOT NULL auto_increment,
  COU_NOM varchar(255) default NULL,
  EQU_ID mediumint(8) unsigned NOT NULL,
  PAY_ID mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (COU_ID),
  CONSTRAINT FK_Pays FOREIGN KEY(PAY_ID) REFERENCES PAYS(PAY_ID)
) AUTO_INCREMENT=1;

INSERT INTO COUREUR (COU_NOM,EQU_ID,PAY_ID)
VALUES
  ("Tad Petty",1,10),  ("Sean Hopkins",1,6),  ("Cairo Skinner",1,9),  ("Ivan Tillman",1,3),  ("Lucius Marquez",1,3),  ("Dale Hoover",5,9),
  ("Emerson Avery",5,2),  ("Beck Hobbs",5,6),  ("Wayne Sweet",5,2),  ("Peter Contreras",5,3),  ("Hamilton Sharpe",2,8),  ("Castor Cotton",2,8),
  ("Brian Watson",2,2),  ("Zeus Rivers",2,8),  ("Nicholas Gilbert",2,9),   ("Geoffrey Abbott",3,6),  ("Calvin Phelps",3,2),  ("Todd Nunez",3,2),
  ("Kenyon Dixon",3,4),  ("Eaton Bean",3,3),  ("Oscar Pollard",4,4),  ("Kadeem Camacho",4,3),  ("Rigel Barber",4,4),  ("Quamar Hood",4,2),  ("Graham Rowe",4,8);
  
  DROP TABLE IF EXISTS TYPE_ETAPE;

CREATE TABLE TYPE_ETAPE (
  TYE_ID mediumint(8) unsigned NOT NULL auto_increment,
  TYE_LABEL TEXT default NULL,
  PRIMARY KEY (TYE_ID)
) AUTO_INCREMENT=1;

INSERT INTO TYPE_ETAPE (TYE_LABEL)
VALUES
  ("Contre_la_montre"),  ("Montagne"),  ("Plaine");
  
DROP TABLE IF EXISTS ETAPE;

CREATE TABLE ETAPE (
  ETA_ID mediumint(8) unsigned NOT NULL auto_increment,
  ETA_DATE DATE,
  ETA_VILLEDEP varchar(255),
  ETA_VILLEARR varchar(255),
  ETA_KM mediumint default NULL,
  TYE_ID mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (ETA_ID)
) AUTO_INCREMENT=1;

INSERT INTO ETAPE (ETA_DATE,ETA_VILLEDEP,ETA_VILLEARR,ETA_KM,TYE_ID)
VALUES
  ("2022-07-05","Reims","Troyes",230,2),  ("2022-07-06","Bastia","Lunel",151,3),  ("2022-07-07","Sotteville-lès-Rouen","Poitiers",226,3),
  ("2022-07-08","Périgueux","Laon",182,2),  ("2022-07-09","Limoges","Dole",227,2),  ("2022-07-10","Dijon","Lille",159,2),
  ("2022-07-11","Alès","Montluçon",189,2),  ("2022-07-12","Nancy","Ajaccio",231,3),  ("2022-07-13","Le Havre","Soissons",173,3),
  ("2022-07-14","Troyes","Lens",174,2),  ("2022-07-15","Sotteville-lès-Rouen","Aubagne",198,3),  ("2022-07-16","Sarreguemines","Cherbourg-Octeville",192,2),
  ("2022-07-17","Tarbes","Colomiers",214,1),  ("2022-07-18","Chalon-sur-Saône","Béziers",246,2),  ("2022-07-19","La Rochelle","Montigny-lès-Metz",192,2),
  ("2022-07-20","Valenciennes","Metz",222,1),  ("2022-07-21","Limoges","Limoges",237,2),  ("2022-07-22","La Seyne-sur-Mer","Colmar",248,2),
  ("2022-07-23","Saint-Dizier","Schiltigheim",202,2);
  
  DROP TABLE IF EXISTS PARTICIPER;

CREATE TABLE PARTICIPER (
  COU_ID mediumint(8) unsigned NOT NULL,
  ETA_ID mediumint(8) unsigned NOT NULL,
  PAR_TEMPS mediumint default NULL,
  PRIMARY KEY (COU_ID,ETA_ID),
  CONSTRAINT FK_Coureur FOREIGN KEY(COU_ID) REFERENCES COUREUR(COU_ID),
  CONSTRAINT FK_Etape FOREIGN KEY(ETA_ID) REFERENCES ETAPE(ETA_ID)
) ;

INSERT INTO PARTICIPER (COU_ID,ETA_ID,PAR_TEMPS)
VALUES
  (1,1,179),  (2,1,205),  (3,1,208),  (4,1,204),  (5,1,188),  (6,1,210),  (7,1,202),  (8,1,181),  (9,1,186),  (10,1,192),  (11,1,192),  (12,1,200),  (13,1,207),  (14,1,195),  (15,1,199),  (16,1,198),  (17,1,194),  (18,1,209),  (19,1,207),  (20,1,180),  (21,1,199),  (22,1,184),  (23,1,193),
  (24,1,208),  (25,1,193),  (1,2,182),  (2,2,179),  (3,2,206),  (4,2,185),  (5,2,198),  (6,2,207),  (7,2,199),  (8,2,202),  (9,2,182),  (10,2,189),  (11,2,185),  (12,2,185),  (13,2,185),  (14,2,182),  (15,2,209),  (16,2,205),  (17,2,195),  (18,2,188),  (19,2,195),  (20,2,189),  (21,2,183),
  (22,2,182),  (23,2,192),  (24,2,195),  (25,2,194),  (1,3,185),  (2,3,188),  (3,3,179),  (4,3,208),  (5,3,205),  (6,3,188),  (7,3,197),  (8,3,204),  (9,3,196),  (10,3,194),  (11,3,208),  (12,3,188),  (13,3,189),  (14,3,187),  (15,3,203),  (16,3,209),  (17,3,209),  (18,3,201),  (19,3,190),
  (20,3,206),  (21,3,186),  (22,3,203),  (23,3,202),  (24,3,186),  (25,3,199),  (1,4,205),  (2,4,203),  (3,4,188),  (4,4,179),  (5,4,194),  (6,4,202),  (7,4,181),  (8,4,192),  (9,4,197),  (10,4,194),  (11,4,205),  (12,4,197),  (13,4,190),  (14,4,202),  (15,4,200),  (16,4,202),  (17,4,189),  (18,4,191),
  (19,4,210),  (20,4,197),  (21,4,189),  (22,4,182),  (23,4,205),  (24,4,194),  (25,4,193),  (1,5,184),  (2,5,185),  (3,5,194),  (4,5,179),  (5,5,195),  (6,5,209),  (7,5,207),  (8,5,193),  (9,5,206),  (10,5,205),  (11,5,181),  (12,5,189),  (13,5,191),  (14,5,199),  (15,5,198),  (16,5,182),  (17,5,182),
  (18,5,193),  (19,5,208),  (20,5,189),  (21,5,181),  (22,5,186),  (23,5,206),  (24,5,195),  (25,5,207),  (1,6,180),  (2,6,194),  (3,6,187),  (4,6,182),  (5,6,209),  (6,6,179),  (7,6,185),  (8,6,198),  (9,6,183),  (10,6,191),  (11,6,195),  (12,6,197),  (13,6,194),  (14,6,197),  (15,6,181),  (16,6,204),
  (17,6,192),  (18,6,184),  (19,6,193),  (20,6,208),  (21,6,208),  (22,6,187),  (23,6,196),  (24,6,202),  (25,6,182),(1,7,178),  (2,7,191),  (3,7,196),  (4,7,192),  (5,7,205),  (6,7,207),  (7,7,194),  (8,7,199),  (9,7,209),  (10,7,203),  (11,7,197),  (12,7,199),  (13,7,199),  (14,7,191),  (15,7,191),
  (16,7,206),  (17,7,203),  (18,7,200),  (19,7,204),  (20,7,195),  (21,7,195),  (22,7,206),  (23,7,192),  (24,7,203),  (1,8,179),  (2,8,187),  (3,8,187),  (4,8,194),  (5,8,208),  (6,8,202),  (7,8,184),  (8,8,180),  (9,8,187),  (10,8,204),  (11,8,202),  (12,8,204),  (13,8,206),  (14,8,197),  (15,8,185),
  (16,8,205),  (17,8,209),  (18,8,190),  (19,8,207),  (20,8,199),  (21,8,183),  (22,8,208),  (23,8,197),  (24,8,206), (1,9,191),  (2,9,184),  (3,9,182),  (4,9,189),  (5,9,179),  (6,9,209),  (7,9,189),  (8,9,208),  (9,9,188),  (10,9,196),  (11,9,183),  (12,9,199),  (13,9,191),  (14,9,198),  (15,9,205),
  (16,9,195),  (17,9,193),  (18,9,193),  (19,9,192),  (20,9,197),  (21,9,180),  (22,9,188),  (23,9,210),  (24,9,209),  (1,10,202),  (2,10,197),  (3,10,209),  (4,10,199),  (5,10,190),  (6,10,199),  (7,10,203),  (8,10,206),  (9,10,198),  (10,10,206),  (11,10,193),  (12,10,194),  (13,10,196),  (14,10,180),
  (15,10,179),  (16,10,192),  (17,10,194),  (18,10,194),  (19,10,191),  (20,10,185),  (21,10,202),  (22,10,191),  (1,11,188),  (2,11,205),  (3,11,191),  (4,11,199),  (5,11,191),  (6,11,183),  (7,11,204),  (8,11,180),  (9,11,204),  (10,11,198),  (11,11,200),  (12,11,193),  (13,11,202),  (14,11,183),
  (15,11,186),  (16,11,188),  (17,11,187),  (18,11,196),  (19,11,209),  (20,11,194),  (21,11,200),  (22,11,179),  (1,12,187),  (2,12,183),  (3,12,195),  (4,12,199),  (5,12,202),  (6,12,208),  (7,12,182),  (8,12,179),  (9,12,196),  (10,12,193),  (11,12,197),  (12,12,185),  (13,12,199),  (14,12,188),
  (15,12,197),  (16,12,199),  (17,12,203),  (18,12,194),  (19,12,205),  (20,12,194),  (1,13,205),  (2,13,208),  (3,13,210),  (4,13,199),  (5,13,181),  (6,13,208),  (7,13,203),  (8,13,195),  (9,13,207),  (10,13,195),  (11,13,181),  (12,13,209),  (13,13,184),  (14,13,181),  (15,13,196),  (16,13,194),
  (17,13,200),  (18,13,181),  (19,13,189),  (20,13,207),   (1,14,194),  (2,14,188),  (3,14,201),  (4,14,192),  (5,14,194),  (6,14,188),  (7,14,184),  (8,14,186),  (9,14,196),  (10,14,198),  (11,14,188),  (12,14,194),  (13,14,186),  (14,14,207),  (15,14,186),  (16,14,198),  (17,14,181),  (18,14,179),  (19,14,206),
  (20,14,208),  (1,15,206),  (2,15,192),  (3,15,190),  (4,15,195),  (5,15,186),  (6,15,196),  (7,15,182),  (8,15,181),  (9,15,207),  (10,15,194),  (11,15,197),  (12,15,193),  (13,15,188),  (14,15,187),  (15,15,199),  (16,15,201),  (17,15,198),  (18,15,182),  (19,15,195),  (20,15,185),  (1,16,185),
  (2,16,190),  (3,16,195),  (4,16,203),  (5,16,198),  (6,16,181),  (7,16,208),  (8,16,197),  (9,16,185),  (10,16,206),  (11,16,207),  (12,16,186),  (13,16,208),  (14,16,186),  (15,16,204),  (16,16,188),  (17,16,192),  (18,16,189),  (19,16,195),  (20,16,182),    (1,17,206),  (2,17,187),  (3,17,202),
  (4,17,195),  (5,17,184),  (6,17,201),  (7,17,200),  (8,17,203),  (9,17,181),  (10,17,185),  (11,17,191),  (12,17,193),  (13,17,197),  (14,17,201),  (15,17,197),  (16,17,192),  (17,17,181),  (18,17,207),  (19,17,188),  (20,17,183),  (1,18,187),  (2,18,210),  (3,18,207),  (4,18,207),  (5,18,182),  (6,18,189),
  (7,18,187),  (8,18,183),  (9,18,200),  (10,18,203),  (11,18,203),  (12,18,193),  (13,18,188),  (14,18,185),  (15,18,202),  (16,18,199),  (17,18,206),  (18,18,185),  (19,18,209),  (20,18,203),  (1,19,193),  (2,19,198),  (3,19,192),  (4,19,193),  (5,19,192),  (6,19,199),  (7,19,191),  (8,19,191),
  (9,19,179),  (10,19,194),  (11,19,194),  (12,19,199),  (13,19,202),  (14,19,209),  (15,19,186),  (16,19,183),  (17,19,197),  (18,19,206),  (19,19,198),  (20,19,199);
  
  DROP TABLE IF EXISTS BONIFICATION;

CREATE TABLE BONIFICATION (
  ETA_ID mediumint(8) unsigned NOT NULL,
  COU_ID mediumint(8) unsigned NOT NULL,
  BON_KM mediumint NOT NULL,
  BON_RANG mediumint default NULL,
  BON_MINUNTE mediumint default NULL,
  PRIMARY KEY (ETA_ID, COU_ID, bon_km),
  CONSTRAINT FK_CoureurBonus FOREIGN KEY(COU_ID) REFERENCES COUREUR(COU_ID),
  CONSTRAINT FK_EtapeBonus FOREIGN KEY(ETA_ID) REFERENCES ETAPE(ETA_ID)
) ;

INSERT INTO BONIFICATION (ETA_ID,COU_ID,BON_KM,BON_RANG,BON_MINUNTE)
VALUES
  (1,6,122,1,2),  (2,14,77,1,4),  (3,13,182,1,4),  (4,3,118,1,3),  (5,7,112,1,2),  (6,13,108,1,4),  (7,14,66,1,3),  (8,4,203,1,2),  (9,14,154,1,3),
  (10,18,72,1,2),  (11,8,206,1,3),  (12,17,117,1,5),  (13,9,114,1,3),  (14,18,52,1,3),  (15,6,70,1,2),  (16,11,103,1,2),  (17,3,101,1,4),  (18,14,210,1,5),
  (19,8,120,1,4),  (1,6,90,2,5),  (2,6,50,2,1),  (3,8,187,2,5),  (4,12,98,2,4),  (5,8,204,2,2),  (6,14,152,2,4),  (7,16,159,2,2),  (8,19,69,2,2),
  (9,12,168,2,1),  (10,14,117,2,5),  (11,8,89,2,4),  (12,9,191,2,2),  (13,16,168,2,3),  (14,8,151,2,1),  (15,17,127,2,4),  (16,6,203,2,1),  (17,4,71,2,3),
  (18,10,186,2,2),  (19,16,54,2,3),  (1,18,165,3,4),  (2,18,89,3,4),  (3,1,69,3,3),  (4,2,149,3,3),  (5,12,91,3,1),  (6,9,77,3,3),  (7,9,70,3,3),
  (8,17,196,3,2),  (9,3,145,3,1),  (10,16,109,3,4),  (11,14,115,3,5),  (12,17,184,3,3),  (13,9,157,3,2),  (14,9,124,3,1),  (15,18,91,3,2),  (16,12,200,3,2),
  (17,18,171,3,5),  (18,14,155,3,2),  (19,2,69,3,1);
  
  /* exo 11 */


  /* exo 12 */ 

  DROP DATABASE IF EXISTS exercice12;

CREATE DATABASE IF NOT EXISTS exercice12;

USE exercice12;

DROP TABLE IF EXISTS `Fournisseur`;

CREATE TABLE IF NOT EXISTS `Fournisseur` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `Fournisseur` (`name`)
VALUES
  ("Ginger Park"),
  ("Victor Foster"),
  ("Rigel Sparks"),
  ("Clio Walker"),
  ("Barclay Ayala");
  
  DROP TABLE IF EXISTS `Client`;

CREATE TABLE IF NOT EXISTS `Client` (
  `clt_num` mediumint(8) unsigned NOT NULL auto_increment,
  `clt_nom` varchar(255) default NULL,
  `clt_prenom` varchar(255) default NULL,
  `clt_pays` varchar(100) default NULL,
  `clt_loc` varchar(255),
  `clt_type` TEXT default NULL,
  PRIMARY KEY (`clt_num`)
) AUTO_INCREMENT=1;

INSERT INTO `Client` (`clt_nom`,`clt_prenom`,`clt_pays`,`clt_loc`,`clt_type`)
VALUES
  ("Chambers","Tobias","Barbados","Ladysmith","Habitue"),
  ("Coffey","Sylvia","Virgin Islands, United States","Kaneohe","VIP"),
  ("Gregory","Amaya","Saint Lucia","Arviat","VIP"),
  ("Nixon","Helen","Benin","Bikaner","VIP"),
  ("Rowe","Simon","Bahamas","Dannevirke","Habitue"),
  ("Hartman","Ivan","Sri Lanka","Wandsworth","Habitue"),
  ("Marquez","Kasimir","Serbia","Culiacán","VIP"),
  ("Holden","Damon","Spain","Mariupol","Habitue"),
  ("Newman","Sheila","South Sudan","Okene","VIP"),
  ("Myers","Marshall","Isle of Man","San Pedro","Habitue"),
  ("Carrillo","Kirk","Argentina","Owerri","VIP"),
  ("Becker","Dylan","Turkmenistan","Ockelbo","Habitue"),
  ("Bass","Uriel","Armenia","Bathurst","Habitue"),
  ("Thornton","Lilah","Slovenia","Steinkjer","Habitue"),
  ("Torres","Graiden","Argentina","Palma de Mallorca","Habitue"),
  ("Mcdonald","Logan","Luxembourg","Arendal","Habitue"),
  ("Bender","Vernon","French Polynesia","Joué-lès-Tours","VIP"),
  ("Bauer","Haley","Laos","Acacías","VIP"),
  ("Dalton","Driscoll","Guinea-Bissau","Jurong East","Habitue"),
  ("Merrill","Vivien","Angola","Campbellton","Habitue");

DROP TABLE IF EXISTS `Magasin`;

CREATE TABLE IF NOT EXISTS `Magasin` (
  `mag_num` mediumint(8) unsigned NOT NULL auto_increment,
  `mag_loc` varchar(255),
  `mag_gerant` varchar(255) default NULL,
  PRIMARY KEY (`mag_num`)
) AUTO_INCREMENT=1;

INSERT INTO `Magasin` (`mag_loc`,`mag_gerant`)
VALUES
  ("Beijing","Delilah Alvarado"),
  ("Invercargill","Noah Martinez"),
  ("Picton","Sonia Rowe"),
  ("Sagay","Amal Rodriguez"),
  ("Yahyalı","Madonna Foley");
  
DROP TABLE IF EXISTS `Article`;

CREATE TABLE IF NOT EXISTS `Article` (
  `art_num` mediumint(8) unsigned NOT NULL auto_increment,
  `art_nom` TEXT default NULL,
  `art_poids` mediumint default NULL,
  `art_stock` mediumint default NULL,
  `art_pa` mediumint default NULL,
  `art_pv` mediumint default NULL,
  `art_four` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`art_num`),
  CONSTRAINT FK_Four FOREIGN KEY (art_four) REFERENCES Fournisseur(id)
) AUTO_INCREMENT=1;

INSERT INTO `Article` (`art_nom`,`art_poids`,`art_stock`,`art_pa`,`art_pv`,`art_four`)
VALUES
  ("mauris,",12,22,77,7,1),
  ("odio",15,21,35,18,1),
  ("suspendisse",14,44,85,15,4),
  ("sit",19,1,4,10,5),
  ("augue",9,43,25,41,2),
  ("amet",18,5,49,68,1),
  ("et",5,10,56,66,2),
  ("pellentesque",8,17,57,26,2),
  ("arcu",7,39,91,34,3),
  ("vestibulum",14,29,39,51,4);

DROP TABLE IF EXISTS `Commande`;

CREATE TABLE IF NOT EXISTS `Commande` (
  `cmd_num` mediumint(8) unsigned NOT NULL auto_increment,
  `cmd_date` DATE,
  `clt_num` mediumint(8) unsigned NOT NULL,
  `mag_num` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`cmd_num`),
  CONSTRAINT FK_clt FOREIGN KEY (clt_num) REFERENCES `Client`(clt_num),
  CONSTRAINT FK_mag FOREIGN KEY (mag_num) REFERENCES Magasin(mag_num)
) AUTO_INCREMENT=1;

INSERT INTO `Commande` (`cmd_date`,`clt_num`,`mag_num`)
VALUES
  ("2019-08-20",5,4),
  ("2019-06-23",2,3),
  ("2019-09-20",10,2),
  ("2019-07-13",19,3),
  ("2019-08-06",8,1),
  ("2019-07-26",13,5),
  ("2019-09-01",17,1),
  ("2019-08-21",8,4),
  ("2019-08-17",9,3),
  ("2019-09-04",6,5),
  ("2019-08-31",20,2),
  ("2019-09-28",15,3),
  ("2019-07-11",18,3),
  ("2019-08-08",18,1),
  ("2019-06-02",10,4),
  ("2019-06-20",7,3),
  ("2019-09-11",7,2),
  ("2019-06-19",7,2),
  ("2019-07-20",19,3),
  ("2019-08-25",8,2),
  ("2019-08-08",17,5),
  ("2019-06-06",20,2),
  ("2019-08-09",6,4),
  ("2019-07-13",5,5),
  ("2019-06-17",17,4),
  ("2019-06-01",1,3),
  ("2019-06-19",16,4),
  ("2019-09-05",7,3),
  ("2019-09-11",8,5),
  ("2019-09-23",12,3);

DROP TABLE IF EXISTS `Ligne_cmd`;

CREATE TABLE IF NOT EXISTS `Ligne_cmd` (
  `cmd_num` mediumint(8) unsigned NOT NULL,
  `art_num` mediumint(8) unsigned NOT NULL,
  `lcd_qte` mediumint default NULL,
  `lcd_pu` mediumint default NULL,
  `lcd_date_liv` DATE,
  CONSTRAINT FK_cmd FOREIGN KEY (cmd_num) REFERENCES Commande(cmd_num),
  CONSTRAINT FK_art FOREIGN KEY (art_num) REFERENCES Article(art_num)
) AUTO_INCREMENT=1;

INSERT INTO `Ligne_cmd`
VALUES
  (16,4,1,999,"2019-07-20"),
  (3,2,3,32,"2018-11-03"),
  (26,4,2,429,"2018-03-20"),
  (20,6,2,882,"2019-05-10"),
  (12,7,1,563,"2018-03-25"),
  (5,8,2,964,"2019-08-26"),
  (23,8,2,344,"2018-09-10"),
  (29,9,2,539,"2019-01-23"),
  (13,7,2,174,"2019-02-02"),
  (20,2,2,346,"2018-09-17"),
  (23,2,1,806,"2017-12-12"),
  (26,3,3,17,"2017-11-22"),
  (24,3,3,647,"2018-05-02"),
  (6,5,1,690,"2019-05-23"),
  (3,5,3,889,"2018-07-27"),
  (10,4,2,426,"2018-08-29"),
  (27,9,1,431,"2017-12-25"),
  (13,9,3,431,"2018-05-24"),
  (10,7,1,301,"2019-09-03"),
  (21,2,2,390,"2018-09-03");
