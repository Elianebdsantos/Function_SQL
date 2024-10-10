USE bd_biblioteca;

SELECT * FROM tb_autores;
SELECT * FROM tb_emprestimos;
SELECT * FROM tb_livros;
SELECT * FROM tb_membros;

-- Exercicio 1. Crie uma função que recebe o id_autor e retorna a idade do autor com base na data de nascimento.

DELIMITER $$
CREATE FUNCTION idade_autor(p_id_autor INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE idade INT;
SELECT TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) INTO idade
FROM tb_autores
WHERE id_autor = p_id_autor;
RETURN idade;
END$$

DELIMITER ;


SELECT idade_autor(2);

ALTER TABLE tb_autores DROP COLUMN idade;

-- Exercicio 2. Crie uma função que recebe o id_autor e retorna a quantidade de livros escritos por esse autor.
DELIMITER $$
CREATE FUNCTION Qtd_livros_autor(id_autor INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE total_livros INT;
SELECT COUNT(*) INTO total_livros
FROM tb_livros
WHERE tb_livros.id_autor = id_autor;
RETURN total_livros;
END$$

DELIMITER ;

SELECT Qtd_livros_autor(1);

-- Exercicio 3. Crie uma função que recebe duas datas e retorna o total de empréstimos realizados nesse período.

DELIMITER $$

CREATE FUNCTION total_emprestimos(data_inicio DATE, data_fim DATE)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE total_emprestimos INT;
SELECT COUNT(*) INTO total_emprestimos
FROM tb_emprestimos
WHERE data_emprestimo BETWEEN data_inicio AND data_fim;
RETURN total_emprestimos;
END$$

DELIMITER ;

SELECT total_emprestimos('2022-10-09','2024-10-01');

-- Exercicio 4. Crie uma função que retorna a média de dias em que os livros foram emprestados.
DELIMITER $$
CREATE FUNCTION media_dias_emprestimo()
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE media_dias DECIMAL(10,2);
    SELECT AVG(DATEDIFF(data_devolucao, data_emprestimo)) INTO media_dias
    FROM tb_emprestimos;
    RETURN media_dias;
END$$

DELIMITER ;

SELECT media_dias_emprestimo();

