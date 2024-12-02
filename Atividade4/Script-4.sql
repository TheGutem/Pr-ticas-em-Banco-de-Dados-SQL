create table if not exists fornecedor (
    id_fornecedor serial not null primary key,
    nome varchar(100) not null,
    endereco varchar(200) not null,
    telefone varchar(100) not null,
    email varchar(100) not null
);

create table if not exists produto (
    id_produto serial not null primary key,
    id_fornecedor integer not null,
    nome varchar(100) not null,
    tipo varchar(50) not null,
    preco numeric(10, 2) not null,
    estoque integer not null,
    constraint id_fornecedor foreign key (id_fornecedor) references fornecedor (id_fornecedor)
);

select * from produto;

alter table produto alter preco type numeric(10, 4);

alter table produto drop constraint ck_preco;

alter table produto add constraint ck_preco check (preco > 0);

drop table fornecedor; --Não é possível pois outros objetos dependem dele. Para conseguir deletar a tabela fornecedor, seria necessário adicionar o comando ON CASCADE