-- Criando um novo banco de dados --
Create Database Biblioteca
Go

-- Acessando o banco de dados --
Use Biblioteca
Go

-- Criando a Tabela Editoras --
Create Table Editoras
 (CodigoEditora Int Not Null Primary Key, -- Definindo chave primaria
   NomeEditora Varchar(30) Not Null,
   Descricao Varchar(20))
Go

-- Criando a Tabela Autores --
Create Table Autores
 (CodigoAutor Int Not Null Primary Key,
  NomeAutor Varchar(40) Not Null,
  SexoAutor Char(1) Null,
  DataNascimentoAutor Date Null)
Go

-- Criando a Tabela Livros --
Create Table Livros
 (CodigoLivro Int Not Null Primary Key,
  CodigoEditora Int Not Null,
  CodigoAutor Int Not Null,
  NomeLivro Varchar(80) Not Null,
  DescricaoLivro Varchar(60) Not Null,
  ISBN Varchar(20) Not Null)
Go

Create Table Clientes
 (CodigoCliente Int Not Null,
  NomeCliente Varchar(100))
Go

-- Adicionando chave primaria na tabela Clientes --
Alter Table Clientes
 Add Constraint PK_Clientes Primary Key (CodigoCliente)
Go

-- Adicionando um relacionamento, criando Foreign Key --
Alter Table Livros
 Add Constraint ChaveEstrangeira_Livros_Editora
  Foreign Key (CodigoEditora)
   References Editoras(CodigoEditora)
Go

-- Adicionando um novo relacionamento entre Livros e Autores--
Alter Table Livros
 Add Constraint ChaveEstrangeira_Livros_Autores
  Foreign Key (CodigoAutor)
   References Autores(CodigoAutor)
Go


-- Inserindo dados na Table Editoras --
Insert Into Editoras (CodigoEditora, NomeEditora, Descricao)
Values (1, 'Editora Azul','Blue')

Insert Into Editoras (CodigoEditora, NomeEditora, Descricao)
Values (2, 'Editora Amarela','Yellow')

Insert Into Editoras (CodigoEditora, NomeEditora, Descricao)
Values (3, 'Editora Vermelha','Red')
Go

-- Padrão Versão 2008 ou superior --
Insert Into Editoras (CodigoEditora, NomeEditora, Descricao)
Values (4, 'Editora Verde','Green'),
              (5, 'Editora Preta','Black')
Go

-- Consultando ou Consumindos dados --
Select CodigoEditora, NomeEditora, Descricao
From Editoras
Go

-- Consultando ou Consumindos dados de forma ordenada --
Select CodigoEditora, NomeEditora, Descricao
From Editoras
Order By NomeEditora Asc
Go

-- Criando a Tabela Funcionarios --
Create Table Funcionarios
 (CodigoFuncionario Int Primary Key Not Null,
  NomeFuncionario Varchar(60) Not Null,
  DataNascimento Date Not Null,
  Email Varchar(200) Not Null)
Go

-- Criando a Tabela Socios --
Create Table Socios
(CodigoSocio Int Primary Key Not Null,
 NomeSocio Varchar(60) Not Null,
 DataNascimento Date Not Null,
 Email Varchar(200) Not Null)
Go

-- Criando a Tabela Reservas --
Create Table Reservas
 (CodigoReserva Int Primary Key Not Null,
  CodigoLivro Int Not Null,
  CodigoFuncionario Int Not Null,
  CodigoSocio Int Not Null,
  DataReserva DateTime Not Null,
  DataDevolucao DateTime Not Null,
  StatusReserva Char(1) Not Null)
Go

-- Adicionando relacionamentos -- 
Alter Table Reservas
 Add Constraint ChaveEstrangeira_Reservas_Livros
  Foreign Key (CodigoLivro)
   References Livros(CodigoLivro)
Go

Alter Table Reservas
 Add Constraint ChaveEstrangeira_Reservas_Socios
  Foreign Key (CodigoSocio)
   References Socios(CodigoSocio)
Go

Alter Table Reservas
 Add Constraint ChaveEstrangeira_Reservas_Funcionarios
  Foreign Key (CodigoFuncionario)
   References Funcionarios(CodigoFuncionario)
Go









