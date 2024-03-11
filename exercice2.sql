/*------------------------------------------*/
/* NOM DE SGBD : Exercice2					*/
/* DATE DE CREATION : 04/10/2023			*/
/* AUTEUR : BENJAMIN						*/
/*------------------------------------------*/
create database if not exists exercice2;
use exercice2;
drop table if exists employes;
drop table if exists departement;


/*------------------------------------------*/
/* TABLE : departement						*/
/*------------------------------------------*/
create table departement (
Dep_dno int not null auto_increment,
Dep_dnom char(50),
Dep_dir numeric(20),
Dep_Ville char(50),
	primary key (dep_dno)
);


/*------------------------------------------*/
/* TABLE : Employes							*/
/*------------------------------------------*/
create table Employes (
emp_eno int not null auto_increment,
emp_enom char(20),
emp_prof char(20),
emp_dateemb date,
emp_sal numeric(8.2),
emp_comm boolean,
dep_dno int not null,
	primary key (emp_eno),
constraint
	foreign key (dep_dno)
    references departement(dep_dno)
);

Insert into departement (dep_dnom,dep_dir,dep_ville)
	values
		("Direction","94","Paris"),
        ("Production","54","Nancy"),
        ("Support","54","Metz");
        
Insert into employes (emp_enom, emp_prof, emp_dateemb, emp_sal,emp_comm, dep_dno)
	values
		("Patrick","Directeur","1984-05-24","1984.24",true,"1"),
        ("Jean","Production","2003-03-28","1300.00",false,"2"),
        ("Pierre","Production","2005-01-12","1852.25",true,"3");
        
