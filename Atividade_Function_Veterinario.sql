USE bd_clinicavetbd;
-- Exercicio 1. Crie uma função que receba o id_cliente e retorne a quantidade de pets que esse cliente possui.

DELIMITER $$
CREATE FUNCTION QtdPetsCliente(id_cliente INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE total_pets INT;
SELECT COUNT(*) INTO total_pets
FROM tb_pets
WHERE tb_pets.id_cliente = id_cliente;
RETURN total_pets;
END$$

DELIMITER ;

SELECT QtdPetsCliente(1);

SELECT * FROM tb_pets;

SELECT * FROM tb_cliente;

-- Exercicio 2. Crie uma função que recebe o id_pet e retorna a data da última consulta do pet.
DELIMITER $$

CREATE FUNCTION data_ultima_consulta (id_pet INT)
RETURNS DATE
READS SQL DATA
BEGIN
DECLARE ultima_data DATE;
SELECT MAX(data_atendimento) INTO ultima_data
FROM tb_atendimentos
WHERE tb_atendimentos.id_pet = id_pet;
RETURN ultima_data;
END $$

DELIMITER ;

SELECT data_ultima_consulta(1);


-- Exercicio 3. Crie uma função que receba o id_veterinario e retorne o número total de atendimentos feitos por ele.
DELIMITER $$
CREATE FUNCTION total_atendimento_veterinario (id_veterinario INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE total_atendimentos INT;
SELECT COUNT(*) INTO total_atendimentos
FROM tb_atendimentos
WHERE tb_atendimentos.id_veterinario = id_veterinario;
RETURN total_atendimentos;
END$$

DELIMITER ;

SELECT total_atendimento_veterinario (2);

SELECT * FROM tb_atendimentos;


DELIMITER $$

CREATE FUNCTION DonoPet(id_pet INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
DECLARE nome_dono VARCHAR(100);
SELECT c.nome INTO nome_dono
FROM tb_cliente c
JOIN tb_pets p ON p.id_cliente = c.id_cliente
WHERE p.id_pet = id_pet;
RETURN nome_dono;
END$$

DELIMITER ;

SELECT DonoPet(1);


SELECT * FROM tb_pets;
SELECT * FROM tb_cliente;



