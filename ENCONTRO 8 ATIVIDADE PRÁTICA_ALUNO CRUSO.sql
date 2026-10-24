-- Acessar/ Setar o BD
USE DB_T05072B_BIANCA_ALVES;

-- Tabela de alunos
CREATE TABLE TB_ALUNO (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    curso VARCHAR(50) NOT NULL
);

-- Inserir dados em alunos
INSERT INTO TB_ALUNO (nome, sobrenome, curso)
VALUES
	('Bianca Cristina', 'Alves', 'Engenharia de Produção'),
    ('Jamily Aparecida', 'Prazeres', 'Ciências Biológicas'),
	('Ana Carolina', 'Silva', 'Ciências Biológicas'),
	('Jessyca', 'Palma', 'Farmácia'),
    ('Douglas', 'Paula', 'Engenharia Química');

-- Tabela de professor
CREATE TABLE TB_PROFESSOR (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome_professor VARCHAR(100) NOT NULL,
    curso VARCHAR(100) NOT NULL
);

-- Inserir dados em professor
INSERT INTO TB_PROFESSOR (nome_professor, curso)
VALUES
	('Gabriel Cotrim', 'Engenharia de Produção'),
    ('Ricardo Mendonça', 'Ciências Biológicas'),
	('Aline de Souza', 'Ciências Biológicas'),
	('Bruno Natali', 'Farmácia'),
    ('Paulo Sena', 'Engenharia Química');

-- Tabela de comentário
CREATE TABLE TB_COMENTARIO (
    id__comentario INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno_comentario INT,
    id_professor_comentario INT,
    comentario TEXT,
    notadoprofessor DECIMAL(3, 1),
    
    FOREIGN KEY (id_aluno_comentario) REFERENCES TB_ALUNO(id_aluno),
    FOREIGN KEY (id_professor_comentario) REFERENCES TB_PROFESSOR(id_professor)
);

-- Inserir dados em comentarios
INSERT INTO TB_COMENTARIO (
    id_aluno_comentario,
    id_professor_comentario,
    comentario,
    notadoprofessor
)
VALUES
    (1, 1, 'Excelente, continue assim! Parabéns', 10.0),
    (2, 2, 'Está no caminho certo', 7.2),
    (3, 3, 'Muito Bom', 8.3),
    (4, 4, 'Recuperação', 5.7),
    (5, 5, 'Parabéns!', 7.0);
    
-- 1. Listar todos os alunos e seus cursos
SELECT * FROM TB_ALUNO;
    
-- 2. Lista todos os professores e cursos que lecionam
SELECT * FROM TB_PROFESSOR;

-- 3. Listar comentários com nota abaixo de 6.0
SELECT
    id_professor_comentario AS ID_Professor,
    comentario AS Comentario,
    notadoprofessor AS Nota
FROM TB_COMENTARIO
WHERE notadoprofessor < 6.0;

-- 4. Listar comentários com nota acima de 6.0
SELECT
    id_professor_comentario AS ID_Professor,
    comentario AS Comentario,
    notadoprofessor AS Nota
FROM TB_COMENTARIO
WHERE notadoprofessor > 6.0;
    
    
    
    
-- Deletar duplicatas    
DELETE FROM TB_COMENTARIO;
-- tabela comentarios
SELECT * FROM TB_COMENTARIO;