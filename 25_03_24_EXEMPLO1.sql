CREATE DATABASE AULA_SQL;

DROP DATABASE AULA_SQL;

CREATE DATABASE DB_AULA25MAR24;

-- comando sql para criar tabela

CREATE TABLE Fornecedor(
    Fcodigo INT NOT NULL,
    Fnome VARCHAR(30) NOT NULL,
    Status INT,
    Cidade VARCHAR (30)
);

-- selecionar dados da tabela
SELECT * FROM Fornecedor;

-- CRIA A TABELA SE ELA NÃO EXISTIR
-- E SE EXISTIR NÃO ACONTECE NADA INCLUSIVE ERRO

CREATE TABLE IF NOT EXISTS Fornecedor(
    Fcodigo INT NOT NULL,
    Fnome VARCHAR(30) NOT NULL,
    Status INT,
    Cidade VARCHAR (30)
);