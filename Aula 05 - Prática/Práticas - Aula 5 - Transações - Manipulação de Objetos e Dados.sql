-- Obtendo informações sobre a transação --
SELECT @@SPID AS 'Control ID', -- variável de sistema 
	            SYSTEM_USER AS 'Login Name', 
	            USER AS 'User Name'
Go

-- Brincando com Transações --
Create Table Tabela1
 (Codigo BigInt Identity(2,2),
  Texto Varchar(Max) Default 'Este é um teste de escrita')
Go

-- Inserindo uma massa de dados na Tabela1 --
Insert Into Tabela1 default values -- Especificando valores padrões
Go 5000

Select Codigo, Texto From Tabela1
Go


-- Consultando uma faixa de valores --
Select Codigo, Texto From Tabela1
Where Codigo >=1200 And Codigo <=3200 -- Filtro
Order By Codigo Desc -- Ordenando os dados pela coluna código
Go

-- Criando uma nova tabela através do Select
Select Codigo, Texto Into Tabela2 From Tabela1
Where Codigo >=1200 And Codigo <=3200 -- Filtro
Order By Codigo Desc -- Ordenando os dados pela coluna código
Go

Select Codigo, Texto From Tabela2
Order By Codigo Desc 
Go

-- Abrindo um bloco de Transação --
Begin Transaction Tran1

 Delete From Tabela1
 Where Codigo >=1200 And Codigo <=3200

 -- Consultando uma faixa de valores --
Select Codigo, Texto From Tabela1
Where Codigo >=1200 And Codigo <=3200 -- Filtro
Order By Codigo Desc -- Ordenando os dados pela coluna código
Go

Commit Transaction Tran1 -- Confirmando a Transação

Insert Into Tabela1
Select Texto from Tabela2

Select * from Tabela1