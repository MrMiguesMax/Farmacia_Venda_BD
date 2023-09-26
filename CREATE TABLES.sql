CREATE DATABASE banco_modelo01;

USE banco_modelo01;

CREATE TABLE fabricante (
    codigo_fabricante INT CHECK(codigo_fabricante >= 0),
    nome_fabricante VARCHAR(35) NOT NULL,
    razao_social VARCHAR(100) NOT NULL,
    email_fabricante VARCHAR(35) NOT NULL,
    CONSTRAINT pk_fabricante PRIMARY KEY (codigo_fabricante)
);

CREATE TABLE cliente (
    cpf_cliente INT NOT NULL,
    nome_cliente VARCHAR(35) NOT NULL,
    data_nascimento DATE NOT NULL, 
    email_cliente VARCHAR(35) NOT NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (cpf_cliente)
);

CREATE TABLE medicamento (
    nome_medicamento VARCHAR(35) NOT NULL,
    data_validade DATE NOT NULL,
    codigo_medicamento INT CHECK (codigo_medicamento >= 0),
    codigo_fabricante INT CHECK(codigo_fabricante >= 0),
    CONSTRAINT pk_medicamento PRIMARY KEY (codigo_medicamento),
    CONSTRAINT fk_fabricante_medicamento FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo_fabricante) ON DELETE CASCADE
);

CREATE TABLE venda (
	codigo_venda INT CHECK (codigo_venda >= 0),
	data_venda DATE NOT NULL,
	cpf_cliente INT NOT NULL,
    quantidade INT CHECK (quantidade > 0),
    codigo_medicamento INT CHECK (codigo_medicamento >= 0),
    CONSTRAINT fk_cliente_venda FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente) ON DELETE CASCADE,
	CONSTRAINT fk_medicamento_venda FOREIGN KEY (codigo_medicamento) REFERENCES medicamento(codigo_medicamento) ON DELETE CASCADE
);

CREATE TABLE cliente_endereco (
	estado VARCHAR(25) NOT NULL,
    cidade VARCHAR(25) NOT NULL,
    bairro VARCHAR(25) NOT NULL,
    rua VARCHAR(25) NOT NULL,
    numero INT CHECK (numero > 0),
    cep INT NOT NULL,
    cpf_cliente INT NOT NULL,
    CONSTRAINT fk_cliente_cliente_endereco FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente) ON DELETE CASCADE
);

CREATE TABLE cliente_telefone (
	telefone_celular VARCHAR(13) NOT NULL,
    telefone_residencial VARCHAR(13) NOT NULL,
    telefone_comercial VARCHAR(13) NOT NULL,
     cpf_cliente INT NOT NULL,
    CONSTRAINT fk_cliente_cliente_telefone FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente) ON DELETE CASCADE
);