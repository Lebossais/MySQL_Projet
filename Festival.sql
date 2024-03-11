/*------------------------------------------*/
/* NOM DE SGBD : Festival					*/
/* DATE DE CREATION : 03/10/2023			*/
/* AUTEUR : BENJAMIN						*/
/*------------------------------------------*/
create database if not exists festival;
use festival;
drop table if exists programmer;
drop table if exists musicien;
drop table if exists representation;


/*------------------------------------------*/
/* TABLE : representation					*/
/*------------------------------------------*/
create table representation (
Num_rep int not null auto_increment,
titre_rep char(50),
lieu_rep char(20),
	primary key (num_rep)
);


/*------------------------------------------*/
/* TABLE : Musicien							*/
/*------------------------------------------*/
create table musicien (
num_mus int not null auto_increment,
nom_mus char(20),
num_rep int not null,
	primary key (num_mus),
constraint
	foreign key (num_rep)
    references representation(num_rep)
);


/*------------------------------------------*/
/* TABLE : Programmer						*/
/*------------------------------------------*/
create table programmer (
pro_Date date unique,
num_rep int not null,
pro_tarif numeric(8.2),
	primary key (pro_Date),
constraint
	foreign key (num_rep)
    references representation (num_rep)
);

INSERT INTO representation (titre_rep,lieu_rep)
VALUES
	("Black Swan","Conservatoire"),
    ("White Pigeon","Salle de repetition"),
    ("Brown canard","Conservatoire"),
    ("Green Rougegorge","Salle de repetition");
    
Insert into musicien (nom_mus,  num_rep)
VALUES
	("Georges Pompidou","1"),
    ("Patrick Sebastien","2"),
    ("George Floyd","3"),
    ("David Guetta","4");
    
Insert into programmer (pro_Date, num_rep, pro_tarif)
VALUES
	("2023-03-24","1","15.00"),
    ("2008-07-15","2","25.00"),
    ("2008-07-25","3","35.00"),
    ("2008-08-25","4","10");
