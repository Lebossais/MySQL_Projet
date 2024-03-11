select * from employes where emp_comm = true;

select emp_enom,emp_prof,emp_sal from employes order by emp_sal asc;
select emp_enom,emp_prof,emp_sal from employes order by emp_sal desc;

select avg(emp_sal) from employes;

select avg(emp_sal) from employes where emp_prof = "Production";

select max(emp_sal), dep_dno from employes group by dep_dno;

select avg(emp_sal), emp_prof from employes group by emp_prof;

select min(a) as minimum_salaire from (select avg(emp_sal) as a from employes as e group by emp_prof) e;

select avg(emp_sal), emp_prof from employes group by emp_prof;



