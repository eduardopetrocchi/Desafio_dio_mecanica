# Banco de Dados - Mecânico

Este repositório contém o script de criação do banco de dados Mecânico e uma série de consultas SQL para extrair informações relevantes sobre mecânicos, ordens de serviço, clientes, veículos e serviços.

## Tabelas

### Endereço

A tabela Endereço armazena informações sobre os endereços dos clientes e mecânicos. As colunas são:

- `idEndereco`: Chave primária autoincrementada
- `Logradouro`: Nome da rua
- `Bairro`: Nome do bairro
- `Cidade_UF`: Nome da cidade e UF separados por um underscore
- `CEP`: CEP do endereço

### Mecânico

A tabela Mecânico armazena informações sobre os mecânicos. As colunas são:

- `idMecanico`: Chave primária autoincrementada
- `Nome`: Nome do mecânico
- `Especialidade`: Especialidade do mecânico
- `idEndereco`: Chave estrangeira que referencia a tabela Endereço

### Ordem de Serviço

A tabela Ordem de Serviço armazena informações sobre as ordens de serviço dos veículos. As colunas são:

- `idOrdemServico`: Chave primária autoincrementada
- `DataEmissao`: Data de emissão da ordem de serviço
- `ValorTotal`: Valor total da ordem de serviço
- `StatusServico`: Status da ordem de serviço
- `DataConclusao`: Data de conclusão da ordem de serviço
- `IdMecanico`: Chave estrangeira que referencia a tabela Mecânico
- `idVeiculo`: Chave estrangeira que referencia a tabela Veículo

### Veículo

A tabela Veículo armazena informações sobre os veículos dos clientes. As colunas são:

- `idVeiculo`: Chave primária autoincrementada
- `Placa`: Placa do veículo
- `Modelo`: Modelo do veículo
- `Ano`: Ano do veículo
- `Quilometragem`: Quilometragem do veículo
- `idOrdemServico`: Chave estrangeira que referencia a tabela Ordem de Serviço

### Serviço

A tabela Serviço armazena informações sobre os serviços oferecidos pelos mecânicos. As colunas são:

- `idServico`: Chave primária autoincrementada
- `Descricao`: Descrição do serviço
- `Valor`: Valor do serviço

### Peça

A tabela Peça armazena informações sobre as peças utilizadas nos serviços. As colunas são:

- `idPeca`: Chave primária autoincrementada
- `Descricao`: Descrição da peça
- `Quantidade`: Quantidade da peça
- `Valor`: Valor da peça

### Cliente

A tabela Cliente armazena informações sobre os clientes. As colunas são:

- `idCliente`: Chave primária autoincrementada
- `Nome`: Nome do cliente
- `CPF`: CPF do cliente
- `Telefone`: Telefone do cliente
- `idVeiculo`: Chave estrangeira que referencia a tabela Veículo
- `idEndereco`: Chave estrangeira que referencia a tabela Endereço

### Ordem Serviço Cliente

A tabela Ordem Serviço Cliente armazena informações sobre os serviços realizados em cada ordem de serviço para cada cliente. As colunas são:

- `ordemServicoCliente`: Chave primária autoincrementada
- `idServico`: Chave estrangeira que referencia a tabela Serviço
- `idCliente`: Chave estrangeira que referencia a tabela Cliente

## Queries SQL

Aqui estão algumas consultas SQL para extrair informações do banco de dados Mecânico:

1. **Listar Nome e Especialidade dos Mecânicos:**
   ```sql
   SELECT Nome, Especialidade
   FROM mecanico;
   ```

2. **Mecânico que Trabalhou em um Modelo Específico:**
   ```sql
   SELECT m.Nome, m.Especialidade
   FROM mecanico m
   INNER JOIN ordemServico os ON m.idMecanico = os.IdMecanico
   INNER JOIN veiculo v ON os.idOrdemServico = v.idVeiculo
   WHERE v.Modelo = 'Gol';
   ```

3. **Serviços Não Concluídos:**
   ```sql
   SELECT idOrdemServico, DataEmissao, ValorTotal, StatusServico
   FROM ordemServico
   WHERE StatusServico <> 'Concluído';
   ```

4. **Total de Despesas de Cada Cliente:**
   ```sql
   SELECT c.Nome, SUM(os.ValorTotal) AS TotalCost
   FROM cliente c
   INNER JOIN veiculo v ON c.idCliente = v.idVeiculo
   INNER JOIN ordemServico os ON v.idOrdemServico = os.idOrdemServico
   GROUP BY c.Nome;
   ```

5. **Total de Serviços Completos por Mecânico:**
   ```sql
   SELECT m.Nome, m.Especialidade, COUNT(*) AS CompletedOrders
   FROM mecanico m
   INNER JOIN ordemServico os ON m.idMecanico = os.IdMecanico
   WHERE os.StatusServico = 'Concluído'
   GROUP BY m.Nome, m.Especialidade
   ORDER BY CompletedOrders DESC;
   ```

6. **Serviços Concluídos com Detalhes do Cliente:**
   ```sql
   SELECT ordemServico.*, cliente.Nome AS ClienteNome, endereco.Logradouro AS EnderecoLogradouro, endereco.Bairro AS EnderecoBairro, endereco.Cidade_UF AS EnderecoCidadeUF, endereco.CEP AS EnderecoCEP
   FROM ordemServico
   JOIN mecanico ON ordemServico.IdMecanico = mecanico.idMecanico
   JOIN cliente ON ordemServico.idVeiculo = cliente.idVeiculo
   JOIN endereco ON cliente.idEndereco = endereco.idEndereco
   WHERE ordemServico.StatusServico = 'Concluído';
   ```

7. **Serviços em Andamento para um Cliente Específico:**
   ```sql
   SELECT c.Nome, c.idCliente, os.idOrdemServico, os.DataEmissao, os.ValorTotal, os.StatusServico
   FROM ordemServico os
   JOIN cliente c ON os.idVeiculo = c.idVeiculo
   WHERE os.StatusServico <> 'Concluído' AND c.idCliente = 1;
  
## Autores

- [@eduardopetrocchi](https://www.github.com/eduardopetrocchi)

