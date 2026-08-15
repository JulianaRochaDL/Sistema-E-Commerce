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

-- Algum vendedor também é fornecedor?
select 
    se.socialName,
    se.CNPJ,
    se.location
from seller se
join supplier su
	on se.CNPJ = su.CNPJ;

-- Relação de produtos/fornecedores e estoques;
select 
	p.Pname as Product,
    su.socialName as name_supplier,
    ps.quantity as quantity_supplier,
    sl.SLquantity as quantity_storage,
    st.storageLocation as storage_location,
    sl.location as Location
from supplier su
join productSupplier ps
	on su.idSupplier = ps.idPsSupplier
join product p
	on p.idProduct = ps.idPsProduct
join storageLocation sl
	on p.idProduct = sl.idLproduct
join productStorage st 
	on st.idProductStorage = sl.idLstorage;

-- As cláusulas podem estar presentes em mais de uma query. 
-- Ex: Consulta para identificar os clientes que realizaram mais de um pedido
select 
	c.idClient,
    concat(c.Fname, ' ', c.Lname) as clientName,
    count(*) as ordersClient
from clients c
join orders o 
	on c.idClient = o.idOrderClient 
group by c.idClient
having ordersClient > 1
order by ordersClient desc;
    
-- Quais clientes já tiveram pelo menos 1 pedido confirmado?
select 
	c.idClient,
    concat(c.Fname, ' ', c.Lname) as clientName,
    count(*) as confirmedOrders,
    o.orderStatus
from clients c
join orders o 
	on c.idClient = o.idOrderClient 
where o.orderStatus = 'Confirmado'
group by c.idClient
order by clientName;

-- Produtos com preço acima de R$ 100
select idProduct, Pname, price
from product
where price > 100
order by price asc;

-- Média de preço por categoria
select
	category,
    round(avg(price), 2) as avgPrice
from product
group by category
order by avgPrice desc;

-- Quais fornecedores fornecem produtos eletrônicos?
select s.idSupplier, p.Pname
from supplier s 
join productSupplier ps
    on s.idSupplier = ps.idPsSupplier
join product p
	on ps.idPsSupplier = p.idProduct
where p.category = 'Eletrônico'
order by p.Pname;

-- Classificando produtos por faixa de preço:
-- até R$ 50,00 = barato
-- de R$ 51,00 a R$ 200,00 = médio
-- acima de R$ 200,00 = caro
select 
	Pname, 
	price,
    case
		when price <= 50 then 'Barato'
        when price between 51 and 200 then 'Médio'
        else 'Caro'
	end as priceCategory
from product
order by price;






    


