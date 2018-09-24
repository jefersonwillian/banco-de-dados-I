-- Acessando o Banco de Dados --
Use Biblioteca
Go

-- Consultando os dados da Tabela Livros --
Select * from Livros
Go

-- Atualização de registros através do comando Update --
-- Utilizando operador AND = E --
Update Livros
Set CodigoAutores = 4
Where CodigoLivros >=1 And CodigoLivros <=10 -- Filtrando utilizando o operador And = E
Go

-- Utilizando operador OR = OU --
Update Livros
Set NomeLivros = 'Meu querido livro'
Where CodigoLivros = 15 Or CodigoLivros = 25
              Or CodigoLivros = 35   
			  Or CodigoLivros = 45
Go

-- Utilizando o operador IN = OR comparativo --
Select * from Livros
Where CodigoLivros In (15,25,35,45)
Go

-- Atualizando registros através do operador Between --
Update Livros
 Set ISBNLivros = Concat('ISBN...:',CodigoLivros) -- Concat versão 2012
 Where CodigoLivros Between 30 And 42
Go

Select * from Livros
Where CodigoLivros Between 30 And 42
Go

Update Livros
 Set ISBNLivros = 'ISBN...SQL 2008:'+CONVERT(Varchar(4),CodigoLivros) -- Versão <= 2008 R2
 Where CodigoLivros Between 20 And 24
Go

Select * from Livros
Where CodigoLivros Between 20 And 24
Or CodigoLivros Between 30 And 42
Go

-- Utilizando o operador like para busca aproximada --
Select CodigoLivros,
       CodigoAutores, 
       NomeLivros,
       DescricaoLivros, 
       ISBNLivros
From Livros
Where ISBNLivros Like '%35'
Go

Select CodigoLivros,
       CodigoAutores, 
       NomeLivros,
       DescricaoLivros, 
       ISBNLivros
From Livros
Where ISBNLivros Like '%3%'
Go

Select CodigoLivros,
       CodigoAutores, 
       NomeLivros,
       DescricaoLivros, 
       ISBNLivros
From Livros
Where ISBNLivros Like '35%'
Go

-- Criando uma tabela com base em uma tabela existente
Select * Into MinhaTabeladeLivros From Livros
Go

Select * from MinhaTabeladeLivros
Go

-- Excluíndo algumas linhas de registros --
Delete From Livros
Go

-- Inserindo os dados de uma tabela com base em outra --
Insert Into Livros
Select * from MinhaTabeladeLivros
Go

Select * from livros
Go