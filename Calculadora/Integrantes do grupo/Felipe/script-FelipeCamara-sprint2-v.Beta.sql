create database aqualife;
use aqualife;

create table tabela_empresa(
	idEmpresa int primary key auto_increment,
	endereco_empresa varchar (60),
    cnpj_empresa varchar (60),
    nome_empresa varchar (50),
    email_responsavel varchar (60),
    telefone_responavel varchar (60)
    );
    
create table tabela_funcionario(
	idFuncionario int primary key auto_increment,
    nome_funcionario varchar (50),
    login_funcionario varchar (50),
    senha_funcionario varchar (50),
    permissoes_funcionario varchar (40),
    fkEmpresa int);
   
create table tabela_tanque(
	idTanque int primary key auto_increment,
    qtdPeixes_tanque varchar (50),
    litros_tanque varchar (40),
    fkEmpresa int);
    
create table tabela_sensor(
	idSensor int primary key auto_increment,
    temperatura_sensor char (2),
    turbidez_sensor char (3),
    data_ultima_revisao_sensor date,
    dataHora_coleta_sensor datetime,
    fkTanque int);
    
alter table tabela_funcionario add foreign key (fkEmpresa)
		references tabela_empresa (idEmpresa);
        
alter table tabela_tanque add foreign key (fkEmpresa)
		references tabela_empresa (idEmpresa);
        
alter table tabela_sensor add foreign key (fkTanque)
		references tabela_tanque (idTanque);

