/*------------------------------------------*/
/* NOM DE SGBD : AUTO ECOLE					*/
/* DATE DE CREATION : 03/10/2023			*/
/* AUTEUR : BENJAMIN						*/
/*------------------------------------------*/

Create database if not exists auto_ecole;

use auto_ecole;

drop table if exists Lecon;
drop table if exists Moniteur;
drop table if exists Eleve;
drop table if exists Calendrier;
drop table if exists Vehicule;
drop table if exists Modele;

/*------------------------------------------*/
/* TABLE : Modele							*/
/*------------------------------------------*/
create table modele (
MOD_ID INTEGER UNSIGNED NOT NULL auto_increment,
MOD_LABEL char(50),
	primary key (MOD_ID)
);

/*------------------------------------------*/
/* TABLE : Vehicule							*/
/*------------------------------------------*/
create table vehicule (
VEH_ID INTEGER UNSIGNED NOT NULL auto_increment,
MOD_ID INTEGER UNSIGNED NOT NULL,
VEH_immat char(10),
veh_label char(50),
	PRIMARY KEY (VEH_ID),
CONSTRAINT FK_VEHICULE_APPARTENI_MODELE
	FOREIGN KEY (MOD_ID)
    REFERENCES Modele(MOD_ID)
);

/*------------------------------------------*/
/* TABLE : Calendrier						*/
/*------------------------------------------*/
create table calendrier (
CAL_ID integer unsigned not null auto_increment,
cal_date timestamp,
	primary key (cal_id)
);

/*------------------------------------------*/
/* TABLE : Eleve							*/
/*------------------------------------------*/
create table Eleve (
ele_id integer unsigned not null auto_increment,
ele_nom char(50),
ele_prenom char(50),
	primary key (ele_id)
);

/*------------------------------------------*/
/* TABLE : Moniteur							*/
/*------------------------------------------*/
create table moniteur (
mon_id integer unsigned not null auto_increment,
mon_nom char(50),
mon_prenom char(50),
    primary key (mon_id)
);

/*------------------------------------------*/
/* TABLE : Lecon							*/
/*------------------------------------------*/
create table Lecon (
ele_id integer unsigned not null,
mon_id integer unsigned not null,
cal_id integer unsigned not null,
mod_id integer unsigned not null,
duree time,
	primary key (ele_id, mon_id, cal_id, mod_id),
constraint fk_lecon_lecon_eleve
	foreign key (ele_id)
    references eleve(ele_id),
constraint fk_lecon_lecon2_moniteur
	foreign key (mon_id)
    references moniteur(mon_id),
constraint fk_lecon_lecon3_calendri
	foreign key (cal_id)
	references calendrier(cal_id),
constraint fk_lecon_lecon4_modele
	foreign key(mod_id)
    references modele(mod_id)
);
