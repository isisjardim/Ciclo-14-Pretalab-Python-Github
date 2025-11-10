-- =============================
-- CRIAÇÃO DO BANCO
-- =============================

DROP TABLE IF EXISTS pagamentos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    cpf CHAR(11) PRIMARY KEY, -- CPF como chave primária
    nome VARCHAR(100)
);

CREATE TABLE categorias (
    id INT PRIMARY KEY,
    descricao VARCHAR(100)
);

CREATE TABLE pagamentos (
    id_pagamento INT PRIMARY KEY,
    cpf_cliente CHAR(11),
    id_categoria INT,
    valor DECIMAL(10,2),
    FOREIGN KEY (cpf_cliente) REFERENCES clientes(cpf),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

-- Inserção de clientes (14 clientes)
INSERT INTO clientes VALUES
('11111111111', 'Ana'),
('22222222222', 'Beatriz'),
('33333333333', 'Carla'),
('44444444444', 'Daniela'),
('55555555555', 'Eduarda'),
('66666666666', 'Fernanda'),
('77777777777', 'Gabriela'),
('88888888888', 'Helena'),
('99999999999', 'Isabela'),
('10101010101', 'Juliana'),
('12121212121', 'Karen'),
('13131313131', 'Laura'),
('13131313130', 'João'),
('13131313132', 'Mauro');

-- Inserção de categorias
INSERT INTO categorias VALUES
(1, 'Alimentação'),
(2, 'Transporte'),
(3, 'Educação'),
(4, 'Investimentos'),
(5, 'Lazer');

-- Inserção de pagamentos (30 registros)
INSERT INTO pagamentos VALUES
(1, '11111111111', 1, 120.00),   -- Ana - alimentação
(2, '22222222222', 5, 200.00),   -- Beatriz - lazer
(3, '33333333333', 4, 500.00),   -- Carla - investimentos
(4, '11111111111', 2, 80.00),    -- Ana - transporte
(5, '44444444444', 3, 300.00),   -- Daniela - educação
(6, '55555555555', 1, 150.00),   -- Eduarda - alimentação
(7, '66666666666', 2, 90.00),    -- Fernanda - transporte
(8, '77777777777', 5, 250.00),   -- Gabriela - lazer
(9, '88888888888', 3, 400.00),   -- Helena - educação
(10, '22222222222', 4, 350.00),  -- Beatriz - investimentos
(11, '33333333333', 1, 60.00),   -- Carla - alimentação
(12, '44444444444', 2, 75.00),   -- Daniela - transporte
(13, '55555555555', 5, 180.00),  -- Eduarda - lazer
(14, '66666666666', 3, 220.00),  -- Fernanda - educação
(15, '77777777777', 4, 600.00),  -- Gabriela - investimentos
(16, '88888888888', 1, 95.00),   -- Helena - alimentação
(17, '11111111111', 5, 130.00),  -- Ana - lazer
(18, '22222222222', 1, 85.00),   -- Beatriz - alimentação
(19, '33333333333', 2, 140.00),  -- Carla - transporte
(20, '44444444444', 4, 450.00),  -- Daniela - investimentos
(21, '55555555555', 2, 70.00),   -- Eduarda - transporte
(22, '66666666666', 5, 310.00),  -- Fernanda - lazer
(23, '77777777777', 1, 200.00),  -- Gabriela - alimentação
(24, '88888888888', 2, 60.00),   -- Helena - transporte
(25, '99999999999', 3, 500.00),  -- Isabela - educação
(26, '10101010101', 4, 700.00),  -- Juliana - investimentos
(27, '12121212121', 5, 150.00),  -- Karen - lazer
(28, '13131313131', 1, 180.00),  -- Laura - alimentação
(29, '99999999999', 2, 95.00),   -- Isabela - transporte
(30, '10101010101', 1, 210.00);  -- Juliana - alimentação

-- =============================
--Querys de Exercícios
-- =============================
--Exercícios
-- 1. Liste os pagamentos com o nome do cliente e a categoria.
SELECT c.nome, p.valor, cat.descricao
FROM pagamentos p JOIN clientes c 
ON p.cpf_cliente = c.cpf JOIN categorias cat
ON p.id_categoria = cat.id 
ORDER BY c.nome;

-- 2. Liste os clientes que ainda não realizaram nenhum pagamento.
SELECT c.nome, c.cpf
FROM clientes c LEFT JOIN pagamentos p
ON c.cpf = p.cpf_cliente 
WHERE p.valor is NULL;


-- 3. Liste os pagamentos com valor acima da média.
SELECT * FROM pagamentos
WHERE valor > (SELECT AVG(valor) FROM pagamentos)
ORDER BY valor DESC;

-- 4. Liste os clientes que realizaram pagamentos na mesma categoria de Educação.

SELECT c.nome, cat.descricao
FROM pagamentos p JOIN clientes c 
ON p.cpf_cliente = c.cpf JOIN categorias cat
ON p.id_categoria = cat.id WHERE cat.descricao = 'Educação' 
ORDER BY c.nome;

SELECT c.nome
FROM pagamentos p JOIN clientes c
ON p.cpf_cliente = c.cpf
WHERE id_categoria = (SELECT id FROM categorias WHERE descricao = 'Educação');

-- 5. Calcule o total pago por cada cliente.
SELECT c.nome, SUM(p.valor) AS total_gasto
FROM clientes c LEFT JOIN pagamentos p
ON c.cpf = p.cpf_cliente
GROUP BY c.nome
ORDER BY total_gasto DESC;

-- 6. Mostre os três clientes que mais pagaram.

SELECT c.nome, SUM(p.valor) AS total_gasto
FROM clientes c JOIN pagamentos p
ON c.cpf = p.cpf_cliente
GROUP BY c.nome
ORDER BY total_gasto DESC
LIMIT 3;

-- 7. Classifique os pagamentos em: “Baixo” (<100), “Médio” (100 a 300), “Alto” (>300).

SELECT valor,
	CASE 
    	WHEN valor < 100 THEN 'Baixo'
		WHEN valor BETWEEN 100 AND 300 THEN 'Médio'
        ELSE 'Alto'
	END AS classe
FROM pagamentos
ORDER BY valor;







