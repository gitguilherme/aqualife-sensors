-- Sprint 3
-- -----------------------------------------------------
create database AqualifeSensors; 
use AqualifeSensors;
-- -----------------------------------------------------
-- Tabela Empresas
create table Empresa(
idEmpresa int primary key auto_increment,
Nome varchar(80),
CNPJ char(14),
CEP char(8),
Numero varchar(45),
Complemento varchar(45),
Email varchar(80),
Senha varchar(50))auto_increment = 101;

-- -----------------------------------------------------
-- Tabela Tanques 
create table Tanque(
idTanque int, -- ***idTanque = fkEmpresa + número do tanque***
Tamanhom3 int,
QntdSensores int, -- ***A cada 2m³ se usa um par de Sensores(LDR, LM35)***
QntdPeixes int, -- ***Cada m³ comporta 375 tilápias***
Especie varchar(50),
DataEntrada date,
fkEmpresa int,
foreign key (fkEmpresa) references Empresa (idEmpresa),
primary key(idTanque, fkEmpresa)
);
-- -----------------------------------------------------
-- Tabela Usuário
create table Usuario(
idUsuario int auto_increment, -- ***idUsuario = fkEmpresa + 5 digitos***
Nome varchar(80),
Email varchar(50),
Senha varchar(50),
fkEmpresa int,
foreign key (fkEmpresa) references Empresa (idEmpresa),
primary key (idUsuario, fkEmpresa)
);
-- -----------------------------------------------------
-- Tabela Monitoramento
create table Monitoramento(
fkUsuario int, 
foreign key (fkUsuario) references Usuario (idUsuario),
fkTanque int,
foreign key (fkTanque) references Tanque (idTanque),
Horario datetime default current_timestamp,
StatusTanque varchar(10),
constraint checkTanque check (StatusTanque = 'Ativo' or StatusTanque = 'Inativo'),
primary key (fkUsuario, fkTanque)
);
-- -----------------------------------------------------
-- Tabela Sensores
create table Sensor(
idSensor int primary key, -- ***idSensor= idTanque + numero do sensor + 1=LDR e 2=LM35***
Tipo varchar(4),
constraint checkTipoSensor check (Tipo = 'LM35' or Tipo = 'LDR'),
Revisao datetime,
fkTanque int,
foreign key (fkTanque) references Tanque (idTanque)

); 
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Tabela Leitura do logSensor
create table logSensor(
idlogSensor int auto_increment, 
DatahoraLog datetime default current_timestamp,
LogSensor float,
fkSensor int,
foreign key (fkSensor) references Sensor (idSensor),
primary key (idlogSensor, fkSensor)
);


