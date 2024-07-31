-- Inserindo dados na tabela Pessoa
INSERT INTO Pessoa(ID_Pessoa, nome, logradouro, cidade, estado, telefone, email)
VALUES 
(NEXT VALUE FOR orderPessoa, 'Lukas Cauã', 'Rua Cilon Cunha Brum, 724', 'Rio de Janeiro', 'RJ', '3157-0406', 'lukascaua@gmail.com'),
(NEXT VALUE FOR orderPessoa, 'Maria Silva', 'Rua das Flores, 123', 'São Paulo', 'SP', '4002-8922', 'maria.silva@gmail.com'),
(NEXT VALUE FOR orderPessoa, 'José Santos', 'Avenida Paulista, 1000', 'São Paulo', 'SP', '4500-1234', 'jose.santos@gmail.com'),
(NEXT VALUE FOR orderPessoa, 'SuperCompras', 'Rua do Comércio, 500', 'Belo Horizonte', 'MG', '3500-1234', 'contato@supercompras.com'),
(NEXT VALUE FOR orderPessoa, 'Três Irmãos', 'Avenida Central, 900', 'Porto Alegre', 'RS', '3100-5678', 'contato@tresi.com');
GO

-- Inserindo dados na tabela PessoaFisica
INSERT INTO PessoaFisica(ID_PessoaFisica, Pessoa_ID_Pessoa, CPF)
VALUES 
((NEXT VALUE FOR orderPessoa), 1, '12345678901'),
((NEXT VALUE FOR orderPessoa), 2, '98765432100'),
((NEXT VALUE FOR orderPessoa), 3, '19283746509');
GO

-- Inserindo dados na tabela PessoaJuridica
INSERT INTO PessoaJuridica(ID_PessoaJuridica, Pessoa_ID_Pessoa, CNPJ)
VALUES 
((NEXT VALUE FOR orderPessoa), 4, '11222333000145'),
((NEXT VALUE FOR orderPessoa), 5, '22334455000167');
GO

-- Inserindo dados na tabela Usuario
INSERT INTO Usuario(LoginName, Senha)
VALUES 
('op3', 'op3'),
('op4', 'op4');
GO

-- Inserindo dados na tabela Produto
INSERT INTO Produto(nome, quantidade, precoVenda)
VALUES 
('Martelo', 150, '15.00'),
('Chave de Fenda', 200, '7.50'),
('Serra', 100, '25.00');
GO

-- Inserindo dados na tabela Movimento
INSERT INTO Movimento(Pessoa_ID_Pessoa, Usuario_ID_Usuario, Produto_ID_Produto, quantidade, tipo, valorUnitario)
VALUES 
(1, (SELECT ID_Usuario FROM Usuario WHERE LoginName = 'op3'), (SELECT ID_Produto FROM Produto WHERE nome = 'Martelo'), 15, 'E', 10.00),
(2, (SELECT ID_Usuario FROM Usuario WHERE LoginName = 'op4'), (SELECT ID_Produto FROM Produto WHERE nome = 'Chave de Fenda'), 10, 'S', 5.00),
(3, (SELECT ID_Usuario FROM Usuario WHERE LoginName = 'op3'), (SELECT ID_Produto FROM Produto WHERE nome = 'Serra'), 5, 'E', 20.00);
GO