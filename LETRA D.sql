BANCO DE DADOS - CARROS

LETRA D:

SELECT mar.nome, mar.pais, 
	COUNT(mo.codigo_marca) AS qtd_carros 
	FROM marca AS mar
	LEFT JOIN modelo AS mo
	ON mar.codigo = mo.codigo_marca
	GROUP BY mar.nome;