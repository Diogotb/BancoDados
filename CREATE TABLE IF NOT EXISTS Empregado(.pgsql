CREATE TABLE IF NOT EXISTS Empregado(
    Ecodigo INT NOT NULL,
    Enome VARCHAR(40) NOT NULL,
    CPF VARCHAR(15) NOT NULL,
    Salario DECIMAL(7,2),
    Dcodigo INT NOT NULL,
    PRIMARY KEY(Ecodigo,Enome),
    FOREIGN KEY(Dcodigo) REFERENCES Departamento   
);

--Alterar Tabelas com o ALTER TABLE 

--Add coluna (adicionar)
ALTER TABLE Empregado ADD sexo CHAR(1);

--Drop Coluna (remover)
ALTER TABLE Empregado DROP sexo;

--Renomear Tabela 
ALTER TABLE Empregado RENAME TO Funcionario;

--ALTER TABLE tabela ALTER COLUMN campo nome tipo_dado;
-- ALTER TABLE Fornecedor ALTER COLUMN status TYPE INT ativo TYPE BOOLEAN;