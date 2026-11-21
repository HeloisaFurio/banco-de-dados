-- BANCO DE DADOS: NEP
-- NUCLEO DE ESTUDOS POLITICOS
-- =====================================================

DROP DATABASE IF EXISTS `nep`;

CREATE DATABASE `nep`;

USE `nep`;

-- =====================================================

CREATE TABLE `usuario` (
    `id_usuario` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `senha` VARCHAR(255) NOT NULL,
    `tipo_usuario` VARCHAR(20) NOT NULL
);

-- =====================================================

CREATE TABLE `turma` (
    `id_turma` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(50) NOT NULL,
    `ano` INT NOT NULL,
    `descricao` TEXT
);

-- =====================================================

CREATE TABLE `administrador` (
    `id_administrador` INT AUTO_INCREMENT PRIMARY KEY,
    `id_usuario` INT NOT NULL UNIQUE,

    FOREIGN KEY (`id_usuario`)
    REFERENCES `usuario` (`id_usuario`)
);

-- =====================================================

CREATE TABLE `aluno` (
    `id_aluno` INT AUTO_INCREMENT PRIMARY KEY,
    `id_usuario` INT NOT NULL UNIQUE,
    `id_turma` INT NOT NULL,
    `data_cadastro` DATE NOT NULL,
    `status_cadastro` VARCHAR(20) NOT NULL DEFAULT 'pendente',
    `id_administrador` INT NULL,

    FOREIGN KEY (`id_usuario`)
    REFERENCES `usuario` (`id_usuario`),

    FOREIGN KEY (`id_turma`)
    REFERENCES `turma` (`id_turma`),

    FOREIGN KEY (`id_administrador`)
    REFERENCES `administrador` (`id_administrador`)
);

-- =====================================================

CREATE TABLE `professor` (
    `id_professor` INT AUTO_INCREMENT PRIMARY KEY,
    `id_usuario` INT NOT NULL UNIQUE,
    `area_atuacao` VARCHAR(100),
    `data_cadastro` DATE NOT NULL,
    `status_cadastro` VARCHAR(20) NOT NULL DEFAULT 'pendente',
    `id_administrador` INT NULL,

    FOREIGN KEY (`id_usuario`)
    REFERENCES `usuario` (`id_usuario`),

    FOREIGN KEY (`id_administrador`)
    REFERENCES `administrador` (`id_administrador`)
);

-- =====================================================

CREATE TABLE `aula` (
    `id_aula` INT AUTO_INCREMENT PRIMARY KEY,
    `titulo` VARCHAR(100) NOT NULL,
    `descricao` TEXT,
    `data` DATE,
    `id_professor` INT NOT NULL,
    `id_turma` INT NOT NULL,

    FOREIGN KEY (`id_professor`)
    REFERENCES `professor` (`id_professor`),

    FOREIGN KEY (`id_turma`)
    REFERENCES `turma` (`id_turma`)
);

-- =====================================================

CREATE TABLE `conteudo` (
    `id_conteudo` INT AUTO_INCREMENT PRIMARY KEY,
    `titulo` VARCHAR(100) NOT NULL,
    `descricao` TEXT,
    `material` TEXT,
    `id_aula` INT NOT NULL,
    FOREIGN KEY (`id_aula`)
    REFERENCES `aula` (`id_aula`)
);

-- =====================================================

CREATE TABLE `resumo` (
    `id_resumo` INT AUTO_INCREMENT PRIMARY KEY,
    `titulo` VARCHAR(100) NOT NULL,
    `descricao` TEXT,
    `texto` TEXT NOT NULL
);

-- =====================================================

INSERT INTO `usuario`
(`nome`, `email`, `senha`, `tipo_usuario`)
VALUES
('Heloisa Furio', 'heloisa@gmail.com', '1410', 'administrador'),
('Ana Souza', 'ana@email.com', 'senha123', 'aluno'),
('Pedro Lima', 'pedro@email.com', 'senha123', 'aluno'),
('Mariana Costa', 'mariana@email.com', 'senha123', 'aluno'),
('Joao Ferreira', 'joao@nep.com', 'senha123', 'professor'),
('Juliana Martins', 'juliana@nep.com', 'senha123', 'professor');

-- =====================================================

INSERT INTO `turma`
(`nome`, `ano`, `descricao`)
VALUES
('Turma NEP 2026', 2026, 'Turma principal do Nucleo de Estudos Politicos.');

-- =====================================================

INSERT INTO `administrador`
(`id_usuario`)
VALUES
(1);

-- =====================================================

INSERT INTO `aluno`
(`id_usuario`, `id_turma`, `data_cadastro`, `status_cadastro`, `id_administrador`)
VALUES
(2, 1, '2026-03-10', 'aprovado', 1),
(3, 1, '2026-03-12', 'aprovado', 1),
(4, 1, '2026-03-15', 'pendente', NULL);

-- =====================================================

INSERT INTO `professor`
(`id_usuario`, `area_atuacao`, `data_cadastro`, `status_cadastro`, `id_administrador`)
VALUES
(5, 'Ciencia Politica', '2026-03-05', 'aprovado', 1),
(6, 'Sociologia', '2026-03-08', 'aprovado', 1);

-- =====================================================

