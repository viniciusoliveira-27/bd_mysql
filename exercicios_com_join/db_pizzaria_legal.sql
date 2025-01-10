-- 1 - Criando DB de pizzaria
CREATE DATABASE db_pizzaria_legal;

-- DROP DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;


-- Criar a tabela tb_categorias

CREATE TABLE tb_categorias (
id bigint auto_increment primary key,
categoria_pizza varchar(255) not null,
descricao_pizza varchar(500) not null
);

-- Insere dados na tabela tb_categorias

INSERT INTO tb_categorias (categoria_pizza, descricao_pizza)
VALUES 	("Salgada", "Pizza grande de 8 pedaços com recheio salgado"),
		("Doce", "Pizza grande de 8 pedaços com recheio Doce"),
        ("Vegetariana", "Pizza grande de 8 pedaços com recheio vegetariano"),
        ("Vegana", "Pizza grande de 8 pedaços com recheio vegano"),
        ("Meio a meio", "Pizza grande de 8 pedaços com dois sabores a escolha");
        
SELECT*FROM tb_categorias;

        
        
-- Criar a tabela tb_pizzas 

CREATE TABLE tb_pizzas   (
id bigint auto_increment primary key,
sabor varchar(255) not null,
ingredientes varchar(500) not null,
preco decimal (6,2) not null,
categoria_pizza_id bigint not null,
FOREIGN KEY (categoria_pizza_id) REFERENCES tb_categorias(id)
);

-- Insere dados na tabela tb_pizzas 

INSERT INTO tb_pizzas  (sabor, ingredientes,  preco, categoria_pizza_id)
VALUES 	("Atum", "Molho de tomate, Atum e Cebola", 45.00, 1 ),
		("Calabresa", "Molho de tomate, calabresa e Cebola roxa", 35.00, 1 ),
        ("Mussarela", "Molho de tomate, Mussarela e Azeitona", 40.00, 3 ),
        ("Palmito", "Molho de tomate, Palmito, mussarela de castanha de caju e cebola", 55.00, 4 ),
        ("Brocolis", "Molho de tomate, brocolis, mussarela e cebola", 50.00, 3 ),
        ("Nutella", "Nutella e raspas de chocolate", 70.00, 2 ),
        ("Meia Calabresa Meia Mussarela", "Molho de tomate, metade calabresa com cebola, metade mussarela com azeitona", 37.50, 5 ),
        ("Prestigio", "Molho de tomate, Atum e Cebola", 65.00, 2 );
        
SELECT*FROM tb_pizzas;

SELECT 	sabor,
		ingredientes,
        CONCAT('R$', FORMAT(preco, 2, 'pt_BR')) AS Preço,
        categoria_pizza_id 
        FROM tb_pizzas
WHERE preco >= 45;

SELECT 	sabor,
		ingredientes,
        CONCAT('R$', FORMAT(preco, 2, 'pt_BR')) AS Preço,
        categoria_pizza_id 
        FROM tb_pizzas
WHERE preco BETWEEN 50 AND 100;

SELECT*FROM tb_pizzas WHERE sabor LIKE '%M%';
 
  -- JOIN
 SELECT*FROM tb_pizzas pizza INNER JOIN tb_categorias cat
 ON pizza.categoria_pizza_id = cat.id;
 
SELECT*FROM tb_pizzas pizza INNER JOIN tb_categorias cat
 ON pizza.categoria_pizza_id = cat.id
 WHERE cat.categoria_pizza = "Doce";
 
SELECT 	sabor,
		ingredientes,
        CONCAT('R$', FORMAT(preco, 2, 'pt_BR')) AS Preço,
        descricao_pizza,
        categoria_pizza,
        categoria_pizza_id        
        FROM tb_pizzas pizza INNER JOIN tb_categorias cat
ON pizza.categoria_pizza_id = cat.id
WHERE cat.categoria_pizza = "Salgada";