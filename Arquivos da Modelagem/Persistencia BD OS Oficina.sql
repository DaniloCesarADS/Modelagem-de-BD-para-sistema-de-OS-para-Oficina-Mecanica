-- Script para Persistência de dados para teste de funcionamento do banco de dados:
-- Developed by Danilo Cesar ADS
-- ***********************************************************************************
-- insert into Table(filed1, field2,...,field n) values ('','',...,''),
	-- (),
    -- (),
    -- ();
    
-- select * from Table;
-- ***********************************************************************************

-- Selecionando a base de dados a ser utilizada...
use OSOficina;

-- Inserções em Clientes:
insert into Clientes(Pnome, Snome, RG, CPF, Nascimento, Logradouro, Endereco, Numero, Complemento, Bairro, Cidade, Estado, CEP, Telefone, Email) 
	values ('Adriano','Silva','354687643','32567419345','1995-03-22','Rua','Santo Domingos','16','4','Nova Maua','Maua','SP','04392087','11977664433','adriano.silva@gmail.com'),
	('Adriana','Souza','254678456','24560936489','1999-05-12','Rua','Armando Figueira','16','B','Cambui','Campinas','SP','13947087','19984732323','adriana.souza@hotmail.com'),
    ('Francisca','Gomes','365789564','35487998009','2003-06-01','Av.','Senador Rodrigues','356','','São João','Paulinia','SP','14567197','19981565321','francisca.gomes@gmail.com'),
    ('Rafael','Mariano','456778787','36578344490','2005-10-10','Rua','São Paulo','242','','Capiburgo','São Mateus','SP','06530023','11987123884','rafael.mariano@gmail.com'),
    ('Severino','Silva','3665778955','39583759372','2010-05-23','Av.','Brigadeiro Heleno','67','D','Boiadeiros','Cosmopolis','SP','14563216','19976853433','compras@terra.com.br'),
    ('Diogo','Ferrari','365854672','69457753039','2004-09-29','Rua','Luiz de Camoes','555','','Centro','Osasco','SP','02260344','11976558744','diogo.ferrari@ig.com.br');

-- Visualizando o resultado na tabela...
select * from Clientes;

-- ***********************************************************************************

-- Inserções em Veiculo:
insert into Veiculo(idVCliente, Modelo, Marca, Placa) 
	values ('4','Uno','Fiat','ABC12345'),
    ('2','911 Turbo S','Porsche','ABC12346'),
    ('5','Gol','Volkswagen','ABC12347'),
    ('3','Palio','Fiat','ABC12348'),
    ('2','Cruze','Chevrolet','ABC12349'),
    ('1','Ranger','Ford','ABC12355'),
    ('6','Fusca','Volkswagen','ABC12365'),
    ('6','L200','Mitsubishi','ABC12335'),
    ('3','iCar','Caoa Cherry','ABC12325'),
    ('1','Tiggo','Caoa Cherry','ABC12395');

-- Visualizando o resultado na tabela...    
select * from Veiculo;

-- ***********************************************************************************

-- Inserções Equipe:
insert into Equipe(NomeEquipe,NumeroMembros) 
	values ('Equipe01','2'),
    ('Equipe02','2'),
    ('Equipe03','2'),
    ('Equipe04','2');

-- Visualizando o resultado na tabela...    
select * from Equipe;

-- ***********************************************************************************

