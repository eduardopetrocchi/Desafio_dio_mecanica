use mecanico;

CREATE TABLE endereco (
    idEndereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Logradouro VARCHAR(50),
    Bairro VARCHAR(30),
    Cidade_UF VARCHAR(30),
    CEP VARCHAR(9)
);

CREATE TABLE mecanico (
    idMecanico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45),
    Especialidade VARCHAR(45),
    CONSTRAINT fk_mecanico_endereco FOREIGN KEY (idMecanico)
        REFERENCES endereco (idEndereco)
);

CREATE TABLE ordemServico (
    idOrdemServico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DataEmissao DATE,
    ValorTotal FLOAT,
    StatusServico VARCHAR(45),
    DataConclusao DATE,
    IdMecanico INT NOT NULL,
    CONSTRAINT fk_os_mecanico FOREIGN KEY (IdMecanico)
        REFERENCES mecanico (idmecanico)
);

ALTER TABLE ordemservico ADD idVeiculo INT NOT NULL;
ALTER TABLE ordemServico ADD CONSTRAINT fk_os_cliente FOREIGN KEY (idVeiculo) REFERENCES veiculo(idVeiculo);


CREATE TABLE veiculo (
    idVeiculo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Placa VARCHAR(10),
    Modelo VARCHAR(30),
    Ano INT,
    Quilometragem FLOAT(2),
    idOrdemServico INT NOT NULL,
    CONSTRAINT fk_veiculo_os FOREIGN KEY (idordemServico)
        REFERENCES ordemServico (idOrdemServico)
);

CREATE TABLE servico (
    idServico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(50),
    Valor FLOAT(2)
);

CREATE TABLE peca (
    idPeca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(50),
    Quantidade INT,
    Valor FLOAT(2)
);


CREATE TABLE cliente (
    idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30),
    CPF INT NOT NULL,
    Telefone VARCHAR(10) NOT NULL,
    idVeiculo INT NOT NULL,
    idEndereco INT NOT NULL,
    CONSTRAINT fk_cliente_veiculo FOREIGN KEY (idVeiculo)
        REFERENCES veiculo (idVeiculo),
    CONSTRAINT fk_cliente_endereco FOREIGN KEY (idEndereco)
        REFERENCES endereco (idEndereco)
);


CREATE TABLE ordemServicoCliente (
    ordemServicoCliente INT NOT NULL,
    idServico INT NOT NULL,
    idCliente INT NOT NULL
);