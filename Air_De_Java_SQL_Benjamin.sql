/*==============================================================*/
/* Nom de SGBD :  AIRdeJAVA                                     */
/* Auteur : Jerome BOEBION                                      */
/* Date de creation :  25/10/2022 			                    */
/*==============================================================*/

/*DROP DATABASE IF EXISTS AirdeJava;*/	
CREATE DATABASE AirdeJava;
use AirdeJava;

drop table if exists ACCES;

drop table if exists AUTEUR;

drop table if exists CHANSON;

drop table if exists CIVILITE;

drop table if exists GROUPE;

drop table if exists INSTRUMENT;

drop table if exists JOUER;

drop table if exists LOGIN;

drop table if exists MEMBRE;

drop table if exists MENU;

drop table if exists NECESSITE;

drop table if exists OCCUPER;

drop table if exists PASSAGE;

drop table if exists PAYS;

drop table if exists PERIODICITE;

drop table if exists PERSONNE;

drop table if exists PROFIL;

drop table if exists REGION;

drop table if exists RENCONTRE;

drop table if exists REPERTOIRE;

drop table if exists REPRESENTATION;

drop table if exists REPRESENTER;

drop table if exists RESPONSABILITE;

drop table if exists SPECIALISER;

drop table if exists SPECIALITE;

drop table if exists TYPEOEUVRE;

/*==============================================================*/
/* Table : ACCES                                                */
/*==============================================================*/
create table ACCES
(
   PRO_ID               int not null,
   MEN_ID               int not null,
   primary key (PRO_ID, MEN_ID)
);

/*==============================================================*/
/* Table : AUTEUR                                               */
/*==============================================================*/
create table AUTEUR
(
   PER_ID               int not null,
   CHA_ID               int not null,
   primary key (PER_ID, CHA_ID)
);

/*==============================================================*/
/* Table : CHANSON                                              */
/*==============================================================*/
create table CHANSON
(
   CHA_ID               int not null AUTO_INCREMENT,
   TYPO_ID              int not null,
   CHA_TITRE            char(50) not null,
   CHA_DATE             char(4) not null,
   CHA_TPS              time not null,
   primary key (CHA_ID)
);

/*==============================================================*/
/* Table : CIVILITE                                             */
/*==============================================================*/
create table CIVILITE
(
   CIV_ID               int not null AUTO_INCREMENT,
   CIV_LIBELLE          char(20) not null,
   primary key (CIV_ID)
);

/*==============================================================*/
/* Table : GROUPE                                               */
/*==============================================================*/
create table GROUPE
(
   GRO_ID               int not null AUTO_INCREMENT,
   PER_ID               int not null,
   GRO_NOM              char(50) not null,
   primary key (GRO_ID)
);

/*==============================================================*/
/* Table : INSTRUMENT                                           */
/*==============================================================*/
create table INSTRUMENT
(
   INS_ID               int not null AUTO_INCREMENT,
   INS_NOM              char(20) not null,
   primary key (INS_ID)
);

/*==============================================================*/
/* Table : JOUER                                                */
/*==============================================================*/
create table JOUER
(
   PER_ID               int not null,
   INS_ID               int not null,
   primary key (PER_ID, INS_ID)
);

/*==============================================================*/
/* Table : LOGIN                                                */
/*==============================================================*/
create table LOGIN
(
   LOG_USER             int not null AUTO_INCREMENT,
   PRO_ID               int not null,
   LOG_NOM              char(20) not null,
   LOG_PASS             char(20) not null,
   primary key (LOG_USER)
);

/*==============================================================*/
/* Table : MEMBRE                                               */
/*==============================================================*/
create table MEMBRE
(
   GRO_ID               int not null,
   PER_ID               int not null,
   primary key (per_id, gro_id)
);

/*==============================================================*/
/* Table : MENU                                                 */
/*==============================================================*/
create table MENU
(
   MEN_ID               int not null AUTO_INCREMENT,
   MEN_LIBELLE          char(20) not null,
   primary key (MEN_ID)
);

/*==============================================================*/
/* Table : NECESSITE                                            */
/*==============================================================*/
create table NECESSITE
(
   CHA_ID               int not null,
   INS_ID               int not null,
   primary key (CHA_ID, INS_ID)
);

/*==============================================================*/
/* Table : OCCUPER                                              */
/*==============================================================*/
create table OCCUPER
(
   RES_ID               int not null,
   GRO_ID               int not null,
   PER_ID               int not null,
   primary key (gro_id, res_id, per_id)
);

/*==============================================================*/
/* Table : PASSAGE                                              */
/*==============================================================*/
create table PASSAGE
(
   PAS_ID               int not null AUTO_INCREMENT,
   GRO_ID               int not null,
   REN_ID               int not null,
   PAS_DATE             datetime not null,
   PAS_HEUREDEB         time not null,
   PAS_HEUREFIN         time not null,
   PAS_LIEU             char(50) not null,
   primary key (PAS_ID)
);

/*==============================================================*/
/* Table : PAYS                                                 */
/*==============================================================*/
create table PAYS
(
   PAY_ID               int not null AUTO_INCREMENT,
   PAY_NOM              char(20) not null,
   primary key (PAY_ID)
);

/*==============================================================*/
/* Table : PERIODICITE                                          */
/*==============================================================*/
create table PERIODICITE
(
   PERI_ID              int not null AUTO_INCREMENT,
   PERI_NOM             char(20) not null,
   primary key (PERI_ID)
);

/*==============================================================*/
/* Table : PERSONNE                                             */
/*==============================================================*/
create table PERSONNE
(
   PER_ID               int not null AUTO_INCREMENT,
   CIV_ID               int not null,
   PER_NOM              char(20) not null,
   PER_PRENOM           char(20) not null,
   PER_ADR              char(50),
   PER_CP               int,
   PER_VILLE            char(20),
   PER_TEL              int,
   PER_FAX              int,
   PER_EMAIL            char(50),
   PER_DATENAISSANCE    datetime,
   primary key (PER_ID)
);

/*==============================================================*/
/* Table : PROFIL                                               */
/*==============================================================*/
create table PROFIL
(
   PRO_ID               int not null AUTO_INCREMENT,
   PRO_TYPE             char(20) not null,
   primary key (PRO_ID)
);

/*==============================================================*/
/* Table : REGION                                               */
/*==============================================================*/
create table REGION
(
   REG_ID               int not null AUTO_INCREMENT,
   PAY_ID               int not null,
   REG_NOM              char(30) not null,
   primary key (REG_ID)
);

/*==============================================================*/
/* Table : RENCONTRE                                            */
/*==============================================================*/
create table RENCONTRE
(
   REN_ID               int not null AUTO_INCREMENT,
   PERI_ID              int not null,
   PER_ID               int not null,
   REG_ID               int not null,
   REN_NOM              char(20) not null,
   REN_LIEU             char(20) not null,
   REN_DATEDEBUT        datetime not null,
   REN_DATEFIN          datetime not null,
   REN_NBPERS           int not null,
   primary key (REN_ID)
);

/*==============================================================*/
/* Table : REPERTOIRE                                           */
/*==============================================================*/
create table REPERTOIRE
(
   CHA_ID               int not null,
   GRO_ID               int not null,
   primary key (CHA_ID, GRO_ID)
);

/*==============================================================*/
/* Table : REPRENSENTATION                                      */
/*==============================================================*/
create table REPRESENTATION
(
   REP_ID               int not null AUTO_INCREMENT,
   PAS_ID               int not null,
   CHA_ID               int not null,
   REP_TEMPS            time not null,
   primary key (REP_ID)
);

/*==============================================================*/
/* Table : REPRESENTER                                          */
/*==============================================================*/
create table REPRESENTER
(
   REG_ID               int not null,
   GRO_ID               int not null,
   primary key (REG_ID, GRO_ID)
);

/*==============================================================*/
/* Table : RESPONSABILITE                                       */
/*==============================================================*/
create table RESPONSABILITE
(
   RES_ID               int not null AUTO_INCREMENT,
   RES_NOM              char(20) not null,
   primary key (RES_ID)
);

