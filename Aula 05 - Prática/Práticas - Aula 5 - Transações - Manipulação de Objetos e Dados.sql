-- Obtendo informa��es sobre a transa��o --
SELECT @@SPID AS 'Control ID', -- vari�vel de sistema 
	            SYSTEM_USER AS 'Login Name', 
	            USER AS 'User Name'
Go

-- Brincando com Transa��es --
Create Table Tabela1
 (Codigo BigInt Identity(2,2),
  Texto Varchar(Max) Default 'Este � um teste de escrita')
Go

-- Inserindo uma massa de dados na Tabela1 --
Insert Into Tabela1 default values -- Especificando valores padr�es
Go 5000

Select Codigo, Texto From Tabela1
Go


-- Consultando uma faixa de valores --
Select Codigo, Texto From Tabela1
Where Codigo >=1200 And Codigo <=3200 -- Filtro
Order By Codigo Desc -- Ordenando os dados pela coluna c�digo
Go

-- Criando uma nova tabela atrav�s do Select
Select Codigo, Texto Into Tabela2 From Tabela1
Where Codigo >=1200 And Codigo <=3200 -- Filtro
Order By Codigo Desc -- Ordenando os dados pela coluna c�digo
Go

Select Codigo, Texto From Tabela2
Order By Codigo Desc 
Go

-- Abrindo um bloco de Transa��o --
Begin Transaction Tran1

 Delete From Tabela1
 Where Codigo >=1200 And Codigo <=3200

 -- Consultando uma faixa de valores --
Select Codigo, Texto From Tabela1
Where Codigo >=1200 And Codigo <=3200 -- Filtro
Order By Codigo Desc -- Ordenando os dados pela coluna c�digo
Go

Commit Transaction Tran1 -- Confirmando a Transa��o

Insert Into Tabela1
Select Texto from Tabela2

Select * from Tabela1