INSERT INTO `aula`
(`titulo`, `descricao`, `data`, `id_professor`, `id_turma`)
VALUES
('Introducao a Politica', 'Conceitos basicos sobre politica e sociedade.', '2026-04-10', 1, 1),

('Democracia e Cidadania', 'Estudo sobre democracia e participacao popular.', '2026-04-17', 1, 1),

('Introducao a Sociologia', 'Estudo das relacoes e estruturas sociais.', '2026-04-24', 2, 1);

-- =====================================================

INSERT INTO `conteudo`
(`titulo`, `descricao`, `material`, `id_aula`)
VALUES
('O que e poletica?', 'Introducao ao conceito de politica.', 'Material de estudo sobre politica e sociedade.', 1),

('Sistemas de governo', 'Apresentacao dos principais sistemas de governo.', 'Material sobre presidencialismo e parlamentarismo.', 1),

('Democracia', 'Conceitos e caracteristicas da democracia.', 'Material sobre os principios democraticos.', 2),

('Desigualdade social', 'Estudo das desigualdades presentes na sociedade.', 'Material introdutorio sobre desigualdade social.', 3);

-- =====================================================

INSERT INTO `resumo`
(`titulo`, `descricao`, `texto`)
VALUES
('O que e democracia?', 'Resumo introdutorio sobre democracia.',
'A democracia e uma forma de organizacao politica baseada na participacao popular e na representacao dos cidadaos.'),

('O que e cidadania?', 'Resumo sobre direitos e deveres dos cidadaos.',
'A cidadania envolve o exercicio de direitos e deveres e a participacao dos individuos na sociedade.'),

('O que e politica?', 'Resumo introdutorio sobre politica.',
'A politica esta relacionada a organizacao da sociedade, as decisoes coletivas e as relacoes de poder.');

-- =====================================================
-- SELECT

-- 1. Consultar todos os usuários:
SELECT * FROM `usuario`;

-- 2. Consultar alunos e suas respectivas turmas:
SELECT `usuario`.`nome`, `usuario`.`email`, `turma`.`nome` AS `turma`, `aluno`.`status_cadastro` FROM `aluno`
JOIN `usuario`
    ON `aluno`.`id_usuario` = `usuario`.`id_usuario`
JOIN `turma`
    ON `aluno`.`id_turma` = `turma`.`id_turma`;

-- 3. Consultar aulas e seus professores:
SELECT `aula`.`titulo` AS `aula`, `usuario`.`nome` AS `professor`, `turma`.`nome` AS `turma` FROM `aula`
JOIN `professor`
    ON `aula`.`id_professor` = `professor`.`id_professor`
JOIN `usuario`
    ON `professor`.`id_usuario` = `usuario`.`id_usuario`
JOIN `turma`
    ON `aula`.`id_turma` = `turma`.`id_turma`;

-- 4. Consultar os conteúdos de cada aula:
SELECT `conteudo`.`titulo` AS `conteudo`, `aula`.`titulo` AS `aula` FROM `conteudo`
JOIN `aula`
    ON `conteudo`.`id_aula` = `aula`.`id_aula`;

-- 5. Consultar os resumos disponíveis:
SELECT * FROM `resumo`;

-- 6. Consultar somente os alunos com cadastro aprovado:
SELECT `usuario`.`nome`, `usuario`.`email`, `aluno`.`status_cadastro` FROM `aluno`
INNER JOIN `usuario`
    ON `aluno`.`id_usuario` = `usuario`.`id_usuario` WHERE `aluno`.`status_cadastro` = 'aprovado';

-- 7. Consultar os professores em ordem alfabética:
SELECT `usuario`.`nome`, `professor`.`area_atuacao` FROM `usuario`
RIGHT JOIN `professor`
    ON `usuario`.`id_usuario` = `professor`.`id_usuario` ORDER BY `usuario`.`nome` ASC;

-- 8. Consultar todas as aulas e a quantidade de conteúdos de cada uma:
SELECT `aula`.`titulo`, COUNT(`conteudo`.`id_conteudo`) AS `quantidade_conteudos` FROM `aula`
LEFT JOIN `conteudo`
    ON `aula`.`id_aula` = `conteudo`.`id_aula`
GROUP BY `aula`.`id_aula`, `aula`.`titulo`;

-- 9. Consultar os cadastros de alunos que ainda não foram analisados:
SELECT `usuario`.`nome`, `usuario`.`email`, `usuario`.`tipo_usuario`, `aluno`.`status_cadastro` FROM `aluno`
LEFT JOIN `administrador`
    ON `aluno`.`id_administrador` = `administrador`.`id_administrador`
JOIN `usuario`
    ON `aluno`.`id_usuario` = `usuario`.`id_usuario` WHERE `administrador`.`id_administrador` IS NULL;

-- 10. Consultar aulas e seus respectivos professores:
SELECT `aula`.`titulo` AS `aula`, `aula`.`data`, `usuario`.`nome` AS `professor`, `professor`.`area_atuacao` FROM `professor`
RIGHT JOIN `aula`
    ON `professor`.`id_professor` = `aula`.`id_professor`
JOIN `usuario`
    ON `professor`.`id_usuario` = `usuario`.`id_usuario` ORDER BY `aula`.`data` ASC;