/*==============================================================*/
/* Table : SPECIALISER                                          */
/*==============================================================*/
create table SPECIALISER
(
   SPE_ID               int not null,
   PER_ID               int not null,
   REN_ID               int not null,
   primary key (per_id, spe_id,  ren_id)
);

/*==============================================================*/
/* Table : SPECIALITE                                           */
/*==============================================================*/
create table SPECIALITE
(
   SPE_ID               int not null AUTO_INCREMENT,
   SPE_NOM              char(20),
   primary key (SPE_ID)
);

/*==============================================================*/
/* Table : TYPEOEUVRE                                           */
/*==============================================================*/
create table TYPEOEUVRE
(
   TYPO_ID              int not null AUTO_INCREMENT,
   TYPO_NOM             char(20) not null,
   primary key (TYPO_ID)
);

alter table ACCES add constraint FK_ACCES foreign key (PRO_ID)
      references PROFIL (PRO_ID) on delete restrict on update restrict;

alter table ACCES add constraint FK_ACCES2 foreign key (MEN_ID)
      references MENU (MEN_ID) on delete restrict on update restrict;

alter table AUTEUR add constraint FK_AUTEUR foreign key (PER_ID)
      references PERSONNE (PER_ID) on delete restrict on update restrict;

alter table AUTEUR add constraint FK_AUTEUR2 foreign key (CHA_ID)
      references CHANSON (CHA_ID) on delete restrict on update restrict;

alter table CHANSON add constraint FK_ESTTYPE foreign key (TYPO_ID)
      references TYPEOEUVRE (TYPO_ID) on delete restrict on update restrict;

alter table GROUPE add constraint FK_CORRESPONDAND foreign key (PER_ID)
      references PERSONNE (PER_ID) on delete restrict on update restrict;

alter table JOUER add constraint FK_JOUER foreign key (PER_ID)
      references PERSONNE (PER_ID) on delete restrict on update restrict;

alter table JOUER add constraint FK_JOUER2 foreign key (INS_ID)
      references INSTRUMENT (INS_ID) on delete restrict on update restrict;

alter table LOGIN add constraint FK_TYPEPROFIL foreign key (PRO_ID)
      references PROFIL (PRO_ID) on delete restrict on update restrict;

alter table MEMBRE add constraint FK_MEMBRE foreign key (GRO_ID)
      references GROUPE (GRO_ID) on delete restrict on update restrict;

alter table MEMBRE add constraint FK_MEMBRE2 foreign key (PER_ID)
      references PERSONNE (PER_ID) on delete restrict on update restrict;

alter table NECESSITE add constraint FK_NECESSITE foreign key (CHA_ID)
      references CHANSON (CHA_ID) on delete restrict on update restrict;

alter table NECESSITE add constraint FK_NECESSITE2 foreign key (INS_ID)
      references INSTRUMENT (INS_ID) on delete restrict on update restrict;

alter table OCCUPER add constraint FK_OCCUPER foreign key (RES_ID)
      references RESPONSABILITE (RES_ID) on delete restrict on update restrict;

alter table OCCUPER add constraint FK_OCCUPER2 foreign key (GRO_ID)
      references GROUPE (GRO_ID) on delete restrict on update restrict;

alter table OCCUPER add constraint FK_OCCUPER3 foreign key (PER_ID)
      references PERSONNE (PER_ID) on delete restrict on update restrict;

alter table PASSAGE add constraint FK_HEBERGER foreign key (REN_ID)
      references RENCONTRE (REN_ID) on delete restrict on update restrict;

alter table PASSAGE add constraint FK_PASSAGEGROUPE foreign key (GRO_ID)
      references GROUPE (GRO_ID) on delete restrict on update restrict;

alter table PERSONNE add constraint FK_CIVIL foreign key (CIV_ID)
      references CIVILITE (CIV_ID) on delete restrict on update restrict;

alter table REGION add constraint FK_SETROUVER foreign key (PAY_ID)
      references PAYS (PAY_ID) on delete restrict on update restrict;

alter table RENCONTRE add constraint FK_ORGANISER foreign key (PER_ID)
      references PERSONNE (PER_ID) on delete restrict on update restrict;

alter table RENCONTRE add constraint FK_SEDEROULER foreign key (PERI_ID)
      references PERIODICITE (PERI_ID) on delete restrict on update restrict;
      
alter table RENCONTRE add constraint FK_SESITUER foreign key (REG_ID)
      references REGION (REG_ID) on delete restrict on update restrict;

alter table REPERTOIRE add constraint FK_REPERTOIRE foreign key (CHA_ID)
      references CHANSON (CHA_ID) on delete restrict on update restrict;

alter table REPERTOIRE add constraint FK_REPERTOIRE2 foreign key (GRO_ID)
      references GROUPE (GRO_ID) on delete restrict on update restrict;

alter table REPRESENTATION add constraint FK_IDENTIFIER foreign key (PAS_ID)
      references PASSAGE (PAS_ID) on delete restrict on update restrict;

alter table REPRESENTATION add constraint FK_PRODUIT foreign key (CHA_ID)
      references CHANSON (CHA_ID) on delete restrict on update restrict;

alter table REPRESENTER add constraint FK_REPRESENTER foreign key (REG_ID)
      references REGION (REG_ID) on delete restrict on update restrict;

alter table REPRESENTER add constraint FK_REPRESENTER3 foreign key (GRO_ID)
      references GROUPE (GRO_ID) on delete restrict on update restrict;

alter table SPECIALISER add constraint FK_SPECIALISER foreign key (SPE_ID)
      references SPECIALITE (SPE_ID) on delete restrict on update restrict;

alter table SPECIALISER add constraint FK_SPECIALISER2 foreign key (PER_ID)
      references PERSONNE (PER_ID) on delete restrict on update restrict;

alter table SPECIALISER add constraint FK_SPECIALISER3 foreign key (REN_ID)
      references RENCONTRE (REN_ID) on delete restrict on update restrict;
      
/* --------------------------
INSERTION JEU DE DONNEES
---------------------------*/
SET FOREIGN_KEY_CHECKS=0;

TRUNCATE PROFIL;
INSERT INTO PROFIL (pro_id, pro_type) VALUES (1, 'Administrateur');
INSERT INTO PROFIL (pro_id, pro_type) VALUES (2, 'Utilisateur');
INSERT INTO PROFIL (pro_id, pro_type) VALUES (3, 'Consultations');

TRUNCATE SPECIALITE;
INSERT INTO SPECIALITE (spe_id, spe_nom) VALUES (1, 'soliste');
INSERT INTO SPECIALITE (spe_id, spe_nom) VALUES (2, 'choriste');
INSERT INTO SPECIALITE (spe_id, spe_nom) VALUES (3, 'musicien');

TRUNCATE RESPONSABILITE;
INSERT INTO RESPONSABILITE (res_id, res_nom) VALUES (1, 'Chauffeur');
INSERT INTO RESPONSABILITE (res_id, res_nom) VALUES (2, 'Eclairagiste');
INSERT INTO RESPONSABILITE (res_id, res_nom) VALUES (3, 'Manutentionnaire');
INSERT INTO RESPONSABILITE (res_id, res_nom) VALUES (4, 'Trésorier');
INSERT INTO RESPONSABILITE (res_id, res_nom) VALUES (5, 'Habilleur');
INSERT INTO RESPONSABILITE (res_id, res_nom) VALUES (6, 'Maquilleur');
INSERT INTO RESPONSABILITE (res_id, res_nom) VALUES (7, 'Groupie');
INSERT INTO RESPONSABILITE (res_id, res_nom) VALUES (8, 'Coach');
INSERT INTO RESPONSABILITE (res_id, res_nom) VALUES (9, 'Intendant');
INSERT INTO RESPONSABILITE (res_id, res_nom) VALUES (10, 'Ingénieur so');
INSERT INTO RESPONSABILITE (res_id, res_nom) VALUES (11, 'Eclairagiste');
INSERT INTO RESPONSABILITE (res_id, res_nom) VALUES (12, 'Secrétaire');
INSERT INTO RESPONSABILITE (res_id, res_nom) VALUES (13, 'Chorégraphe');
INSERT INTO RESPONSABILITE (res_id, res_nom) VALUES (14, 'Scénographe');
INSERT INTO RESPONSABILITE (res_id, res_nom) VALUES (15, 'Cuisinier');

