drop database if exists biblio;

CREATE DATABASE biblio;

use biblio;

drop table if exists livre;
create table livre ( 
	numinv varchar(6) not null ,
    titre varchar(50), 
    auteur varchar(50),
    qte int(2) unsigned,
    primary key (numinv)
);

lock tables livre write;
-- Insérer 20 livres dans la table "livre"
INSERT INTO livre (numinv, titre, auteur, qte) VALUES
    ('INV001', 'Le Seigneur des Anneaux', 'J.R.R. Tolkien', 5),    ('INV002', 'Harry Potter à l\'école des sorciers', 'J.K. Rowling', 8),    ('INV003', '1984', 'George Orwell', 10),    ('INV004', 'Le Petit Prince', 'Antoine de Saint-Exupéry', 12),
    ('INV005', 'Orgueil et Préjugés', 'Jane Austen', 7),    ('INV006', 'Les Misérables', 'Victor Hugo', 6),    ('INV007', 'Cinquante nuances de Grey', 'E.L. James', 4),    ('INV008', 'L\'Alchimiste', 'Paulo Coelho', 9),
    ('INV009', 'Le Hobbit', 'J.R.R. Tolkien', 11),    ('INV010', 'Da Vinci Code', 'Dan Brown', 14),    ('INV011', 'Le Rouge et le Noir', 'Stendhal', 8),    ('INV012', 'Guerre et Paix', 'Léon Tolstoï', 6),
    ('INV013', 'Crime et Châtiment', 'Fiodor Dostoïevski', 7),    ('INV014', 'Le Vieil Homme et la Mer', 'Ernest Hemingway', 5),    ('INV015', 'Le Guépard', 'Giuseppe Tomasi di Lampedusa', 4),    ('INV016', 'Moby Dick', 'Herman Melville', 6),
    ('INV017', 'Le Nom de la Rose', 'Umberto Eco', 8),    ('INV018', 'L\'Écume des Jours', 'Boris Vian', 6),    ('INV019', 'Le Comte de Monte-Cristo', 'Alexandre Dumas', 9),    ('INV020', 'Dune', 'Frank Herbert', 10);
unlock tables;
    
drop table if exists abonne;

create table abonne(
	numab varchar(5) not null ,
    nom varchar(15),
    prenom varchar(15), 
    primary key (numab) 
);

lock table abonne write;
-- Insérer 20 abonnés dans la table "abonne"
INSERT INTO abonne (numab, nom, prenom) VALUES
    ('AB001', 'Dupont', 'Jean'),    ('AB002', 'Martin', 'Marie'),    ('AB003', 'Smith', 'John'),    ('AB004', 'Dubois', 'Isabelle'),    ('AB005', 'Garcia', 'Carlos'),
    ('AB006', 'Müller', 'Andreas'),    ('AB007', 'Wang', 'Li'),    ('AB008', 'Kim', 'Min-jun'),    ('AB009', 'Ivanov', 'Sergei'),    ('AB010', 'López', 'Maria'),
    ('AB011', 'Chen', 'Wei'),    ('AB012', 'Kawasaki', 'Yuki'),    ('AB013', 'Lee', 'Ji-hoon'),    ('AB014', 'González', 'Luis'),    ('AB015', 'Rodriguez', 'Ana'),
    ('AB016', 'Sato', 'Takashi'),    ('AB017', 'Nguyen', 'Thi'),    ('AB018', 'Gupta', 'Amit'),    ('AB019', 'Santos', 'André'),    ('AB020', 'Ferrari', 'Giulia');
unlock tables;

drop table if exists pret;
create table pret ( 
	numinv varchar(6) not null ,
	numab varchar(5) not null ,
	datepret date,
	primary key (numinv,numab) 
);

lock table pret write;
-- Insérer 40 emprunts aléatoires
INSERT INTO pret (numinv, numab, datepret) VALUES
    ('L001', 'A001', '2023-10-01'),    ('L002', 'A002', '2023-10-02'),    ('L003', 'A003', '2023-10-03'),    ('L004', 'A004', '2023-10-04'),    ('L005', 'A005', '2023-10-05'),    ('L006', 'A006', '2023-10-06'),    ('L007', 'A007', '2023-10-07'),    ('L008', 'A008', '2023-10-08'),    ('L009', 'A009', '2023-10-09'),    ('L010', 'A010', '2023-10-10'),
    ('L011', 'A011', '2023-10-11'),    ('L012', 'A012', '2023-10-12'),    ('L013', 'A013', '2023-10-13'),    ('L014', 'A014', '2023-10-14'),    ('L015', 'A015', '2023-10-15'),    ('L016', 'A016', '2023-10-16'),    ('L017', 'A017', '2023-10-17'),    ('L018', 'A018', '2023-10-18'),    ('L019', 'A019', '2023-10-19'),    ('L020', 'A020', '2023-10-20'),
    ('L001', 'A002', '2023-10-21'),    ('L002', 'A003', '2023-10-22'),    ('L003', 'A004', '2023-10-23'),    ('L004', 'A005', '2023-10-24'),    ('L005', 'A006', '2023-10-25'),    ('L006', 'A007', '2023-10-26'),    ('L007', 'A008', '2023-10-27'),    ('L008', 'A009', '2023-10-28'),    ('L009', 'A010', '2023-10-29'),    ('L010', 'A011', '2023-10-30'),
	('L011', 'A012', '2023-10-31'),    ('L012', 'A013', '2023-11-01'),    ('L013', 'A014', '2023-11-02'),    ('L014', 'A015', '2023-11-03'),    ('L015', 'A016', '2023-11-04'),    ('L016', 'A017', '2023-11-05'),    ('L017', 'A018', '2023-11-06');
