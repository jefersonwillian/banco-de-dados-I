-- Criando o Banco de Dados --
Create Database Biblioteca
Go

-- Acessando o Banco de Dados --
Use Biblioteca
Go

-- Criando a Tabela de Autores --
Create Table Autores
(CodigoAutores TinyInt Primary Key,
 NomeAutores Varchar(20) Not Null,
 DataNascimentoAutores Date Not Null,
 SexoAutores Char(1))
Go

-- Inserindo dados na tabela Autores --
Insert Into Autores (CodigoAutores, NomeAutores,
                                        DataNascimentoAutores, SexoAutores)
Values (1,'Autor A','1980-04-06','M'), 
              (2,'Autor B','1980-05-8','F'),
              (3,'Autor C','1980-06-18','F'),
              (4,'Autor D','1980-07-20','M')
Go

-- Consultando os dados cadastrados --
Select CodigoAutores, 
       NomeAutores,
       DataNascimentoAutores,
       SexoAutores
From Autores
Order By NomeAutores Desc -- Ordenando o resultado do Select através da coluna NomeAutores --
Go

-- Criando a Tabela de Livros --
Create Table Livros
(CodigoLivros SmallInt Not Null,
 CodigoAutores TinyInt Not Null,
 NomeLivros Varchar(60) Not Null,
 DescricaoLivros Varchar(200) Null,
 ISBNLivros Char(20))
Go

-- Adicionando Chave Primária na Tabela Livros --
Alter Table Livros
 Add Constraint [PK_Livros_CodigoLivros] Primary Key (CodigoLivros)
Go

-- Adicionando relacionamento entre Livros e Autores
Alter Table Livros
 Add Constraint [FK_Livros_Autores_CodigoAutores] Foreign Key (CodigoAutores)
  References Autores(CodigoAutores)
Go

-- Realizar a criação do DER - Diagrama Entidade Relacionamento --

-- Inserindo 50 linhas de registros na tabela Livros --
-- Declarando as variávei @ContadorLinhas --
Declare @ContadorLinhas TinyInt

--Atribuíndo valores para variáveis --
Set @ContadorLinhas = 1 

While @ContadorLinhas <=50
Begin
 Insert Into Livros (CodigoLivros, CodigoAutores, NomeLivros, DescricaoLivros, ISBNLivros)
 Values(@ContadorLinhas, 1,'Livro....','Meu Livro','ISBN')

 Set @ContadorLinhas = @ContadorLinhas + 1
End

-- Consultando os dados na tabela de Livros --
Select CodigoLivros As 'Codigo do Livro', 
       NomeLivros As 'Nome do Livro',
       DescricaoLivros, 
       ISBNLivros As 'ISBN',
       CodigoAutores As 'Codigo do Autor'
From Livros
Order By CodigoLivros Desc -- Ordenando o resultado em ordem decrescente --
Go