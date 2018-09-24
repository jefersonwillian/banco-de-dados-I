-- Acessando o banco de Dados MSDB --
Use nomeDoBanco
Go

-- Criando um novo banco de dados --
Create Database cadastro_veiculos

-- Acessando o Banco de Dados Cadastro_Veiculos
Use cadastro_veiculos
go

-- Criando a Tabela Proprietario -- 
Create Table proprietario
(
id int Primary Key,
nome varchar(100) not null,
sobrenome varchar(100) not null,
DataNasc datetime not null,
cpf varchar(9) not null,
endereco varchar (150)not null,
cidade varchar(100) not null,
cep varchar (20) null,
uf char(2) not null,
email varchar (50)null,
telefone nchar (15)not null,
sexo char (1) not null,
)

-- Criando a Tabela Veiculo com Chave --
Create Table Veiculo
(
id int Primary Key,
marca varchar (100) not null,
modelo varchar (100) not null,
cor varchar (100) not null,
anoDeFabri date not null,
placa varchar (7) not null,
categoria varchar (20) not null,
Renavam nchar (11) not null,
combustivel varchar (10) not null,
constraint fk_id_proprietario foreign key (id) references proprietario (id),
)