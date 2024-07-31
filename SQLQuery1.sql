USE Loja;
GO

-- Criação da SEQUENCE para gerar identificadores de pessoa
CREATE SEQUENCE orderPessoa
AS INT
START WITH 1
INCREMENT BY 1;
GO

-- Criação da tabela Pessoa
CREATE TABLE Pessoa (
    ID_Pessoa INT NOT NULL DEFAULT NEXT VALUE FOR orderPessoa,
    nome VARCHAR(255),
    logradouro VARCHAR(255),
    cidade VARCHAR(255),
    estado CHAR(2),
    telefone VARCHAR(11),
    email VARCHAR(255),
    CONSTRAINT CPK_Pessoa PRIMARY KEY CLUSTERED (ID_Pessoa ASC)
);
GO

-- Criação da tabela PessoaFisica
CREATE TABLE PessoaFisica (
    ID_PessoaFisica INT NOT NULL,
    Pessoa_ID_Pessoa INT NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    CONSTRAINT CPK_PessoaFisica PRIMARY KEY CLUSTERED (ID_PessoaFisica ASC),
    CONSTRAINT CFK_Pessoa_PessoaFisica FOREIGN KEY (Pessoa_ID_Pessoa) REFERENCES Pessoa (ID_Pessoa)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
GO

-- Criação da tabela PessoaJuridica
CREATE TABLE PessoaJuridica (
    ID_PessoaJuridica INT NOT NULL,
    Pessoa_ID_Pessoa INT NOT NULL,
    CNPJ VARCHAR(14) NOT NULL,
    CONSTRAINT CPK_PessoaJuridica PRIMARY KEY CLUSTERED (ID_PessoaJuridica ASC),
    CONSTRAINT CFK_Pessoa_PessoaJuridica FOREIGN KEY (Pessoa_ID_Pessoa) REFERENCES Pessoa (ID_Pessoa)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
GO

-- Criação da tabela Usuario
CREATE TABLE Usuario (
    ID_Usuario INT NOT NULL IDENTITY,
    LoginName VARCHAR(255) NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    CONSTRAINT CPK_Usuario PRIMARY KEY CLUSTERED (ID_Usuario ASC)
);
GO

-- Criação da tabela Produto
CREATE TABLE Produto (
    ID_Produto INT NOT NULL IDENTITY,
    nome VARCHAR(255) NOT NULL,
    quantidade INT,
    precoVenda NUMERIC(10, 2),
    CONSTRAINT CPK_Produto PRIMARY KEY CLUSTERED (ID_Produto ASC)
);
GO

-- Criação da tabela Movimento
CREATE TABLE Movimento (
    ID_Movimento INT NOT NULL IDENTITY,
    Pessoa_ID_Pessoa INT NOT NULL,
    Usuario_ID_Usuario INT NOT NULL,
    Produto_ID_Produto INT NOT NULL,
    quantidade INT,
    tipo CHAR(1),
    valorUnitario DECIMAL(10, 2),
    CONSTRAINT CPK_Movimento PRIMARY KEY CLUSTERED (ID_Movimento ASC),
    CONSTRAINT CFK_Produto_Movimento FOREIGN KEY (Produto_ID_Produto) REFERENCES Produto (ID_Produto)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT CFK_Usuario_Movimento FOREIGN KEY (Usuario_ID_Usuario) REFERENCES Usuario (ID_Usuario)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT CFK_Pessoa_Movimento FOREIGN KEY (Pessoa_ID_Pessoa) REFERENCES Pessoa (ID_Pessoa)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
GO
