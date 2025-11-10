-- ========================
DROP TABLE IF EXISTS itens_pedido;
CREATE TABLE itens_pedido (
    id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL REFERENCES pedidos(id) ON DELETE CASCADE,
    produto_id INT NOT NULL REFERENCES produtos(id),
    quantidade INT NOT NULL,
    preco_unitario NUMERIC(10,2) NOT NULL
);

-- ========================
-- Tabela de Pagamentos
-- ========================
DROP TABLE IF EXISTS pagamentos;
CREATE TABLE pagamentos (
    id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL REFERENCES pedidos(id) ON DELETE CASCADE,
  usuario_id INT NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    valor NUMERIC(10,2) NOT NULL,
    metodo VARCHAR(50) NOT NULL, -- Ex: Cartão, Pix, Boleto
    status VARCHAR(50) DEFAULT 'Aguardando',
    data_pagamento TIMESTAMP
);

-- ========================
-- Usuários (20)
-- ========================
INSERT INTO usuarios (nome, email, senha) VALUES
('João Silva', 'joao1@email.com', '123456'),
('Maria Souza', 'maria2@email.com', 'abcdef'),
('Carlos Pereira', 'carlos3@email.com', 'senha123'),
('Ana Oliveira', 'ana4@email.com', 'senha456'),
('Pedro Santos', 'pedro5@email.com', 'teste111'),
('Juliana Costa', 'juliana6@email.com', 'teste222'),
('Fernando Lima', 'fernando7@email.com', 'teste333'),
('Patrícia Ramos', 'patricia8@email.com', 'teste444'),
('Ricardo Alves', 'ricardo9@email.com', 'teste555'),
('Aline Rocha', 'aline10@email.com', 'teste666'),
('Bruno Martins', 'bruno11@email.com', 'teste777'),
('Camila Ferreira', 'camila12@email.com', 'teste888'),
('Rodrigo Nunes', 'rodrigo13@email.com', 'teste999'),
('Mariana Gomes', 'mariana14@email.com', 'senhaabc'),
('André Carvalho', 'andre15@email.com', 'senha123'),
('Vanessa Teixeira', 'vanessa16@email.com', 'senha321'),
('Gustavo Melo', 'gustavo17@email.com', 'senha654'),
('Larissa Barros', 'larissa18@email.com', 'senha789'),
('Felipe Azevedo', 'felipe19@email.com', 'senha000'),
('Renata Duarte', 'renata20@email.com', 'senha321');

-- ========================
-- Endereços (20)
-- ========================
INSERT INTO enderecos (usuario_id, logradouro, numero, complemento, bairro, cidade, estado, cep, principal) VALUES
(1, 'Rua das Flores', '123', 'Apto 101', 'Centro', 'São Paulo', 'SP', '01001-000', TRUE),
(2, 'Av. Paulista', '1500', NULL, 'Bela Vista', 'São Paulo', 'SP', '01310-100', TRUE),
(3, 'Rua das Acácias', '45', NULL, 'Jardim', 'Rio de Janeiro', 'RJ', '20010-000', TRUE),
(4, 'Av. Brasil', '999', 'Casa', 'Centro', 'Belo Horizonte', 'MG', '30120-000', TRUE),
(5, 'Rua Goiás', '12', NULL, 'Industrial', 'Curitiba', 'PR', '80000-000', TRUE),
(6, 'Rua Bahia', '58', 'Fundos', 'Leste', 'Porto Alegre', 'RS', '90000-000', TRUE),
(7, 'Rua Amazonas', '345', NULL, 'Norte', 'Fortaleza', 'CE', '60000-000', TRUE),
(8, 'Av. Recife', '88', 'Bloco B', 'Boa Vista', 'Recife', 'PE', '50000-000', TRUE),
(9, 'Rua Pará', '19', NULL, 'Sul', 'Manaus', 'AM', '69000-000', TRUE),
(10, 'Rua Sergipe', '220', 'Casa 2', 'Oeste', 'Belém', 'PA', '66000-000', TRUE),
(11, 'Av. Ceará', '789', NULL, 'Centro', 'Florianópolis', 'SC', '88000-000', TRUE),
(12, 'Rua Paraná', '77', NULL, 'Lapa', 'São Paulo', 'SP', '05000-000', TRUE),
(13, 'Rua Tocantins', '150', 'Casa', 'Centro', 'Campinas', 'SP', '13000-000', TRUE),
(14, 'Rua Maranhão', '60', 'Apto 202', 'Sul', 'Salvador', 'BA', '40000-000', TRUE),
(15, 'Av. Minas Gerais', '410', NULL, 'Industrial', 'Uberlândia', 'MG', '38400-000', TRUE),
(16, 'Rua Roraima', '22', NULL, 'Centro', 'Natal', 'RN', '59000-000', TRUE),
(17, 'Rua Amapá', '71', NULL, 'Centro', 'João Pessoa', 'PB', '58000-000', TRUE),
(18, 'Rua Rondônia', '93', NULL, 'Jardim', 'Cuiabá', 'MT', '78000-000', TRUE),
(19, 'Rua Acre', '55', NULL, 'Oeste', 'Campo Grande', 'MS', '79000-000', TRUE),
(20, 'Av. Piauí', '14', NULL, 'Leste', 'Teresina', 'PI', '64000-000', TRUE);

