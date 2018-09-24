-- Acessando o banco de Dados MSDB --
Use msdb
Go

-- Criando um novo banco de dados --
Create Database Aula02
Go

-- Acessando o banco de dados Aula02 --
Use Aula02
Go

-- Criando a Tabela Usuarios --
Create Table Usuarios
(CodigoUsuarios Int Primary Key,
 NomeUsuarios Varchar(100) Not Null,
 Endereco Varchar(155) Not Null,
 Usuario Varchar(20) Not Null,
 Senha Varchar(20) Not Null)
Go

-- Consultando a estrutura e dados da tabela Usuarios --
Select CodigoUsuarios, 
       NomeUsuarios, 
	   Endereco, 
	   Usuario, 
	   Senha
From Usuarios
Go

-- Inserindo uma linha de registro na Tabela Usuarios --
Insert Into Usuarios (CodigoUsuarios, NomeUsuarios, Endereco, Usuario, Senha)
Values (1,'Pedro','Rua Professor Tibério Justo da Silva','PedroGalvao','PedroGalvao')
Go

Insert Into Usuarios (CodigoUsuarios, NomeUsuarios, Endereco, Usuario, Senha)
Values (2,'Galvão','Rua Jayme Carvalho de Brito','Yemi','Yemi@2017')
Go

-- Consultando a estrutura e dados da tabela Usuarios --
Select CodigoUsuarios, 
       NomeUsuarios, 
	   Endereco, 
	   Usuario, 
	   Senha
From Usuarios
Go