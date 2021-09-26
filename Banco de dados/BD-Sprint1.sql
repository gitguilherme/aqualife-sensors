-- criar database
create database sprint1;
-- usar database
use sprint1;
-- criar tabela das empresas
create table registro_empresas
(IdEmpresa int primary key,
NomeEmpresa varchar(40),
Login varchar(40),
Senha varchar (40),
QntTanques int );
-- inserir dados
insert into registro_empresas values
(101,'Peixe Fresco','peixe_fresco@bandfish.com.br','iKVUN9R%&gra',4),
(102,'Rio Doce Piscicultura','riodocepiscicultura@bandfish.com.br','N9fiXkev*Al#',7),
(103,'Fisher Piscicultura','fisherpiscicultura@bandfish.com.br','m5oB*FUymt%o',6),
(104,'Aquatropic','aquatropic@bandfish.com.br','u$07C6zZhLk#',8);
-- visualizar a tabela
select * from registro_empresas;
-- criar tabela tanques
create table Tanques
(IdTanque int primary key,
TamanhoTanque varchar(10),
QntPeixes int,
Especie varchar(40),
IdEmpresa int,
foreign key(IdEmpresa) references registro_empresas(IdEmpresa)
);
-- descrever tabela tanques
desc tanques;
-- inserir dados na tabela tanques
insert into Tanques values
(1,'4m³',1500,'Tilápia',101),
(2,'6m³',2250,'Tilápia',102),
(3,'5m³',1875,'Tilápia',103),
(4,'7m³',2625,'Tilápia',104);
-- visualizar tabela tanques
select * from tanques;
select * from registro_empresas;

-- cada m³ comporta 375 tilápias
-- 101 = 4 -1
-- 102 = 7 - 1
-- 103 = 6 - 1
-- 104 = 8 - 1
insert into tanques values
(5,'5m³',1875,'Tilápia',101),
(6,'4m³',1500,'Tilápia',101),
(7,'6m³',2250,'Tilápia',101),
(8,'8m³',3000,'Tilápia',102),
(9,'4m³',1500,'Tilápia',102),
(10,'10m³',3750,'Tilápia',102),
(11,'9m³',3375,'Tilápia',102),
(12,'7m³',2625,'Tilápia',102),
(13,'6m³',2250,'Tilápia',102),
(14,'4m³',1500,'Tilápia',103),
(15,'5m³',1875,'Tilápia',103),
(16,'7m³',2625,'Tilápia',103),
(17,'10m³',3750,'Tilápia',103),
(18,'6m³',2250,'Tilápia',103),
(19,'8m³',3000,'Tilápia',104),
(20,'5m³',1875,'Tilápia',104),
(21,'6m³',2250,'Tilápia',104),
(22,'10m³',3750,'Tilápia',104),
(23,'4m³',1500,'Tilápia',104),
(24,'7m³',2625,'Tilápia',104),
(25,'9m³',3375,'Tilápia',104);
select * from tanques;
select * from registro_empresas;