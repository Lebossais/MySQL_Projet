select count(*) as nombre_total_etudiant from etudiant;

select min(eva_note) as Note_mini, max(eva_note) as note_maxi from evaluer order by eva_note;


select avg(eva_note),etu_nom,etu_prenom,mat_libelle from evaluer as e
inner join etudiant on e.etu_Netudiant = etudiant.etu_Netudiant 
inner join matiere on e.Mat_code = matiere.mat_code
group by e.etu_Netudiant, e.mat_code;

select avg(eva_note),mat_libelle from evaluer as e
inner join matiere on e.Mat_code = matiere.mat_code
group by e.mat_code;

select avg(eva_note),etu_nom,etu_prenom  from evaluer as e
inner join etudiant on e.etu_Netudiant = etudiant.etu_Netudiant 
group by e.etu_Netudiant;

select avg(eva_note) as moyenne_générale from evaluer;

select avg(eva_note) as moyenne,etu_nom,etu_prenom  from evaluer as e
inner join etudiant on e.etu_Netudiant = etudiant.etu_Netudiant 
group by e.etu_Netudiant  ;