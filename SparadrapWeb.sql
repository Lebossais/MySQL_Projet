/*------------------------------------------*/
/* NOM DE SGBD : Sparadrap					*/
/* DATE DE CREATION : 30/10/2023			*/
/* AUTEUR : BENJAMIN						*/
/*------------------------------------------*/
create database if not exists sparadrapweb;

use Sparadrapweb;

drop table if exists Panier;
drop table if exists Achat;
drop table if exists compose;
drop table if exists Ordonnance;
drop table if exists Medicament;
drop table if exists Categorie;
drop table if exists Client;
drop table if exists Mutuelle;
drop table if exists Specialiste;
drop table if exists Medecin;
drop table if exists Entreprise;
drop table if exists Personne;
drop table if exists Adresse;


create table if not exists User
(
	id int not null auto_increment,
    name varchar(20) not null,
    email varchar(40) not null,
		primary key (id)

);

/*------------------------------------------*/
/* TABLE : Adresse							*/
/*------------------------------------------*/
create table if not exists Adresse 
(
	Adr_ID 				bigint not null auto_increment,
	Adr_Numero_Rue 		int not null,
	Adr_Nom_Rue 		varchar(40) not null,
	Adr_Code_Postal		numeric(5) not null,
	Adr_Ville 			varchar(20) not null,
		primary key (Adr_ID)
);


/*------------------------------------------*/
/* TABLE : Personne							*/
/*------------------------------------------*/
create table if not exists Personne 
(
	Per_ID 				bigint not null auto_increment,
	Per_Prenom 			char (15) not null,
	Per_Nom 			char (15) not null,
	Per_Telephone 		varchar (10) not null,
	Per_Email 			varchar (50) not null,
	Adr_ID 		bigint not null,
		primary key (Per_ID),
	constraint
		foreign key (Adr_ID) references Adresse(Adr_ID) on delete restrict on update restrict
);

/*------------------------------------------*/
/* TABLE : Entreprise						*/
/*------------------------------------------*/
create table if not exists Entreprise 
(
	Ent_ID 					bigint not null auto_increment,
	Ent_Raison_Sociale 		varchar (25) not null,
	Ent_Telephone 			varchar (10) not null,
	Ent_Email				varchar(40) not null,
	Adr_ID 					bigint not null,
		primary key (Ent_ID),
	constraint
		foreign key (Adr_ID) references Adresse (Adr_ID) on delete restrict on update restrict

);

/*------------------------------------------*/
/* TABLE : Medecin							*/
/*------------------------------------------*/
create table if not exists Medecin 
(
	Med_ID 				bigint not null auto_increment,
	Med_Aggrement 		varchar(11) not null,
	Per_ID 				bigint not null,
		primary key (Med_ID),
	constraint
		foreign key (Per_ID) references Personne (Per_ID) on delete restrict on update restrict
);

/*------------------------------------------*/
/* TABLE : Spécialiste						*/
/*------------------------------------------*/
create table if not exists Specialiste 
(
	Spe_ID 				bigint not null auto_increment,
	Spe_Specialite 		char(20) not null,
	Per_ID 				bigint not null,
		primary key (Spe_ID),
	constraint 
		foreign key (Per_ID) references Personne (Per_ID) on delete restrict on update restrict
);

/*------------------------------------------*/
/* TABLE : Mutuelle							*/
/*------------------------------------------*/
create table if not exists Mutuelle 
(
	Mut_ID 					bigint not null auto_increment,
	Mut_Departement 		numeric (3) not null,
	Mut_Prise_En_Charge 	numeric (2) not null,
	Ent_ID 					bigint not null,
		primary key (Mut_ID),
	constraint
		foreign key (Ent_ID) references Entreprise (Ent_ID) on delete restrict on update restrict
);


/*------------------------------------------*/
/* TABLE : Client							*/
/*------------------------------------------*/
Create table if not exists Client 
(
	Cli_ID 					bigint not null auto_increment,
	Cli_Date_Naissance 		date not null,
	Cli_Numero_Secu 		numeric(15) not null,
	Per_ID 					bigint not null,
	Med_ID 					bigint not null,
	Spe_ID 					bigint,
	Mut_ID 					bigint not null,
		primary key (Cli_ID),
	constraint
		foreign key (Per_ID) references Personne (Per_ID) on delete restrict on update restrict,
		foreign key (Med_ID) references Medecin (Med_ID) on delete restrict on update restrict,
		foreign key (Spe_ID) references Specialiste (Spe_ID) on delete restrict on update restrict,
		foreign key (Mut_ID) references Mutuelle (Mut_ID) on delete restrict on update restrict
);

/*------------------------------------------*/
/* TABLE : Catégorie						*/
/*------------------------------------------*/
create table if not exists Categorie 
(
	Cat_ID 			bigint not null auto_increment,
	Cat_Categorie 	char(20),
		primary key (Cat_ID)
);

