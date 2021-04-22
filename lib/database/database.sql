create database desafio_dart_avancado;

use desafio_dart_avancado;

create table estados(
	id int unique not null primary key,
    sigla varchar(2),
    nome varchar(200)
);

create table cidades(
	id int unique not null primary key,
    nome varchar(200)
);

create table estado_cidade(
	id_estado int not null,
    id_cidade int not null,
    foreign key (id_estado) references estados(id),
    foreign key (id_cidade) references cidades(id)
);