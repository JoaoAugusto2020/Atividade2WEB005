BANCO DE DADOS - CARROS

HISTÓRICO DE TENTATIVAS:

CREATE DATABASE carros;
USE  carros;

CREATE TABLE marca (
	codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	pais VARCHAR(30) NOT NULL
);

INSERT INTO marca (nome, pais) VALUES ('Volkswagen', 'Alemanha'), ('Ford', 'EUA'), ('Fiat', 'Italia'), ('GM', 'EUA');

CREATE TABLE modelo (
	codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	categoria VARCHAR(30) NOT NULL,
	cor VARCHAR(30) NOT NULL,
	codigo_marca INT NOT NULL,
	CONSTRAINT FK_marca	FOREIGN KEY (codigo_marca) REFERENCES marca (codigo)
);
	
INSERT INTO modelo (nome, categoria, cor, codigo_marca) VALUES ('Gol', 'Hatch', 'preto', '1'), ('Palio', 'Hatch', 'vermelho', '3'), ('Ecosport', 'SUV', 'azul', '2'), ('Fox', 'Família', 'preto', '1');

/*alguma coisa deu errado, não sei o que, então vou tentar criar as tabelas e só depois usar os INSERTs */

DROP TABLE marca;
DROP TABLE modelo;

CREATE TABLE marca (
	codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	pais VARCHAR(30) NOT NULL
);

CREATE TABLE modelo (
	codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	categoria VARCHAR(30) NOT NULL,
	cor VARCHAR(30) NOT NULL,
	codigo_marca INT NOT NULL,
	CONSTRAINT FK_marca	FOREIGN KEY (codigo_marca) REFERENCES marca (codigo)
);

INSERT INTO marca (nome, pais) VALUES ('Volkswagen', 'Alemanha'), ('Ford', 'EUA'), ('Fiat', 'Italia'), ('GM', 'EUA');
INSERT INTO modelo (nome, categoria, cor, codigo_marca) VALUES ('Gol', 'Hatch', 'preto', '1'), ('Palio', 'Hatch', 'vermelho', '3'), ('Ecosport', 'SUV', 'azul', '2'), ('Fox', 'Família', 'preto', '1');

/*agora deu, não sei porque mas deu... */

UPDATE modelo SET cor = 'cinza' WHERE codigo = 4;

SELECT mar.nome, mar.pais, 
	COUNT(mo.codigo_marca) AS qtd_carros 
	FROM marca AS mar
	LEFT JOIN modelo AS mo
	ON mar.codigo = mo.codigo_marca
	GROUP BY mar.nome;

DELETE FROM marca WHERE codigo = 4;