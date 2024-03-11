select nomLog, prixLog from projet
inner join logiciel on projet.NumProj = logiciel.NumProj
where titreproj = "Gestion de Stock" order by prixLog desc;

select sum(prixlog) as "Cours total du projet" from logiciel where numproj = 10;

select count(*) as "Nombre de Developpeur qui ont travailler sur le projet" from  realisation 
inner join Projet on realisation.NumProj = projet.NumProj
where realisation.NumProj = (select projet.numproj from projet where titreproj = "Gestion de Stock");


select titreproj from logiciel
inner join projet on logiciel.NumProj = projet.NumProj
group by logiciel.NumProj
having count(*) > 5 ;

select developpeur.numdev,nomdev from realisation
inner join developpeur on realisation.NumDev = developpeur.NumDev
group by realisation.NumDev;

select realisation.NumProj, count(Numproj) as "nombre de dev assignés"
from realisation 
group by NumProj
having count(NumProj) = ALL (select count(numdev) from developpeur) ;


/*create temporary table test select titreproj as a from logiciel
inner join projet on logiciel.NumProj = projet.NumProj; */

/*select  realisation.numdev,realisation.numproj, count(*)from realisation
inner join projet on realisation.NumProj = projet.NumProj
group by realisation.Numdev, realisation.numproj;*/