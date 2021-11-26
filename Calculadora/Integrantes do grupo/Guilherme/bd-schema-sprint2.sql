-- Schema Sprint 2
-- -----------------------------------------------------
create database AqualifeSensors; 
use AqualifeSensors;
-- -----------------------------------------------------
-- Tabela Empresas
create table Empresa(
idEmpresa int primary key auto_increment,
Nome varchar(80),
CNPJ char(14),
Endereco varchar(150))auto_increment = 101;
-- -----------------------------------------------------
-- Tabela Tanques 
create table Tanque(
idTanque int primary key, -- ***idTanque = fkEmpresa + número do tanque***
Tamanhom3 int,
QntdSensores int, -- ***A cada 2m³ se usa um par de Sensores(LDR, LM35)***
QntdPeixes int, -- ***Cada m³ comporta 375 tilápias***
Especie varchar(50),
DataEntrada date,
fkEmpresa int,
foreign key (fkEmpresa) references Empresa (idEmpresa));
-- -----------------------------------------------------
-- Tabela Usuário
create table Usuario(
idUsuario int primary key, -- ***idUsuario = fkEmpresa + 5 digitos***
Nome varchar(80),
Login varchar(50),
Senha varchar(50),
Permissao varchar(10),
constraint checkPermissao check (Permissao = 'Power User' or Permissao = 'User'),
fkEmpresa int,
foreign key (fkEmpresa) references Empresa (idEmpresa));
-- -----------------------------------------------------
-- Tabela Monitoramento
create table Monitoramento(
fkUsuario int,
foreign key (fkUsuario) references Usuario (idUsuario),
fkTanque int,
foreign key (fkTanque) references Tanque (idTanque),
Horario datetime default current_timestamp,
StatusTanque varchar(10),
constraint checkTanque check (StatusTanque = 'Ativo' or StatusTanque = 'Inativo'));
-- -----------------------------------------------------
-- Tabela Sensores
create table Sensor(
idSensor int primary key, -- ***idSensor= idTanque + numero do sensor + 1=LDR e 2=LM35***
Tipo varchar(4),
constraint checkTipoSensor check (Tipo = 'LM35' or Tipo = 'LDR'),
Revisao datetime,
fkTanque int,
foreign key (fkTanque) references Tanque (idTanque));
-- -----------------------------------------------------
-- Tabela Leitura do Sensor
create table logSensor(
idlogSensor int primary key, -- ***Na Sprint 2 utilizaremos um id para a leitura do sensor, para a Sprint3 usaremos o datetime default current_timestamp*** 
DatahoraLog datetime default current_timestamp, -- ***primary key***
LogSensor float,
fkSensor int,
foreign key (fkSensor) references Sensor (idSensor));
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Insirir os dados da tabela:





