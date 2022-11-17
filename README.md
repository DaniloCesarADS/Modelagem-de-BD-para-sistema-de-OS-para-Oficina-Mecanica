# Projeto de banco de dados para cenário de Ordens de Serviço em Oficina Mecânica:

**Contexto de aplicação:** Base de dados para gerenciar informações de ordens de serviço em um ambiente de Oficina mecânica.

**Tipo de banco de dados**: Relacional.

**SGBD**: MySQL

**Desenvolvedor**: Danilo Cesar ADS

**Objetivo**: Criar um projeto lógico de sistema de banco de dados relacional para persistir e gerenciar informações relativas as atividades de prestação de serviços em uma oficina mecânica.

## Etapas do projeto lógico de banco de dados relacional:

* Levantamento de requisitos;
* Modelagem do BD;
* Construção do BD - Criação do BD conforme estimado em modelagem, bem como a realização de testes unitários em busca de correção de erros;
* Persistência de dados para teste de funcionamento do BD;
* Criação de consultas para obtenção de informações persistidas e cálculos relativos a aplicação de sistema de Ordens de Serviço.



# Modelagem de um sistema de BD para gerenciamento de ordens de serviço em uma oficina mecânica



## Levantamento de requisitos:



Narrativa empregada para levantamento do contexto da aplicação e dos requisitos do projeto de BD para modelagem.

- Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica;
- Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões periódicas;
- Cada veículo é  designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega;
- A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra;
- O valor de cada peça também irá compor a OS;
- O cliente autoriza a execução dos serviços;
- A mesma equipe avalia e executa os serviços;
- Os mecânicos possuem código, nome, endereço e especialidade;
- Cada OS possui: nº, data de emissão, um valor, status e uma data para conclusão dos trabalhos;
- Uma OS pode ser composta por vários serviços;
- Uma OS pode ter vários tipos de peça.



## Sugestões para a modelagem:

* Decidido retirar o atributo "Valor" da OS e recuperar via consultas para a realização de cálculos;
* Decidido não relacionar peça com serviço para evitar dupla associação dos dados e diminuir a complexidade nas relações da OS do banco. Assim é possível centralizar as consultas na OS.

## Construção do BD:

A construção do BD, foi dividida em 3 scripts diferentes para organização. São eles:

* Criação BD OS Oficina.sql >> Script com as instruções para criar o banco de dados;
* Persistência BD OS Oficina.sql >> Script com as instruções para gravar os dados no BD;
* Consultas BD OS Oficina.sql >> Script com as Queries de consulta.



## Relação de algumas perguntas respondidas e solicitações retornadas através do uso das Queries no Banco de Dados:

* Recuperações de tabelas completas com SELECT...
* Quero ver o id, Nome, Sobrenome, Telefone e Email referente aos clientes...
* Quero ver modelo, marca e placa referentes aos veículos cadastrados...
* Quero uma relação dos serviços e peças para estimar o orçamento e o tempo de execução total...
* Quais os veículos que constam nas OSs?
* Aproveitando a query anterior, como ordenar as OSs pela mais antiga?
* Quantos pedidos foram feitos por cada cliente e quantas OSs foram geradas em razão desses pedidos?
* Quero uma relação peças importadas e seus prazos de fornecimento?
* Quais os serviços mais solicitados e o total de receita com cada um deles?
* Qual o valor total das OSs?

## Software de Modelagem:

MySQL Workbench

