INSERT INTO endereco (Logradouro, Bairro, Cidade_UF, CEP) VALUES
('Rua das Flores', 'Centro', 'São Paulo/SP', '01001-000'),
('Avenida das Palmeiras', 'Jardim Botânico', 'Rio de Janeiro/RJ', '20000-000'),
('Rua dos Girassóis', 'Jardim Primavera', 'Curitiba/PR', '80000-000'),
('Avenida dos Ipês', 'Vila das Acácias', 'Belo Horizonte/MG', '30000-000'),
('Rua das Margaridas', 'Loteamento dos Cravos', 'Porto Alegre/RS', '90000-000'),
('Travessa das Violetas', 'Bairro dos Lírios', 'Brasília/DF', '70000-000'),
('Avenida das Orquídeas', 'Parque das Hortênsias', 'Salvador/BA', '40000-000'),
('Rua dos Lírios', 'Jardim das Rosas', 'Recife/PE', '50000-000'),
('Avenida das Tulipas', 'Vila das Margaridas', 'Fortaleza/CE', '60000-000'),
('Rua das Azaleias', 'Bairro dos Crisântemos', 'Manaus/AM', '69000-000');


INSERT INTO mecanico (Nome, Especialidade) VALUES
('João Silva', 'Motor e Transmissão'),
('Maria Santos', 'Sistema de Freios'),
('Pedro Oliveira', 'Suspensão e Direção'),
('Ana Souza', 'Sistema Elétrico'),
('Lucas Pereira', 'Ar Condicionado'),
('Mariana Costa', 'Injeção Eletrônica'),
('Carlos Martins', 'Sistema de Escape'),
('Juliana Ferreira', 'Diagnóstico de Falhas'),
('Felipe Rodrigues', 'Alinhamento e Balanceamento'),
('Amanda Almeida', 'Manutenção Geral');


INSERT INTO ordemServico (DataEmissao, ValorTotal, StatusServico, DataConclusao, IdMecanico) VALUES
('2023-01-05', 250.00, 'Em andamento', NULL, 1),
('2023-02-10', 350.00, 'Concluído', '2023-02-15', 2),
('2023-03-18', 180.00, 'Em andamento', NULL, 3),
('2023-04-22', 420.00, 'Concluído', '2023-04-28', 4),
('2023-05-09', 300.00, 'Em andamento', NULL, 5),
('2023-06-15', 150.00, 'Concluído', '2023-06-20', 6),
('2023-07-20', 200.00, 'Em andamento', NULL, 7),
('2023-08-25', 280.00, 'Concluído', '2023-08-30', 8),
('2023-09-30', 400.00, 'Em andamento', NULL, 9),
('2023-10-10', 180.00, 'Concluído', '2023-10-15', 10);

UPDATE ordemservico
SET idVeiculo = 10
WHERE idOrdemServico = 10;


INSERT INTO veiculo (Placa, Modelo, Ano, Quilometragem, idOrdemServico) VALUES
('ABC1234', 'Gol', 2019, 25000.50, 1),
('DEF5678', 'Uno', 2015, 40000.75, 2),
('GHI9101', 'Palio', 2018, 30000.25, 3),
('JKL2345', 'Civic', 2017, 45000.80, 4),
('MNO6789', 'Corolla', 2020, 20000.30, 5),
('PQR1234', 'Fiesta', 2016, 35000.40, 6),
('STU5678', 'HB20', 2019, 27000.60, 7),
('VWX9101', 'Onix', 2019, 32000.20, 8),
('YZA2345', 'Fox', 2017, 28000.70, 9),
('BCD6789', 'Celta', 2015, 38000.35, 10);

INSERT INTO servico (Descricao, Valor) VALUES
('Troca de óleo', 100.00),
('Alinhamento e balanceamento', 150.00),
('Revisão completa', 300.00),
('Troca de pneus', 200.00),
('Limpeza de ar-condicionado', 80.00),
('Troca de correia dentada', 250.00),
('Substituição de amortecedores', 350.00),
('Troca de filtros', 120.00),
('Reparo de freios', 180.00),
('Serviço de elétrica', 200.00);

INSERT INTO peca (Descricao, Quantidade, Valor) VALUES
('Pastilhas de freio', 4, 120.00),
('Filtro de ar', 2, 50.00),
('Velas de ignição', 4, 80.00),
('Amortecedor dianteiro', 2, 300.00),
('Correia do alternador', 1, 80.00),
('Sensor de temperatura', 1, 60.00),
('Jogo de velas', 6, 120.00),
('Jogo de cabos de ignição', 1, 100.00),
('Disco de freio', 2, 180.00),
('Bateria', 1, 250.00);

INSERT INTO cliente (Nome, CPF, Telefone, idVeiculo, idEndereco) VALUES
('João Silva', 12345678901, '999999999', 1, 1),
('Maria Oliveira', 98765432109, '888888888', 2, 2),
('Pedro Santos', 45678912302, '777777777', 3, 3),
('Ana Souza', 78945612303, '666666666', 4, 4),
('Carlos Pereira', 32165498704, '555555555', 5, 5),
('Juliana Costa', 65498732105, '444444444', 6, 6),
('Fernando Lima', 98732165406, '333333333', 7, 7),
('Luiza Martins', 15975346807, '222222222', 8, 8),
('Rafaela Almeida', 35715945608, '111111111', 9, 9),
('Marcos Ferreira', 24681357910, '000000000', 10, 10);

INSERT INTO ordemServicoCliente (ordemServicoCliente, idServico, idCliente) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);
