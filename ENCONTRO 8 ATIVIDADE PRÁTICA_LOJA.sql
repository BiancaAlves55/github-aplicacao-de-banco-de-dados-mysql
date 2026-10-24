-- Acessar/ Setar o BD
USE DB_T05072B_BIANCA_ALVES;

-- Tabela de produtos
CREATE TABLE TB_PRODUTO_lOJA (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(8,2) NOT NULL
);

-- Inserir dados em Produtos
INSERT INTO TB_PRODUTO_lOJA (nome, preco)
VALUES
    ('Bolo de Fubá', 28.50),
    ('Bolo de Chocolate', 35.00),
    ('Pão de Queijo', 18.90),
    ('Bolo de Banana', 25.8),
    ('Pão de Frios', 5.90);

-- Tabela de fornecedores
CREATE TABLE TB_FORNECEDOR_LOJA (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

-- Inserir dados em Fornecedores
INSERT INTO TB_FORNECEDOR_LOJA (nome, telefone)
VALUES
    ('Fornecedor A', '(12) 99999-1111'),
    ('Fornecedor B', '(12) 98888-2222'),
    ('Fornecedor C', '(12) 99999-3333'),
    ('Fornecedor D', '(12) 99999-4444'),
    ('Fornecedor E', '(12) 99999-5555');


-- Tabela de vendas
CREATE TABLE TB_VENDAS_LOJA (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    data_venda DATE,

    FOREIGN KEY (id_produto)
        REFERENCES TB_PRODUTO_lOJA(id_produto)
);

-- Inserir dados em Vendas
INSERT INTO TB_VENDAS_LOJA (id_produto, quantidade, data_venda)
VALUES
    (1, 2, '2026-10-20'),
    (2, 1, '2026-10-21'),
    (1, 3, '2026-10-22'),
    (3, 5, '2026-10-22'),
    (2, 2, '2026-10-19');

-- 1. Listar todos os produtos cadastrados
SELECT * FROM TB_PRODUTO_lOJA;

-- 2. Listar total de unidades vendidas por produto
SELECT
    P.nome AS produto,
    SUM(V.quantidade) AS total_unidades_vendidas
FROM TB_PRODUTO_lOJA P
INNER JOIN TB_VENDAS_LOJA V
    ON P.id_produto = V.id_produto
GROUP BY P.id_produto, P.nome;

-- 3. Listar o total de vendas do Bolo de Fubá
SELECT
    P.nome AS produto,
    SUM(V.quantidade) AS total_vendas
FROM TB_PRODUTO_lOJA P
INNER JOIN TB_VENDAS_LOJA V
    ON P.id_produto = V.id_produto
WHERE P.nome = 'Bolo de Fubá'
GROUP BY P.nome;

-- 4. Listar o total de vendas do Bolo de Chocolate
SELECT
    P.nome AS produto,
    SUM(V.quantidade) AS total_vendas
FROM TB_PRODUTO_lOJA P
INNER JOIN TB_VENDAS_LOJA V
    ON P.id_produto = V.id_produto
WHERE P.nome = 'Bolo de Chocolate'
GROUP BY P.nome;

-- 5. Produtos vendidos em 2026-10-19
SELECT
    P.nome AS produto,
    V.data_venda,
    V.quantidade
FROM TB_PRODUTO_lOJA P
INNER JOIN TB_VENDAS_LOJA V
    ON P.id_produto = V.id_produto
WHERE V.data_venda = '2026-10-19';