TRUNCATE TYPEOEUVRE;
INSERT INTO TYPEOEUVRE (typo_id, typo_nom) VALUES (1, 'Pop');
INSERT INTO TYPEOEUVRE (typo_id, typo_nom) VALUES (2, 'Rock');
INSERT INTO TYPEOEUVRE (typo_id, typo_nom) VALUES (3, 'Classique');
INSERT INTO TYPEOEUVRE (typo_id, typo_nom) VALUES (4, 'RnB');
INSERT INTO TYPEOEUVRE (typo_id, typo_nom) VALUES (5, 'Reggea');
INSERT INTO TYPEOEUVRE (typo_id, typo_nom) VALUES (6, 'Metal');
INSERT INTO TYPEOEUVRE (typo_id, typo_nom) VALUES (7, 'Variete');
INSERT INTO TYPEOEUVRE (typo_id, typo_nom) VALUES (8, 'Punk');
INSERT INTO TYPEOEUVRE (typo_id, typo_nom) VALUES (9, 'Eletro');

TRUNCATE INSTRUMENT;
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (1, 'Accordéo');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (2, 'Appeau');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (3, 'Banjo');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (4, 'Basse');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (5, 'Bâton de pluie');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (6, 'Batterie');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (7, 'Bombarde');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (8, 'Bongo');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (9, 'Calebasse');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (10, 'Carillo');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (11, 'Castagnettes');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (12, 'Cithare');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (13, 'Clarinette');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (14, 'Claveci');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (15, 'Claves');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (16, 'Cloche');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (17, 'Corne');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (18, 'Cornemuse');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (19, 'Cymbales');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (20, 'Diapaso');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (21, 'Djembé');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (22, 'Flûte');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (23, 'Grelots');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (24, 'Guimbarde');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (25, 'Guitare');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (26, 'Harmonica');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (27, 'Harpe');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (28, 'Hautbois');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (29, 'Lyre');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (30, 'Mandoline');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (31, 'Orgue');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (32, 'Piano');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (33, 'Saxophone');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (34, 'Synthétiseur');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (35, 'Tambour');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (36, 'Timbale');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (37, 'Triangle');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (38, 'Trombone');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (39, 'Trompette');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (40, 'Violo');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (41, 'Violoncelle');
INSERT INTO INSTRUMENT (ins_id, ins_nom) VALUES (42, 'Xylophone');

TRUNCATE PERIODICITE;
INSERT INTO PERIODICITE (peri_id, peri_nom) VALUES (1, 'Unique');
INSERT INTO PERIODICITE (peri_id, peri_nom) VALUES (2, 'Quotidienne');
INSERT INTO PERIODICITE (peri_id, peri_nom) VALUES (3, 'Lundi-Vendredi');
INSERT INTO PERIODICITE (peri_id, peri_nom) VALUES (4, 'Week-end');
INSERT INTO PERIODICITE (peri_id, peri_nom) VALUES (5, 'Hebdomadaire');
INSERT INTO PERIODICITE (peri_id, peri_nom) VALUES (6, 'Mensuelle');
INSERT INTO PERIODICITE (peri_id, peri_nom) VALUES (7, 'Bimensuelle');
INSERT INTO PERIODICITE (peri_id, peri_nom) VALUES (8, 'Trimestrielle');
INSERT INTO PERIODICITE (peri_id, peri_nom) VALUES (9, 'Semestrielle');
INSERT INTO PERIODICITE (peri_id, peri_nom) VALUES (10, 'Annuelle');
INSERT INTO PERIODICITE (peri_id, peri_nom) VALUES (11, 'Biennale');
INSERT INTO PERIODICITE (peri_id, peri_nom) VALUES (12, 'tria-nnuel');
INSERT INTO PERIODICITE (peri_id, peri_nom) VALUES (13, 'quadri-annuel');
INSERT INTO PERIODICITE (peri_id, peri_nom) VALUES (14, 'quinquennal');

TRUNCATE PAYS;
INSERT INTO PAYS (pay_id, pay_nom) VALUES (1, 'France');
INSERT INTO PAYS (pay_id, pay_nom) VALUES (2, 'Belgique');
INSERT INTO PAYS (pay_id, pay_nom) VALUES (3, 'Italie');
INSERT INTO PAYS (pay_id, pay_nom) VALUES (4, 'Suède');
INSERT INTO PAYS (pay_id, pay_nom) VALUES (5, 'Pologne');
INSERT INTO PAYS (pay_id, pay_nom) VALUES (6, 'Suède');
INSERT INTO PAYS (pay_id, pay_nom) VALUES (7, 'Norvège');
INSERT INTO PAYS (pay_id, pay_nom) VALUES (8, 'Allemagne');
INSERT INTO PAYS (pay_id, pay_nom) VALUES (9, 'Espagne');
INSERT INTO PAYS (pay_id, pay_nom) VALUES (10, 'Portugal');
INSERT INTO PAYS (pay_id, pay_nom) VALUES (11, 'Royaume-Uni');
INSERT INTO PAYS (pay_id, pay_nom) VALUES (12, 'Autriche');
INSERT INTO PAYS (pay_id, pay_nom) VALUES (13, 'Pays-Bas');

TRUNCATE CIVILITE;
INSERT INTO CIVILITE (civ_id, civ_libelle) VALUES (1, 'Monsieur');
INSERT INTO CIVILITE (civ_id, civ_libelle) VALUES (2, 'Madame');
INSERT INTO CIVILITE (civ_id, civ_libelle) VALUES (3, 'Mademoiselle');

TRUNCATE MENU;
INSERT INTO MENU (men_id, men_libelle) VALUES (1, 'Groupes');
INSERT INTO MENU (men_id, men_libelle) VALUES (2, 'Rencontres');
INSERT INTO MENU (men_id, men_libelle) VALUES (3, 'Œuvres');
INSERT INTO MENU (men_id, men_libelle) VALUES (4, 'Interrogations');
INSERT INTO MENU (men_id, men_libelle) VALUES (5, 'Outils');

TRUNCATE `LOGIN`;
INSERT INTO `LOGIN` (log_user, pro_id, log_nom, log_pass) VALUES (1, 1, 'Jea', 'Némar');
INSERT INTO `LOGIN` (log_user, pro_id, log_nom, log_pass) VALUES (2, 2, 'Robi', 'Didonque');
INSERT INTO `LOGIN` (log_user, pro_id, log_nom, log_pass) VALUES (3, 3, 'Camille', 'Onssiterne');
INSERT INTO `LOGIN` (log_user, pro_id, log_nom, log_pass) VALUES (4, 2, 'Thomas', 'Teufarssi');
INSERT INTO `LOGIN` (log_user, pro_id, log_nom, log_pass) VALUES (5, 3, 'Jéremy', 'Maichossette');

TRUNCATE ACCES;
INSERT INTO ACCES (pro_id, men_id) VALUES (1, 1);
INSERT INTO ACCES (pro_id, men_id) VALUES (1, 2);
INSERT INTO ACCES (pro_id, men_id) VALUES (1, 3);
INSERT INTO ACCES (pro_id, men_id) VALUES (1, 4);
INSERT INTO ACCES (pro_id, men_id) VALUES (1, 5);
INSERT INTO ACCES (pro_id, men_id) VALUES (2, 1);
INSERT INTO ACCES (pro_id, men_id) VALUES (2, 2);
INSERT INTO ACCES (pro_id, men_id) VALUES (2, 3);
INSERT INTO ACCES (pro_id, men_id) VALUES (2, 4);
INSERT INTO ACCES (pro_id, men_id) VALUES (3, 4);

