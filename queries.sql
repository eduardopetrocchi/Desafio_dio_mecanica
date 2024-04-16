SELECT 
    Nome, Especialidade
FROM
    mecanico;

-- Mecânico que trabalhou no modelo espeficicado 
SELECT 
    m.Nome, m.Especialidade
FROM
    mecanico m
        INNER JOIN
    ordemServico os ON m.idMecanico = os.IdMecanico
        INNER JOIN
    veiculo v ON os.idOrdemServico = v.idVeiculo
WHERE
    v.Modelo = 'Gol';

-- Servicos não completados
SELECT 
    os.idOrdemServico,
    os.DataEmissao,
    os.ValorTotal,
    os.StatusServico
FROM
    ordemServico os
WHERE
    os.StatusServico <> 'Concluído';

-- Total de despesas de cada cliente
SELECT 
    c.Nome, SUM(os.ValorTotal) AS TotalCost
FROM
    cliente c
        INNER JOIN
    veiculo v ON c.idCliente = v.idVeiculo
        INNER JOIN
    ordemServico os ON v.idOrdemServico = os.idOrdemServico
GROUP BY c.Nome;

-- Total de serviços completos por mecânico 
SELECT 
    m.Nome, m.Especialidade, COUNT(*) AS CompletedOrders
FROM
    mecanico m
        INNER JOIN
    ordemServico os ON m.idMecanico = os.IdMecanico
WHERE
    os.StatusServico = 'Concluído'
GROUP BY m.Nome , m.Especialidade
ORDER BY CompletedOrders DESC;

-- Serviços concluídos
SELECT 
    ordemServico.*,
    cliente.Nome AS ClienteNome,
    endereco.Logradouro AS EnderecoLogradouro,
    endereco.Bairro AS EnderecoBairro,
    endereco.Cidade_UF AS EnderecoCidadeUF,
    endereco.CEP AS EnderecoCEP
FROM
    ordemServico
        JOIN
    mecanico ON ordemServico.IdMecanico = mecanico.idMecanico
        JOIN
    cliente ON ordemServico.idVeiculo = cliente.idVeiculo
        JOIN
    endereco ON cliente.idEndereco = endereco.idEndereco
WHERE
    ordemServico.StatusServico = 'Concluído';

-- Serviços em andamento para determinado cliente
SELECT 
    c.Nome,
    c.idCliente,
    os.idOrdemServico,
    os.DataEmissao,
    os.ValorTotal,
    os.StatusServico
FROM
    ordemServico os
        JOIN
    cliente c ON os.idVeiculo = c.idVeiculo
WHERE
    os.StatusServico <> 'Concluído'
        AND c.idCliente = 1;

-- Total de serviços por modelo
SELECT 
    v.Modelo, COUNT(*) AS TotalCompletedServices
FROM
    veiculo v
        JOIN
    ordemServico os ON v.idOrdemServico = os.idOrdemServico
WHERE
    os.StatusServico = 'Concluído'
GROUP BY v.Modelo;

