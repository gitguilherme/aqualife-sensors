create database aqualifeSensors;

use aqualifeSensors;

create table empresa(
	idEmpresa int primary key auto_increment,
    nome varchar(50),
    cnpj char(14),
    email varchar(30),
    senha varchar(30),
    cep char(8),
    logradouro varchar(30),
    bairro varchar(30),
    cidade varchar(30),
    uf char(2)
);

create table funcionario(
	idFuncionario int primary key auto_increment,
    nomeFuncionario varchar(50),
    cpf char(11),
    email varchar(30),
    senha varchar(30),
    cep char(8),
    logradouro varchar(30),
    bairro varchar(30),
    cidade varchar(30),
    uf char(2),
    fkEmpresa int,
    foreign key (fkEmpresa) references empresa (idEmpresa)
);

create table tanque(
	idTanque int primary key auto_increment,
    tamanhoM2 float,
    qtdPeixes int,
    fkEmpresa int,
    foreign key (fkEmpresa) references empresa (idEmpresa)
);

create table logSensor(
	valorTemperatura float,
    valorTurbidez float,
    dataHora datetime default current_timestamp,
    fkTanque int,
    foreign key (fkTanque) references tanque (idTanque)
);