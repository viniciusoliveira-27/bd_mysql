-- 1 - Criando DB de Games
CREATE DATABASE db_generation_game_online;

-- DROP DATABASE db_generation_game_online;

USE db_generation_game_online;


-- Criar a tabela tb_classes

CREATE TABLE tb_classes (
id bigint auto_increment primary key,
classe varchar(255) not null,
descricao varchar(500) not null
);

-- Insere dados na tabela tb_classes

INSERT INTO tb_classes (classe, descricao)
VALUES 	("Barbaro", "Classe de Barbaro, que foca em força e agilidade"),
		("Paladino", "Classe de paladino, que foca em Honra e Força"),
        ("Mago", "Classe de mago, que foca em magia e poder"),
        ("Bardo", "Classe de bardo, que foca em magia e agilidade"),
        ("Ladino", "Classe de ladino, que foca em ataque furtivo e trapaceiro arcano"),
        ("Druida", "Classe de druida, que foca em magia de transformação e magia de druida");
        
-- Criar a tabela tb_personagens

CREATE TABLE tb_personagens  (
id bigint auto_increment primary key,
nome varchar(255) not null,
poder_ataque bigint not null,
poder_defesa bigint not null,
classe_id bigint not null,
FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

-- Insere dados na tabela tb_personagens

INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, classe_id)
VALUES 	("Hercules", 8000, 5000, 1),
		("Lancelot", 3200, 1200, 2),
        ("Gandalf", 1500, 5000, 3),
        ("O Trovador", 1900, 3000, 4),
        ("Vax'ildan",4000, 1700, 5),
        ("Ruff Ghanor", 7000, 5000, 1),
        ("Feldon", 2500, 3000, 6),
        ("Ruprest",3500, 2500, 5);
        
SELECT*FROM tb_personagens;

SELECT*FROM tb_personagens WHERE poder_ataque >= 2000;

SELECT*FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT*FROM tb_personagens WHERE nome LIKE '%C%';
 
  -- JOIN
 SELECT*FROM tb_personagens p INNER JOIN tb_classes c
 ON p.classe_id=c.id;
 
SELECT*FROM tb_personagens p INNER JOIN tb_classes c
 ON p.classe_id=c.id
 WHERE c.classe = "Barbaro";

 
 
 
 

