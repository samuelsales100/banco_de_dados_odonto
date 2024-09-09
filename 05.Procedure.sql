/* Esta consulta mostra todos os tratamentos,realizados,junto com os procedimento e o custo total de cada procedimento,
*/
SELECT
t.tratamento_id,
t.descricao AS tratamento_descricao,
p.nome AS procedimento_nome,
tp.quantidade,
pr.custo,
(tp.quantidade * pr.custo) AS custo_total
FROM
   Tratamento t
INNER JOIN
    tratamento_procedimento tp ON t.tratamento_id = tp.tratamento_id
INNER JOIN 
procedimento pr ON tp.procedimento_id = pr.procedimento_id;

/*sempre que um novo procedimento é inserido na tabela Tratamento_Procedimento,
a triger atualizará o custo total do tratamento correspondente na tabela tratamento.*/

DELIMITER //
CREATE TRIGGER AtualizarCustoTratamento
AFTER INSERT ON Tratamento_Procedimento
FOR EACH ROW
BEGIN
DECLARE custo_total DECIMAL(10, 0);
    
 -- Calcula o custo total do tratamento
SELECT SUM(tp.quantidade * p.custo) INTO custo_total
FROM Tratamento_Procedimento tp
JOIN Procedimento p ON tp.procedimento_id = p.procedimento_id
WHERE tp.tratamento_id = NEW.tratamento_id;
 
-- atualiza o valor total do tratamento na tabela Tratamento
UPDATE Tratamento
SET valor_total = custo_total
WHERE tratamento_id = NEW.tratamento_id;
END//
DELIMITER ;

/*
Vamos criar uma procedure para gerar um relatorio de todas as consultas de um paciente especifico,
incluindoo informações sobre o paciente, dentista e data de consulta. Essa procedure pode ser útil para consultas rápidas de historico de atendimento de um paciente
*/
DELIMITER //
 
CREATE PROCEDURE RelatorioConsultasPaciente(IN pacienteId INT)
BEGIN
 -- Seleciona detalhes das consultas do paciente
 SELECT
	c.onsulta_id,
    P.nome AS paciente_nome,
    d.nome AS dentista_nome,
    c.data_consulta
FROM
	Consulta c
INNER JOIN
	Paciente p ON c.paciente_id = p.paciente_id
INNER JOIN
	Dentista d ON c.dentista_id = d.dentista_id
WHERE
	p.paciente_id = pacienteId;
END//

DELIMITER ;