SELECT p.*, pf.CPF
FROM Pessoa p
INNER JOIN PessoaFisica pf ON p.ID_Pessoa = pf.Pessoa_ID_Pessoa;

SELECT p.*, pj.CNPJ
FROM Pessoa p
INNER JOIN PessoaJuridica pj ON p.ID_Pessoa = pj.Pessoa_ID_Pessoa;

SELECT m.*, p.nome AS fornecedor, pr.nome AS Produto, 
m.quantidade, m.valorUnitario,(m.quantidade * m.valorUnitario) 
AS total FROM Movimento m INNER JOIN Pessoa p ON p.ID_Pessoa = m.Pessoa_ID_Pessoa
INNER JOIN Produto pr ON pr.ID_Produto = m.Produto_ID_Produto WHERE m.tipo = 'E';

SELECT m.*, p.nome AS comprador, pr.nome AS Produto,
m.quantidade, m.valorUnitario,(m.quantidade * m.valorUnitario) 
AS total FROM Movimento m INNER JOIN Pessoa p ON p.ID_Pessoa = m.Pessoa_ID_Pessoa
INNER JOIN Produto pr ON pr.ID_Produto = m.Produto_ID_Produto WHERE m.tipo = 'S';

SELECT pr.nome AS Produto, SUM(m.quantidade * m.valorUnitario) 
AS ValorTotalEntradas FROM Movimento m
INNER JOIN Produto pr ON pr.ID_Produto = m.Produto_ID_Produto
WHERE m.tipo = 'E' GROUP BY pr.nome;

SELECT pr.nome AS Produto, 
SUM(m.quantidade * m.valorUnitario) 
AS ValorTotalSaidas FROM Movimento m
INNER JOIN Produto pr ON pr.ID_Produto = m.Produto_ID_Produto
WHERE m.tipo = 'S' GROUP BY pr.nome;

SELECT u.ID_Usuario, u.LoginName FROM Usuario u
LEFT JOIN Movimento m ON u.ID_Usuario = m.Usuario_ID_Usuario AND m.tipo = 'E'
WHERE m.ID_Movimento IS NULL;

SELECT u.ID_Usuario, u.LoginName, SUM(m.quantidade * m.valorUnitario) AS 
ValorTotalEntradas FROM Movimento m
INNER JOIN Usuario u ON u.ID_Usuario = m.Usuario_ID_Usuario
WHERE m.tipo = 'E'
GROUP BY u.ID_Usuario, u.LoginName;


SELECT u.ID_Usuario, u.LoginName,
SUM(m.quantidade * m.valorUnitario) AS ValorTotalSaidas
FROM Movimento m
INNER JOIN Usuario u ON u.ID_Usuario = m.Usuario_ID_Usuario
WHERE m.tipo = 'S' GROUP BY u.ID_Usuario, u.LoginName;

SELECT pr.nome AS Produto, SUM(m.quantidade * m.valorUnitario) / SUM(m.quantidade)
AS ValorMedioVenda FROM Movimento m
INNER JOIN Produto pr ON pr.ID_Produto = m.Produto_ID_Produto
WHERE m.tipo = 'S' GROUP BY pr.nome;