TRUNCATE CHANSON;
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (1, 1, 'Smells Like teen spirit', '1991', '00:05:01');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (2, 7, 'Rocky road to Dubli', '1901', '00:03:20');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (3, 2, 'Detachable penis', '1992', '00:03:22');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (4, 2, 'Highway to hell', '1979', '00:03:26');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (5, 2, 'Die, die my darling', '1984', '00:06:29');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (6, 4, 'Killing me softly with his song', '1973', '00:04:46');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (7, 7, 'Whiskey in the jar', '1728', '00:15:04');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (8, 8, 'I wanna be sedated', '1979', '00:02:29');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (9, 1, 'Janie Jones', '1977', '00:02:09');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (10, 8, 'I wanna be your dog', '1969', '00:03:09');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (11, 8, 'Pretty vacant', '1977', '00:03:20');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (12, 3, 'So what', '1981', '00:03:08');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (13, 8, 'Insane in the Brai', '1993', '00:03:33');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (14, 2, 'Stoned raiders', '1995', '00:02:54');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (15, 2, 'I fought the law', '1959', '00:02:14');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (16, 2, 'The End', '1967', '00:11:43');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (17, 8, 'Atrocity exhibitio', '1980', '00:06:06');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (18, 1, 'A means to an end', '1980', '00:04:07');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (19, 6, 'The Funeral party', '1981', '00:04:14');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (20, 2, 'Hey,hey, My My', '1979', '00:05:20');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (21, 9, 'Derezzed', '2010', '00:01:43');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (22, 1, 'Wrong', '2009', '00:03:13');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (23, 2, 'Rotten apple', '1994', '00:06:58');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (24, 2, 'Nutshell', '1994', '00:04:19');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (25, 2, 'Mama', '1983', '00:06:52');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (26, 2, 'Zouk', '2011', '00:03:00');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (27, 1, 'Ma Chanson leur à pas plu', '1987', '00:04:11');
INSERT INTO CHANSON (cha_id, typo_id, cha_titre, cha_date, cha_tps) VALUES (28, 1, 'Loulou', '1988', '00:04:10');

TRUNCATE PERSONNE;
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (1, 1, 'ARISTOTE', 'JEAN FRANCOIS', '19 RUE GENERAL LECLERC', 78300, 'POISSY', NULL, NULL, 'jf.aristote@hotmail.fr', '1962-06-19');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (2, 1, 'BALLY', 'PHILIPPE', '3 RUE DES NOISETTES', 33000, 'BORDEAUX', NULL, NULL, '', '1981-05-15');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (3, 1, 'DURAND', 'PIERRE', '', 54500, 'VANDOEUVRE', NULL, NULL, 'p.durand@gmail.com', '1964-10-22');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (4, 2, 'GARCIA', 'LAURENCE', '78 RUE DU CANTALOUP', 41000, 'BLOIS', NULL, NULL, '', '1959-07-04');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (5, 2, 'GIRAUDIER', 'VALERIE', '19 AV ROUGE BORDEAUX', 63000, 'CLERMONT FERRAND', NULL, NULL, '', '1991-07-01');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (6, 1, 'BARDI', 'HENRY', '15 CHEMIN DE CROIX', 92000, 'NANTERRE', NULL, NULL, 'h.bardin@gmail.com', '1955-06-27');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (7, 1, 'LOUMAIGNE', 'PIERRE', '', 73000, 'CHAMBERRY', NULL, NULL, '', '1972-08-15');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (8, 1, 'MOULIADE', 'LOUIS', '11 RUE DE LA FONTAINE', 83600, 'FREJUS', NULL, NULL, '', '1970-04-29');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (9, 1, 'PAGNON ', 'MICHEL', '99 PLACE DE LA LANCE', 94120, 'FONTENAY SOUS BOIS', NULL, NULL, '', '1964-06-01');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (10, 3, 'RAYNAUD', 'SYLVIE', '54 PLACE DE L''ÉTÉ VERT', 95130, 'FRANCONVILLE', NULL, NULL, '', '1953-01-28');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (11, 1, 'BIJOUMAT', 'SYLVAI', '54 ALLEE DES FLEURS', 92500, 'RUEIL MALMAISO', NULL, NULL, 's.bijoumat@yahoo.fr', '1950-08-09');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (12, 1, 'AURY', 'STEVE', '118 AV DE POISSY', 59300, 'VALENCIENNE', NULL, NULL, '', '1974-04-28');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (13, 3, 'HABER', 'SONIA', '19 RUE DE LA ROQUETTE', 13127, 'VITROLLES', NULL, NULL, '', '1980-08-25');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (14, 2, 'MILLET ', 'FRANCOISE', '', 38200, 'VIENNES', NULL, NULL, '', '1969-02-11');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (15, 1, 'BELISTOT', 'NICOLAS', '112 AV DE LA VERRIERE', 95100, 'ARGENTEUIL', NULL, NULL, 'n.belistot@free.fr', '1949-03-22');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (16, 3, 'PAILLETTE', 'MAUDE', '56 AV DE LA FORTUNE', 54000, 'NANCY', NULL, NULL, '', '1967-11-01');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (17, 2, 'SOLHEID', 'JOSIANE', '12 RUE OPPORTUNITE', 57000, 'METZ', NULL, NULL, 'j.solheid@gmail.com', '1971-09-18');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (18, 1, 'KLERSY', 'KARIM', '45 RUE DE LA MEDITERRANEE', 66000, 'PERPIGNA', NULL, NULL, '', '1972-09-08');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (19, 1, 'FOURNIE', 'YVES', '13 RUE DE L''ECHO', 59500, 'DOUAI', NULL, NULL, '', '1966-03-10');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (20, 1, 'ALBERTO', 'RENE', '15 RUE DU MOULI', 78500, 'SARTROUVILLE', NULL, NULL, 'r.alberto@hotmail.fr', '1970-07-12');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (21, 1, 'CARL', 'ZIDANE', '12 RUE DE L''ABREUVOIR', 83600, 'FREJUS', NULL, NULL, '', '1965-01-04');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (22, 1, 'MEDINA', 'MOKHTAR', '119 RUE DU FAUCO', 57600, 'FORBACH', NULL, NULL, '', '1955-04-12');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (23, 3, 'HADDAD ', 'LAETITIA', '14 AV FLANDRE', 91620, 'JUVISY SUR ORGE', NULL, NULL, '', '1949-08-18');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (24, 1, 'FONDEVILLE', 'FRANCOIS', '89 RUE DE L''ARMEE', 25000, 'BESANCO', NULL, NULL, 'f.fondeville@gmail.com', '1960-09-27');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (25, 1, 'OUAISSA', 'AMAR', '59 RUE DE LA PROVINCE', 17500, 'JONZAC', NULL, NULL, '', '1961-04-07');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (26, 1, 'COSTES', 'CHRISTIA', '235 AV DE L''ESPOIR', 37300, 'JOUE LES TOURS', NULL, NULL, '', '1984-03-06');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (27, 2, 'AUBERT', 'SOPHIE', '5 RUE DU FIL ROUGE', 49000, 'ANGERS', NULL, NULL, '', '1971-06-28');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (28, 2, 'BAZZARA', 'AURORE', '', 13080, 'AIX EN PROVENCE', NULL, NULL, '', '1964-03-18');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (29, 1, 'AZERTY', 'MICHEL', '', 75012, 'PARIS', NULL, NULL, 'm.azerty@free.fr', '1977-02-23');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (30, 1, 'MARINOT', 'ANTOINE', '', 75008, 'PARIS', NULL, NULL, '', '1963-05-08');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (31, 2, 'CANTI', 'JEANINE', '256 ALLEE DES OISEAUX', 65000, 'TARBES', NULL, NULL, 'j.cantin@msn.com', '1971-11-23');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (32, 1, 'NGUYE', 'MICHEL', '10 AV DE LA LIBERTE', NULL, 'MARSEILLE', NULL, NULL, '', '1967-12-23');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (33, 3, 'PARKER', 'LAURA', '', 54520, 'LAXOU', NULL, NULL, '', '1964-03-30');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (34, 1, 'RODOMISTO', 'CHRISTOPHE', '76 RUE FROUARD', 38000, 'GRENOBLE', NULL, NULL, '', '1972-10-27');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (35, 2, 'AUGUSTIN ', 'MELANIE', '', 54390, 'FROUARD', NULL, NULL, '', '1963-06-09');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (36, 1, 'BANOU', 'FRANCK', '13 AV DE LA SPHERE', 97200, 'FORT DE France', NULL, NULL, 'f.banoun@free.fr', '1975-07-17');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (37, 1, 'TCHANA', 'PATRICK', '19 RUE DE L ALTITUDE', 17200, 'ROYA', NULL, NULL, 'p.tchana@gmail.com', '1982-07-14');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (38, 3, 'CONNER', 'ALISO', '', 33450, 'MONTUSA', NULL, NULL, '', '2000-01-01');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (39, 1, 'DAVID', 'FELIX', '', NULL, '', NULL, NULL, '', '1948-12-27');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (40, 2, 'BENSOUSS', 'JULIE', '', 97224, 'DUCOS', NULL, NULL, '', '1974-11-26');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (41, 2, 'BRETANI', 'MARIE', '56 RUE DE LA LORRAINE', 13004, 'MARSEILLE', NULL, NULL, 'm.bretanie@gmail.com', '1953-02-17');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (42, 1, 'MAILLARD', 'ARNAUD', '100 RUE DU TILLEUL', 37500, 'CHINO', NULL, NULL, '', '1960-08-07');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (43, 2, 'DUBRULLE', 'JULIETTE', '13 RUE RENARD', NULL, '', NULL, NULL, '', '1974-06-22');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (44, 1, 'LE DUFF', 'ISAAC', '7 AV GENERAL DE GAULLE', NULL, '', NULL, NULL, '', '1980-03-27');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (45, 3, 'MEYNARD ', 'JESSICA', '', NULL, '', NULL, NULL, '', '1971-02-03');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (46, 2, 'HUC', 'ELISABETH', '13 AV DE LA GRANDE ARMEE', 75019, 'PARIS', NULL, NULL, 'e.huc@free.fr', '1970-01-09');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (47, 3, 'LAURENCE', 'PEGGY', '', 17500, 'JONZAC', NULL, NULL, '', '1972-10-29');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (48, 1, 'GARCI', 'YOA', '', NULL, '', NULL, NULL, '', '1965-01-05');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (49, 1, 'IDTALEB', 'ISMAEL', '115 RUE CHATEAU NEUF', NULL, '', NULL, NULL, '', '1982-02-15');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (50, 2, 'JAMET', 'FRANCINE', '', 66600, 'PERILLOS', NULL, NULL, '', '1977-07-31');
INSERT PERSONNE (per_id, civ_id, per_nom, per_prenom, per_adr, per_cp, per_ville, per_tel, per_fax, per_email, per_datenaissance) VALUES (51, 1, 'MAOUET', 'YVES', '', 13009, 'MARSEILLE', NULL, NULL, 'y.maouet@yahoo.fr', '1966-08-14');

