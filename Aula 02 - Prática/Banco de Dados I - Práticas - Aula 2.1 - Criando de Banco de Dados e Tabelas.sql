-- Criando um novo banco de dados --
Create Database Solange
Go

-- Acessando o Banco de Dados Solange --
Use Solange
Go

-- Criando uma nova tabela --
Create Table Clientes
(CodigoDoCliente Int Not Null,
 NomeDoCliente Varchar(60) Not Null,
 SexoDoCliente Char(1) Not Null,
 DataDeNascimentoDoCliente Date Null,
 EnderecoDoCliente Varchar(100) Null)
Go

-- Consultando a estrutura da tabela Clientes --
Select CodigoDoCliente, 
            NomeDoCliente, 
			SexoDoCliente,
            DataDeNascimentoDoCliente,
			EnderecoDoCliente
From Clientes
Go

-- Inserindo uma nova linha de registro lógico na tabela de Clientes --
Insert Into Clientes(CodigoDoCliente, 
                                    NomeDoCliente, 
                                    SexoDoCliente, 
									DataDeNascimentoDoCliente, 
									EnderecoDoCliente)
Values(1, 'Brayan','M','1999-03-07','Itapevi fodeu.....')
Go

-- Consultando os dados cadastrados na tabela de Clientes --
Select CodigoDoCliente, 
            NomeDoCliente, 
			SexoDoCliente,
            DataDeNascimentoDoCliente,
			EnderecoDoCliente
From Clientes
Go

-- Criando a Tabela de Produtos --
Create Table Produtos
(CodigoDoProduto SmallInt Not Null Primary Key, -- Chave Primária = PK --
 NomeDoProduto Varchar(30) Not Null,
 Preco Money)
Go

-- Inserindo uma linha de registro lógico na tabela de Produtos
Insert Into Produtos (CodigoDoProduto, NomeDoProduto, Preco)
Values(1, 'Arroz',14.25)
Go

-- Consultando os dados na tabela de Produtos --
Select CodigoDoProduto, NomeDoProduto, Preco
From Produtos
Go

-- Tente inserir novamente o registro informando na linha 53 --