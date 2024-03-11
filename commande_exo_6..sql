select * from avion where capacite > 350;

select nomav,numav,ville from avion where ville = "Marrakech";

select numpil,ville_dep, H_Dep from vol;

select * from pilote;

select nompil, salaire, ville from pilote where salaire >20000 && ville = "Meknes"; /*Aucun, mais la commande fonctionne bien avec une autre ville comme Marrakech*/

select * from avion where capacite < 350 && ville = "Marrakech";

select * from pilote
left join vol on pilote.NUMPIL = vol.NUMPIL
where vol.NUMPIL is null;

select * from vol
inner join pilote on vol.NUMPIL = pilote.NUMPIL
where ville_dep = "Marrakech" && pilote.VILLE = "Meknès";

select * from vol 
inner join avion on vol.NUMAV = avion.NUMAV
where avion.ville != "Marrakech";

select ville_arr from vol
where VILLE_DEP = "Guelma"; /*Fonctionne mais aucun vol n'est en départ de Guelma. Si Marrakech est selectionné, renvoie Rabat et Meknès en arrivée*/