TRUNCATE REGION;
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (1, 11, "Midlands de l'Ouest");
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (2, 11, 'Yorkshire et Humber');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (3, 8, 'Bade-Wurtemberg');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (4, 8, 'Basse-Saxe');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (5, 8, 'Bavière');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (6, 8, 'Berlin');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (7, 8, 'Brandebourg');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (8, 8, 'Brême');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (9, 8, 'Hambourg');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (10, 8, 'Hesse');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (13, 8, 'Rhénanie-Palatinat');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (14, 8, 'Sarre');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (15, 8, 'Saxe');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (16, 8, 'Schleswig-Holstein');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (17, 8, 'Thuringe');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (18, 12, "Autriche de l'Est");
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (19, 12, 'Autriche du Sud');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (20, 12, "Autriche de l'Ouest");
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (21, 13, 'Nord');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (22, 13, 'Est');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (23, 13, 'Ouest');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (24, 13, 'Sud');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (25, 1, "Grand-Est");
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (26, 1, 'Bretagne');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (27, 1, 'Ile-de-France');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (28, 1, 'Occitanie');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (29, 1, 'Basse-Normandie');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (30, 1, "Provence-Alpes-Côte d'Azur");
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (31, 1, 'Auvergne-Rhône-Alpes');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (32, 1, 'Normandie');
INSERT REGION (reg_id, pay_id, reg_nom) VALUES (33, 1, 'Pays de la Loire');

TRUNCATE RENCONTRE;
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (1, 1, 6, 25, 'CANAL SOLEIL', 'NANCY', '2011-02-14 14:00:00', '2011-02-17 23:59:00', 1500);
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (2, 6, 10, 26, 'VIEILLES CHARRUES', 'BREST', '2011-12-12 20:00:00', '2011-12-15 22:00:00', 2200);
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (3, 11, 11, 27, 'LES MUZIKELLES', 'PARIS', '2011-06-10 14:00:00', '2011-06-14 22:00:00', 35000);
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (4, 11, 10, 28, 'REGGAE FESTIVALES', 'NARBONNE', '2011-08-05 20:30:00', '2011-08-07 00:00:00', 3000);
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (5, 15, 10, 25, "JA'SOUND", 'METZ', '2011-01-02', '2011-01-06', 4500);
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (6, 17, 8, 29, 'VOULSTOCK', 'CAEN', '2011-04-19', '2011-04-22', 18000);
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (7, 20, 11, 30, "FIEST'A SETE", 'NICE', '2011-05-05', '2011-05-07', 25000);
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (8, 24, 5, 31, 'ENFERMES DEHORS', 'GRENOBLE', '2011-03-26', '2011-03-29', 7000);
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (9, 31, 6, 28, 'NUIT DE NACRE', 'TOULOUSE', '2011-05-21', '2011-05-23', 11000);
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (10, 31, 10, 28, 'TRAD HIVERNALES', 'MONTPELLIER', '2011-11-16 15:05:00', '2011-11-19 22:00:00', 5000);
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (11, 36, 11, 30, 'CAP FESTIVAL', 'MARSEILLE', '2011-06-01', '2011-06-04', 6000);
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (12, 37, 7, 32, 'MOISSON ROCK', 'CHERBOURG', '2011-10-22', '2011-10-27', 30000);
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (13, 41, 10, 33, 'SCOPITONE', 'NANTES', '2011-09-06 20:00:00', '2011-09-09 22:00:00', 10000);
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (14, 46, 9, 31, 'PANTIERO', 'LYON', '2011-12-01', '2011-12-04', 8000);
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (15, 17, 8, 31, 'SALSA', 'SAINT ETIENNE', '2011-09-18 20:00:00', '2011-09-24 23:00:00', 20000);
INSERT RENCONTRE (ren_id, per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers) VALUES (16, 17, 8, 31, 'Irlande', 'SAINT ETIENNE', '2011-09-25 21:30:00', '2011-09-25 23:00:00', 20000);

TRUNCATE NECESSITE;
INSERT INTO NECESSITE (cha_id, ins_id) VALUES (1,11);
INSERT INTO NECESSITE (cha_id, ins_id) VALUES (1,25);
INSERT INTO NECESSITE (cha_id, ins_id) VALUES (4,25);
INSERT INTO NECESSITE (cha_id, ins_id) VALUES (5,32);
INSERT INTO NECESSITE (cha_id, ins_id) VALUES (6,32);
INSERT INTO NECESSITE (cha_id, ins_id) VALUES (9,11);
INSERT INTO NECESSITE (cha_id, ins_id) VALUES (9,31);
INSERT INTO NECESSITE (cha_id, ins_id) VALUES (9,32);
INSERT INTO NECESSITE (cha_id, ins_id) VALUES (9,33);
INSERT INTO NECESSITE (cha_id, ins_id) VALUES (12,32);
INSERT INTO NECESSITE (cha_id, ins_id) VALUES (13,31);
INSERT INTO NECESSITE (cha_id, ins_id) VALUES (13,33);

