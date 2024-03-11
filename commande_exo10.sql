select * from coureur
inner join equipe on coureur.EQU_ID = equipe.EQU_ID
where equipe.EQU_NOM = "Festina";

select sum(eta_km) as "TOTAL KM" from etape where eta_date like "2022%";

select sum(eta_km) as "Total KM haute montagne" from etape
inner join type_etape on etape.TYE_ID = type_etape.TYE_ID
where type_etape.TYE_LABEL = "montagne";

select * from bonification
right join coureur on bonification.COU_ID = coureur.COU_ID;

select * from bonification
left join coureur on bonification.COU_ID = coureur.COU_ID;


where bonification.cou_id is null;

select coureur.COU_NOM from participer
inner join coureur on participer.COU_ID = coureur.COU_ID
inner join etape on participer.ETA_ID = etape.ETA_ID
group by coureur.COU_nom
having count(coureur.cou_nom) = ALL (select count(eta_ID) from etape);


select sum(participer.eta_id), coureur.COU_NOM from bonification
inner join coureur on bonification.COU_ID = coureur.COU_ID
where eta_id between "1" and "13"
group by coureur.cou_id
having sum((select bonification.ETA_ID from bonification where eta_id between "1" and "13")) = ALL (select sum(ETA_ID) from etape where eta_id between "1" and "13");

drop table if exists temporaire;
create temporary table temporaire
select sum(participer.PAR_TEMPS) - sum(ifnull(bonification.BON_MINUNTE, 0)) as tem_calcule , coureur.COU_NOM coureur, equipe.EQU_NOM from participer
inner join coureur on participer.COU_ID = coureur.COU_ID
inner join equipe on coureur.EQU_ID = equipe.EQU_ID
left join bonification on coureur.COU_ID = bonification.COU_ID and bonification.ETA_ID = participer.ETA_ID
inner join etape on participer.ETA_ID = etape.ETA_ID
where participer.eta_id between "1" and "13"
group by coureur.cou_id
having count(coureur.cou_nom) = ALL (select count(eta_ID) from etape where eta_id <="13") /*  */ 
order by tem_calcule asc;

select sum(tem_calcule), equ_nom from temporaire group by equ_nom;