-- Inserindo dados nas tabelas

use ecommerce;

show tables;

-- idClient, Fname, Minit, Lname, Address
insert into Clients (Fname, Minit, Lname, Address) 
	values ('Caio', 'A', 'Oliveira', 'rua das pedras, 255, Centro, Recife/PE'),
		   ('Sofia', 'R', 'Costa', 'rua Pedro Ferreira, 68, Alecrim, João Pessoa/PB'),
           ('Vivian', 'C', 'Lima', 'rua Padre Salomão, 96, Nova Cidade, Salvador/BA'),
           ('João', 'L', 'Espínola', 'avenida Carlos Filho, 116, Centro, Recife/PE'),
           ('Daniela', 'S', 'Gonçalves', 'avenida Bernardo Pinto, 96, Lagoa Azul, Nata/RN'),
           ('Pedro', 'E', 'Rocha', 'rua Maciel Dantas, 63, Ponta Branca, Nata/RN');

select * from Clients;

-- idClient, CPF
insert into clientsPF (idClient, CPF) 
	values (1, 33362598436),
		   (2, 96332114789),
           (3, 85222563112),
           (4, 44598733216),
           (5, 14569863258),
           (6, 77652369855);
                      
delete from clientsPF
where CPF in (33362598436, 85222563112, 77652369855);

select * from clientsPF;

-- idClient, CNPJ
insert into clientsPJ (idClient, CNPJ) 
	values (1, 69823147000155),
		   (3, 62587963000163),
           (6, 69873665000152);
           
select * from clientsPJ;

-- Pname, classification_kids, category('Eletrônico','Vestimenta','Brinquedos','Calçados','Cosméticos','Alimentos'), rating, size
insert into product (Pname, classification_kids, category, rating, size, price) 
	values ('Blusa', false, 'Vestimenta', '4', 'P', 89.90),
		   ('Fone de ouvido', false,'Eletrônico','4.2', null, 200.00),
           ('Patins', true, 'Brinquedos', '3.9', '34', 310.50),
           ('Caixa de chocolate', false, 'Alimentos', '5', null, 26.40),
           ('Máscara de cílios', false, 'Cosméticos', 5, null, 58.90),
           ('Blush', false,'Cosméticos', 5, null, 49.99),
           ('Casa da Barbie', true, 'Brinquedos', '4.9', '60x55x40', 890.50),
           ('Tablet', false, 'Eletrônico', '4.1', '11"', 1600.00),
           ('Calça jeans', false, 'Vestimenta', '3.8', '40', 209.99),
           ('Tênis', false, 'Calçados', '4.5', '35', 780.00);
           
select * from product;

-- idClient, typePayment('Pix','Boleto','Cartão','Dois cartões'), limitAvailable
insert into payments (idClient, typePayment, limitAvailable) 
	values (1, 'Cartão', 3500.00),
		   (2, 'Pix', NULL),
           (3, 'Boleto', NULL),
           (4, 'Dois cartões', 7000.00),
           (5, 'Cartão', 1800.00),
           (6, 'Pix', NULL);
           
select * from payments;

-- idOrderClient, orderStatus('Cancelado','Confirmado','Em processamento'), orderDescription, sendValue
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue) 
	values (1, 'Confirmado', 'Compra de blusa', 12.90),
		   (2, default, 'Compra de fone de ouvido', 18.50),
           (3, 'Confirmado', 'Compra de patins', 25.00),
           (4, 'Cancelado', 'Compra de caixa de chocolate', 0.00),
           (5, 'Confirmado', 'Compra de máscara de cílios e blush', default),
           (6, 'Em processamento', 'Compra de tablet', 22.50),
           (1, default, 'Compra de tênis', 16.90),
           (2, 'Em processamento', 'Compra de calça jeans', 14.50),
           (3, 'Confirmado', 'Compra de casa da Barbie', 35.00),
           (5, 'Cancelado', 'Compra de fone de ouvido e tablet', default),
           (6, 'Confirmado', 'Compra de blusa e calça jeans', 17.50),
           (4, default, 'Compra de blush', 9.90),
           (2, 'Confirmado', 'Compra de máscara de cílios', 11.90),
           (1, 'Confirmado', 'Compra de tablet e fone de ouvido', 28.90);
           