TRUNCATE AUTEUR;
INSERT AUTEUR (cha_id, per_id) VALUES (1, 5);
INSERT AUTEUR (cha_id, per_id) VALUES (2, 39);
INSERT AUTEUR (cha_id, per_id) VALUES (3, 7);
INSERT AUTEUR (cha_id, per_id) VALUES (4, 48);
INSERT AUTEUR (cha_id, per_id) VALUES (5, 45);
INSERT AUTEUR (cha_id, per_id) VALUES (6, 15);
INSERT AUTEUR (cha_id, per_id) VALUES (7, 17);
INSERT AUTEUR (cha_id, per_id) VALUES (8, 39);
INSERT AUTEUR (cha_id, per_id) VALUES (9, 24);
INSERT AUTEUR (cha_id, per_id) VALUES (10, 25);
INSERT AUTEUR (cha_id, per_id) VALUES (11, 26);
INSERT AUTEUR (cha_id, per_id) VALUES (12, 48);
INSERT AUTEUR (cha_id, per_id) VALUES (13, 37);
INSERT AUTEUR (cha_id, per_id) VALUES (14, 38);
INSERT AUTEUR (cha_id, per_id) VALUES (15, 41);
INSERT AUTEUR (cha_id, per_id) VALUES (16, 45);
INSERT AUTEUR (cha_id, per_id) VALUES (17, 4);
INSERT AUTEUR (cha_id, per_id) VALUES (18, 9);
INSERT AUTEUR (cha_id, per_id) VALUES (19, 13);
INSERT AUTEUR (cha_id, per_id) VALUES (20, 39);
INSERT AUTEUR (cha_id, per_id) VALUES (21, 32);
INSERT AUTEUR (cha_id, per_id) VALUES (22, 33);
INSERT AUTEUR (cha_id, per_id) VALUES (23, 45);
INSERT AUTEUR (cha_id, per_id) VALUES (24, 50);
INSERT AUTEUR (cha_id, per_id) VALUES (25, 51);

TRUNCATE JOUER;
INSERT JOUER (per_id, ins_id) VALUES (2, 32);
INSERT JOUER (per_id, ins_id) VALUES (4, 15);
INSERT JOUER (per_id, ins_id) VALUES (4, 23);
INSERT JOUER (per_id, ins_id) VALUES (4, 26);
INSERT JOUER (per_id, ins_id) VALUES (5, 1);
INSERT JOUER (per_id, ins_id) VALUES (5, 25);
INSERT JOUER (per_id, ins_id) VALUES (5, 28);
INSERT JOUER (per_id, ins_id) VALUES (6, 15);
INSERT JOUER (per_id, ins_id) VALUES (6, 21);
INSERT JOUER (per_id, ins_id) VALUES (6, 31);
INSERT JOUER (per_id, ins_id) VALUES (6, 34);
INSERT JOUER (per_id, ins_id) VALUES (7, 20);
INSERT JOUER (per_id, ins_id) VALUES (8, 30);
INSERT JOUER (per_id, ins_id) VALUES (9, 3);
INSERT JOUER (per_id, ins_id) VALUES (9, 5);
INSERT JOUER (per_id, ins_id) VALUES (9, 11);
INSERT JOUER (per_id, ins_id) VALUES (10, 2);
INSERT JOUER (per_id, ins_id) VALUES (10, 3);
INSERT JOUER (per_id, ins_id) VALUES (11, 34);
INSERT JOUER (per_id, ins_id) VALUES (12, 9);
INSERT JOUER (per_id, ins_id) VALUES (13, 29);
INSERT JOUER (per_id, ins_id) VALUES (13, 34);
INSERT JOUER (per_id, ins_id) VALUES (14, 8);
INSERT JOUER (per_id, ins_id) VALUES (14, 26);
INSERT JOUER (per_id, ins_id) VALUES (15, 1);
INSERT JOUER (per_id, ins_id) VALUES (16, 19);
INSERT JOUER (per_id, ins_id) VALUES (18, 2);
INSERT JOUER (per_id, ins_id) VALUES (18, 4);
INSERT JOUER (per_id, ins_id) VALUES (18, 8);
INSERT JOUER (per_id, ins_id) VALUES (19, 28);
INSERT JOUER (per_id, ins_id) VALUES (20, 2);
INSERT JOUER (per_id, ins_id) VALUES (20, 25);
INSERT JOUER (per_id, ins_id) VALUES (22, 17);
INSERT JOUER (per_id, ins_id) VALUES (23, 17);
INSERT JOUER (per_id, ins_id) VALUES (23, 21);
INSERT JOUER (per_id, ins_id) VALUES (23, 24);
INSERT JOUER (per_id, ins_id) VALUES (24, 1);
INSERT JOUER (per_id, ins_id) VALUES (24, 5);
INSERT JOUER (per_id, ins_id) VALUES (25, 8);
INSERT JOUER (per_id, ins_id) VALUES (25, 10);
INSERT JOUER (per_id, ins_id) VALUES (25, 18);
INSERT JOUER (per_id, ins_id) VALUES (26, 1);
INSERT JOUER (per_id, ins_id) VALUES (26, 4);
INSERT JOUER (per_id, ins_id) VALUES (27, 11);
INSERT JOUER (per_id, ins_id) VALUES (27, 27);
INSERT JOUER (per_id, ins_id) VALUES (28, 20);
INSERT JOUER (per_id, ins_id) VALUES (28, 31);
INSERT JOUER (per_id, ins_id) VALUES (29, 8);
INSERT JOUER (per_id, ins_id) VALUES (30, 17);
INSERT JOUER (per_id, ins_id) VALUES (30, 20);
INSERT JOUER (per_id, ins_id) VALUES (31, 23);
INSERT JOUER (per_id, ins_id) VALUES (32, 22);
INSERT JOUER (per_id, ins_id) VALUES (33, 17);
INSERT JOUER (per_id, ins_id) VALUES (33, 23);
INSERT JOUER (per_id, ins_id) VALUES (33, 33);
INSERT JOUER (per_id, ins_id) VALUES (35, 16);
INSERT JOUER (per_id, ins_id) VALUES (37, 14);
INSERT JOUER (per_id, ins_id) VALUES (37, 33);
INSERT JOUER (per_id, ins_id) VALUES (38, 21);
INSERT JOUER (per_id, ins_id) VALUES (40, 18);
INSERT JOUER (per_id, ins_id) VALUES (41, 7);
INSERT JOUER (per_id, ins_id) VALUES (43, 18);
INSERT JOUER (per_id, ins_id) VALUES (43, 20);
INSERT JOUER (per_id, ins_id) VALUES (44, 16);
INSERT JOUER (per_id, ins_id) VALUES (44, 17);
INSERT JOUER (per_id, ins_id) VALUES (44, 23);
INSERT JOUER (per_id, ins_id) VALUES (45, 1);
INSERT JOUER (per_id, ins_id) VALUES (45, 7);
INSERT JOUER (per_id, ins_id) VALUES (45, 20);
INSERT JOUER (per_id, ins_id) VALUES (45, 21);
INSERT JOUER (per_id, ins_id) VALUES (46, 12);
INSERT JOUER (per_id, ins_id) VALUES (47, 2);
INSERT JOUER (per_id, ins_id) VALUES (47, 34);
INSERT JOUER (per_id, ins_id) VALUES (48, 6);
INSERT JOUER (per_id, ins_id) VALUES (49, 4);
INSERT JOUER (per_id, ins_id) VALUES (49, 12);
INSERT JOUER (per_id, ins_id) VALUES (50, 13);
INSERT JOUER (per_id, ins_id) VALUES (50, 25);
INSERT JOUER (per_id, ins_id) VALUES (51, 27);
INSERT JOUER (per_id, ins_id) VALUES (51, 31);