unlock tables;    

/* 2- Écrire une fonction qui calcule, pour un adhérent donné, le nombre de
jours restant avant d’être en retard.

▪ Si l’adhérent n’a pas d’emprunts en cours, on renvoie NULL.
▪ Si l’adhérent est en retard, on renvoie un résultat négatif
correspondant au nombre de jours de retard le plus grand pour ses
emprunts en cours. Par exemple, s’il devait rendre un livre avant-hier
et qu’il a un livre à rendre le lendemain, on renvoie « -2 » pour avanthier.
▪ Si l’adhérent n’est pas en retard, on renvoie un résultat positif
correspondant au nombre de jours d’emprunt restant le plus petit
pour ses emprunts en cours. Par exemple, s’il doit rendre un livre
demain et un autre après-demain, on renvoie « +1 » pour demain.
(Pour ces deux derniers cas, on prendra en compte la possibilité
d’avoir des emprunts avec des durées Max différentes et des
emprunts en cours avec des dates d’emprunt différentes).

3- Utiliser cette fonction pour afficher la situation de tous les adhérents.
4- Écrire une procédure qui permette de lister les emprunts d’un adhérent identifié par son numéro.
5- Écrire une procédure qui affiche les exemplaires disponibles d’un titre (on fera une version OUTER JOIN et une version NOT IN). Pour se faciliter la tâche, on a intérêt à d’abord traiter la question : “combien y a-t-il exemplaires disponibles du titre ‘NARCISSE ET GOLDMUND'” avec les deux versions demandées, pour ensuite passer à l’écriture de la procédure stockée.
6- Écrire une procédure qui affiche les titres d’un auteur et le nombre d’exemplaires disponibles par titre. On testera avec LEWIS CAROLL, GILBERT HOTTOIS et kenneth white. Pour se faciliter la tâche, on a intérêt à commencer par traiter la question : « Les exemplaires dispo de Lewis Caroll » puis « Le nombre d’exemplaires dispo par titre de Lewis Caroll » pour enfin écrire la procédure stockée.
7- Ecrire une procédure qui permette d’enregistrer un emprunt.
8- Modifier la table des emprunts : mettez la valeur par défaut de la durée max à 14*/

-- 2.1 / 2.2 /2.3 / 3

drop function if exists emprunt_ou_pas_emprunt;
delimiter &&
create function emprunt_ou_pas_emprunt (p_numab varchar(5))
returns float
deterministic
begin
	declare stockage int;
    declare stockage2 varchar(5);
    
	select numab, min(datediff(pret.datepret, current_date())) into stockage2, stockage
	from pret
	where pret.numab = p_numab
    group by numab;
    
    IF (stockage is null) then
		return NULL ; 
        else return stockage;
    END IF ;
end && 
delimiter ;

select numab, emprunt_ou_pas_emprunt(numab) from abonne; 

select emprunt_ou_pas_emprunt ("AB001");-- renvoie -11 (en retard de 11jours)
select emprunt_ou_pas_emprunt ("AB014");-- renvoie le plus petit livre en date de rendu (2jours) 
select emprunt_ou_pas_emprunt ("AB019");-- renvoie 7 (reste 7 jours)
select emprunt_ou_pas_emprunt ("AB020"); -- renvoie null


-- 4

drop procedure if exists afficher_emprunt;
delimiter &&
Create procedure afficher_emprunt (p_numab varchar(5))
Begin 
	select * from pret
	where numab = p_numab
    group by numinv,numab;
end &&
delimiter ;

call afficher_emprunt("AB001"); 
call afficher_emprunt("AB014"); 


-- 5

drop procedure if exists afficher_stock_dispo;
delimiter &&
Create procedure afficher_stock_dispo (p_numab varchar(5))
Begin 
	select * from pret
	where numab = p_numab
    group by numinv,numab;
end &&
delimiter ;

call afficher_stock_dispo()


/*-- 3 
drop function if exists emprunt_ou_pas_emprunt2;
delimiter &&
create function emprunt_ou_pas_emprunt2(p_numab varchar(5))
returns float
deterministic
begin
	declare stockage varchar(100);
    declare stockage3 varchar(100);
    declare fin tinyint default 0;
	declare curseur_client cursor for select datediff(pret.datepret, current_date()) from abonne
    inner join pret on abonne.numab = pret.numab;
    
    declare continue handler for not found set fin = 1;
	
    open curseur_client;
    loop_curseur : LOOP
		fetch curseur_client into stockage;
        if fin = 1 then
			leave loop_curseur;
		end if;

    set stockage3 := stockage;
	return stockage3;
    end LOOP;
    close curseur_client;
END &&
Delimiter ;
    
    select numab, emprunt_ou_pas_emprunt2(numab) from pret ; 
    

/*delimiter &&
drop procedure if exists le_nom;
Create procedure le_nom (p_1 genre, p_2 genre)
Begin 
	bref le code ici
	update employe
    set emp_salaire = p_emp_salaire
	where emp_id = p_emp_id;
end &&
delimiter ;

call le_nom (); 



drop function if exists compter_employes;
delimiter &&
create function le_nom ()
returns int
deterministic
begin
	return (select count(distinct emp_id) into test
	from travail
	where p_pro_id = pro_id);
end &&
delimiter ;

select le_nom ();*/