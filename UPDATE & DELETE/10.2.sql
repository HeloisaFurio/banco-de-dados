-- 1

update `cliente`
set `telefone`='48998765432'
where `cpf`='111.111.111-11';

-- 2 

update `empregado`
set `cargo`='Desenvolvedor Sênior'
where `cpf`= '333.333.333-33';

-- 3

delete from `projEmp`
where `codProj` = 3;

delete from `projeto`
where `codProj` = 3;

delete from `cliente`
where `cpf` = '555.555.555-55';

-- 4
update `projeto`
set `preco`=`preco`*1.1;

-- 5

delete from `projEmp`
where `codProj`=2 and `cpfEmpregado`='333.333.333-33';

-- 6

update `projeto`
set `descricao` = concat('PROJETO LEGADO - ', `descricao`)
where `dtSolicitacao`<'2025-09-15';

-- 7

update `projEmp`
set `hrTrab` = `hrTrab`+15
where `cpfEmpregado` = '666.666.666-66' and `codProj`=3;

-- 8

delete from `projeto`
where `preco` < 6000;

-- 9

update `projeto`
set `dtEstimada` = DATE_ADD(`dtEstimada`, INTERVAL 7 DAY)
where `cpfGerente` = '444.444.444-44';

-- 10

delete from `empregado`
where `cpf`= '999.999.999-99';

-- 11

update `empregado`
set `cargo`= 'Gerente de Projetos'
where `cpf`= '333.333.333-33';

update `projeto`
set `cpfGerente` = '333.333.333-33'
where `cpfGerente` = '222.222.222-22';

-- 12

delete from `projeto`
where `dtFim`< current_date() 
and `cpfCliente` <> '111.111.111-11';