/*------------------------------------------*/
/* TABLE : Medicament						*/
/*------------------------------------------*/
create table if not exists Medicament 
(
	Medi_ID 				bigint not null auto_increment,
	Medi_Nom 				char(15),
	Medi_Prix 				numeric(8,2) not null,
	Medi_Date_Mise_Service 	date,
	Cat_ID					bigint not null,
		primary key (Medi_ID),
	constraint
		foreign key (Cat_ID) references Categorie (Cat_ID) on delete restrict on update restrict
);

/*------------------------------------------*/
/* TABLE : Ordonnance						*/
/*------------------------------------------*/
create table if not exists Ordonnance 
(
	Ord_ID 			bigint not null auto_increment,
	Ord_Num 		int not null,
	Ord_Date 		date not null,
    Cli_ID			bigint not null,
	Med_ID			bigint not null,
	Spe_ID 			bigint,
		primary key (Ord_ID),
	constraint
		foreign key (Cli_ID) references Client(Cli_ID) on delete restrict on update restrict,
		foreign key (Med_ID) references Medecin(Med_ID) on delete restrict on update restrict,
		foreign key (Spe_ID) references Specialiste(Spe_ID) on delete restrict on update restrict
);

/*------------------------------------------*/
/* TABLE : Compose							*/
/*------------------------------------------*/
Create table Compose 
(
	Comp_ID			bigint not null auto_increment,
	Ord_ID 			bigint not null,
	Medi_ID 		bigint not null,
    Compose_Qte		int not null, 
		primary key(Comp_ID),
	constraint 
		foreign key (Ord_ID) references Ordonnance(Ord_ID)on delete restrict on update restrict,
		foreign key (Medi_ID) references Medicament(Medi_ID)on delete restrict on update restrict
);

/*------------------------------------------*/
/* TABLE : Achat							*/
/*------------------------------------------*/
create table if not exists Achat 
(
	AchatID 		bigint not null auto_increment,
	Achat_Date		date not null,
	Cli_ID 			bigint not null,
    Ord_ID			bigint,
		primary key (AchatID),
	constraint
		foreign key (Cli_ID) references Client (Cli_ID) on delete restrict on update restrict,
        foreign key (Ord_ID) references Ordonnance(Ord_ID) on delete restrict on update restrict
);

/*------------------------------------------*/
/* TABLE : Panier							*/
/*------------------------------------------*/
Create table Panier 
(
	Panier_ID		bigint not null auto_increment,
	Achat_ID 		bigint not null,
	Medi_ID 		bigint not null,
    Panier_Qte 	int not null,
		primary key (Panier_ID),
	constraint
		foreign key (Medi_ID) references Medicament(Medi_ID) on delete restrict on update restrict,
        foreign key (Achat_ID) references Achat(AchatID) on delete restrict on update restrict
);


DROP TABLE IF EXISTS dbuser;

CREATE TABLE dbuser (
  id bigint AUTO_INCREMENT  PRIMARY KEY,
  username VARCHAR(250) NOT NULL,
  password VARCHAR(250) NOT NULL,
  role VARCHAR(250) NOT NULL
);
/*--------------------------------------*/
/*		INSERTION JEU DE DONNEES		*/
/*--------------------------------------*/

SET FOREIGN_KEY_CHECKS=0;


Insert into Adresse (Adr_ID, Adr_Numero_Rue, Adr_Nom_Rue, Adr_Code_Postal, Adr_Ville) 
VALUES 
	(1, 59, "Rue de la Paix", 59842, "Bethune"), 			-- Client
    (2, 47, "Rue de la Liberté",58421,"La Gorgue"),			-- Client
    (3, 2, "Rue de la Gastronomie", 59875,"Armentières"),	-- Client
    (4, 17,"Rue des Soins", 59842, "Dunkerque"),			-- Cabinet Med + Spe
    (5, 25,"Rue des Concurrents", 62000, "Lens");			-- Mutuelle

Insert into Personne (Per_ID, Per_Prenom , Per_Nom, Per_Telephone, Per_Email, Adr_ID) 
VALUES 
	(1, "Jean","Fouqueaut", "0655998877", "Jean.Fouqueaut@gmail.com", 1), 				-- Client
    (2, "Sarah", "Dupond", "0684526758", "Sarah.Dupont@hotmail.com", 2),				-- Client
    (3, "Marie", "Petain", "0652145896", "Marie.Durand@orange.fr", 3),					-- Client
    (4, "Michel","Michel","0658442269","Michel.Michel@medecin.fr", 4),					-- Medecin
    (5,"Gaeten","Mortis", "0659452370","Gaeten.Mortis@medecin.fr", 4),					-- Medecin
    (6, "Paul","Special", "0660462471","Paul.Special@specialiste.fr", 4),				-- Specialiste
    (7, "Jacqueline","Speciale", "0661472572","Jacequline.Speciale@specialiste.fr", 4);	-- Specialiste
    
