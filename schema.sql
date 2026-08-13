-- criação do banco de dados para o cenário de E-commerce

create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    Address varchar(30)
);

alter table clients auto_increment=1;

-- criar tabela dos clientes PF
create table clientsPF(
	idClient int primary key,
    CPF char(11) not null unique,
    constraint fk_clientsPF foreign key (idClient) references Clients(idClient)
);

-- criar tabela dos clientes PJ
create table clientsPJ(
	idClient int primary key,
    CNPJ char(14) not null unique,
    constraint fk_clientsPJ foreign key (idClient) references Clients(idClient)
);

-- criar tabela produto
-- size = dimensão do produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(10) not null,
    classification_kids bool default false,
    category enum('Eletrônico','Vestimenta','Brinquedos','Calçados','Cosméticos','Alimentos') not null,
    rating float default 0,
    size varchar(10)
);

alter table product auto_increment=1;

-- criar tabela pagamentos
create table payments(
	idClient int,
    idPayment int auto_increment primary key,
    typePayment enum('Pix','Boleto','Cartão','Dois cartões') not null,
    limitAvailable float,
    constraint fk_payments_client foreign key (idClient) references clients(idClient)
);

-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
		on update cascade
);

alter table orders auto_increment=1;

-- criar tabela estoque
create table productStorage(
	idProductStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

alter table productStorage auto_increment=1;

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

alter table supplier auto_increment=1;

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    abstName varchar(255),
    CNPJ char(15),
    CPF char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_CNPJ_supplier unique (CNPJ),
	constraint unique_CPF_supplier unique (CPF)
);

alter table seller auto_increment=1;

-- criar tabela Produtos/vendedor
create table productSeller(
	idPseller int,
    idProduct int,
    prodQuantity int default 1,
    primary key (idPseller, idProduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

-- criar tabela produto/pedido
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_POproduct_product foreign key (idPOproduct) references product(idProduct),
    constraint fk_product_order foreign key (idPOorder) references orders(idOrder)
);

-- criar tabela de produtos em estoque
create table storageLocation(
	idLproduct int,
    idLstorage int,
    SLquantity int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_product_SL foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_SL foreign key (idLstorage) references productStorage(idProductStorage)
);

-- Criar tabela produto/fornecedor
create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_PS_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_PS_product foreign key (idPsProduct) references product(idProduct)
);

-- Criar tabela de entrega
create table delivery(
	idDelivery int auto_increment primary key,
    idOrder int,
    trackingCode varchar(50), 
    deliveryStatus enum('Em processamento', 
						'Enviado', 
                        'Em transporte', 
                        'Saiu para entrega', 
                        'Entregue', 
                        'Cancelado') default 'Em processamento',
	constraint fk_Order_Delivery foreign key (idOrder) references orders(idOrder)
);

alter table delivery auto_increment=1;

show tables;
show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';

