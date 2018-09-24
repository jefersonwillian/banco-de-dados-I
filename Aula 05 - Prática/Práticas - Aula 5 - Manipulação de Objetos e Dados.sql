-- Criando um novo Banco de Dados --
Create Database FatecBD1
Go

-- Acessando o Banco de Dados --
Use FatecBD1
Go

-- Criando a Tabela Fornecedores utilizando Constraints - Not Null, Null, Check, Default e Unique --
Create Table Fornecedores
(Codigo Int Primary Key Identity(1,1),
 RazaoSocial Varchar(80) Not Null,
 Apelido VarChar(30),
 CNPJ BigInt Not Null Unique NonClustered,
 CPF BigInt Not Null Unique NonClustered,
 DataCadastro DateTime Default GetDate(),
 Email Varchar(100) Not Null)
Go

-- Criando a Tabela Produtos utilizando Constraints - Not Null, Null, Check, Default e Unique --
Create Table Produtos
(Codigo Int Identity(1,1),
 Descricao Varchar(80) Not Null,
 DataCadastro DateTime Constraint DF_Produtos_DataCadastro Default GetDate(),
 Quantidade SmallInt Not Null Default (0),
 ValorUnitario Float Not Null 
  Constraint PK_Produtos_Codigo Primary Key (Codigo),
  Constraint CK_Produtos_ValorUnitario Check (ValorUnitario >=0))
Go

-- Inserindo dados na Tabela Fornecedores --
Insert Into Fornecedores (RazaoSocial, CNPJ, CPF, DataCadastro, Email)
Values ('Fornec A', 14397991001, 28877148802, '2018-03-10',
			  'fornecedora@fornec.com.br')
Go

Insert Into Fornecedores (RazaoSocial, Apelido, CNPJ, CPF, Email)
Values ('Fornecedor B', 'Fornec B', 14397991002, 28877148803, 
			  'fornecedorb@fornec.com.br')
Go

Insert Into Fornecedores (RazaoSocial, CNPJ, CPF, DataCadastro, Email)
Values ('Fornecedor C',
             14397991003, 
			 28877148804, 
			 '2018-03-10',
			 'fornecedorc@fornec.com.br')
Go

-- Consultando os dados da Tabela Fornecedores --
Select Codigo, RazaoSocial, 
             Apelido, CNPJ, 
	         CPF, DataCadastro, 
	         Email 
From Fornecedores
Go

Select Codigo, 
           RazaoSocial As 'Razão Social', 
           Apelido As 'Apelido do Fornecedor',
		   Convert(Char(14),CNPJ) + ' - ' + Convert(Char(14),CPF) As 'Documentos', 
		   Cast(CNPJ as Char(14)) + ' - ' + Cast(CPF as Char(14)) As 'Documentos', 
		   DataCadastro 'Data', 
	       Email 
From Fornecedores
Go

Select Codigo, 
           RazaoSocial As 'Razão Social', 
           Apelido As 'Apelido do Fornecedor',
		   Concat(CNPJ,' - ',CPF) As 'Documentos', 
		   DataCadastro 'Data', 
	       Email
From Fornecedores
Where Codigo  =  (Select Top 1 Codigo from Fornecedores
                                    Order By Codigo Desc ) -- Subquery --
Order By Documentos Desc
Go

-- Inserindo dados na Tabela Produtos --
Insert Into Produtos (Descricao, Quantidade, ValorUnitario)
Values ('Arroz', 10, 12.50)
Go

Insert Into Produtos (Descricao, Quantidade, ValorUnitario)
Values ('Feijão', 100, 22.50)
Go

-- Consultando os dados da Tabela Produtos --
Select Codigo, Descricao, DataCadastro, 
             Quantidade, ValorUnitario
From Produtos
Go

-- Adicionando uma nova coluna na Tabela de Produtos --
Alter Table Produtos
 Add CodigoDoFornecedor Int Null
Go

-- Consultando os dados da Tabela Produtos --
Select Codigo, Descricao, DataCadastro, 
             Quantidade, ValorUnitario, CodigoDoFornecedor
From Produtos
Go

-- Evitando a apresentação do valor chave Null --
Select Codigo, Descricao, DataCadastro, 
             Quantidade, ValorUnitario, 
			 IsNull(CodigoDoFornecedor,0) As 'Fornecedor'
From Produtos
Go