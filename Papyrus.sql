/*------------------------------------------*/
/* NOM DE SGBD : Papyrus					*/
/* DATE DE CREATION : 17/10/2023			*/
/* AUTEUR : BENJAMIN						*/
/*------------------------------------------*/

Create database if not exists Papyrus;

use papyrus;

drop table if exists Vente;
drop table if exists Fournisseur;
drop table if exists LigCom;
drop table if exists EntCom;
drop table if exists Produit;

/*------------------------------------------*/
/* TABLE : Produit							*/
/*------------------------------------------*/
create table Produit (
Art_Cod char(4) UNIQUE NOT NULL,
Art_Lib varchar(35),
Stk_ale smallint,
Stk_Phy smallint,
Qte_Ann smallint,
Uni_mes char(5),
	primary key (art_cod)
);

/*------------------------------------------*/
/* TABLE : Fournisseur						*/
/*------------------------------------------*/
create table fournisseur (
fou_num int not null,
fou_nom varchar(35),
fou_rue varchar(35),
fou_pos char(5),
fou_vil varchar(30),
fou_con varchar(15), -- Contact
satisf tinyint, -- Indice satisfaction
	primary key (fou_num)
); 


/*------------------------------------------*/
/* TABLE : EntCom							*/
/*------------------------------------------*/
create table EntCom(
com_num int not null auto_increment,
com_obs varchar(35), -- Observations
com_date date,
fou_num int not null,
    foreign key (fou_num) references fournisseur(fou_num),
	primary key(com_num, fou_num)
);

/*------------------------------------------*/
/* TABLE : LigCom							*/
/*------------------------------------------*/
create table ligCom (
com_num int not null auto_increment,
art_cod char(4) unique not null,
lig_com tinyint,
qte_cde smallint,
pri_uni numeric(8,2),
qte_liv smallint,
der_liv date,
	foreign key (art_cod) references produit(art_cod),
    foreign key (com_num) references entCom(com_num),
 	primary key (com_num,art_cod)
);

/*------------------------------------------*/
/* TABLE : Vente							*/
/*------------------------------------------*/
create table vente(
Art_Cod char(4) UNIQUE NOT NULL,
fou_num int not null auto_increment,
del_liv smallint,
qte_1 smallint,
prix_1 numeric(8,2),
qte_2 smallint,
prix_2 numeric(8,2),
qte_3 smallint,
prix_3 numeric(8,2),
	foreign key (art_cod) references produit(art_cod),
    foreign key (fou_num) references fournisseur(fou_num),
	primary key(Art_Cod, fou_num)
);

insert into produit (Art_Cod, Art_Lib, Stk_ale, Stk_Phy, Qte_Ann, Uni_mes) values (1, 'Mayo', 5, 15, 100, 'gr');
insert into produit (Art_Cod, Art_Lib, Stk_ale, Stk_Phy, Qte_Ann, Uni_mes) values (2, 'Ketchup', 10, 8, 120, 'gr');
insert into produit (Art_Cod, Art_Lib, Stk_ale, Stk_Phy, Qte_Ann, Uni_mes) values (3, 'Moutarde', 5, 10, 80, 'gr');
insert into produit (Art_Cod, Art_Lib, Stk_ale, Stk_Phy, Qte_Ann, Uni_mes) values (4, 'Poivre', 3, 5, 50, 'gr');
insert into produit (Art_Cod, Art_Lib, Stk_ale, Stk_Phy, Qte_Ann, Uni_mes) values (5, 'Worcester', 1, 3, 20, 'gr');

insert into fournisseur (fou_num, fou_nom, fou_rue, fou_pos, fou_vil, fou_con, satisf) values (1, 'Heinz', "59 rue de la saveur", 54000, 'Nancy', 'Michel', 4);
insert into fournisseur (fou_num, fou_nom, fou_rue, fou_pos, fou_vil, fou_con, satisf) values (2, 'Dijon', "99 rue de la graine", 21231, 'Dijon', 'Albert', 3);
insert into fournisseur (fou_num, fou_nom, fou_rue, fou_pos, fou_vil, fou_con, satisf) values (3, 'Amora', "23 rue du goût", 59000, 'Lille', 'Gertrude', 2);

insert into entcom (com_num, com_obs, com_date, fou_num) values (1, "RAS",2023-08-12, 3 );
insert into entcom (com_num, com_obs, com_date, fou_num) values (2, "RAS",2023-09-13, 2);
insert into entcom (com_num, com_obs, com_date, fou_num) values (3, "grosse commande",2023-10-10, 1);

insert into ligCom (com_num, art_cod, lig_com, qte_cde, pri_uni, qte_liv, der_liv) values (1, 1, 1, 5.00, 5, 2023-05-18);
insert into ligCom (com_num, art_cod, lig_com, qte_cde, pri_uni, qte_liv, der_liv) values (1, 2, 2, 4.00, 4, 2023-05-18);
insert into ligCom (com_num, art_cod, lig_com, qte_cde, pri_uni, qte_liv, der_liv) values (2, 4, 1, 2.00, 2, 2022-12-22);
insert into ligCom (com_num, art_cod, lig_com, qte_cde, pri_uni, qte_liv, der_liv) values (2, 3, 2, 3.00, 3, 2022-12-22);
insert into ligCom (com_num, art_cod, lig_com, qte_cde, pri_uni, qte_liv, der_liv) values (3, 5, 1, 1.00, 1, 2023-09-10);

insert into vente (Art_Cod, fou_num, del_liv, qte_1, prix_1, qte_2, prix_2, qte_3, prix_3) values (1, 1, 4, 1, 5.00, 2, 4.00);
insert into vente (Art_Cod, fou_num, del_liv, qte_1, prix_1, qte_2, prix_2, qte_3, prix_3) values (4, 2, 5);
insert into vente (Art_Cod, fou_num, del_liv, qte_1, prix_1, qte_2, prix_2, qte_3, prix_3) values (5, 3, 2);

select * from fournisseur 
where fou_pos = 77 OR 78 OR 92 OR 77
order by fou_pos DESC;


