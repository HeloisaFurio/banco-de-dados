--01
SELECT * FROM `Animais`;

--02
SELECT `nome`, `email`, `cidade` FROM `Tutores`;

--03
SELECT `nome`, `especialidade` FROM `Veterinarios`;

--04
SELECT `motivo`, `custo` FROM `Consultas`;

--05
SELECT * FROM `Animais` WHERE `especie` = 'Gato';

--06
SELECT `nome`, `peso_kg` FROM `Animais` WHERE `peso_kg` > '20';

--07
SELECT * FROM `Consultas` WHERE `custo` = '150,00';

--08
SELECT `nome`, `dtNascimento` FROM `Animais` WHERE `dtNascimento` >= '2022-01-01';

--09
SELECT `nome`, `raca` FROM `Animais` WHERE `raca` != 'Labrador';

--10
SELECT * FROM `Animais` WHERE `especie` = 'Cachorro' AND `peso_kg` < '10';

--11
SELECT * FROM `Consultas` WHERE `dtConsulta` BETWEEN '2025-01-01' AND '2025-12-31' AND `custo` > '180';

--12
SELECT * FROM `Animais` WHERE `especie` = 'Cachorro' OR `especie` = 'Gato';

--13
SELECT * FROM `Tutores` WHERE `cidade` = 'São Paulo' OR `cidade` = 'Rio de Janeiro';

--14
SELECT * FROM `Animais` WHERE (`especie` = 'Cachorro' AND `peso_kg` > '30') OR (`especie` = 'Gato' AND `peso_kg` < '5');

--15
SELECT `nome`, `telefone` FROM `Tutores` WHERE `nome` LIKE 'A%';

--16
SELECT `nome`, `raca` FROM `Animais` WHERE `raca` LIKE '%Retriever%';

--17
SELECT `nome`, `email`, `cidade` FROM `Tutores` WHERE `cidade` IN ('Belo Horizonte', 'Florianópolis', 'Porto Alegre');

--18
--Não foi explicado

--19
SELECT * FROM `Animais` WHERE `obs` IS NULL;

--20
SELECT * FROM `Consultas` WHERE `diagnostico` IS NOT NULL;