-- -----------------------------------------------------
-- -----------------------------------------------------
-- Inserir dados (Empresa)
insert into Empresa (Nome, CNPJ, CEP, Numero, Complemento, Email, Senha) values
('Peixe Fresco',12345432167890, 04447025, 12.500, null, 'peixe@pf.com.br', '123'), -- 101
('Rio Doce Piscicultura',09876512345678, 05065098, 6.234, null, 'rio@rd.com.br', '123'), -- 102
('Fisher Piscicultura',56789012345678, 08749030, 500, null, 'fisher@fp.com.br', '123'); -- 103
-- -----------------------------------------------------
select*from Empresa;
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Inserir dados (Tanque) 
-- ***A cada 2m³ se usa um par de Sensores(LDR, LM35)***
-- ***Cada m³ comporta 375 tilápias***  2x=750 3x=1125 4x=1500 5x=1875 6x=2250
-- ***idTanque = fkEmpresa + número do tanque***
insert into Tanque (idTanque, Tamanhom3, QntdSensores, QntdPeixes, Especie, DataEntrada, fkEmpresa) values
(10101,3,2,900,'Tilápia Azul','2021-06-10',101),
(10102,4,2,1200,'Tilápia Zebra','2021-07-10',101),
(10201,1,1,250,'Tilápia Azul','2021-08-29',102),
(10202,4,2,1200,'Tilápia Azul','2021-08-29',102),
(10301,4,2,1800,'Tilápia Azul','2021-09-11',103),
(10302,6,3,1100,'Tilápia Zebra','2021-09-20',103);
-- -----------------------------------------------------
select*from Tanque;
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Inserir dados (Usuario)
-- ***idUsuario = fkEmpresa + 5 digitos*** ---- inicio do CPF --- 
insert into Usuario (idUsuario, Nome, Email, Senha, fkEmpresa) values
(10112345,'Lucas Fernandes','adm@aqualife.com.br','C!3vcelwYZ^q',101),
(10123456,'Caio Almeida','user@qualife.com.br','UtmK28$*7yCM',101),
(10234567,'João Cardoso','adm@aqualife.com.br','cSSH%hz3k%SZ',102),
(10245678,'Yane Duarte','user@aqualife.com.br','upsq#KTdSN$F',102),
(10309876,'Amanda Silva','adm@aqualife.com.br','p9rGdF#*zXxe',103),
(10387654,'Jéssica Moreira','user@aqualife.com.br','j#6@!rhlTByP',103);
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Inserir dados (Monitoramento)
insert into Monitoramento (fkUsuario, fkTanque, StatusTanque)  values 
(10112345,10102,'Ativo'),
(10245678,10201,'Ativo'),
(10309876,10301,'Ativo');
-- -----------------------------------------------------
select*from Monitoramento;
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Inserir dados (Sensores)
-- ***idSensor= idTanque + numero do par do sensor (posição a cada 2 metros cúbicos) + 1=LDR e 2=LM35***
insert into Sensor (idSensor, Tipo, Revisao, fkTanque) values 
(1010111, 'LDR','2020-10-09', 10101),
(1010112, 'LM35','2020-10-09', 10101),
(1010121, 'LDR','2020-10-09', 10101),
(1010122, 'LM35','2020-10-09', 10101);
insert into Sensor (idSensor, Tipo, Revisao, fkTanque) values
(1010211, 'LDR','2021-04-03', 10102),
(1010212, 'LM35','2021-04-03', 10102),
(1010221, 'LDR','2021-04-03', 10102),
(1010222, 'LM35','2021-04-03', 10102);
insert into Sensor (idSensor, Tipo, Revisao, fkTanque) values
(1020111, 'LDR', '2021-01-29',10201),
(1020112, 'LM35','2021-01-29', 10201);
insert into Sensor (idSensor, Tipo, Revisao, fkTanque) values
(1020211, 'LDR', '2021-10-10',10202),
(1020212, 'LM35','2021-10-10', 10202),
(1020221, 'LDR','2021-10-10', 10202),
(1020222, 'LM35','2021-10-10', 10202);
insert into Sensor (idSensor, Tipo, Revisao, fkTanque) values
(1030111, 'LDR','2021-07-21', 10301),
(1030112, 'LM35','2021-07-21', 10301),
(1030121, 'LDR','2021-07-21', 10301),
(1030122, 'LM35','2021-07-21', 10301);
insert into Sensor (idSensor, Tipo, Revisao, fkTanque) values
(1030211, 'LDR', '2021-07-20', 10302),
(1030212, 'LM35','2021-07-20', 10302),
(1030221, 'LDR','2021-07-20', 10302),
(1030222, 'LM35','2021-07-20', 10302),
(1030231, 'LDR','2021-07-20', 10302),
(1030232, 'LM35','2021-07-20', 10302);

-- -----------------------------------------------------
-- -----------------------------------------------------
-- Exemplos:
-- -----------------------------------------------------r

select * from Empresa join Usuario on fkempresa = idempresa; -- Select empresas + usuários;
select * from Tanque join Empresa on fkempresa = idempresa; -- Select empresas + tanques;
select * from Usuario join Monitoramento on  fkusuario = idusuario join Tanque on fktanque = idtanque; -- Select monitoramento feito pelos usuários nos tanques;
-- -----------------------------------------------------
-- -----------------------------------------------------
