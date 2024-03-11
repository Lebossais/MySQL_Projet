-- 4.1.1 Donner la séquence en SQL pour créer un compte utilisateur avec des droits de consultations(lecture et écriture de la base de données mais sans les
-- droits d'administrations de la base de données

 -- Création de utilisateur
create user 'Jerome'@'localhost' identified by 'mdp';

 -- Don de lecture et d'écriture à l'utilisateur sans qu'il puisse supprimer et sans les droits d'adminstrations de la base de données (Sans le GRANT OPTION)
grant select, insert
on airdejava
to  'Jerome'@'localhost';

-- 4.1.2 Après réflexion, dans la base de données je ne souhaite pas que le compte utilisateur ait accès aux tables suivantes "PROFIL", "ACCES", "MENU", "LOGIN"
-- en écriture. Donner le code SQL pour retirer ces droits

Revoke select, insert on airdejava.Profil from 'Jerome'@'localhost';
Revoke select, insert on airdejava.acces from 'Jerome'@'localhost';
Revoke select, insert on airdejava.menu from 'Jerome'@'localhost';
Revoke select, insert on airdejava.login from 'Jerome'@'localhost';


-- 4.2 Décrivez les procédures que vous mettez en place pour assurer les sauvegardes de la base.
/*
backup {Database | SCHEMA} { * | airdejava} to 'airdejava_backup';

Ou utiliser du MysqlDump

Ou dans la barre de Menu : Server > DataExport et choisir ce qu'on veut exporter depuis la table AirDeJava => Le sauvegarder dans un fichier
*/

-- 4.3.1 Pour chacune des inerrogations demandées (page5), créez un script contenant la ou les requêtes nécessaires.

-- 4.3.1.1 Interrogation des groupes jouant un titre donné : Par exemple pour le titre « Detachable penis »

select gro_nom as Groupe, chanson.CHA_TITRE as Titre from chanson
inner join airdejava.repertoire on chanson.cha_id = repertoire.CHA_ID
inner join airdejava.groupe on airdejava.repertoire.GRO_ID = groupe.GRO_ID
where chanson.CHA_TITRE = "Detachable penis";

-- 4.3.1.2 Interrogation des rencontres où un titre a été interprété et par qui : Par exemple pour le titre « The End »

select rencontre.REN_NOM as 'Nom de la Rencontre', rencontre.REN_LIEU as Lieu, groupe.GRO_NOM as Groupe, chanson.CHA_TITRE as Titre from passage
inner join rencontre on passage.REN_ID = rencontre.REN_ID
inner join groupe on passage.GRO_ID = groupe.GRO_ID
inner join representation on passage.PAS_ID = representation.PAS_ID
inner join chanson on representation.CHA_ID = chanson.CHA_ID
where chanson.CHA_TITRE = "THE END";

-- 4.3.1.3 	Interrogation des membres ayant une spécialité donnée pour une rencontre donnée : 
-- 			Par exemple pour le festival « CAP FESTIVAL » et la spécialité « Soliste »

select rencontre.REN_NOM as 'Nom de la Rencontre', personne.PER_PRENOM as Prénom, personne.PER_NOM as Nom, specialite.SPE_NOM as Spécialité from specialiser
inner join rencontre on specialiser.REN_ID = rencontre.REN_ID
inner join specialite on specialiser.SPE_ID = specialite.SPE_ID
inner join personne on specialiser.PER_ID = personne.PER_ID
where rencontre.REN_NOM = "CAP FESTIVAL" && specialite.SPE_NOM = "Soliste";

-- 4.3.1.4 Interrogation des titres de plus de x minutes pour un pays ou une région donnée :
-- 		   Par exemple pour la région « Bavière » et le pays « Royaume-Uni »

select reg.REG_NOM as Region, Pays.PAY_NOM as Pays, chanson.CHA_TITRE as Titre, chanson.CHA_TPS as Temps from representer as repr
inner join region as reg on repr.REG_ID = reg.REG_ID
inner join pays on reg.PAY_ID = pays.PAY_ID
inner join groupe on repr.GRO_ID = groupe.GRO_ID
inner join repertoire as reper on groupe.GRO_ID = reper.GRO_ID
inner join chanson on reper.CHA_ID = chanson.CHA_ID
where chanson.CHA_TPS > '00:03:00'&& (reg.REG_NOM = "Bavière" OR pays.PAY_NOM = "Royaume-Uni");

-- 4.3.1.5 Interrogation des rencontres ayant eu n groupes participants.
--  	   Test avec 1, 2, 3
select rencontre.REN_NOM as 'Nom de la Rencontre', count(groupe.GRO_ID) as 'Nombre de groupe qui joue' from passage
inner join rencontre on passage.REN_ID = rencontre.REN_ID
inner join groupe on passage.GRO_ID = groupe.GRO_ID
group by rencontre.REN_NOM
having count(passage.GRO_ID) = 1; -- Changer la Valeur pour afficher les rencontres où x nombre de groupe joue

-- 4.3.1.6 Interrogation des rencontres où on a joué d'un instrument donné
select ren.REN_NOM as 'Nom de la Rencontre', ren.REN_LIEU, per.PER_PRENOM as Prénom, per.PER_NOM as Nom, ins.INS_NOM as Instrument from rencontre as ren
inner join passage on ren.REN_ID = passage.REN_ID
inner join groupe on passage.GRO_ID = groupe.GRO_ID
inner join membre on groupe.GRO_ID = membre.GRO_ID
inner join personne as per on membre.PER_ID= per.PER_ID 
inner join jouer on per.PER_ID = jouer.PER_ID
inner join instrument as ins on jouer.INS_ID = ins.INS_ID
where ins.INS_NOM = "Guitare";


/*select ren.REN_NOM as 'Nom de la Rencontre', ren.REN_LIEU, per.PER_PRENOM as Prénom, per.PER_NOM as Nom, ins.INS_NOM as Instrument from rencontre as ren
inner join personne as per on ren.PER_ID= per.PER_ID 
inner join jouer on per.PER_ID = jouer.PER_ID
inner join instrument as ins on jouer.INS_ID = ins.INS_ID
where ins.INS_NOM = "Guitare";   Ne renvoie pas tout le monde */

-- 4.3.1.7 Planning complet de la rencontre par lieu et groupe.

select ren.REN_NOM as 'Nom de la Rencontre', ren.REN_LIEU as Ville, PAS_DATE as Passage, PAS_HEUREDEB as 'Heure Début'
, PAS_HEUREFIN 'Heure Fin', PAS_LIEU 'Lieu', GRO_NOM as Groupe from rencontre as ren
inner join passage on ren.REN_ID = passage.REN_ID
inner join groupe on passage.GRO_ID = groupe.GRO_ID
where ren.REN_NOM = "Canal Soleil"; -- Changer la valeur pour obtenir le planning COMPLET de la Rencontre voulu


-- 4.3.2 Exportez vos tables vers des tableaux de votre choix, ainsi que le contenu du résultat de vos requêtes. Ces tableaux devront apparaître dans votre
-- dossier final.

-- VOIR DOSSIER / RAPPORT 

-- 5.1	Créez une fonction permettant de contrôler qu’une date de rencontre est bien  un vendredi soir, un samedi ou un dimanche en matinée. 
-- 		Exception : du 15 juin au 15 septembre, les rencontres peuvent se dérouler n’importe quel jour.

drop function if exists controle_date;
delimiter |
create function controle_date (p_date datetime)
returns char(10)
deterministic
begin

	if 
		month(p_date) in (7,8) or
        (month(p_date) = 6 AND day(p_date) >=15) OR
        (month(p_date) = 9 and day (p_date) <=15 AND
        (dayofweek(p_date) between 2 AND 5))
        or (dayofweek(p_date) = 6 AND DATE_FORMAT(p_date, "%H") > '19:00:00')
        or (dayofweek(p_date) = 7) 
        or (dayofweek(p_date) = 1 and DATE_FORMAT(p_date, "%H") < '10:00:00') then 
    return 'True';
    else
    return 'False';
End if;
   
end | 
delimiter ;

select controle_date('2023-10-29 15:00:00') as 'Date Valide ?';


-- Fonctionne seul pour toutes les dates mais pas dans une fonction ?
	SELECT DATE_FORMAT(passage.pas_date, "%W %M %e %Y  %H:%i:%s") as rencontre from passage
    where DATE_FORMAT(passage.pas_date, "%W") = "Friday" and  DATE_FORMAT(passage.pas_date, "%H") > 18
    or DATE_FORMAT(passage.pas_date, "%W") =  "Saturday" 
    or DATE_FORMAT(passage.pas_date, "%W") = "Sunday" and  DATE_FORMAT(passage.pas_date, "%H") < 12
    or DATE_FORMAT(passage.pas_date, "%m %e")  BETWEEN '06 15' AND '09 15';

-- 5.2 Mettez en place les triggers liées à la suppression d’un groupe et à la suppression d’une œuvre

Drop trigger if exists related_info_groupe;
DELIMITER &&
CREATE TRIGGER related_info_groupe
AFTER DELETE ON groupe FOR EACH ROW
begin
	Delete from representer where gro_id=OLD.gro_id;
    Delete from membre where gro_id=OLD.gro_id;
    Delete from repertoire where gro_id=OLD.gro_id;
    Delete from occuper where gro_id=OLD.gro_id;
    Delete from passage where gro_id=OLD.gro_id;
    end&&
DELIMITER ;

Drop trigger if exists related_info_oeuvre;
DELIMITER &&
CREATE TRIGGER related_info_oeuvre
AFTER DELETE ON chanson FOR EACH ROW
begin
	Delete from auteur where CHA_ID=OLD.CHA_ID;
    Delete from repertoire where CHA_ID=OLD.CHA_ID;
    Delete from necessite where CHA_ID=OLD.CHA_ID;
    Delete from representation where CHA_ID=OLD.CHA_ID;
end&&
DELIMITER ;


-- 5.3.1 Créez une procédure stockée qui sélectionne les groupes qui ne participent  pas à une rencontre donnée

drop procedure if exists selection_groupe;
delimiter &&
create procedure selection_groupe (p_ren_nom char(20))
begin

select distinct gro_nom as groupe from groupe
where gro_nom not in (
	select gro_nom from groupe
    inner join passage on groupe.GRO_ID = passage.GRO_ID
	inner join rencontre on passage.REN_ID = rencontre.REN_ID
    where ren_nom = p_ren_nom);
    
end&&
delimiter ;

call selection_groupe ('Canal Soleil');

-- commande isolée pour les test
select distinct gro_nom from groupe
where gro_nom not in (
	select gro_nom from groupe
    inner join passage on groupe.GRO_ID = passage.GRO_ID
	inner join rencontre on passage.REN_ID = rencontre.REN_ID
    where ren_nom = "Salsa");

/*select * from groupe
left join passage on groupe.GRO_ID = passage.GRO_ID
left join rencontre on passage.REN_ID = rencontre.REN_ID
where 'SALSA' not in (coalesce(rencontre.REN_NOM)); or rencontre.REN_NOM is null; && rencontre.REN_NOM != "Salsa"; (tests)*/

-- 5.3.2 puis une autre qui renvoie le dernier numéro de rencontre insérée. 

drop procedure if exists last_rencontre;
delimiter &&
create procedure last_rencontre ()
begin

select * from rencontre
order by REN_ID DESC
limit 1;

end&&
delimiter ;

call last_rencontre();

/*select * from rencontre
order by REN_ID DESC
limit 1;  (commande isolée pour les tests)*/ 

-- 5.4  Créez un objet du SGDB qui permet de générer sept rencontres ayant les mêmes caractéristiques sauf le jour de la rencontre qui varie d’une journée à 
-- 		chaque fois. Vous devez vous assurer que la date de rencontre est correcte sinon aucune des rencontres ne doit être insérée (transaction) – réutiliser la  fonction crée précédemment.

drop procedure if exists sept_rencontre;
Delimiter &&
create procedure sept_rencontre ()
begin
	declare dte date;
	declare date1 date ;
    declare date2 date;
    declare compteur int;
    declare verif boolean ;
    declare last_id int;
    
    set dte = now();
    set verif=true;
    set compteur=0;
    
set autocommit = 0;
Start transaction;
	
    while (compteur<7 and verif = true) do
    
	set date1 = date_add(dte, interval 1 day);
	set date2 = date_add(date1, interval 4 hour);

INSERT RENCONTRE (per_id, peri_id, reg_id, ren_nom, ren_lieu, ren_datedebut, ren_datefin, ren_nbpers)
VALUES (1, 6, 25, 'CANAL SOLEIL', 'NANCY', date1, date2, 1500);

	if(select controle_date((select ren_datedebut from rencontre order by ren_id desc limit 1)) = 'true')  then
                set compteur = compteur +1;
            else 
                set verif = false;
            end if;
        end while;
        if (verif = true) then 
            select "insertion réussit";
            commit;
        else 
            select "echec de l'insertion";
            rollback;
        end if;
set autocommit=1;
    
end&&
delimiter ;

call sept_rencontre();