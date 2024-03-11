select nom, prenom, e_mail from reservation
inner join client on reservation.NumCli = client.NumCli
where reservation.NumCli is not null group by nom,prenom,e_mail;

select nom,prenom,e_mail from reservation
right join client on reservation.numCli = client.numCli
where CodeVoyage is null;

select destination, nom,prenom,e_mail from reservation
inner join client on reservation.NumCli = client.NumCli
inner join voyage on reservation.CodeVoyage = voyage.CodeVoyage
where duree > "10" && prix < "1000";

select * from reservation
inner join voyage on reservation.CodeVoyage = voyage.CodeVoyage
inner join client on reservation.NumCli = client.NumCli
where client.numCli = ALL (select count(*) from reservation group by codevoyage);