-- Apagar Banco de Dados db_quitanda

DROP DATABASE db_quitanda;
 
-- Recriar o Banco de dados db_quitanda

CREATE DATABASE db_quitanda;
 
-- Selecionar o Banco de Dados db_quitanda

USE db_quitanda;
 
-- Criar a tabela tb_categorias

CREATE TABLE tb_categorias(

id bigint AUTO_INCREMENT,

descricao varchar(255) NOT NULL,

PRIMARY KEY (id)

);
 
-- Insere dados na tabela tb_categorias

INSERT INTO tb_categorias (descricao)

VALUES ("Frutas");
 
INSERT INTO tb_categorias (descricao)

VALUES ("Verduras");
 
INSERT INTO tb_categorias (descricao)

VALUES ("Legumes");
 
INSERT INTO tb_categorias (descricao)

VALUES ("Temperos");
 
 
INSERT INTO tb_categorias (descricao)

VALUES ("Ovos");
 
INSERT INTO tb_categorias (descricao)

VALUES ("outros");
 
-- Lista todos os dados da tabela tb_categorias

SELECT * FROM tb_categorias;
 
-- Criar a Tabela tb_produtos

CREATE TABLE tb_produtos(

id bigint AUTO_INCREMENT,

nome varchar(255) NOT NULL,

quantidade int, 

dtvalidade date NULL,

preco decimal(6, 2),

categoria_id bigint, 

PRIMARY KEY (id),

FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)

);
 
-- Insere dados na tabela tb_produtos

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)

VALUES ("Maçã", 1000, "2022-03-07", 1.99, 1);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)

VALUES ("Banana", 1300, "2022-03-08", 5.00, 1);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)

VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)

VALUES ("Alface", 300, "2022-03-10", 7.00, 2);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)

VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);
 
INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)

VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);
 
INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)

VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);
 
INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)

VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)

VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)

VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)

VALUES ("Manga", 200, "2022-03-07", 5.49, 1);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)

VALUES ("Laranja", 3000, "2022-03-13", 10.00, 1);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)

VALUES ("Couve", 100, "2022-03-12", 1.50, 2);
 
INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)

VALUES("Tomate", 1105, "2022-03-15", 3.00, 3);
 
INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)

VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);
 
INSERT INTO tb_produtos(nome, quantidade, preco)

VALUES("Sacola Cinza", 1118, 0.50);
 
INSERT INTO tb_produtos(nome, quantidade, preco)

VALUES("Sacola Verde", 1118, 0.50);
 
-- Visualiza todos os dados da tabela tb_produtos

SELECT * FROM tb_produtos;

-- Ordenação através do alfabeto
 SELECT*FROM tb_produtos ORDER BY nome;
-- Ordenação descrescente através do alfabeto 
 SELECT*FROM tb_produtos ORDER BY nome DESC;
 -- Ordenação crescente nomes e preços
 SELECT*FROM tb_produtos ORDER BY nome, preco;
 -- Apresentação de produtos que estão entre os preços R$5.00 e R$15.00
 SELECT*FROM tb_produtos WHERE preco BETWEEN 5 AND 15;
 -- Apresentação de produtos que tem o valor de R$5.00, R$10.00 e R$15.00
 SELECT*FROM tb_produtos WHERE preco IN (5,10,15);
 

-- Agora utilizaremos o LIKE que só funciona com texto (varchar)
 -- Aparece somente os produtos que começam com as letras Ra
 SELECT*FROM tb_produtos WHERE nome LIKE 'RA%';
 -- Aparece somente os produtos que possuem as letras ra
 SELECT*FROM tb_produtos WHERE nome LIKE '%RA%';
 -- Aparece somente os produtos que terminam com as letras ra
 SELECT*FROM tb_produtos WHERE nome LIKE '%RA';
 SELECT*FROM tb_produtos WHERE nome LIKE '%ovo%';
 
 -- COLLATION
 -- ai - Ignora acentuação do texto
 -- ci - Ignora formatação do texto, se a letra está em maiúsculo ou minúsculo
 -- Caso esteja as ou cs exige acentuação/maiúsculo e minúsculo --
 SELECT @@collation_database;
 
 -- Contas
 -- Somar todos os produtos
 SELECT sum(preco) as soma FROM tb_produtos;
 -- Média de preço dos produtos
 SELECT avg(preco) as media FROM tb_produtos;
 -- Contagem
 -- Contagem de linhas da tabela
 SELECT count(*) as contar FROM tb_produtos;
 -- Contagem de categoria_id. Não vai contar os atributos que não tem valor de categoria (sacolas)
 SELECT count(categoria_id) as contar FROM tb_produtos;
 -- Valor máximo e mínimo
 SELECT max(preco) as maior_preco FROM tb_produtos;
 SELECT min(preco) as menor_preco FROM tb_produtos;
 
 -- JOIN
 -- Inner Join Traz tudo o que tem conexão com a chave estrangeira
 SELECT*FROM tb_produtos INNER JOIN tb_categorias
 -- Compara a chave estrangeira com a primária e se bater, mostra o resultado, senão, fica vazio.
 ON tb_produtos.categoria_id=tb_categorias.id;
 
-- WHERE tb_produtos.categoria_id=2;
 
 -- LEFT JOIN Traz tudo o que tem conexão com a chave estrangeira e o que não tem também (sacola)
 SELECT*FROM tb_produtos LEFT JOIN tb_categorias
 -- Compara a chave estrangeira com a primária e se bater, mostra o resultado, senão, fica vazio.
 ON tb_produtos.categoria_id=tb_categorias.id;
 
 -- RIGHT JOIN Traz o que não está classificado na chave estrangeira (na descrição aparece "Outros")
SELECT*FROM tb_produtos RIGHT JOIN tb_categorias
 -- Compara a chave estrangeira com a primária e se bater, mostra o resultado, senão, fica vazio.
 ON tb_produtos.categoria_id=tb_categorias.id;
 
 -- Fornece a informação descrição-categoria e faz a média do preço de cada categoria.
 SELECT tb_categorias.descricao, avg(preco) as preco_medio
 FROM tb_produtos INNER JOIN tb_categorias
 ON tb_produtos.categoria_id=tb_categorias.id
 -- Agrupa todas as frutas de cada categoria e fazer a média do preço
 GROUP BY tb_categorias.descricao
 -- Traz as categorias cujo o preço médio seja maior que 5
 HAVING preco_medio >5;