-- Inserções em Mecanico:
insert into Mecanico(idMEquipe,Pnome, Snome, Telefone, Email, Logradouro, Endereco, Numero, Complemento, Bairro, Cidade, Estado, CEP, Especialidade) 
	values ('1','José','Silva','11977664433','jose.silva@gmail.com','Rua','Santo Mecanonico','16','4','Nova Maua','Maua','SP','04392087','Mecanico'),
	('2','Ricardo','Souza','19984732323','ricardo.souza@hotmail.com','Rua','Armando Xilindró','16','B','Cambui','Campinas','SP','13947087','Mecanico'),
    ('3','Francisco','Gomes','19981565321','francisco.gomes@gmail.com','Av.','Senador Veadeiros','356','','São João','Paulinia','SP','14567197','Mecanico'),
    ('4','Rafael','Galeoni','11987123884','rafael.galeoni@gmail.com','Rua','São Valadão','242','','Capiburgo','São Mateus','SP','06530023','Mecanico'),
    ('1','Severino','Figueroa','19976853433','severino.figueroa@terra.com.br','Av.','Brigadeiro Berdinasi','67','D','Boiadeiros','Cosmopolis','SP','14563216','Eletricista automotivo'),
    ('2','João','Bernardoxy','11976558744','joao.bernard@ig.com.br','Rua','Luiz de Mercadeiros','555','','Centro','Osasco','SP','02260344','Eletricista automotivo'),
    ('3','Diogo','Julião','11976558744','diogo.juliao@ig.com.br','Rua','Charles III','555','','Centro','Osasco','SP','02260344','Eletricista automotivo'),
    ('4','Cicero','Calpena','11976558744','cicero.calpena@ig.com.br','Rua','Sobral','555','','Centro','Osasco','SP','02260344','Eletricista automotivo');

-- Visualizando o resultado na tabela...
select * from Mecanico;

-- ***********************************************************************************

insert into Pedido (idPedidoEquipe, idPedidoVeiculo, Descricao, DataSolicitacao, Liberado) 
	values('1','2','Preventiva','2020-01-10','SIM'),
    ('2','1','Preventiva','2020-02-10','SIM'),
    ('3','3','Preventiva','2020-02-11','SIM'),
    ('4','4','Preventiva','2020-02-15','SIM'),
    ('1','5','Preventiva','2020-03-23','SIM'),
    ('2','6','Preventiva','2020-12-10','SIM'),
    ('3','7','Preventiva','2020-12-13','SIM'),
    ('4','8','Preventiva','2020-11-10','SIM'),
    ('1','10','Preventiva','2020-09-30','SIM'),
    ('4','9','Preventiva','2020-01-10','SIM');

-- Visualizando o resultado na tabela...
select * from Pedido;

