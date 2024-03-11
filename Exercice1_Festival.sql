select titre_rep from representation;

select titre_rep from representation where lieu_rep = 'Conservatoire';

select nom_mus,titre_rep from musicien
Inner join representation on musicien.num_rep = representation.num_rep ;

select titre_rep,lieu_rep,pro_tarif from programmer
Inner join representation on programmer.num_rep = representation.Num_rep where pro_Date = "2008-07-25"; 

select count(*) from musicien where num_rep = 20;

select titre_rep,pro_date,pro_tarif from representation  
Inner join programmer on representation.num_rep = programmer.num_rep where pro_tarif <= 20;