---Correção Exercicios

CREATE TABLE FORNECEDOR(
    FCODIGO INTEGER PRIMARY KEY,
    FNOME VARCHAR(50) NOT NULL,
    STATUS VARCHAR(10) DEFAULT 'ATIVO',
    CIDADE VARCHAR(20)
);

SELECT * FROM FORNECEDOR;

CREATE TABLE PECA(
    PCODIGO INTEGER PRIMARY KEY,
    PNOME VARCHAR(50) NOT NULL,
    COR VARCHAR(10) NOT NULL,
    PESO NUMERIC(7,2) NOT NULL,
    CIDADE VARCHAR(20) NOT NULL
);

SELECT * FROM PECA;

CREATE TABLE INSTITUCAO(
    ICODIGO INTEGER PRIMARY KEY,
    INOME VARCHAR(50) NOT NULL
);

SELECT * FROM INSTITUCAO;

CREATE TABLE PROJETOS(
    PRCODIGO INTEGER PRIMARY KEY,
    PRNOME VARCHAR(50) NOT NULL,
    PRCIDADE VARCHAR(20) NOT NULL,
    ICODIGO INTEGER,
    FOREIGN KEY (ICODIGO) REFERENCES INSTITUCAO
);

SELECT * FROM PROJETOS;

CREATE TABLE FORNECIMENTO(
    ID SERIAL PRIMARY KEY,
    FCODIGO INTEGER,
    PCODIGO INTEGER,
    PRCODIGO INTEGER,
    QUANTIDADE INTEGER,
    FOREIGN KEY(FCODIGO) REFERENCES FORNECEDOR,
    FOREIGN KEY(PCODIGO) REFERENCES PECA,
    FOREIGN KEY(PRCODIGO) REFERENCES PROJETOS
);

SELECT * FROM FORNECIMENTO;