TRUNCATE GROUPE;
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (3, 11, 'The Beatles');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (4, 15, 'La mano negra');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (5, 17, 'Louise Attaque');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (6, 20, 'Abba');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (7, 24, 'Killer bees');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (8, 31, 'Myslovitz');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (9, 36, 'Mecano');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (10, 37, 'Début de soirée');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (11, 41, 'Il était une fois');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (12, 46, 'The supremes');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (13, 1, 'The blues brothers');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (14, 6, 'Tri Yann');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (15, 11, 'Johnny Hallyday');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (16, 15, 'Daft punk');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (17, 17, 'Los Portos');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (18, 20, 'Lady punk');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (19, 24, 'Afpa Max');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (20, 31, 'La bande à Bono');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (21, 36, 'Tokyo Hotel');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (22, 37, 'Mississipi burning');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (23, 41, 'Chocolate box');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (24, 46, 'Fingers in the nose');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (25, 1, 'Demonic turtle');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (26, 6, 'Donde esta la fiesta ?');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (27, 11, 'Simple minds');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (28, 31, 'MCD do dupy !');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (29, 36, 'Les tambours du Bronx');
INSERT GROUPE (gro_id, per_id, gro_nom) VALUES (30, 37, 'Alea jacta est');

TRUNCATE PASSAGE;
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (1, 19, 1, '2012-02-14', '14:00:00', '15:00:00', 'Salle des Fêtes Vandoeuvre');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (2, 30, 1, '2012-02-14', '15:30:00', '16:45:00', 'Zénith de Nancy');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (3, 9, 1, '2012-02-14', '18:30:00', '20:00:00', 'Le Quai''son');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (4, 20, 1, '2012-02-17', '21:00:00', '23:30:00', 'Zénith de Nancy');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (5, 18, 1, '2012-02-17', '16:00:00', '16:45:00', 'Salle des Fêtes Villerupt');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (6, 13, 1, '2012-02-17', '20:45:00', '23:59:00', 'Zénith de Nancy');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (7, 17, 2, '2011-12-12', '20:00:00', '21:30:00', 'Le Quartz');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (8, 14, 2, '2011-12-14', '21:45:00', '23:00:00', 'Penn Ar Jazz');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (9, 6, 2, '2011-12-15', '16:00:00', '18:30:00', 'Penfeld Parc Expo');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (10, 5, 2, '2011-12-15', '20:00:00', '22:00:00', 'Parc Expo Penvillers - Quimper');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (11, 6, 3, '2011-06-10', '14:00:00', '15:25:00', 'Café de la Danse - 11ème');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (12, 4, 3, '2011-06-10', '18:00:00', '20:30:00', 'La Cigale - 18ème');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (13, 16, 3, '2011-06-10', '21:30:00', '23:00:00', 'Zénith de Paris');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (14, 16, 3, '2011-06-13', '20:00:00', '22:00:00', 'Zénith de Paris');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (15, 16, 3, '2011-06-14', '20:00:00', '22:00:00', 'Zénith de Paris');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (16, 21, 4, '2011-08-05', '20:30:00', '22:00:00', 'Théâtre de Narbonne');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (17, 22, 4, '2011-08-06', '21:30:00', '23:00:00', 'Théâtre de Narbonne');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (18, 14, 4, '2011-08-07', '22:30:00', '00:00:00', 'Théâtre de Narbonne');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (19, 16, 10, '2011-11-16', '15:05:00', '16:00:00', 'Zénith de Montpellier');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (20, 15, 10, '2011-11-19', '20:00:00', '22:00:00', 'Zénith de Montpellier');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (21, 30, 13, '2011-09-06', '20:00:00', '21:30:00', 'Le TNT - Nantes');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (22, 14, 13, '2011-09-09', '20:00:00', '22:00:00', 'Zénith de Nantes');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (23, 28, 15, '2011-09-18', '20:00:00', '22:00:00', 'Parc des Expos - St-Etienne');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (24, 15, 15, '2011-09-24', '21:30:00', '23:00:00', 'Zénith de Saint-Etienne');
INSERT PASSAGE (pas_id, gro_id, ren_id, pas_date, pas_heuredeb, pas_heurefin, pas_lieu) VALUES (26, 15, 16, '2011-09-25', '21:30:00', '22:00:00', 'Zénith de Saint-Etienne');

TRUNCATE OCCUPER;
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (3, 1, 20);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (3, 2, 34);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (3, 3, 16);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (4, 1, 33);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (4, 2, 50);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (4, 3, 9);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (5, 1, 2);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (5, 2, 30);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (5, 3, 34);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (5, 4, 14);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (6, 1, 51);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (6, 2, 41);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (6, 3, 27);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (6, 4, 38);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (7, 1, 44);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (8, 1, 42);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (8, 2, 2);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (8, 3, 18);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (9, 1, 22);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (9, 2, 12);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (9, 3, 43);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (10, 1, 20);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (10, 2, 16);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (10, 3, 35);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (11, 1, 18);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (12, 1, 23);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (12, 2, 11);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (12, 3, 28);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (13, 1, 50);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (13, 2, 35);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (13, 3, 48);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (13, 4, 33);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (13, 5, 32);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (13, 6, 39);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (14, 1, 2);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (15, 1, 9);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (15, 2, 5);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (15, 3, 17);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (15, 4, 38);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (16, 1, 32);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (16, 2, 50);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (17, 1, 34);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (17, 3, 15);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (17, 4, 32);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (17, 5, 48);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (17, 6, 2);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (18, 1, 25);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (18, 2, 38);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (18, 3, 4);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (18, 4, 40);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (18, 13, 11);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (19, 2, 26);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (19, 3, 34);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (20, 1, 48);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (20, 2, 44);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (20, 2, 49);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (20, 3, 47);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (20, 4, 9);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (20, 5, 9);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (20, 6, 47);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (21, 1, 2);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (21, 2, 26);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (22, 2, 9);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (22, 3, 9);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (22, 4, 17);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (22, 5, 48);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (23, 3, 34);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (23, 4, 12);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (23, 5, 7);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (23, 6, 34);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (23, 7, 51);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (23, 8, 50);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (24, 1, 39);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (24, 15, 16);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (25, 4, 34);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (25, 14, 29);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (26, 5, 21);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (27, 7, 37);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (27, 9, 1);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (27, 10, 12);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (27, 11, 21);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (27, 12, 33);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (28, 1, 38);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (29, 1, 39);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (29, 2, 22);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (29, 8, 29);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (29, 14, 44);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (30, 1, 46);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (30, 7, 2);
INSERT OCCUPER (gro_id, res_id, per_id) VALUES (30, 12, 34);

