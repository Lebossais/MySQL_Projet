select avg(project.ESTIMATELOAD ) FROM projet_actif.project group by IDSECTORACTIVITY;

select tinylabel, labelfunction from project
inner join stage on project.IDproject = stage.IDproject 
inner join intervention on stage.idstage = intervention.idstage
inner join employee on intervention.BADGEEMPLOYEE = employee.NUMBERBADGE
inner join sign on employee.NUMBERBADGE = sign.NUMBERBADGE
inner join contract on sign.IDCONTRACT = contract.IDCONTRACT
inner join functionbox on contract.idfunction = functionbox.idfunction;

select tinylabel, LABELSECTORACTIVITY, LABELFUNCTION, count(distinct intervention.BADGEEMPLOYEE) from project
inner join stage on project.IDproject = stage.IDproject 
inner join intervention on stage.idstage = intervention.idstage
inner join employee on intervention.BADGEEMPLOYEE = employee.NUMBERBADGE
inner join sign on employee.NUMBERBADGE = sign.NUMBERBADGE
inner join contract on sign.IDCONTRACT = contract.IDCONTRACT
inner join functionbox on contract.idfunction = functionbox.idfunction
inner join sectoractivity on project.IDSECTORACTIVITY = sectoractivity.IDSECTORACTIVITY
where REALENDDATE is null
group by tinylabel, LABELSECTORACTIVITY, LABELFUNCTION;
/*
update contract set salary = salary*1.05 
inner join sign on contract.idcontract = sign.idcontract
where sign.entrydate = (select (timediff(now(),sign.entrydate)/365.25) >5 ) ;
*/


delimiter &&
create trigger table_projet_verif
after insert on project
for each row
begin
 if timediff(new.PRESTARTDATE, new.PREENDDATE) <=0 then
	signal sqlstate '45000' set message_text = 'La date ne peut être null';
END IF;
end &&
delimiter ;

delimiter &&
create trigger client_coherence
after insert on company
for each row
begin
 if (revenue/workforce) > 1000000 then
	signal sqlstate '45000' set message_text = 'Erreur du CA';
end if;
end &&
delimiter ;

delimiter &&
create trigger maj_personnel
after insert on contract
for each row
begin 
if (old.idstatus < new.idstatus) then 
	signal sqlstate '45100' set message_text = 'Erreur Statut contrat';
end if;
end&&
delimiter ;

delimiter &&
create trigger suppr_projet_cancel
after delete on project
for each row
begin
	if (timediff(month, now(), REALENDDATE) <2) then
    signal sqlstate '45000' set message_text = 'Erreur';
end if;
end&&
delimiter ;

delimiter &&
create procedure moyenne ()
begin
	select avg(estimateload) from project
    where project.REALENDDATE is null;
end&&
delimiter ;

delimiter &&
create procedure theme_projet (p_infostech varchar(25))
begin
	select * from project
    inner join compose on project.IDPROJECT = compose.IDPROJECT
    inner join infostech on compose.IDINFOSTECH = infostech.IDINFOSTECH
    where LABELINFOSTECH = p_infostech
    having timediff(year, now(), REALENDDATE) > 2 ;
end &&

