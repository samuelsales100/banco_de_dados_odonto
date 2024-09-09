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

/* Esta consulta mostra todos os tratamentos,realizados,junto com os procedimento e o custo total de cada procedimento,
*/
SELECT
t.tratamento_id,
t.descricao AS Tratamento_Descricao,
p.nome AS procedimento_nome,
tp.quantidade,
pr.custo,
(tp.quantidade * pr.custo) AS custo_total
FROM
   Tratamento t
INNER JOIN
    Tratamento_Procedimento tp ON t.tratamento_id = tp.tratamento_id
INNER JOIN 
Procedimento pr ON tp.procedimento_id = pr.procedimento_id;

/*
 Esta consulta fornece informacoes sobre os pagamentos efetuados, incluindo o valor, a data do pagamento e a descricao do tratamento associado.
*/
SELECT
    p.pagamento_id,
    t.descricao AS tratamento_descricao
    p.valor AS valor_pago,
    p.data_pagamento
FROM
   pagamento p
insert join
   Tratamento t ON p.tratamento_id = t.tratamento_id;