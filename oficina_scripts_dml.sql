-- 1. Quais são os nomes e especialidades de todos os mecânicos?
SELECT nome, especialidade FROM Mecanicos;

-- 2. Quais clientes possuem veículos da marca "Fiat"?
SELECT DISTINCT Clientes.nome
FROM Clientes
INNER JOIN Veiculos ON Clientes.idCliente = Veiculos.idCliente
WHERE Veiculos.marca = 'Fiat';

-- 3. Qual é o status e a data de conclusão das ordens de serviço para o veículo com idVeiculo = 1?
SELECT status, dataConclusao
FROM OrdensDeServico
WHERE idVeiculo = 1;

-- 4. Quais serviços têm um valor superior a 75.00?
SELECT descricao, valor
FROM Servicos
WHERE valor > 75.00;

-- 5. Quais peças estão associadas à ordem de serviço com idOS = 1 e qual a quantidade utilizada?
SELECT Pecas.nome, OS_Pecas.quantidade
FROM Pecas
INNER JOIN OS_Pecas ON Pecas.idPeca = OS_Pecas.idPeca
WHERE OS_Pecas.idOS = 1;

-- 6. Qual é o número total de serviços concluídos por cada mecânico?
SELECT Mecanicos.nome, COUNT(OrdensDeServico.idOS) AS totalServicosConcluidos
FROM Mecanicos
LEFT JOIN OrdensDeServico ON Mecanicos.idMecanico = OrdensDeServico.idMecanico
WHERE OrdensDeServico.status = 'Concluída'
GROUP BY Mecanicos.nome;

-- 7. Qual é o valor total gasto em peças na ordem de serviço com idOS = 2?
SELECT SUM(Pecas.valor * OS_Pecas.quantidade) AS valorTotalPecas
FROM Pecas
INNER JOIN OS_Pecas ON Pecas.idPeca = OS_Pecas.idPeca
WHERE OS_Pecas.idOS = 2;

-- 8. Quais são os nomes dos clientes que possuem tanto veículos da marca "Fiat" quanto da marca "Volkswagen"?
SELECT Clientes.nome
FROM Clientes
INNER JOIN Veiculos ON Clientes.idCliente = Veiculos.idCliente
WHERE Veiculos.marca = 'Fiat'
INTERSECT
SELECT Clientes.nome
FROM Clientes
INNER JOIN Veiculos ON Clientes.idCliente = Veiculos.idCliente
WHERE Veiculos.marca = 'Volkswagen';

-- 9. Quais mecânicos nunca realizaram um serviço?
SELECT Mecanicos.nome
FROM Mecanicos
LEFT JOIN OrdensDeServico ON Mecanicos.idMecanico = OrdensDeServico.idMecanico
WHERE OrdensDeServico.idOS IS NULL;

-- 10. Quais são os detalhes dos veículos e seus respectivos clientes, juntamente com o status da ordem de serviço mais recente?
SELECT
    Veiculos.marca,
    Veiculos.modelo,
    Clientes.nome AS nomeCliente,
    Clientes.telefone,
    OrdensDeServico.status AS statusOrdemServico
FROM
    Veiculos
INNER JOIN
    Clientes ON Veiculos.idCliente = Clientes.idCliente
LEFT JOIN
    OrdensDeServico ON Veiculos.idVeiculo = OrdensDeServico.idVeiculo
ORDER BY
    OrdensDeServico.dataEmissao DESC;