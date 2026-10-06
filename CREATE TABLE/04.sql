CREATE TABLE `usuario` (
    `id` INT PRIMARY KEY,
    `telefone` VARCHAR(100),
    `cidade` VARCHAR(100),
    `sexo` VARCHAR(30),
    `idade` INT,
    `nome` VARCHAR(100)
);

CREATE TABLE `foto` (
    `id` INT PRIMARY KEY,
    `arquivo` CHAR,
    `formato` VARCHAR(30),
    `idusuario` INT,
    FOREIGN KEY (`idusuario`) REFERENCES `usuario`(`id`)
);

CREATE TABLE `avalia` (
    `id` INT PRIMARY KEY,
    `avaliacao` VARCHAR(300),
    `avaliador` INT,
    `avaliado` INT,
    FOREIGN KEY (`avaliador`) REFERENCES `usuario`(`id`),
    FOREIGN KEY (`avaliado`) REFERENCES `usuario`(`id`)
);