TRUNCATE MEMBRE;
INSERT MEMBRE (per_id, gro_id) VALUES (1, 5);
INSERT MEMBRE (per_id, gro_id) VALUES (1, 7);
INSERT MEMBRE (per_id, gro_id) VALUES (1, 16);
INSERT MEMBRE (per_id, gro_id) VALUES (1, 25);
INSERT MEMBRE (per_id, gro_id) VALUES (2, 29);
INSERT MEMBRE (per_id, gro_id) VALUES (3, 16);
INSERT MEMBRE (per_id, gro_id) VALUES (3, 20);
INSERT MEMBRE (per_id, gro_id) VALUES (4, 9);
INSERT MEMBRE (per_id, gro_id) VALUES (5, 14);
INSERT MEMBRE (per_id, gro_id) VALUES (5, 30);
INSERT MEMBRE (per_id, gro_id) VALUES (6, 27);
INSERT MEMBRE (per_id, gro_id) VALUES (8, 18);
INSERT MEMBRE (per_id, gro_id) VALUES (9, 12);
INSERT MEMBRE (per_id, gro_id) VALUES (9, 22);
INSERT MEMBRE (per_id, gro_id) VALUES (10, 16);
INSERT MEMBRE (per_id, gro_id) VALUES (10, 20);
INSERT MEMBRE (per_id, gro_id) VALUES (11, 18);
INSERT MEMBRE (per_id, gro_id) VALUES (12, 11);
INSERT MEMBRE (per_id, gro_id) VALUES (12, 23);
INSERT MEMBRE (per_id, gro_id) VALUES (12, 28);
INSERT MEMBRE (per_id, gro_id) VALUES (15, 5);
INSERT MEMBRE (per_id, gro_id) VALUES (15, 9);
INSERT MEMBRE (per_id, gro_id) VALUES (15, 17);
INSERT MEMBRE (per_id, gro_id) VALUES (17, 15);
INSERT MEMBRE (per_id, gro_id) VALUES (18, 4);
INSERT MEMBRE (per_id, gro_id) VALUES (18, 11);
INSERT MEMBRE (per_id, gro_id) VALUES (18, 25);
INSERT MEMBRE (per_id, gro_id) VALUES (19, 26);
INSERT MEMBRE (per_id, gro_id) VALUES (20, 9);
INSERT MEMBRE (per_id, gro_id) VALUES (21, 26);
INSERT MEMBRE (per_id, gro_id) VALUES (22, 9);
INSERT MEMBRE (per_id, gro_id) VALUES (22, 17);
INSERT MEMBRE (per_id, gro_id) VALUES (23, 7);
INSERT MEMBRE (per_id, gro_id) VALUES (23, 12);
INSERT MEMBRE (per_id, gro_id) VALUES (24, 16);
INSERT MEMBRE (per_id, gro_id) VALUES (25, 29);
INSERT MEMBRE (per_id, gro_id) VALUES (26, 21);
INSERT MEMBRE (per_id, gro_id) VALUES (27, 12);
INSERT MEMBRE (per_id, gro_id) VALUES (27, 21);
INSERT MEMBRE (per_id, gro_id) VALUES (29, 22);
INSERT MEMBRE (per_id, gro_id) VALUES (29, 29);

TRUNCATE REPERTOIRE;
INSERT REPERTOIRE (cha_id, gro_id) VALUES (1, 4);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (1, 7);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (1, 23);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (3, 3);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (3, 11);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (4, 9);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (5, 12);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (5, 16);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (6, 5);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (6, 23);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (7, 6);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (7, 8);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (7, 10);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (7, 12);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (8, 9);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (9, 6);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (9, 14);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (9, 17);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (10, 3);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (10, 4);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (11, 23);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (11, 25);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (12, 8);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (12, 15);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (12, 26);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (13, 12);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (13, 13);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (13, 27);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (14, 13);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (14, 28);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (15, 18);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (15, 29);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (16, 5);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (16, 18);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (16, 20);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (16, 30);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (17, 21);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (18, 14);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (18, 19);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (19, 22);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (19, 23);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (20, 24);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (21, 15);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (21, 22);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (22, 11);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (23, 16);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (24, 4);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (24, 24);
INSERT REPERTOIRE (cha_id, gro_id) VALUES (25, 22);

TRUNCATE SPECIALISER;
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (2, 1, 4);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (3, 1, 1);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (3, 2, 2);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (5, 1, 5);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (7, 1, 10);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (10, 1, 11);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (10, 2, 13);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (11, 2, 5);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (11, 2, 10);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (19, 1, 11);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (19, 2, 9);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (20, 1, 13);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (25, 2, 7);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (27, 1, 11);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (28, 1, 9);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (29, 2, 9);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (30, 2, 11);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (30, 2, 15);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (31, 1, 14);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (31, 2, 4);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (31, 2, 6);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (41, 1, 13);
INSERT SPECIALISER (per_id, spe_id,  ren_id) VALUES (45, 1, 6);

TRUNCATE REPRESENTER;
INSERT REPRESENTER (gro_id, reg_id) VALUES (3, 5);
INSERT REPRESENTER (gro_id, reg_id) VALUES (4, 1);
INSERT REPRESENTER (gro_id, reg_id) VALUES (4, 2);
INSERT REPRESENTER (gro_id, reg_id) VALUES (4, 7);
INSERT REPRESENTER (gro_id, reg_id) VALUES (5, 2);
INSERT REPRESENTER (gro_id, reg_id) VALUES (5, 13);
INSERT REPRESENTER (gro_id, reg_id) VALUES (6, 3);
INSERT REPRESENTER (gro_id, reg_id) VALUES (6, 10);
INSERT REPRESENTER (gro_id, reg_id) VALUES (8, 13);
INSERT REPRESENTER (gro_id, reg_id) VALUES (9, 7);
INSERT REPRESENTER (gro_id, reg_id) VALUES (9, 22);
INSERT REPRESENTER (gro_id, reg_id) VALUES (10, 1);
INSERT REPRESENTER (gro_id, reg_id) VALUES (10, 9);
INSERT REPRESENTER (gro_id, reg_id) VALUES (14, 14);
INSERT REPRESENTER (gro_id, reg_id) VALUES (15, 16);
INSERT REPRESENTER (gro_id, reg_id) VALUES (16, 7);
INSERT REPRESENTER (gro_id, reg_id) VALUES (19, 18);
INSERT REPRESENTER (gro_id, reg_id) VALUES (19, 24);
INSERT REPRESENTER (gro_id, reg_id) VALUES (20, 19);
INSERT REPRESENTER (gro_id, reg_id) VALUES (21, 4);
INSERT REPRESENTER (gro_id, reg_id) VALUES (22, 6);
INSERT REPRESENTER (gro_id, reg_id) VALUES (22, 14);
INSERT REPRESENTER (gro_id, reg_id) VALUES (23, 1);
INSERT REPRESENTER (gro_id, reg_id) VALUES (24, 8);
INSERT REPRESENTER (gro_id, reg_id) VALUES (25, 5);

TRUNCATE REPRESENTATION;
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (1, 18, 1, '00:04:10');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (2, 16, 2, '00:11:40');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (3, 4, 3, '00:03:30');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (4, 16, 4, '00:11:40');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (5, 15, 5, '00:02:14');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (6, 13, 6, '00:03:30');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (7, 9, 7, '00:02:10');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (8, 9, 8, '00:02:10');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (9, 9, 9, '00:02:10');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (10, 6, 10, '00:05:00');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (11, 9, 11, '00:02:10');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (12, 1, 12, '00:05:00');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (13, 5, 13, '00:06:30');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (14, 23, 14, '00:07:00');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (15, 23, 15, '00:07:00');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (16, 17, 16, '00:06:06');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (17, 21, 17, '00:01:50');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (18, 18, 18, '00:04:10');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (19, 23, 19, '00:07:00');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (20, 21, 20, '00:01:50');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (21, 16, 21, '00:02:20');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (22, 18, 22, '00:04:10');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (23, 13, 23, '00:03:40');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (24, 12, 24, '00:03:10');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (25, 18, 25, '00:04:10');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (26, 16, 26, '00:11:40');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (27, 20, 27, '00:05:20');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (28, 19, 28, '00:04:20');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (29, 1, 29, '00:05:00');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (30, 1, 30, '00:05:00');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (31, 2, 31, '00:03:20');
INSERT REPRESENTATION (rep_id, cha_id, pas_id, rep_temps) VALUES (32, 7, 32, '00:15:00');

TRUNCATE SPECIALISER;
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (2, 1, 4);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (3, 1, 1);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (3, 2, 2);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (5, 1, 5);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (7, 1, 10);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (10, 1, 11);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (10, 2, 13);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (11, 2, 5);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (11, 2, 10);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (19, 1, 11);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (19, 2, 9);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (20, 1, 13);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (25, 2, 7);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (27, 1, 11);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (28, 1, 9);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (29, 2, 9);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (30, 2, 11);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (30, 2, 15);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (31, 1, 14);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (31, 2, 4);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (31, 2, 6);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (41, 1, 13);
INSERT SPECIALISER (per_id, spe_id, ren_id) VALUES (45, 1, 6);

SET FOREIGN_KEY_CHECKS=1;