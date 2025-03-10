-- Criação da tabela Mecanicos
CREATE TABLE Mecanicos (
    idMecanico INT PRIMARY KEY,
    nome VARCHAR(120),
    endereco VARCHAR(255),
    especialidade VARCHAR(100)
);

-- Criação da tabela Clientes
CREATE TABLE Clientes (
    idCliente INT PRIMARY KEY,
    nome VARCHAR(120),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Criação da tabela Veiculos
CREATE TABLE Veiculos (
    idVeiculo INT PRIMARY KEY,
    idCliente INT,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

-- Criação da tabela OrdensDeServico
CREATE TABLE OrdensDeServico (
    idOS INT PRIMARY KEY,
    idVeiculo INT,
    dataEmissao DATE,
    dataConclusao DATE,
    status VARCHAR(50),
    FOREIGN KEY (idVeiculo) REFERENCES Veiculos(idVeiculo)
);

-- Criação da tabela Servicos
CREATE TABLE Servicos (
    idServico INT PRIMARY KEY,
    descricao VARCHAR(255),
    valor DECIMAL(10, 2)
);

-- Criação da tabela Pecas
CREATE TABLE Pecas (
    idPeca INT PRIMARY KEY,
    nome VARCHAR(120),
    valor DECIMAL(10, 2)
);

-- Criação da tabela OS_Servicos (tabela de junção entre OrdensDeServico e Servicos)
CREATE TABLE OS_Servicos (
    idOS INT,
    idServico INT,
    PRIMARY KEY (idOS, idServico),
    FOREIGN KEY (idOS) REFERENCES OrdensDeServico(idOS),
    FOREIGN KEY (idServico) REFERENCES Servicos(idServico)
);

-- Criação da tabela OS_Pecas (tabela de junção entre OrdensDeServico e Pecas)
CREATE TABLE OS_Pecas (
    idOS INT,
    idPeca INT,
    quantidade INT,
    PRIMARY KEY (idOS, idPeca),
    FOREIGN KEY (idOS) REFERENCES OrdensDeServico(idOS),
    FOREIGN KEY (idPeca) REFERENCES Pecas(idPeca)
);

-- Adicionando a coluna idMecanico à tabela OrdensDeServico
ALTER TABLE OrdensDeServico ADD idMecanico INT;

-- Adicionando a chave estrangeira para idMecanico na tabela OrdensDeServico
ALTER TABLE OrdensDeServico ADD FOREIGN KEY (idMecanico) REFERENCES Mecanicos(idMecanico);