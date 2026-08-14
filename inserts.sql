-- Inserindo dados nas tabelas
-- drop table ecommerce;
use ecommerce;

show tables;

-- idClient, Fname, Minit, Lname, Address
insert into Clients (Fname, Minit, Lname, Address) values
			('Caio', 'A', 'Oliveira', 'rua das pedras, 255, Centro, Recife/PE'),
            ('Sofia', 'R', 'Costa', 'rua Pedro Ferreira, 68, Alecrim, João Pessoa/PB'),
            ('Vivian', 'C', 'Lima', 'rua Padre Salomão, 96, Nova Cidade, Salvador/BA'),
            ('João', 'L', 'Espínola', 'avenida Carlos Filho, 116, Centro, Recife/PE'),
            ('Daniela', 'S', 'Gonçalves', 'avenida Bernardo Pinto, 96, Lagoa Azul, Nata/RN'),
            ('Pedro', 'E', 'Rocha', 'rua Maciel Dantas, 63, Ponta Branca, Nata/RN');

-- idClient, CPF
insert into clientsPF (idClient, CPF) values
					  (1, 33362598436),
                      (2, 96332114789),
                      (3, 85222563112),
                      (4, 44598733216),
                      (5, 14569863258),
                      (6, 77652369855);
                      
delete from clientsPF
where CPF in (33362598436, 85222563112, 77652369855);

-- idClient, CNPJ
insert into clientsPJ (idClient, CNPJ) values
				      (1, 69823147000155),
                      (3, 62587963000163),
                      (6, 69873665000152);

-- Pname, classification_kids, category('Eletrônico','Vestimenta','Brinquedos','Calçados','Cosméticos','Alimentos'), rating, size
insert into product (Pname, classification_kids, category, rating, size, price) values
					('Blusa', false, 'Vestimenta', '4', 'P', 89.90),
                    ('Fone de ouvido', false,'Eletrônico','4.2', null, 200.00),
                    ('Patins', true, 'Brinquedos', '3.9', '34', 310.50),
                    ('Caixa de chocolate', false, 'Alimentos', '5', null, 26.40),
                    ('Máscara de cílios', false, 'Cosméticos', 5, null, 58.90),
                    ('Blush', false,'Cosméticos', 5, null, 49.99),
                    ('Casa da Barbie', true, 'Brinquedos', '4.9', '60x55x40', 890.50),
                    ('Tablet', false, 'Eletrônico', '4.1', '11"', 1600.00),
                    ('Calça jeans', false, 'Vestimenta', '3.8', '40', 209.99),
                    ('Tênis', false, 'Calçados', '4.5', '35', 780.00);

-- idClient, typePayment('Pix','Boleto','Cartão','Dois cartões'), limitAvailable
insert into payments (idClient, typePayment, limitAvailable) values
					 (1, 'Cartão', 3500.00),
					 (2, 'Pix', NULL),
					 (3, 'Boleto', NULL),
					 (4, 'Dois cartões', 7000.00),
					 (5, 'Cartão', 1800.00),
					 (6, 'Pix', NULL);
                     
desc orders;

-- idOrderClient, orderStatus('Cancelado','Confirmado','Em processamento'), orderDescription, sendValue
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue) values
				   (1, 'Confirmado', 'Compra de blusa', 12.90),
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
                   

                   

                      
