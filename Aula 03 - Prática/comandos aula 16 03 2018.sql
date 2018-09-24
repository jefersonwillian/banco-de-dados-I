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
Values (4,'João Pedro','M','2004-09-28')
Go

-- Consultando os dados cadastrados na tabela de Funcionarios --
Select CodigoFuncionario As 'Código do Funcionario',
		NomeFuncionario As 'Nome do Funcionário',
		Case SexoFuncionario
		When 'M' Then 'Masculino'
		When 'F' Then 'Feminino'
		When 'I' Then 'Indefinido'
	   End As 'Sexo ou Gênero',
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

-- Adicionando o relacionamento lógico entre as Tabelas Funcionarios e Departamentos --
Update Funcionarios
Set CodigoDepartamento = 2 -- Atribuíndo um novo valor para a coluna --
Where CodigoFuncionario = 4 -- onde o CodigoFuncionario for igual á 4--
Go

Update Funcionarios
Set CodigoDepartamento= 1 -- Atribuíndo um novo valor para a coluna --
Where CodigoFuncionario = 3 -- onde o CodigoFuncionario for igual á 4 --
Go

Update Funcionarios
Set CodigoDepartamento= 3 -- Atribuíndo um novo valor para a coluna --
Where CodigoFuncionario = 2 -- onde o CodigoFuncionario for igual á 4 --
Go

Select * from Funcionarios
go

-- Filtrando e ordenando os registros no select --
Select F.CodigoFuncionario As 'Código do Funcionário',
       F.NomeFuncionario As 'Nome do Funcionário',
	   Case F.SexoFuncionario
	    When 'M' Then 'Masculino'
		When 'F' Then 'Feminino'
		When 'I' Then 'Indefinido'
	   End As 'Sexo ou Gênero',
	   F.DataNascimentoFuncionario As 'Data de Nascimento',
	   F.CodigoDepartamento
From Funcionarios F
Where F.CodigoDepartamento <> 0
Order By F.NomeFuncionario Desc 
Go