-- Realizando Queries

use ecommerce;

-- Quantos pedidos foram feitos por cada cliente?
select 
	c.idClient,
    concat(c.Fname, ' ', c.Lname) as clientName,
    count(*) as totalOrders
from clients c
left join orders o
	on c.idClient = o.idOrderClient
group by c.idClient
order by totalOrders desc;
    


