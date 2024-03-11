select * from film where duree >= 120;

select nomVille from cinema 
inner join ville on cinema.CodePostal = ville.CodePostal
where nomCine = "ICI";

select nomCine from salle
inner join cinema on salle.NumCine = cinema.NumCine
inner join ville on cinema.CodePostal = ville.CodePostal
where ville.NomVille = "Nancy" or salle.Capacite > 100 group by nomCine;

select nomCine,adresse, nomville from projection
inner join film on projection.NumExploit = film.NumExploit
inner join salle on projection.NumSalle = salle.NumSalle
inner join cinema on salle.NumCine = cinema.NumCine
inner join ville on cinema.CodePostal = ville.CodePostal
where film.Titre = "DEAD ALIVE BACK" && NumSemaine = "18";

select film.numexploit from projection
inner join film on projection.NumExploit = film.NumExploit
group by film.numexploit
having count(film.NumExploit) = ALL ( select count(*) from projection group by numExploit);

select titre from projection
right join film on projection.NumExploit = film.NumExploit
where projection.NumExploit is null ;