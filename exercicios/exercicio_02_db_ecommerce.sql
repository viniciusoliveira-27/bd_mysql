-- 1 - Criando DB de RH
CREATE DATABASE db_ecommerce;

-- DROP TABLE db_ecommerce;

USE db_ecommerce;

-- 2 criando tabela produtos

 CREATE TABLE tb_produtos(
	id bigint auto_increment primary key,
    nome varchar(255) not null,
    quantidade int not null,
    data_fabricacao date,
    preco decimal (8,2)
 );
 -- 3 Inserindo 8 dados na tabela
INSERT INTO tb_produtos (nome, quantidade, data_fabricacao, preco)
 VALUES ("Playstation 5", 6, "2022-02-10", 4000),
		("XBox Series X", 20, "2022-01-20", 3500),
        ("Nintendo switch", 15, "2022-03-7", 2000),
		("Pc gamer", 10, "2024-01-20", 4000),
        ("Playstation 4", 4, "2020-03-7", 2000),
		("Xbox One", 11, "2020-01-20", 1500),
        ("Nintendo Wii", 3, "2017-03-7", 400),
        ("Notebook Gamer", 17, "2023-02-02", 3750);
        
        
SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 500;

SELECT * FROM tb_produtos WHERE preco < 500;

UPDATE tb_produtos SET preco = 350 WHERE id = 7;