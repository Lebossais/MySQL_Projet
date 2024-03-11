DROP DATABASE IF EXISTS fonctionsExo1;

CREATE DATABASE IF NOT EXISTS fonctionsExo1;

USE fonctionsExo1;

drop table if exists SERVICE;
  
create table SERVICE(
	SER_ID int auto_increment,
    SER_NOM varchar(30),
    SER_CHEF int,
    primary key (SER_ID)
);

lock tables SERVICE write;
INSERT INTO SERVICE (SER_NOM)
VALUES
  ("Comptabilite"),  ("Recherche"),  ("Ressource Humaine");
unlock tables;

drop table if exists EMPLOYE;

create table EMPLOYE(
	EMP_ID int auto_increment,
    EMP_NOM varchar(30),
    EMP_HEBDO int,
    EMP_SALAIRE int,
    EMP_SERV int,
    primary key(EMP_ID)
);

lock tables EMPLOYE write;
INSERT INTO EMPLOYE (EMP_NOM,EMP_HEBDO,EMP_SALAIRE,EMP_SERV)
VALUES
  ("Lee Houston",2,1894,2),  ("Thor Marquez",2,2661,2),  ("Samantha Copeland",8,2698,2),  ("Xyla Sawyer",1,2544,1),  ("Kelsie Boyle",0,2867,2),
  ("Leslie Cortez",6,2273,1),  ("Vladimir Mcmahon",7,2666,1),  ("Aiko Marquez",7,1842,2),  ("Lavinia Bird",7,2727,3),  ("Perry Walton",6,2903,3),
  ("Mary Bryant",0,2838,3),  ("Aline Hobbs",7,2029,2),  ("Kelly Knight",8,2003,1),  ("Kareem Cobb",8,2230,3),  ("Tanya Cooke",1,2899,2),
  ("Holmes Tanner",1,1554,3),  ("Dominique Torres",7,2120,2),  ("Keiko Cross",2,2425,2),  ("Grace Jarvis",1,1567,3),  ("Slade Henry",7,2048,1);
  unlock tables;
  
alter table SERVICE
add constraint FK_SER_CHEF foreign key (SER_CHEF) references EMPLOYE(EMP_ID);
update SERVICE set SER_CHEF = 1 where SER_ID = 1;
update SERVICE set SER_CHEF = 2 where SER_ID = 2;
update SERVICE set SER_CHEF = 3 where SER_ID = 3;
  
drop table if exists PROJET;

create table PROJET(
	PRO_ID int auto_increment,
    PRO_NOM varchar(30),
    PRO_RESP int,
    primary key (PRO_ID),
    constraint FK_PRO_RESP foreign key (PRO_RESP) references EMPLOYE(EMP_ID)
);

lock tables PROJET write;
INSERT INTO PROJET (PRO_NOM,PRO_RESP)
VALUES 
  ("Mega Lavage Informatique",1),  ("Cool Zero",2),  ("Lavage Informatique Zero",3),  ("Restaurant",4),  ("Bar à Tapas",5),  ("Super Cool Mega",6);
unlock tables;

drop table if exists TRAVAIL;

create table TRAVAIL(
	EMP_ID int,
    PRO_ID int,
    TRA_DUREE int,
    constraint FK_TRA_EMP foreign key (EMP_ID) references EMPLOYE(EMP_ID),
    constraint FK_TRA_PRO foreign key (PRO_ID) references PROJET(PRO_ID)
);

lock tables TRAVAIL write;
INSERT INTO TRAVAIL (EMP_ID,PRO_ID,TRA_DUREE)
VALUES
  (14,3,3),  (7,5,9),  (18,3,36),  (4,1,19),  (3,2,38),  (12,4,4),  (4,1,34),  (4,1,16),  (4,2,33),  (14,1,42),  (18,2,31),  (4,1,22),  (17,3,17),  (6,4,40),  (15,3,9),  (4,5,48),  (18,2,26),  (16,3,48),  (9,3,11),  (18,5,28),
  (18,4,23),  (17,2,50),  (13,6,39),  (18,3,36),  (9,5,22),  (6,6,25),  (11,2,37),  (16,4,11),  (13,4,30),  (10,6,13),  (9,1,14),  (16,2,29),  (14,1,44),  (7,5,41),  (9,6,44),  (10,4,26),  (10,3,12),  (5,5,45),  (1,5,49),  (18,3,7),
  (9,3,19),  (1,4,42),  (20,3,16),  (15,5,45),  (16,3,48),  (11,1,34),  (17,4,46),  (11,3,29),  (13,3,17),  (18,3,21),  (18,5,43),  (6,6,8),  (8,1,1),  (11,3,44),  (3,5,31),  (19,1,31),  (4,3,34),  (4,3,7),  (2,1,44),  (15,3,4),
  (18,3,2),  (5,6,36),  (16,6,19),  (17,3,20),  (5,3,35),  (8,2,48),  (2,2,35),  (13,3,31),  (6,2,37),  (5,3,8),  (3,4,33),  (17,1,6),  (5,6,21),  (12,3,47),  (3,2,36),  (14,4,42),  (3,2,35),  (20,4,40),  (5,6,46),  (1,3,9),
  (11,5,36),  (20,2,17),  (9,4,34),  (20,3,12),  (17,2,35),  (1,5,10),  (7,4,13),  (2,5,50),  (2,3,34),  (2,3,20),  (6,4,25),  (6,4,30),  (6,3,47),  (5,3,26),  (15,1,11),  (5,4,40),  (1,5,40),  (4,4,32),  (8,5,27),  (17,2,32),
  (18,3,38),  (2,5,41),  (18,5,25),  (13,3,26),  (13,5,30),  (13,6,1),  (20,2,6),  (1,4,31),  (6,1,4),  (13,6,28),  (1,2,33),  (16,6,1),  (7,4,15),  (19,4,14),  (5,1,13),  (12,5,40),  (9,5,19),  (4,2,22),  (14,3,43),  (9,3,23);
