-- 1 - Criando DB de RH
CREATE DATABASE db_curso_da_minha_vida;

-- DROP DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;


-- Criar a tabela tb_categorias

CREATE TABLE tb_categorias (
id bigint auto_increment primary key,
categoria varchar(255) not null,
tipo varchar(500) not null
);

-- Insere dados na tabela tb_categorias

INSERT INTO tb_categorias (categoria, tipo)
VALUES 	("Backend", "Cursos e/ou Bootcamps voltado para Backend"),
		("Frontend", "Cursos e/ou Bootcamps voltado para Frontend"),
        ("Fullstack", "Cursos e/ou Bootcamps voltado para Fullstack"),
        ("Inteligencia artificial (IA)", "Cursos e/ou Bootcamps com foco em IA"),
        ("Graduação", "Graduação na Área de Tecnologia");
        
SELECT*FROM tb_categorias;        
        
-- Criar a tabela tb_cursos  

CREATE TABLE tb_cursos (
id bigint auto_increment primary key,
nome_curso varchar(255) not null,
empresa varchar(500) not null,
qtde_horas bigint not null,
preco decimal (6,2) not null,
categoria_id bigint not null,
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Insere dados na tabela tb_cursos  

INSERT INTO tb_cursos   (nome_curso, empresa,  qtde_horas, preco, categoria_id)
VALUES 	("Bootcamp Java", "DIO", 68, 100, 1 ),
		("Bootcamp Javascript", "Generation", 400, 0, 3 ),
        ("Curso React", "Udemy", 50, 100, 2),
        ("Java", "Udemy", 56, 27.50, 1),
        ("Ia", "DIO", 42, 200, 4 ),
        ("ADS", "UNICID", 2000, 100, 5),
        ("Typescript", "DIO", 69, 600, 3),
        ("Fundamento de IA para devs", "DIO", 45, 50, 4 );
        
SELECT*FROM tb_cursos ;

SELECT 	nome_curso,
		empresa,
        CONCAT('R$', FORMAT(preco, 2, 'pt_BR')) AS Preço,
        qtde_horas,
        categoria_id 
        FROM tb_cursos
WHERE preco >= 250;

SELECT 	nome_curso,
		empresa,
        CONCAT('R$', FORMAT(preco, 2, 'pt_BR')) AS Preço,
        qtde_horas,
        categoria_id 
        FROM tb_cursos
WHERE preco BETWEEN 0 and 100;

SELECT*FROM tb_cursos WHERE nome_curso LIKE '%J%';
 
  -- JOIN
 SELECT*FROM tb_cursos curso INNER JOIN tb_categorias cat
 ON curso.categoria_id = cat.id;
 
 SELECT*FROM tb_cursos curso INNER JOIN tb_categorias cat
 ON curso.categoria_id = cat.id
 WHERE cat.categoria = "Backend";
 
