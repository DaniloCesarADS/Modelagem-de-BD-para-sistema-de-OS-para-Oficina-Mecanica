-- Script de criação da Databse para o cenário de aplicação de um sistema de Ordem de Serviço (OS) uma fictícia Oficina:
-- Developed by Danilo Cesar ADS

-- Ordem de criação das entidades individuais, visando evitar erros relativos as chaves e referências de dados:
-- 1) Criar Tabela "Clientes";
-- 2) Criar Tabela "Veiculo";
-- 3) Criar Tabela "Equipe";
-- 4) Criar Tabela "Mecanico";
-- 5) Criar Tabela "Pedido";
-- 6) Criar Tabela "Peca";
-- 7) Criar Tabela "Servico";
-- 8) Criar Tabela "OS".

-- ***************************************************************************************
-- INÍCIO DA CRIAÇÃO À PARTIR DAQUI:

-- Criação do Banco de dados para aplicação de Sistema de OS para Oficina Mecânica:

-- Criando a Base de Dados:
create database OSOficina;
-- OBS: DANGEROUS >> Para apagar TODA a base de dados -> drop database OSOficina;

-- Para usar a database e poder criar as tabelas e consultas dentro dela...
use OSOficina;

-- CRIAÇÃO DE TABELAS...

-- ***********************************************************************************************************
-- create table "table"(
	-- Primary Key...
    -- Foreign Key...
	-- Atribbutes...
	-- Constraints...
-- );
-- Visualize table structure...
-- ***********************************************************************************************************

-- Criar a tabela "Clientes"...
create table Clientes(
	-- Primary Key...
	idCliente int auto_increment primary key,
    
    -- Atribbutes...
    Pnome varchar(45) not null,
    Snome varchar(20),
    RG varchar(10),
    CPF varchar(11),
    Nascimento date not null,
    Logradouro varchar(3),
    Endereco varchar(60),
    Numero int,
    Complemento varchar(10),
    Bairro varchar(45),
    Cidade varchar(45),
    Estado varchar(2),
    CEP char(8),
    Telefone varchar(12),
    Email varchar(45),
    
    -- Constraints...
    constraint unique_cpf unique (CPF)
);

-- Visualize table structure...
desc Clientes;

-- ***********************************************************************************************************

-- Criar tabela "Veiculo"...
create table Veiculo(
	-- Primary Key...
	idVeiculo int auto_increment primary key,
    
     -- Foreign Key...
    idVCliente int,
    
    -- Atribbutes...
    Modelo varchar(50) not null default 'MODELO',
    Marca varchar(50) not null default 'MARCA',
    Placa varchar(8) not null default 'PLACA',
    
    -- Constraints...
    constraint unique_placa unique (Placa),
    constraint fk_veiculo_cliente foreign key (idVCliente) references Clientes(idCliente)
);

-- Visualize table structure...
desc Veiculo;

-- ***********************************************************************************************************

-- criar tabela "Equipe"...
create table Equipe(
	-- Primary Key...
	idEquipe int auto_increment primary key,
    
    -- Atribbutes...
    NomeEquipe varchar(9),
    NumeroMembros int,
    
    constraint unique_NomeEquipe unique (NomeEquipe)
);

-- Visualize table structure...
desc Equipe;

-- ***********************************************************************************************************


-- Criar a tabela "Mecanico"...
create table Mecanico(
	-- Primary Key...
	idMecanico int auto_increment primary key,
    
    -- Foreign Key...
    idMEquipe int,
    
    -- Atribbutes...
    Pnome varchar(45) not null,
    Snome varchar(20),
    Telefone varchar(12),
    Email varchar(45),
    Logradouro varchar(3),
    Endereco varchar(60),
    Numero int,
    Complemento varchar(10),
    Bairro varchar(45),
    Cidade varchar(45),
    Estado varchar(2),
    CEP char(8),
    Especialidade varchar(50),
    
    -- Constraints...
    constraint fk_mecanico_equipe foreign key (idMEquipe) references Equipe(idEquipe)
);

-- Visualize table structure...
desc Mecanico;

-- ***********************************************************************************************************

-- Criar tabela "Pedido"...
create table Pedido(
	-- Primary Key...
	idPedido int auto_increment primary key,
    
    -- Foreign Key...
    -- idPedidoCliente int,
    idPedidoEquipe int,
    idPedidoVeiculo int,
    
    -- Atribbutes...
	Descricao varchar(100),
    DataSolicitacao date,
    Liberado enum('SIM','NÃO') default 'SIM',
    
    -- Constraints...
    constraint fk_pedido_equipe foreign key (idPedidoEquipe) references Equipe(idEquipe),
    constraint fk_pedido_veiculo foreign key (idPedidoVeiculo) references Veiculo(idVeiculo)
);

-- Visualize table structure...
desc Pedido;

-- ***********************************************************************************************************

-- Criar tabela "Peca"...
create table Peca(
	-- Primary Key...
	idPeca int auto_increment primary key,
    
    -- Atribbutes...
    Descricao varchar(45),
    TipoPeca varchar(45),
    ClasseMaterial enum('MECANICA','ELETRICA','ELETRONICA') default 'MECANICA',
    Marca varchar(45),
    ValorPeca float,
    NacionalImport enum('NACIONAL','IMPORTADA') default 'NACIONAL',
    TempoFornecDias int
);

-- Visualize table structure...
desc Peca;

-- ***********************************************************************************************************

-- Criar tabela "Servico"...
create table Servico(
	-- Primary Key...
	idServico int auto_increment primary key,
    
    -- Atribbutes...
    DescServico varchar(150) default 'DESCRICAO',
    TempoExecDias float not null default '0.00',
    ValorServico float not null default '0.00'
);
	
-- Visualize table structure...
desc Servico;

-- ***********************************************************************************************************

-- Criar tabela "OS"...
create table OS(
	-- Primary Key...
	idOS int auto_increment primary key,
    
    -- Foreign Key...
    idOSPedido int,
    idOSServico int,
    idOSPeca int,
    
    -- Atribbutes...
    QtdeServico int,
    QtdePeca int,
    DataEmissao date not null default '1900-01-01',
    OSStatus enum('Aguardando','Em progresso','Finalizada','Interrompida') default 'Aguardando',
    
    -- Constraints...
    constraint fk_OS_pedido foreign key (idOSPedido) references Pedido(idPedido),
    constraint fk_OS_servico foreign key (idOSServico) references Servico(idServico),
    constraint fk_OS_peca foreign key (idOSPeca) references Peca(idPeca)
);

-- Visualize table structure...
desc OS;

-- ***********************************************************************************************************
