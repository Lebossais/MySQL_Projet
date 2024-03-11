-- 1 Liste des contacts Français 
select companyName as Société, ContactName as Contact, ContactTitle as Fonction, Phone as Téléphone from customers where country = "France";

-- 2 La liste des Produits vendus par Exotic Liquids
select ProductName as Produit, UnitPrice as Prix from products
inner join suppliers on products.SupplierID = suppliers.SupplierID
where suppliers.CompanyName = "Exotic Liquids";

-- 3 Le nombre de produits vendus par des sociétés Françaises du plus grand au plus petit
select companyName as Société, count(productName) as NbrProduits from products 
inner join suppliers on products.SupplierID = suppliers.SupplierID
where suppliers.Country = "France"
group by CompanyName
order by NbrProduits DESC;

-- 4 Clients Français ayant plus de 10 commandes
select CompanyName as Client, count(orderID) as NbrCommandes from orders
inner join customers on orders.CustomerID = customers.CustomerID
where customers.Country = "France"
group by CompanyName
having NbrCommandes > 10;

-- 5 CLients ayant un chiffres d'affaires > 30 000
select c.CompanyName as Clients, sum(od.Quantity*od.UnitPrice)as CA, c.Country from orders as o
inner join customers as c on o.CustomerID = c.CustomerID
inner join `order details` as od on o.OrderID = od.OrderID
group by c.CompanyName, c.Country
having CA > 30000;

-- 6 Les Pays des clients chez Exotic Liquid
select c.country as Pays from customers as c
inner join orders as o on c.CustomerID = o.CustomerID
inner join `order details`as od on o.OrderID = od.OrderID
inner join products as p on od.ProductID = p.ProductID
inner join suppliers as s on p.SupplierID = s.SupplierID
where s.CompanyName = "Exotic Liquids"
group by c.Country
order by c.country ASC;

-- 7 Montant des ventes de 1997
select sum(od.Quantity*od.UnitPrice)as "CA 1997" from orders as o
inner join customers as c on o.CustomerID = c.CustomerID
inner join `order details` as od on o.OrderID = od.OrderID
where o.OrderDate BETWEEN "1997-01-01 00:00:00"  and "1997-12-31 00:00:00";

-- 8 Montant des ventes de 1997 par mois
select date_format(o.orderdate, '%m') as Mois, sum(od.Quantity*od.UnitPrice) as "CA 1997" from orders as o
inner join customers as c on o.CustomerID = c.CustomerID
inner join `order details` as od on o.OrderID = od.OrderID
where o.OrderDate BETWEEN "1997-01-01 00:00:00"  and "1997-12-31 00:00:00"
group by date_format(o.orderdate, '%m')
order by date_format(o.orderdate, '%m');


-- Partie 2
-- 1 Dernière Date de Commande de "Du Monde Entier"

select max(OrderDate) as "Date Dernière Commande" from orders as o
inner join customers as c on o.CustomerID = c.CustomerID
where c.CompanyName = "Du monde entier";


-- 2 Délais moyen de livraison
select avg(TIMESTAMPDIFF(DAY, orderdate, shippedDate)) as "Delais Moyen" from orders;


-- 3 Créer un index sur la colonne CompanyName et ContactName de la table suppliers
create index `index exercice` on suppliers (CompanyName, ContactName);


-- 4 On souhaite supprimer toutes les données liées à "Specialty Biscuits"
/*Delete  from suppliers as s
inner join products as p on p.SupplierID = s.SupplierID
inner join `order details` as od on p.productID = od.productID
inner join orders as o on od.orderid = o.orderID 
where companyName = "Specialty Biscuits";
-- La supression en cascade pourrait permettre la supression automatiser de TOUTES les données liées ) "Specialty Biscuits"