-- ========================
-- Produtos (20)
-- ========================
INSERT INTO produtos (nome, descricao, preco, estoque) VALUES
('Notebook Dell', 'Inspiron 15, 8GB RAM, 256GB SSD', 3500.00, 10),
('Smartphone Samsung', 'Galaxy S22, 128GB', 4200.00, 15),
('Fone Bluetooth', 'Cancelamento de ruído', 350.00, 30),
('Cadeira Gamer', 'Ergonômica com apoio lombar', 1200.00, 8),
('Monitor LG', 'Full HD 24 polegadas', 900.00, 12),
('Teclado Mecânico', 'Switch Blue', 280.00, 25),
('Mouse Gamer', 'RGB, 7200 DPI', 150.00, 40),
('HD Externo 1TB', 'USB 3.0', 450.00, 20),
('SSD 500GB', 'NVMe M.2', 600.00, 18),
('Placa de Vídeo RTX 3060', '12GB GDDR6', 2200.00, 6),
('Smartwatch Apple', 'Series 7', 3200.00, 10),
('Tablet Samsung', 'Galaxy Tab S7', 2800.00, 9),
('Impressora HP', 'Multifuncional Wi-Fi', 700.00, 14),
('Headset Gamer', '7.1 Surround', 400.00, 22),
('Câmera Canon', 'EOS Rebel T7', 3500.00, 5),
('Caixa de Som JBL', 'Bluetooth portátil', 600.00, 16),
('Kindle Paperwhite', 'Tela antirreflexo', 550.00, 11),
('Microfone Blue Yeti', 'USB condensador', 1200.00, 7),
('Webcam Logitech', '1080p Full HD', 380.00, 13),
('Console PS5', 'PlayStation 5 com 1 controle', 4500.00, 4);

-- ========================
-- Pedidos (20)
-- ========================
INSERT INTO pedidos (usuario_id, endereco_id, status) VALUES
(1, 1, 'Pendente'),
(2, 2, 'Confirmado'),
(3, 3, 'Enviado'),
(4, 4, 'Entregue'),
(5, 5, 'Pendente'),
(6, 6, 'Confirmado'),
(7, 7, 'Enviado'),
(8, 8, 'Pendente'),
(9, 9, 'Confirmado'),
(10, 10, 'Entregue'),
(11, 11, 'Pendente'),
(12, 12, 'Confirmado'),
(13, 13, 'Enviado'),
(14, 14, 'Entregue'),
(15, 15, 'Pendente'),
(16, 16, 'Confirmado'),
(17, 17, 'Enviado'),
(18, 18, 'Pendente'),
(19, 19, 'Confirmado'),
(20, 20, 'Entregue');

-- ========================
-- Itens do Pedido (20)
-- ========================
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00),
(2, 2, 1, 4200.00),
(3, 3, 2, 350.00),
(4, 4, 1, 1200.00),
(5, 5, 1, 900.00),
(6, 6, 1, 280.00),
(7, 7, 2, 150.00),
(8, 8, 1, 450.00),
(9, 9, 1, 600.00),
(10, 10, 1, 2200.00),
(11, 11, 1, 3200.00),
(12, 12, 1, 2800.00),
(13, 13, 1, 700.00),
(14, 14, 1, 400.00),
(15, 15, 1, 3500.00),
(16, 16, 1, 600.00),
(17, 17, 1, 550.00),
(18, 18, 1, 1200.00),
(19, 19, 1, 380.00),
(20, 20, 1, 4500.00);

