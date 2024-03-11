select article.art_num, avg(lcd_pu * lcd_qte) as "prix moyen de vente", count(*) as "nombre de vente" from ligne_cmd
inner join article on ligne_cmd.art_num = article.art_num
group by article.art_num;

select count(*) as "nombre total de commande", count(distinct clt_nom)"nombre de client différents", count(distinct cmd_date) as "nombre de jours différents" from commande
join client on commande.clt_num = client.clt_num
where cmd_date like "2019%";
/*nbr ventre, nombre client difft, nombre de jours ou il y a eu des ventes (2109)*/

select clt_num from commande
where cmd_date between "2019-06-05" and "2019-06-10";

select count(clt_loc) as a, clt_nom, clt_loc from client
group by clt_loc, clt_nom
order by a DESC;

select client.clt_nom, commande.cmd_date, commande.clt_num, count(cmd_num) from `client`
inner join `client` on commande.clt_num = client.clt_num
group by client.clt_nom
having count(cmd_num) > 1 ;

