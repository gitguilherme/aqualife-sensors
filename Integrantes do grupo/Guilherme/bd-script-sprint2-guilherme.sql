-- Schema Sprint 2
-- -----------------------------------------------------
create database AqualifeSensors;
use AqualifeSensors;
-- -----------------------------------------------------
-- Tabela Empresas
create table Empresa(
idEmpresa int primary key auto_increment,
Nome varchar(80),
Login varchar(50),
Senha varchar(50))auto_increment = 101;
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
-- Tabela Funcionario
create table Funcionario(
idFuncionario int primary key, -- ***idFuncionario = fkEmpresa + 5 digitos***
Nome varchar(80),
Login varchar(50),
Senha varchar(50),
fkEmpresa int,
foreign key (fkEmpresa) references Empresa (idEmpresa));
-- -----------------------------------------------------
-- Tabela Monitoramento
create table Monitoramento(
fkFuncionario int,
foreign key (fkFuncionario) references Funcionario (idFuncionario),
fkTanque int,
foreign key (fkTanque) references Tanque (idTanque),
Horario datetime default current_timestamp,
Descricao varchar(100));
-- -----------------------------------------------------
-- Tabela Sensores
create table Sensor(
idSensor int primary key, -- ***idSensor= idTanque + numero do sensor + 1=LDR e 2=LM35***
Tipo varchar(15),
Revisao date,
fkTanque int,
foreign key (fkTanque) references Tanque (idTanque));
-- -----------------------------------------------------
-- Inserir dados (Empresa)
insert into Empresa (Nome, Login, Senha) values
('Peixe Fresco','peixe_fresco@aqualife.com.br','iKVUN9R%&gra'), -- 101
('Rio Doce Piscicultura','riodocepiscicultura@aqualife.com.br','N9fiXkev*Al#'), -- 102
('Fisher Piscicultura','fisherpiscicultura@aqualife.com.br','m5oB*FUymt%o'), -- 103
('Aquatropic','aquatropic@aqualife.com.br','u$07C6zZhLk#'); -- 104
select*from Empresa;
-- -----------------------------------------------------
-- Inserir dados (Tanque) 
-- ***A cada 2m³ se usa um par de Sensores(LDR, LM35)***
-- ***Cada m³ comporta 375 tilápias***  2x=750 3x=1125 4x=1500 5x=1875 6x=2250
-- ***idTanque = fkEmpresa + número do tanque***
insert into Tanque (idTanque, Tamanhom3, QntdSensores, QntdPeixes, Especie, DataEntrada, fkEmpresa) values
(10101,3,2,900,'Tilápia','2021-06-10',101),
(10102,4,2,1200,'Tilápia','2021-07-10',101),
(10201,1,1,250,'Tilápia','2021-08-29',102),
(10202,4,2,1200,'Tilápia','2021-08-29',102),
(10301,6,3,1800,'Tilápia','2021-08-11',103),
(10302,6,3,1800,'Tilápia','2021-09-11',103),
(10303,4,2,1100,'Tilápia','2021-09-20',103),
(10401,5,2,1500,'Tilápia','2021-10-04',104);
select*from Tanque;
-- -----------------------------------------------------
-- Inserir dados (Funcionario)
-- ***idFuncionario = fkEmpresa + 5 digitos***
-- ***login (user) = nome + fkEmpresa
insert into Funcionario (idFuncionario, Nome, Login, Senha, fkEmpresa) values
(10112345,'Lucas Fernandes','lucas10112345','C!3vcelwYZ^q',101),
(10123456,'Caio Almeida','caio10123456','UtmK28$*7yCM',101),
(10234567,'João Cardoso','joao10234567','cSSH%hz3k%SZ',102),
(10245678,'Yane Duarte','yane10245678','upsq#KTdSN$F',102),
(10309876,'Amanda Silva','amanda10309876','p9rGdF#*zXxe',103),
(10398765,'Fernando Santos','fernando10398765','uELcKah#n02R',103),
(10387654,'Jéssica Moreira','jessica10387654','j#6@!rhlTByP',103),
(10476543,'Carlos Pereira','carlos10376543','YT6$gFbDm!&r',104);
select*from Funcionario;
-- -----------------------------------------------------
-- Inserir dados (Monitoramento)
insert into Monitoramento (fkFuncionario, fkTanque, Descricao) values
(10112345,10102,'Tanque OK'),
(10245678,10201,'Tanque Ok'),
(10476543,10401,'Tanque Ok'),
(10309876,10303,'Tanque Ok');
select*from Monitoramento;
-- -----------------------------------------------------
-- Inserir dados (Sensores)
-- ***idSensor= idTanque + numero do sensor + 1=LDR e 2=LM35***
insert into Sensor (idSensor, Tipo, fkTanque) values 
(10101011, 'LDR', 10101),
(10101012, 'LM35', 10101),
(10101021, 'LDR', 10101),
(10101022, 'LM35', 10101);
insert into Sensor (idSensor, Tipo, fkTanque) values
(10102011, 'LDR', 10102),
(10102012, 'LM35', 10102),
(10102021, 'LDR', 10102),
(10102022, 'LM35', 10102);
insert into Sensor (idSensor, Tipo, fkTanque) values
(10201011, 'LDR', 10201),
(10201012, 'LM35', 10201);
insert into Sensor (idSensor, Tipo, fkTanque) values
(10202011, 'LDR', 10202),
(10202012, 'LM35', 10202),
(10202021, 'LDR', 10202),
(10202022, 'LM35', 10202);
insert into Sensor (idSensor, Tipo, fkTanque) values
(10301011, 'LDR', 10301),
(10301012, 'LM35', 10301),
(10301021, 'LDR', 10301),
(10301022, 'LM35', 10301),
(10301031, 'LDR', 10301),
(10301032, 'LM35', 10301);
insert into Sensor (idSensor, Tipo, fkTanque) values
(10302011, 'LDR', 10302),
(10302012, 'LM35', 10302),
(10302021, 'LDR', 10302),
(10302022, 'LM35', 10302),
(10302031, 'LDR', 10302),
(10302032, 'LM35', 10302);
insert into Sensor (idSensor, Tipo, fkTanque) values
(10303011, 'LDR', 10303),
(10303012, 'LM35', 10303),
(10303021, 'LDR', 10303),
(10303022, 'LM35', 10303);
insert into Sensor (idSensor, Tipo, fkTanque) values
(10401011, 'LDR', 10401),
(10401012, 'LM35', 10401),
(10401021, 'LDR', 10401),
(10401022, 'LM35', 10401);
-- -----------------------------------------------------
-- -----------------------------------------------------