select * from orders;
                   
-- storageLocation
insert into productStorage (storageLocation) 
	values ('Centro de Distribuição - Natal/RN'),
		   ('Centro de Distribuição - Recife/PE'),
           ('Centro de Distribuição - João Pessoa/PB'),
           ('Centro de Distribuição - Fortaleza/CE'),
           ('Centro de Distribuição - Salvador/BA'),
           ('Filial - Campina Grande/PB'),
           ('Filial - Maceió/AL'),
           ('Filial - Aracaju/SE'),
           ('Filial - Teresina/PI'),
           ('Filial - São Luís/MA');
           
select * from productStorage;

-- socialName, CNPJ, contact
insert into supplier (socialName, CNPJ, contact)
	values ('Tech Solutions Ltda', '12345678000101', '84991234567'),
		   ('Moda Fashion Confecções', '23456789000112', '81987654321'),
           ('Brinquedos Alegria S.A.', '34567890000123', '71999887766'),
           ('Cosméticos Bella Ltda', '45678901000134', '85988776655'),
           ('Alimentos Nordeste Ltda', '56789012000145', '83997665544'),
           ('Calçados Premium Ltda', '67890123000156', '82996554433'),
           ('Eletrônicos Brasil S.A.', '78901234000167', '27995443322'),
           ('Distribuidora Central Ltda', '89012345000178', '11994332211'),
           ('Importadora Global Ltda', '90123456000189', '61993221100'),
           ('Mega Fornecimentos Ltda', '01234567000190', '31992110099');
           
select * from supplier;

-- socialName, abstName, CNPJ, CPF, location, contact
insert into seller (socialName, abstName, CNPJ, CPF, location, contact)
	values ('Tech Store Ltda', 'Tech Store', '11222333000101', null, 'São Paulo/SP', '11998765432'),
		   ('Moda Elegante Ltda', 'Moda Elegante', '22333444000112', null, 'Recife/PE', '81997654321'),
           ('Brinquedos Feliz S.A.', 'Brinq Feliz', '33444555000123', null, 'Fortaleza/CE', '85996543210'),
           ('Cosméticos Bella Ltda', 'Bella Cosméticos', '44555666000134', null, 'Salvador/BA', '71995432109'),
           ('Calçados Premium Ltda', 'Premium Shoes', '55666777000145', null, 'Belo Horizonte/MG', '31994321098'),
           ('Carlos Henrique', null, null, '12345678901', 'Natal/RN', '84993210987'),
           ('Mariana Souza', null, null, '23456789012', 'João Pessoa/PB', '83992109876'),
           ('Pedro Oliveira', null, null, '34567890123', 'Campina Grande/PB', '83991098765'),
           ('Ana Beatriz Lima', null, null, '45678901234', 'Maceió/AL', '82990987654'),
           ('Lucas Ferreira', null, null, '56789012345', 'Aracaju/SE', '79999876543');

update seller
set CNPJ = '67890123000156'
where socialName = 'Calçados Premium Ltda';

update seller
set CNPJ = '45678901000134'
where socialName = 'Cosméticos Bella Ltda';

select * from seller;
      
-- idPseller, idProduct, prodQuantity
insert into productSeller (idPseller, idProduct, prodQuantity) 
	values (1, 2, 50),
		   (1, 8, 20),
           (2, 1, 80),
           (2, 9, 45),
           (3, 3, 15),
           (3, 7, 12),
           (4, 5, 35),
           (4, 6, 40),
           (5, 10, 30),
           (6, 2, 18),
           (6, 8, 10),
           (7, 4, 60),
           (7, 5, 25),
           (8, 1, 50),
           (8, 9, 22),
           (9, 3, 8),
           (9, 10, 16),
           (10, 6, 55),
           (10, 7, 14);
           
select * from productSeller;
      
select min(idOrder), max(idOrder)
from orders;

-- idPOproduct, idPOorder, poQuantity, poStatus('Disponível','Sem estoque')
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) 
	values (1, 1, 2, 'Disponível'),
		   (2, 1, 1, 'Disponível'),
           (3, 2, 1, 'Disponível'),
           (4, 2, 3, 'Sem estoque'),
           (5, 2, 2, 'Disponível'),
           (8, 3, 1, 'Disponível'),
           (10, 3, 1, 'Disponível'),
           (9, 4, 2, 'Disponível'),
           (7, 4, 1, 'Disponível'),
           (2, 4, 1, 'Sem estoque'),
           (1, 5, 3, 'Disponível'),
           (6, 6, 2, 'Disponível'),
           (5, 7, 1, 'Disponível'),
           (8, 8, 1, 'Disponível'),
           (10, 8, 2, 'Disponível'),
           (4, 9, 4, 'Disponível'),
           (3, 10, 1, 'Disponível'),
           (8, 10, 2, 'Sem estoque'),
           (7, 10, 1, 'Disponível'),
           (6, 11, 2, 'Disponível'),
           (2, 11, 1, 'Disponível'),
           (9, 12, 1, 'Disponível'),
           (10, 12, 2, 'Disponível'),
           (8, 12, 1, 'Disponível'),
           (3, 13, 2, 'Sem estoque'),
           (4, 13, 5, 'Disponível'),
           (5, 13, 1, 'Disponível'),
           (2, 14, 2, 'Disponível'),
           (9, 14, 3, 'Disponível'),
           (1, 14, 1, 'Disponível');
           
select * from productOrder;

-- idLproduct, idLstorage, SLquantity, location
insert into storageLocation (idLproduct, idLstorage, SLquantity, location)
	values (1, 1, 25, 'Corredor A - Prateleira 01'),
		   (2, 1, 18, 'Corredor A - Prateleira 02'),
           (3, 2, 12, 'Corredor B - Prateleira 01'),
           (4, 3, 40, 'Corredor C - Prateleira 03'),
           (5, 4, 35, 'Corredor D - Prateleira 02'),
           (6, 5, 28, 'Corredor E - Prateleira 01'),
           (7, 6, 10, 'Corredor F - Prateleira 04'),
           (8, 7, 15, 'Corredor G - Prateleira 02'),
           (9, 8, 22, 'Corredor H - Prateleira 01'),
           (10, 9, 30, 'Corredor I - Prateleira 03'),
           (2, 10, 8, 'Corredor J - Prateleira 01'),
           (8, 2, 6, 'Corredor B - Prateleira 05'),
           (1, 3, 12, 'Corredor C - Prateleira 01'),
           (5, 6, 14, 'Corredor F - Prateleira 02'),
           (9, 5, 9, 'Corredor E - Prateleira 04');
           
select * from storageLocation;
           
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity)
	values (1, 2, 120),
		   (1, 8, 45),
           (2, 1, 200),
           (2, 9, 150),
           (3, 3, 60),
           (3, 7, 30),
           (4, 5, 180),
           (4, 6, 160),
           (5, 4, 300),
           (6, 10, 100),
           (7, 2, 80),
           (7, 8, 35),
           (8, 1, 140),
           (8, 9, 90),
           (9, 3, 50),
           (9, 10, 70),
           (10, 5, 120),
           (10, 6, 100);
           
select * from productSupplier;

-- idOrder, trackingCode, deliveryStatus('Em processamento','Enviado','Em transporte','Saiu para entrega','Entregue','Cancelado')
insert into delivery (idOrder, trackingCode, deliveryStatus)
	values (1, 'BR100000001', 'Entregue'),
		   (2, 'BR100000002', 'Em transporte'),
           (3, 'BR100000003', default),
           (4, 'BR100000004', 'Cancelado'),
           (5, 'BR100000005', 'Entregue'),
           (6, 'BR100000006', 'Enviado'),
           (7, 'BR100000007', 'Saiu para entrega'),
           (8, 'BR100000008', 'Entregue'),
           (9, 'BR100000009', default),
           (10, 'BR100000010', 'Enviado'),
           (11, 'BR100000011', 'Entregue'),
           (12, 'BR100000012', 'Em processamento'),
           (13, 'BR100000013', 'Entregue'),
           (14, 'BR100000014', 'Em transporte');
           
select * from delivery;
    


           


    



                   

                   

                   

                      
