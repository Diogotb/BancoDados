-- BANCO DE DADOS
CREATE DATABASE BD_EX01;

SELECT DATABASE();

-- TABELAS
CREATE TABLE TBL_FORNECEDOR(
FCODIGO INT NOT NULL,
FNOME VARCHAR(50) NOT NULL,
FSTATUS VARCHAR(10) NOT NULL DEFAULT 'ATIVO',
FCIDADE VARCHAR(50) NOT NULL,
PRIMARY KEY (FCODIGO)
);

CREATE TABLE TBL_PECA(
PCODIGO INT NOT NULL,
PNOME VARCHAR(30) NOT NULL,
PCOR VARCHAR(30) NOT NULL,
PESO DOUBLE NOT NULL,
PCIDADE VARCHAR(30) NOT NULL,
PRIMARY KEY (PCODIGO)
); 

CREATE TABLE TBL_INSTITUICAO(
ICODIGO INT NOT NULL,
INOME VARCHAR(30) NOT NULL,
PRIMARY KEY (ICODIGO)
);

CREATE TABLE TBL_PROJETO(
PRCODIGO INT NOT NULL,
PRNOME VARCHAR(30) NOT NULL,
CIDADE VARCHAR(30) NOT NULL,
ICODIGO INT NOT NULL,
PRIMARY KEY (PRCODIGO),
FOREIGN KEY (ICODIGO) REFERENCES TBL_INSTITUICAO(ICODIGO)
);

CREATE TABLE TBL_FORNECIMENTO(
FCODIGO INT NOT NULL,
PCODIGO INT NOT NULL,
PRCODIGO INT NOT NULL,
QTDE INT NOT NULL,
PRIMARY KEY (FCODIGO, PCODIGO, PRCODIGO),
FOREIGN KEY (FCODIGO) REFERENCES TBL_FORNECEDOR(FCODIGO),
FOREIGN KEY (PCODIGO) REFERENCES TBL_PECA(PCODIGO),
FOREIGN KEY (PRCODIGO) REFERENCES TBL_PROJETO(PRCODIGO)
);