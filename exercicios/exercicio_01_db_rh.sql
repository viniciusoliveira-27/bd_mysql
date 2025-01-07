
-- 1 - Criando DB de RH
CREATE DATABASE db_rh;

-- DROP TABLE tb_colaboradores;

USE db_rh;

-- 2 criando tabela colaboradores

 CREATE TABLE tb_colaboradores(
	id bigint auto_increment primary key,
    nome varchar(255) not null,
    salario decimal(8,2) not null,
    data_inicio date not null,
    funcao varchar(255) not null
 );
 
 -- 3 Inserindo 5 dados na tabela
 INSERT INTO tb_colaboradores (nome, salario, data_inicio, funcao)
 VALUES ("Vinicius Ribeiro", 5500, "2025-03-27", "Desenvolvedor Java Junior"),
		("Bruno Oliveira", 5000, "2024-01-20", "PO"),
        ("Wilson Marçal", 4500, "2024-03-7", "Programador CNC"),
        ("Tobias Thor", 150, "2024-03-7", "Mascote"),
        ("Beatriz Steavnev", 6000, "2022-07-31", "Supervisora");
        
SELECT * FROM tb_colaboradores;

SELECT * FROM tb_colaboradores WHERE salario > 2000;

SELECT * FROM tb_colaboradores WHERE salario < 2000;

UPDATE tb_colaboradores SET salario = 350 WHERE id = 4;