-- ***********************************************************************************
insert into Peca (Descricao, TipoPeca, ClasseMaterial, Marca, ValorPeca, NacionalImport, TempoFornecDias)
	values ('Correia do motor','Correia','MECANICA','Fiat','120','NACIONAL','5'),
    ('Cambio manual','Alavanca','MECANICA','Fiat','450','NACIONAL','5'),
    ('Miolo chave porta malas','Fecho','MECANICA','Fiat','320','NACIONAL','5'),
    ('Kit Radiador','Radiador','MECANICA','Fiat','2000','NACIONAL','5'),
    ('Kit Para brisas','Para brisas','MECANICA','Fiat','300','NACIONAL','5'),
    ('Kit Injeção Eletronica','Injeção Elçetrônica','ELETRONICA','Fiat','4000','NACIONAL','5'),
	('Correia do motor','Correia','MECANICA','Chevrolet','120','NACIONAL','5'),
    ('Cambio manual','Alavanca','MECANICA','Chevrolet','450','NACIONAL','5'),
    ('Miolo chave porta malas','Fecho','MECANICA','Chevrolet','320','NACIONAL','5'),
    ('Kit Radiador','Radiador','MECANICA','Chevrolet','2000','NACIONAL','5'),
    ('Kit Para brisas','Para brisas','MECANICA','Chevrolet','300','NACIONAL','5'),
    ('Kit Injeção Eletronica','Injeção Elçetrônica','ELETRONICA','Chevrolet','4000','NACIONAL','5'),
    ('Correia do motor','Correia','MECANICA','Volkswagen','120','NACIONAL','5'),
    ('Cambio manual','Alavanca','MECANICA','Volkswagen','450','NACIONAL','5'),
    ('Miolo chave porta malas','Fecho','MECANICA','Volkswagen','320','NACIONAL','5'),
    ('Kit Radiador','Radiador','MECANICA','Volkswagen','2000','NACIONAL','5'),
    ('Kit Para brisas','Para brisas','MECANICA','Volkswagen','300','NACIONAL','5'),
    ('Kit Injeção Eletronica','Injeção Elçetrônica','ELETRONICA','Volkswagen','4000','NACIONAL','5'),
    ('Correia do motor','Correia','MECANICA','Ford','120','IMPORTADA','10'),
    ('Cambio manual','Alavanca','MECANICA','Ford','450','IMPORTADA','10'),
    ('Miolo chave porta malas','Fecho','MECANICA','Ford','320','IMPORTADA','10'),
    ('Kit Radiador','Radiador','MECANICA','Ford','2000','IMPORTADA','10'),
    ('Kit Para brisas','Para brisas','MECANICA','Ford','300','IMPORTADA','10'),
    ('Kit Injeção Eletronica','Injeção Elçetrônica','ELETRONICA','Ford','4000','IMPORTADA','10'),
    ('Correia do motor','Correia','MECANICA','Porsche','12000','IMPORTADA','20'),
    ('Cambio manual','Alavanca','MECANICA','Porsche','4500','IMPORTADA','20'),
    ('Miolo chave porta malas','Fecho','MECANICA','Porsche','3200','IMPORTADA','20'),
    ('Kit Radiador','Radiador','MECANICA','Porsche','20000','IMPORTADA','20'),
    ('Kit Para brisas','Para brisas','MECANICA','Porsche','3000','IMPORTADA','20'),
    ('Kit Injeção Eletronica','Injeção Elçetrônica','ELETRONICA','Porsche','60000','IMPORTADA','40'),
    ('Correia do motor','Correia','MECANICA','Mitsubishi','120','IMPORTADA','10'),
    ('Cambio manual','Alavanca','MECANICA','Mitsubishi','450','IMPORTADA','10'),
    ('Miolo chave porta malas','Fecho','MECANICA','Mitsubishi','320','IMPORTADA','10'),
    ('Kit Radiador','Radiador','MECANICA','Mitsubishi','3000','IMPORTADA','10'),
    ('Kit Para brisas','Para brisas','MECANICA','Mitsubishi','300','IMPORTADA','10'),
    ('Kit Injeção Eletronica','Injeção Elçetrônica','ELETRONICA','Mitsubishi','9000','IMPORTADA','10'),
    ('Correia do motor','Correia','MECANICA','Caoa','120','IMPORTADA','10'),
    ('Cambio manual','Alavanca','MECANICA','Caoa','450','IMPORTADA','10'),
    ('Miolo chave porta malas','Fecho','MECANICA','Caoa','320','IMPORTADA','10'),
    ('Kit Radiador','Radiador','MECANICA','Caoa','2000','IMPORTADA','10'),
    ('Kit Para brisas','Para brisas','MECANICA','Caoa','300','IMPORTADA','10'),
    ('Kit Injeção Eletronica','Injeção Elçetrônica','ELETRONICA','Caoa','4000','IMPORTADA','10'),
    ('Kit Bateria icar','Baterias','ELETRICA','Caoa','6000','IMPORTADA','10');
    
-- Visualizando o resultado na tabela...
select * from Peca;

-- ***********************************************************************************
insert into Servico (DescServico, TempoExecDias, ValorServico)
	values ('Trocar Correia','1','700'),
    ('Trocar alavanca de cambio','1','400'),
    ('Trocar o miolo da chave','1','400'),
    ('Trocar Radiador','3','1000'),
    ('Trocar para brisas','1','400'),
    ('Trocar injeção Eletronica','5','2000'),
    ('Trocar Bateria','5','2000'),
    ('Revisão','1','500');
    
    -- Visualizando o resultado na tabela...
select * from Servico;

-- ***********************************************************************************
insert into OS (idOSPedido, idOSServico, idOSPeca, QtdeServico, QtdePeca, DataEmissao, OSStatus)
	values ('1','1','25','1','1','2020-01-13','Finalizada'),
    ('2','2','2','1','1','2020-02-15','Finalizada'),
    ('3','3','15','1','1','2020-02-13','Finalizada'),
    ('4','4','4','1','1','2020-02-17','Finalizada'),
    ('5','5','11','1','1','2020-03-23','Finalizada'),
    ('6','6','23','1','1','2020-10-17','Finalizada'),
    ('7','3','15','1','1','2020-12-13','Finalizada'),
    ('8','4','34','1','1','2020-11-10','Finalizada'),
    ('9','3','39','1','1','2020-09-30','Finalizada'),
    ('10','3','39','1','1','2020-01-20','Finalizada');
    
-- Visualizando o resultado na tabela...
select * from OS;