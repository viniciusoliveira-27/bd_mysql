CREATE DATABASE db_escola;

-- DROP TABLE tb_alunos;

USE db_escola;

CREATE TABLE tb_alunos (

id bigint auto_increment primary key, 
nome varchar (150) not null, 
nota int not null,
data_entrada date,
periodo varchar (100) 

);

 -- 3 Inserindo 8 dados na tabela
INSERT INTO tb_alunos (nome, nota, data_entrada, periodo)
 VALUES ("Vinicius Ribeiro", 10, "2012-03-27", "Vespertino"),
		("Bruno Oliveira", 5, "2015-01-20", "Matutino"),
        ("Wilson Marçal", 5, "2014-03-7", "Vespertino"),
        ("Pedro Sampaio", 3, "2015-03-7", "Matutino"),
        ("Memphis Depay", 8, "2012-03-7", "Noturno"),
        ("Lebron James", 4, "2013-03-7", "Vespertino"),
        ("Tobias Thor", 9, "2018-03-7", "Noturno"),
        ("Beatriz Steavnev", 10, "2017-07-31", "Noturno");
        

SELECT * FROM tb_alunos;
        
SELECT * FROM tb_alunos WHERE nota > 7;

SELECT * FROM tb_alunos WHERE nota < 7;

UPDATE tb_alunos SET periodo = "Vespertino" WHERE id = 8;