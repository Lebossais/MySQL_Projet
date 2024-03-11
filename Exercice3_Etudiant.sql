/*------------------------------------------*/
/* NOM DE SGBD : Etudiant					*/
/* DATE DE CREATION : 04/10/2023			*/
/* AUTEUR : BENJAMIN						*/
/*------------------------------------------*/

create database if not exists Etudiant;
use Etudiant;
drop table if exists evaluer;
drop table if exists etudiant;
drop table if exists matiere;

/*------------------------------------------*/
/* TABLE : etudiant							*/
/*------------------------------------------*/
create table etudiant (
Etu_Netudiant int not null auto_increment,
Etu_nom char(20),
Etu_prenom char (20),
	primary key (Etu_Netudiant)
);


/*------------------------------------------*/
/* TABLE : matiere							*/
/*------------------------------------------*/
create table matiere (
mat_code int not null auto_increment,
mat_libelle char(20),
mat_coeff numeric(2.2),
	primary key (mat_code)
);

/*------------------------------------------*/
/* TABLE : evaluer		 					*/
/*------------------------------------------*/
create table evaluer (
eva_id int not null auto_increment,
eva_date date not null ,
eva_note numeric(2.2),
etu_Netudiant int not null,
mat_code int not null,
	primary key (eva_id),
constraint
	foreign key (etu_Netudiant)
    references etudiant(etu_Netudiant),
constraint
	foreign key (mat_code)
	references matiere(mat_code)
);

insert into etudiant (Etu_nom, Etu_prenom)
values
	("Emmanuel","Kant"),
    ("Sigmund","Freud"),
    ("Friedrich","Nietzsche");
    
insert into matiere (mat_libelle, mat_coeff)
values
	("Philosophie","4"),
    ("Mathematique","2"),
    ("Neuro-Sciences","3");
    
insert into evaluer (etu_Netudiant,mat_code,eva_Date, Eva_note)
values
	("1","1","2023-10-04","19"),
    ("2","1","2023-10-04","18"),
    ("3","1","2023-10-04","17"),
    ("1","2","2023-10-03","9"),
    ("2","2","2023-10-03","2"),
    ("3","2","2023-10-03","4"),
    ("1","3","2023-10-02","12"),
    ("2","3","2023-10-02","14"),
    ("3","3","2023-10-02","16");