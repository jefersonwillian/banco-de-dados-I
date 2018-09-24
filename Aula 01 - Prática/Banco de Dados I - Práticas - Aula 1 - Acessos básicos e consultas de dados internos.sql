-- Acessando um banco de Dados --
Use Model2
Go

-- Acessando o Banco de Dados MSDB --
Use MSDB
Go

-- Obtendo o ID do banco de Dados --
Select DB_ID() As 'Número do Banco'
Go

-- Obtendo o Nome do Banco de Dados --
Select DB_Name() As 'Nome do Banco de Dados'
Go

-- Obter informações sobre o Banco de Dados --
Select DB_ID() As 'ID',
             DB_Name() As 'Database'
Go

-- Consultando dados de uma tabela --
Select * from sys.database_files
Go

Select Name, 
             Physical_name
From sys.database_files
Go

-- Criando um novo Banco de Dados --
Create Database Aula2
Go

-- Acessando o Banco de Dados Aula2 --
Use Aula2
Go
