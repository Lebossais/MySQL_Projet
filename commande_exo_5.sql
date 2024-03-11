select * from etudiant order by NomEt ASC;

select nomEns,gradeens as grade,nommat as matiere from enseignant
inner join matiere on enseignant.CodeMat = matiere.CodeMat
where NomMat = "BD";

select nommat,coefmat, NomEns from matiere
inner join enseignant on matiere.CodeMat = enseignant.codemat
where GradeEns = "grd3";

select nommat, coefmat,note from note
inner join matiere on note.CodeMat = matiere.CodeMat
inner join etudiant on note.CodeEt = etudiant.CodeEt
where etudiant.CodeEt = "4"; /*ou changer le 4 par le code etudiant*/

select count(*) "nombre d'enseignant qui enseigne la matière recherché" from enseignant
inner join matiere on enseignant.CodeMat = matiere.CodeMat
where matiere.NomMat = "Informatique"; /*forcément, il n'y a pas la matière informatique, mais fonctionne par exemple avec BD et donc renvoie 1*/