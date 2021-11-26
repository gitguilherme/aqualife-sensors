CREATE TABLE empresa (
idEmpresa int primary key auto_increment,
nome varchar(50),
cnpj char(14),
email varchar(100),
cep char(9),
endereço varchar(90),
bairro varchar(45),
cidade varchar(45)
);

SELECT * from empresa;

CREATE TABLE tanque(
idTanque int primary key auto_increment,
tamanho float,
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa)
);

SELECT * from tanque;

CREATE TABLE funcionario(
idFuncionario int primary key auto_increment,
nome varchar(60),
cpf char(14),
email varchar(90),
cep char(9),
endereço varchar(90),
bairro varchar(45),
cidade varchar(45),
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa)
);

SELECT * from funcionario;

CREATE TABLE funcionario_tanque(
fkEmpresa int,
fkTanque int,
dataHora datetime,
foreign key (fkEmpresa) references empresa(idEmpresa),
foreign key (fkTanque) references tanque(idTanque),
primary key (fkEmpresa, fkTanque, dataHora)
);

SELECT * from funcionario_tanque;

CREATE TABLE peixe(
idPeixe int primary key auto_increment,
qtdPeixes int,
peso float,
fkTanque int,
foreign key (fkTanque) references tanque(idTanque)
);

SELECT * from peixe;

CREATE TABLE temperatura(
idSensorTemp int primary key auto_increment,
valorTemperatura float,
dataHora datetime,
fkTanque int,
foreign key (fkTanque) references tanque(idTanque)
);

SELECT * from temperatura;

CREATE TABLE turbidez(
idSensorLDR int primary key auto_increment,
valorTurbidez float,
dataHora datetime,
fkTanque int,
foreign key (fkTanque) references tanque(idTanque)
);

SELECT * from turbidez;