-- ========================
-- Pagamentos (20 com usuario_id)
-- ========================
INSERT INTO pagamentos (pedido_id, usuario_id, valor, metodo, status, data_pagamento) VALUES
(1, 1, 3500.00, 'Cartão de Crédito', 'Aprovado', '2025-09-01 10:00:00'),
(2, 2, 4200.00, 'Pix', 'Aprovado', '2025-09-02 14:30:00'),
(3, 3, 700.00, 'Boleto', 'Aguardando', NULL),
(4, 4, 1200.00, 'Cartão de Crédito', 'Aprovado', '2025-09-03 16:00:00'),
(5, 5, 900.00, 'Pix', 'Aprovado', '2025-09-04 09:20:00'),
(6, 6, 280.00, 'Cartão de Crédito', 'Aprovado', '2025-09-04 10:15:00'),
(7, 7, 300.00, 'Boleto', 'Aguardando', NULL),
(8, 8, 450.00, 'Cartão de Crédito', 'Aprovado', '2025-09-05 11:45:00'),
(9, 9, 600.00, 'Pix', 'Aprovado', '2025-09-06 08:40:00'),
(10, 10, 2200.00, 'Cartão de Crédito', 'Aprovado', '2025-09-07 15:10:00'),
(11, 11, 3200.00, 'Pix', 'Aprovado', '2025-09-08 17:00:00'),
(12, 12, 2800.00, 'Boleto', 'Aguardando', NULL),
(13, 13, 700.00, 'Pix', 'Aprovado', '2025-09-09 19:25:00'),
(14, 14, 400.00, 'Cartão de Crédito', 'Aprovado', '2025-09-10 12:30:00'),
(15, 15, 3500.00, 'Pix', 'Aprovado', '2025-09-11 09:50:00'),
(16, 16, 600.00, 'Boleto', 'Aguardando', NULL),
(17, 17, 550.00, 'Cartão de Crédito', 'Aprovado', '2025-09-12 20:00:00'),
(18, 18, 1200.00, 'Pix', 'Aprovado', '2025-09-13 18:40:00'),
(19, 19, 380.00, 'Cartão de Crédito', 'Aprovado', '2025-09-14 10:15:00'),
(20, 20, 4500.00, 'Pix', 'Aprovado', '2025-09-15 11:55:00');

-- ========================
--Query SQL

SELECT * FROM produtos
WHERE estoque BETWEEN 5 AND 15;

SELECT * FROM produtos
WHERE estoque > 5 AND estoque < 15;


SELECT * FROM usuarios
WHERE nome LIKE 'R%';

SELECT produto_id, SUM(quantidade*preco_unitario) AS valor
FROM itens_pedido
GROUP BY produto_id
HAVING SUM(quantidade*preco_unitario)> 3000
ORDER BY valor DESC;

SELECT usuario_id, AVG(valor) AS total_gasto
FROM pagamentos
GROUP BY usuario_id
ORDER BY total_gasto DESC;

SELECT usuario_id, SUM(valor) AS total_gasto
FROM pagamentos
GROUP BY usuario_id
HAVING SUM(valor) > 1000
ORDER BY total_gasto DESC;

SELECT status, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY status
HAVING COUNT(*) > 5
ORDER BY total_pedidos DESC;

SELECT * FROM itens_pedido;

SELECT usuario_id, MAX(valor) AS total_gasto
FROM pagamentos
GROUP BY usuario_id
ORDER BY total_gasto DESC;

SELECT metodo, SUM(valor) AS total_gasto
FROM pagamentos
GROUP BY metodo
ORDER BY total_gasto DESC;


SELECT status, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY status
ORDER BY total_pedidos DESC;

-- Produtos do mais caro para o mais barato
SELECT id, nome, preco
FROM produtos
ORDER BY preco DESC;

-- Usuários ordenados por data de criação (mais recente primeiro)
SELECT id, nome, email, data_criacao
FROM usuarios
ORDER BY data_criacao DESC;

-- Estados distintos dos endereços (3 primeiros)
SELECT DISTINCT estado AS estado_cliente
FROM enderecos
LIMIT 3;

-- Nomes distintos de usuários (10 primeiros)
SELECT DISTINCT nome AS cliente
FROM usuarios
LIMIT 10;

-- Listar todos os pagamentos
SELECT * FROM pagamentos;

-- Filtrar pagamentos por status 
SELECT * FROM pagamentos WHERE status = 'Aguardando';