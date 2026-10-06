CREATE TABLE `disciplina` (
    `id` INT PRIMARY KEY,
    `nome` VARCHAR(100),
    `ano/semestre` INT,
    `cargahoraria` INT
);

CREATE TABLE `trabalho` (
    `id` INT PRIMARY KEY,
    `titulo` VARCHAR(50),
    `arquivo` CHAR,
    `dataentrega` DATE,
    `nota` FLOAT,
    `iddisciplina` INT,
    FOREIGN KEY (`iddisciplina`) REFERENCES `disciplina`(`id`)
);

CREATE TABLE `autor` (
    `matricula` INT PRIMARY KEY,
    `nome` VARCHAR(100),
    `email` VARCHAR(100)
);

CREATE TABLE `trabalhoautor` (
    `idtrabalho` INT,
    `matriculaautor` INT,
    FOREIGN KEY (`idtrabalho`) REFERENCES `trabalho`(`id`),
    FOREIGN KEY (`matriculaautor`) REFERENCES `autor`(`matricula`)
);