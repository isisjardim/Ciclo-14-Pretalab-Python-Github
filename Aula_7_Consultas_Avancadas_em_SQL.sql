-- 1. Criando tabelas
CREATE TABLE filmes (
    id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    genero TEXT NOT NULL,
    ano INTEGER
);

CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT
);

CREATE TABLE avaliacoes (
    id INTEGER PRIMARY KEY,
    filme_id INTEGER,
    usuario_id INTEGER,
    nota INTEGER,
    comentario TEXT,
    FOREIGN KEY (filme_id) REFERENCES filmes(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- 2. Inserindo 20 filmes
INSERT INTO filmes (id, titulo, genero, ano) VALUES
(1, 'Inception', 'Ação', 2010),
(2, 'Toy Story 3', 'Animação', 2010),
(3, 'Gladiador', 'Ação', 2000),
(4, 'Matrix', 'Ficção', 1999),
(5, 'Titanic', 'Drama', 1997),
(6, 'O Rei Leão', 'Animação', 1994),
(7, 'Avatar', 'Ficção', 2009),
(8, 'Vingadores: Ultimato', 'Ação', 2019),
(9, 'Forrest Gump', 'Drama', 1994),
(10, 'Coringa', 'Drama', 2019),
(11, 'Divertida Mente', 'Animação', 2015),
(12, 'Shrek', 'Animação', 2001),
(13, 'Se Beber, Não Case!', 'Comédia', 2009),
(14, 'Superbad', 'Comédia', 2007),
(15, 'O Poderoso Chefão', 'Drama', 1972),
(16, 'Interestelar', 'Ficção', 2014),
(17, 'Homem-Aranha: Sem Volta para Casa', 'Ação', 2021),
(18, 'Frozen', 'Animação', 2013),
(19, 'Up: Altas Aventuras', 'Animação', 2009),
(20, 'Pantera Negra', 'Ação', 2018);

-- 3. Inserindo 10 usuários
INSERT INTO usuarios (id, nome, email) VALUES
(1, 'Ana', 'ana@email.com'),
(2, 'Bruno', 'bruno@email.com'),
(3, 'Carla', 'carla@email.com'),
(4, 'Daniel', 'daniel@email.com'),
(5, 'Elisa', 'elisa@email.com'),
(6, 'Felipe', 'felipe@email.com'),
(7, 'Gabriela', 'gabriela@email.com'),
(8, 'Henrique', 'henrique@email.com'),
(9, 'Isabela', 'isabela@email.com'),
(10, 'João', 'joao@email.com');

-- 4. Inserindo 20 avaliações (cada uma ligada a um usuário)
INSERT INTO avaliacoes (id, filme_id, usuario_id, nota, comentario) VALUES
(101, 1, 1, 5, 'Excelente, gostei!'),
(102, 1, 2, 4, 'Bom, mas confuso'),
(103, 2, 3, 5, 'Maravilhoso!'),
(104, 2, 4, 3, 'Legal, mas não é meu favorito'),
(105, 5, 5, 5, 'Clássico emocionante'),
(106, 6, 6, 4, 'Muito bom, nostálgico'),
(107, 7, 7, 5, 'Visual incrível'),
(108, 8, 8, 5, 'O melhor filme de super-heróis'),
(109, 8, 9, 4, 'Muito bom, mas longo'),
(110, 9, 10, 5, 'Inspirador e emocionante'),
(111, 10, 1, 5, 'Atuação brilhante'),
(112, 11, 2, 4, 'Animação divertida'),
(113, 12, 3, 3, 'Engraçado, mas meio repetitivo'),
(114, 13, 4, 4, 'Comédia leve e boa'),
(115, 15, 5, 2, 'Obra-prima do cinema'),
(116, 16, 6, 2, 'Fenomenal e profundo'),
(117, 17, 7, 2, 'Muito bom, ótimo entretenimento'),
(118, 20, 8, 4, 'Herói inspirador');


-- Pratica 5
-- Consulte as avaliações, classificando-as em: “Ótima” (nota = 5), “Boa” (nota entre 3 e 4), “Ruim” (nota < 3)

SELECT nota,
	CASE
    	WHEN nota = 5 THEN 'Ótima'
        WHEN nota BETWEEN 3 AND 4 THEN 'Boa'
		ELSE 'Ruim'
    END AS classificacao
FROM avaliacoes
ORDER BY nota DESC;

-- Pratica 4
-- Calcule quantos filmes Classicos, Modernos e Atuais existem na tabelas filmes. Considere Classico antes de 1900, Moderno de 1900 a 2010, e atual após 2010
SELECT 
   CASE
       WHEN ano < 1900 THEN 'Clássico'
       WHEN ano BETWEEN 1900 AND 2010 THEN 'Moderno'
       ELSE 'Atual'
   END AS periodo,
   COUNT(*)
FROM filmes
GROUP BY periodo;


SELECT 
   SUM(CASE WHEN ano < 1900 THEN 1 ELSE 0 END) AS classicos,
   SUM(CASE WHEN ano BETWEEN 1900 AND 2010 THEN 1 ELSE 0 END) AS modernos,
   SUM(CASE WHEN ano > 2010 THEN 1 ELSE 0 END) AS atuais
FROM filmes;


-- Exemplo 3
SELECT 
   SUM(CASE WHEN nota = 5 THEN 1 ELSE 0 END) AS otimas,
   SUM(CASE WHEN nota < 3 THEN 1 ELSE 0 END) AS ruins
FROM avaliacoes;

-- Exemplo 2
SELECT titulo, ano,
   CASE
       WHEN ano < 1900 THEN 'Clássico'
       WHEN ano BETWEEN 1900 AND 2010 THEN 'Moderno'
       ELSE 'Atual'
   END AS periodo
FROM filmes;
