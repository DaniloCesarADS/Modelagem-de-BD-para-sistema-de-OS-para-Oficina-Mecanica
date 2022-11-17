-- Script com as consultas realizadas no banco de dados:
-- Developed by Danilo Cesar ADS

-- Selecionando a base de dados a ser utilizada...
use OSOficina;

-- Recuperações de tabelas completas com SELECT:
select * from Clientes;
select * from Veiculo;
select * from Pedido;
select * from OS;
select * from Servico;

-- Recuperações de campos específicos com SELECT:
-- Quero ver o id, Nome, Sobrenome, Telefone e Email referente aos clientes...
select idCliente, Pnome, Snome, Telefone, Email from Clientes;
-- Quero ver modelo, marca e placa referentes aos veículos cadastrados...
select Modelo, Marca, Placa from Veiculo;

-- Filtros com WHERE:
-- Quero uma relação dos serviços e peças para estimar o orçamento e o tempo de execução total...
select S.DescServico, S.TempoExecDias, S.ValorServico, P.Descricao, P.Marca, P.ValorPeca, 
P.NacionalImport, P.TempoFornecDias from Servico S, Peca P, OS where OS.idOSPeca = P.idPeca
and OS.idOSServico = S.idServico;

-- Quais os veiculos que constam nas OSs?
select OS.idOS, P.idPedido, V.Modelo, V.Marca, V.Placa, C.idCliente, C.CPF, OS.DataEmissao, E.NomeEquipe from OS 
	inner join Pedido P on P.idPedido = OS.idOSPedido 
	inner join Veiculo V on P.idPedidoVeiculo = V.idVeiculo
    inner join Clientes C on V.idVCliente = C.idCliente
    inner join Equipe E on P.idPedidoEquipe = E.idEquipe
    group by V.modelo;
    
-- Aproveitando a query anterior, como ordenar as OSs pela mais antiga?
select OS.idOS, P.idPedido, V.Modelo, V.Marca, V.Placa, C.idCliente, C.CPF, OS.DataEmissao, E.NomeEquipe from OS 
	inner join Pedido P on P.idPedido = OS.idOSPedido 
	inner join Veiculo V on P.idPedidoVeiculo = V.idVeiculo
    inner join Clientes C on V.idVCliente = C.idCliente
    inner join Equipe E on P.idPedidoEquipe = E.idEquipe
    group by V.modelo
    order by OS.DataEmissao;

-- Quantos pedidos foram feitos por cada cliente e quantas OSs foram geradas em razão desses pedidos?
select V.idVCliente, count(P.idPedido) as Qtde_Pedidos, count(OS.idOS) as Qtde_OSs from Pedido P 
	inner join OS on OS.idOSPedido = P.idPedido
    inner join Veiculo V on P.idPedidoVeiculo = V.idVeiculo
    group by V.idVCliente;

-- Quero uma relação peças importadas e seus prazos de fornecimento?
select idPeca, Descricao, TipoPeca, Marca, TempoFornecDias from Peca
	where NacionalImport = 'IMPORTADA';
    
-- Quais os servicos mais solicitados e o total de receita com cada um deles?
select S.DescServico, count(OS.QtdeServico) as Qtde, sum(S.ValorServico) as Rec_Total from OS
	inner join Servico S on OS.idOSServico = S.idServico
	group by S.DescServico
    order by Qtde desc;

-- Qual o valor total das OSs?
select OS.idOS, sum(S.ValorServico * OS.QtdeServico) as Total_Servicos, sum(P.ValorPeca * OS.QtdePeca) as Total_Pecas,
	sum((S.ValorServico * OS.QtdeServico) + (P.ValorPeca * OS.QtdePeca)) as Total_OS from OS
    inner join Servico S on OS.idOSServico = S.idServico
    inner join Peca P on OS.idOSPeca = P.idPeca
    group by OS.idOS
    order by Total_OS desc;


