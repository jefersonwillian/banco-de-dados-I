-- Criando um novo Banco de Dados --
Create Database Empresas
go

-- Acessando o Banco de dados Empresas -- 
Use Empresas
go

-- Criando Tabela de Funcionarios --
Create Table Funcionarios(
	CodigoFuncionario int Primary Key Not Null,
	NomeFuncionario Varchar(20) Not Null,
	SexoFuncionario Char(1) Null,
	DataNascimentoFuncionario Date Null
)
go

--  Criando a Tabela de Departamentos -- 
Create Table Departamentos(
	CodigoDepartamento Int Primary Key Not null,
	NomeDepartamento Varchar(20) Not null,
	SiglaDepartamento Char(2) Not null,
)
go

-- Consultando a Estrutura da Tabelas --
Select CodigoFuncionario,
       NomeFuncionario,
	   SexoFuncionario,
	   DataNascimentoFuncionario
From Funcionarios
Go

Select CodigoDepartamento,
	   NomeDepartamento,
	   SiglaDepartamento
From Departamentos
Go

-- Inserindo os dados na Tabela de Funcionarios --
Insert Into Funcionarios (CodigoFuncionario, NomeFuncionario, SexoFuncionario, DataNascimentoFuncionario)
values (1,'Pedro','M','1980-04-28')
go

Insert Into Funcionarios (CodigoFuncionario, 
                          NomeFuncionario, 
						  SexoFuncionario, 
                          DataNascimentoFuncionario)
Values (2,'Fernanda','F','1981-01-28')
Go

Insert Into Funcionarios (CodigoFuncionario, 
                          NomeFuncionario, 
						  SexoFuncionario, 
                          DataNascimentoFuncionario)
Values (3,'Eduardo','M','2001-09-06')
Go

Insert Into Funcionarios (CodigoFuncionario, 
                          NomeFuncionario, 
						  SexoFuncionario, 
                          DataNascimentoFuncionario)
Values (4,'Jo�o Pedro','M','2004-09-28')
Go

-- Consultando os dados cadastrados na tabela de Funcionarios --
Select CodigoFuncionario As 'C�digo do Funcionario',
		NomeFuncionario As 'Nome do Funcion�rio',
		Case SexoFuncionario
		When 'M' Then 'Masculino'
		When 'F' Then 'Feminino'
		When 'I' Then 'Indefinido'
	   End As 'Sexo ou G�nero',
	   DataNascimentoFuncionario As 'Data de Nascimento'
From Funcionarios
Go

-- Inserindo os dados na Tabela de Departamentos --
Insert Into Departamentos (CodigoDepartamento, NomeDepartamento, SiglaDepartamento)
Values (1,'Caixa','C')
Go

Insert Into Departamentos (CodigoDepartamento, NomeDepartamento, SiglaDepartamento)
Values (2,'Cozinha','CZ')
Go

Insert Into Departamentos (CodigoDepartamento, NomeDepartamento, SiglaDepartamento)
Values (3,'Recursos Humanos','RH')
Go

-- Consultando os registros inseridos na tabela de departamentos --
Select CodigoDepartamento, NomeDepartamento, SiglaDepartamento
From Departamentos
Go

-- Alterando a estrutura da Tabela Funcionarios --
Alter Table Funcionarios
 Add CodigoDepartamento Int
Go

-- Adicionando o relacionamento l�gico entre as Tabelas Funcionarios e Departamentos --
Update Funcionarios
Set CodigoDepartamento = 2 -- Atribu�ndo um novo valor para a coluna --
Where CodigoFuncionario = 4 -- onde o CodigoFuncionario for igual � 4--
Go

Update Funcionarios
Set CodigoDepartamento= 1 -- Atribu�ndo um novo valor para a coluna --
Where CodigoFuncionario = 3 -- onde o CodigoFuncionario for igual � 4 --
Go

Update Funcionarios
Set CodigoDepartamento= 3 -- Atribu�ndo um novo valor para a coluna --
Where CodigoFuncionario = 2 -- onde o CodigoFuncionario for igual � 4 --
Go

Select * from Funcionarios
go

-- Filtrando e ordenando os registros no select --
Select F.CodigoFuncionario As 'C�digo do Funcion�rio',
       F.NomeFuncionario As 'Nome do Funcion�rio',
	   Case F.SexoFuncionario
	    When 'M' Then 'Masculino'
		When 'F' Then 'Feminino'
		When 'I' Then 'Indefinido'
	   End As 'Sexo ou G�nero',
	   F.DataNascimentoFuncionario As 'Data de Nascimento',
	   F.CodigoDepartamento
From Funcionarios F
Where F.CodigoDepartamento <> 0
Order By F.NomeFuncionario Desc 
Go