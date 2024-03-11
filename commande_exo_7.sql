select dateNaissance, Adresse from employe where Prenom = "Taha" && nom = "Lamharchi";

select nom,prenom,adresse,NomD from employe
inner join departement on employe.N_Dep = departement.N_Dep
where NomD = "recherche";

select nom, prenom from employe
where superieur = (select matricule from employe where prenom ="Taha");

select nom,heures,nomp from travaille
inner join employe on travaille.Matricule = employe.Matricule
inner join projet on travaille.N_Proj = projet.N_Proj
where heures > "10" && projet.lieu = "Guelmim";

select nomp from travaille
inner join projet on travaille.N_Proj = projet.N_Proj
inner join employe on travaille.Matricule = employe.Matricule
where employe.Prenom = "Taha" && employe.Prenom = "Dane"; /*fonctionne mais ils n'ont aucun projet en commun, si Taha est seule, remonte 1 information*/

select nom, prenom from travaille
right join employe on travaille.Matricule = employe.Matricule
where travaille.matricule is null;

/* select N_pro from travaille */
/*Je ne l'ai pas fait*/

/*select * from travaille
right join employe on travaille.Matricule = employe.Matricule
left join projet on travaille.N_Proj = projet.N_Proj
where travaille.matricule is null or projet.Lieu != "Guelmim" ;*/

select nom from Employe
where matricule not in (select travaille.matricule from travaille
right join employe on travaille.Matricule = employe.Matricule
left join projet on travaille.N_Proj = projet.N_Proj
where projet.lieu = "Guelmim");