Insert into Entreprise (Ent_ID,	Ent_Raison_Sociale,	Ent_Telephone, Ent_Email, Adr_ID) 
VALUES 
	(1, "Acoris Mutelle","0672254761","Acoris.Mutuelle@mutuelle.fr", 5),
    (2, "France Mutuelle", "0673264862","France.Mutuelle@mutuelle.fr", 5);

Insert into Medecin (Med_ID, Med_Aggrement,Per_ID) 
VALUES 
	(1, 10234567891, 4),
    (2 ,10234567892 , 5);

Insert into Specialiste (Spe_ID, Spe_Specialite, Per_ID) 
VALUES 
	(1, "Chiurgie", 6),
    (2, "Cardiologie", 7);

Insert into Mutuelle (Mut_ID, Mut_Departement, Mut_Prise_En_Charge, Ent_ID) 
VALUES 
	(1, 59, 85, 1),
    (2, 62, 60, 2);

Insert into Client (Cli_ID, Cli_Date_Naissance, Cli_Numero_Secu, Per_ID, Med_ID, Spe_ID, Mut_ID) 
VALUES 
	(1, '1998-05-05', "2012345678", 1, 1, 1, 1),
    (2, '1986-09-09', "2012345689", 2, 1, 2, 1),
    (3, '2000-12-15', "2012345679", 3, 2, null, 2);
    
Insert into Categorie (Cat_ID, Cat_Categorie) 
VALUES 
	(1, "Analegesique"),
    (2, "Antibiotique"),
    (3, "Anti inflammatoire"),
    (4, "Corticoides");

Insert into Medicament (Medi_ID, Medi_Nom, Medi_Prix, Medi_Date_Mise_Service, Cat_ID) 
VALUES 
	(1, "Doliprane", 5.00, '2001-08-27', 1),
    (2, "Aspirine", 4.00, '2000-06-25', 1),
    (3, "Amoxicilline", 3.00, '2010-08-05', 2),
    (4, "Oracilline", 9.00, '2009-09-17', 2),
    (5, "Xydol", 6.00, '2008-12-14', 3),
    (6, "Advil", 5.00, '2005-06-22',3),
    (7, "Solupred", 8.00, '2003-04-12',4),
    (8, "Cortisol", 10.00, '1950-01-01', 4);

Insert into Ordonnance (Ord_ID, Ord_Num, Ord_Date, Cli_ID, Med_ID, Spe_ID) 
VALUES 
	(1, 1, '2023-10-23', 1, 1, 1),
    (2, 2, '2023-10-24', 2, 1, 1),
    (3, 3, '2023-10-25', 3, 2, 1),
    (4, 4, '2023-10-26', 1, 1, null),
    (5, 5, '2023-10-27', 2, 1, 2),
    (6, 6, '2023-10-28', 3, 2, 2),
    (7, 7, '2023-10-29', 1, 1, 2),
    (8, 8, '2023-10-30', 2, 1, null),
    (9, 9, '2023-10-30', 3, 2, null);

Insert into Compose (Ord_ID, Medi_ID, Compose_Qte)
VALUES
	(1, 1, 5),
    (2, 2, 6),
    (3, 3, 4),
    (4, 4, 5),
    (5, 1, 4),
    (6, 2, 3),
    (7, 3, 2),
    (8, 4, 1),
    (9, 2, 5),
    (9, 3, 4);

Insert into Achat (AchatID, Achat_Date, Cli_ID, Ord_ID) 
VALUES 
	(1, '2023-10-25', 1, 1),
    (2, '2023-10-26', 2, 2),
    (3, '2023-10-26', 3, 3),
    (4, '2023-10-26', 3, null),
    (5, '2023-10-27', 1, null),
    (6, '2023-10-28', 1, 4),
    (7, '2023-10-29', 2, 5),
    (8, '2023-10-30', 3, 6);
    
Insert into Panier (Achat_ID, Medi_ID, Panier_Qte) 
VALUES 
	(1, 1, 5),
    (2, 2, 6),
    (3, 3, 4),
	(4, 2, 2),
    (5, 2, 3),
    (4, 4, 5),
    (5, 1, 4),
    (6, 2, 3);
    
INSERT INTO dbuser (username, password, role) 
VALUES 
	('dbuser', '$2y$10$.qkbukzzX21D.bqbI.B2R.tvWP90o/Y16QRWVLodw51BHft7ZWbc.', 'USER'),
	('dbadmin', '$2y$10$kp1V7UYDEWn17WSK16UcmOnFd1mPFVF6UkLrOOCGtf24HOYt8p1iC', 'ADMIN');


SET FOREIGN_KEY_CHECKS=1;