-- Inserindo dados nas tabelas
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
insert into product (Pname, classification_kids, category, rating, size) values
					('Blusa', false, 'Vestimenta', '4', 'P'),
                    ('Fone de ouvido', false,'Eletrônico','4.2', null),
                    ('Patins', true, 'Brinquedos', '3.9', '34'),
                    ('Caixa de chocolate', false, 'Alimentos', '5', null),
                    ('Máscara de cílios', false, 'Cosméticos', 5, null),
                    ('Blush', false,'Cosméticos', 5, null),
                    ('Casa da Barbie', true, 'Brinquedos', '4.9', '60x55x40'),
                    ('Tablet', false, 'Eletrônico', '4.1', '11"'),
                    ('Calça jeans', false, 'Vestimenta', '3.8', '40'),
                    ('Tênis', false, 'Calçados', '4.5', '35');


                      