unlock tables;

-- 1- Écrire une procédure qui prend comme arguments un identifiant d’employé et un nombre, puis mettre à jour le salaire de l’employé donné avec le nombre donné.
-- 2- Écrire une fonction qui compte le nombre d’employés participant à un projet donné.
-- 3- Écrire une fonction qui compte le nombre de projets supervisés par les employés d’un service donné.
-- 4- Écrire une fonction qui compte le nombre de projets auxquels participe l’employé donné.
-- 5- Écrire une fonction qui renvoie la chaîne ‘Salaire faible’ si le salaire de l’employé donné est supérieur à 2000\$ sinon retourner ‘Bon salaire‘.
-- 6- Écrire une fonction, qui compte le nombre d’employés qui prennent en charge plus que le nombre de projets donné.
-- 7- Écrire une procédure qui insère l’employé donné dans une table de sauvegarde nommée ‘ALERT_EMPLOYE‘.  

/* -- 1- Écrire une procédure qui prend comme arguments un identifiant d’employé et un nombre, puis mettre à jour le salaire de l’employé donné avec le nombre donné.*/

delimiter |
drop procedure if exists modif_salaire;
Create procedure modif_salaire (p_EMP_ID int,p_EMP_SALAIRE int)
Begin 
	update employe
    set emp_salaire = p_emp_salaire
	where emp_id = p_emp_id;
end|
delimiter ;

call modif_salaire (1 , 2195);

/*-- 2- Écrire une fonction qui compte le nombre d’employés participant à un projet donné.*/

drop function if exists compter_employes;
delimiter |
create function compter_employes (p_pro_id int(2))
returns int
deterministic
begin

	declare test int;
    
	select count(distinct emp_id) into test
	from travail
	where p_pro_id = pro_id;
    return test;
end | 
delimiter ;

select compter_employes (1);

/* -- 3- Écrire une fonction qui compte le nombre de projets supervisés par les employés d’un service donné. */

drop function if exists employe_supervise;
delimiter |
create function employe_supervise (p_emp_serv int)
returns int
deterministic
begin
	declare stockage int;
	select count(pro_id) into stockage
	from projet
    inner join employe on projet.pro_resp = employe.emp_id
	where p_emp_serv = emp_serv;
    return stockage;
end | 
delimiter ;

select employe_supervise(2);


/* -- 4- Écrire une fonction qui compte le nombre de projets auxquels participe l’employé donné. */

drop function if exists projet_par_employe;
delimiter |
create function projet_par_employe (p_emp_id int)
returns int
deterministic
begin
	declare stockage int;
	select count(distinct pro_id) into stockage
	from travail
	where p_emp_id = emp_id;
    return stockage;
end | 
delimiter ;

select projet_par_employe(4);

/* -- 5- Écrire une fonction qui renvoie la chaîne ‘Salaire faible’ si le salaire de l’employé donné est supérieur à 2000\$ sinon retourner ‘Bon salaire‘. */

drop function if exists compte_salaire;
delimiter |
create function compte_salaire (p_emp_id int)
returns varchar(25)
deterministic
begin
	declare stockage int;
    declare stockage2 varchar(25);
    
	select emp_salaire into stockage
	from employe
	where emp_id = p_emp_id;
    
    IF (stockage is null) then
		set stockage2 = "Entrée Invalide";
    ELSE IF (stockage <= 2000) then
		set stockage2 = "Salaire Faible";
	ELSE 
		set stockage2 = "Bon salaire";
    END IF ;
	END IF ;

    return stockage2;
end | 
delimiter ;

select compte_salaire(8);
select compte_salaire(4);

/*-- 6- Écrire une fonction, qui compte le nombre d’employés qui prennent en charge plus que le nombre de projets donné.*/ 

drop function if exists compter_employes_projet ;
delimiter |
create function compter_employes_projet (p_projet int)
returns int 
deterministic
begin

	return(select count(distinct emp_id) 
	from travail 
	where emp_id not in ((select emp_id from travail group by emp_id having count(distinct pro_id) < p_projet)));
    
end | 
delimiter ;

select compter_employes_projet(5);


/*delimiter &&
create function count_employes_plus_proj(n integer)
returns integer
deterministic
begin
select(*)from (
select count(*) as projets, nuempl from travail
group by nuemp

end &&
delimiter ;*/

-- 7- Écrire une procédure qui insère l’employé donné dans une table de sauvegarde nommée ‘ALERT_EMPLOYE‘.  

drop procedure if exists alerte;
delimiter |
Create procedure alerte (p_emp_id int)
Begin 
    create table if not exists ALERT_EMPLOYE(
    ALT_EMP_ID int not null,
    ALT_EMP_NOM varchar(30),
    ALT_EMP_HEBDO int,
    ALT_EMP_SALAIRE int,
    ALT_EMP_SERV int,
    primary key(ALT_EMP_ID));
    
    insert into ALERT_EMPLOYE (select * from employe
	where emp_id = p_emp_id);
end|
delimiter ;

call alerte (3);

select * from alert_employe;
    
    
    /* petit test fait en supplément pour le 6*/
    
select count(distinct pro_id)
	from travail
    group by emp_id;
    
    select *
	from travail
    group by emp_id, pro_id, tra_duree
	having 2 < count((select count(distinct pro_id) from travail group by emp_id));
    
    select count(distinct pro_id) from travail;