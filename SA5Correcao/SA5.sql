CREATE DATABASE SA5_DevNoite;

-- Tabela "Clientes"
CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Email VARCHAR(100)
);

-- Adicionar coluna "Telefone" à tabela "Clientes"
ALTER TABLE Clientes
ADD Telefone VARCHAR(20);

-- Adicionar restrição UNIQUE ao campo "Email"
ALTER TABLE Clientes
ADD CONSTRAINT UK_Email UNIQUE (Email);

-- Tabela "Pedidos"
CREATE TABLE Pedidos (
    ID INT PRIMARY KEY,
    ID_Cliente INT,
    Data_Pedido DATE,
    Total DECIMAL(10, 2)
);

-- Adicionar restrição de chave estrangeira na tabela "Pedidos"
ALTER TABLE Pedidos
ADD CONSTRAINT FK_ID_Cliente FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID);

ALTER TABLE Pedidos DROP COLUMN Status;

-- Adicionar a Coluna Staus em pedidos
ALTER TABLE Pedidos
ADD Status VARCHAR(20) 
DEFAULT 'Em Andamento'
CHECK (Status IN ('Em andamento', 'Finalizado', 'Excluído')) 
;

-- Tabela "Produtos"
CREATE TABLE Produtos (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Descricao TEXT,
    Preco DECIMAL(10, 2)
);

-- Adicionar restrição para garantir que o campo "Preço" seja positivo
ALTER TABLE Produtos
ADD CONSTRAINT CHK_Preco_Positive CHECK (Preco > 0);

-- Tabela "Categorias"
CREATE TABLE Categorias (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100)
);

-- Tabela "Pedidos_Produtos" (Tabela de junção)
CREATE TABLE Pedidos_Produtos (
    ID_Pedido INT,
    ID_Produto INT,
    PRIMARY KEY (ID_Pedido, ID_Produto)
);

-- Adicionar restrição de chave estrangeira na tabela "Pedidos_Produtos"
ALTER TABLE Pedidos_Produtos
ADD CONSTRAINT FK_ID_Pedido FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID),
ADD CONSTRAINT FK_ID_Produto FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID);

-- Tabela "Produtos_Categorias" (Tabela de junção)
CREATE TABLE Produtos_Categorias (
    ID_Produto INT,
    ID_Categoria INT,
    PRIMARY KEY (ID_Produto, ID_Categoria)
);

-- Adicionar restrição de chave estrangeira na tabela "Produtos_Categorias"
ALTER TABLE Produtos_Categorias
ADD CONSTRAINT FK_ID_Produto FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID),
ADD CONSTRAINT FK_ID_Categoria FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID);

-- Tabela "Empregados"
CREATE TABLE Empregados (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Cargo VARCHAR(20)
);

-- Adicionar restrição de verificação para garantir que o campo "Cargo" contenha apenas valores válidos
ALTER TABLE Empregados
ADD CONSTRAINT CHK_Cargo_Valido CHECK (Cargo IN ('Gerente', 'Vendedor', 'Atendente'));

-- Tabela "Vendas"
CREATE TABLE Vendas (
    ID INT PRIMARY KEY,
    ID_Produto INT,
    ID_Cliente INT,
    Data_Venda DATE,
    Quantidade INT
);

-- Adicionar restrições de chave estrangeira na tabela "Vendas"
ALTER TABLE Vendas
ADD CONSTRAINT FK_ID_Produto FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID),
ADD CONSTRAINT FK_ID_Cliente FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID);



-- DML (Data Manipulation Language) Exercício:

-- Insira cinco novos clientes na tabela "Clientes"
INSERT INTO Clientes (ID, Nome, Sobrenome, Email, Telefone) VALUES
(1, 'João', 'Silva', 'joao@example.com', '123456789'),
(2, 'Maria', 'Santos', 'maria@example.com', '987654321'),
(3, 'Carlos', 'Ferreira', 'carlos@example.com', '456123789'),
(4, 'Ana', 'Souza', 'ana@example.com', '987123654'),
(5, 'Pedro', 'Oliveira', 'pedro@example.com', '654789321');

-- Insira dez novos registros de pedidos na tabela "Pedidos", associando-os a diferentes clientes
INSERT INTO Pedidos (ID, ID_Cliente, Data_Pedido, Total) VALUES
(1, 1, '2024-04-01', 100.00),
(2, 2, '2024-04-02', 50.00),
(3, 3, '2024-04-03', 75.00),
(4, 4, '2024-04-04', 200.00),
(5, 5, '2024-04-05', 30.00),
(6, 1, '2024-04-06', 80.00),
(7, 2, '2024-04-07', 90.00),
(8, 3, '2024-04-08', 120.00),
(9, 4, '2024-04-09', 150.00),
(10, 5, '2024-04-10', 60.00);

-- Insira quinze novos produtos na tabela "Produtos"
INSERT INTO Produtos (ID, Nome, Descricao, Preco) VALUES
(1, 'Produto 1', 'Descrição do Produto 1', 50.00),
(2, 'Produto 2', 'Descrição do Produto 2', 75.00),
(3, 'Produto 3', 'Descrição do Produto 3', 100.00),
(4, 'Produto 4', 'Descrição do Produto 4', 25.00),
(5, 'Produto 5', 'Descrição do Produto 5', 150.00),
(6, 'Produto 6', 'Descrição do Produto 6', 80.00),
(7, 'Produto 7', 'Descrição do Produto 7', 90.00),
(8, 'Produto 8', 'Descrição do Produto 8', 120.00),
(9, 'Produto 9', 'Descrição do Produto 9', 150.00),
(10, 'Produto 10', 'Descrição do Produto 10', 60.00),
(11, 'Produto 11', 'Descrição do Produto 11', 45.00),
(12, 'Produto 12', 'Descrição do Produto 12', 70.00),
(13, 'Produto 13', 'Descrição do Produto 13', 110.00),
(14, 'Produto 14', 'Descrição do Produto 14', 130.00),
(15, 'Produto 15', 'Descrição do Produto 15', 55.00);

SELECT * from produtos;

INSERT into pedidos (id,id_cliente,data_pedido,total,status) values
(1,1,'2024-04-04',100.50,'Em andamento');
INSERT into pedidos (id,id_cliente,data_pedido,total,status) values
(2,1,'2024-04-05',50.50,'Em andamento');


-- Associe 3 produtos aos pedidos na tabela "Pedidos_Produtos"
INSERT INTO Pedidos_Produtos (ID_Pedido, ID_Produto) VALUES
(1, 1),
(1, 2),
(2, 3);

-- Associe 3 produtos às categorias na tabela "Produtos_Categorias"
INSERT INTO Produtos_Categorias (ID_Produto, ID_Categoria) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insira cinco registros de funcionários na tabela "Funcionários"
INSERT INTO Funcionarios (ID, Nome, Sobrenome, Cargo) VALUES
(1, 'Carlos', 'Silva', 'Gerente'),
(2, 'Ana', 'Ferreira', 'Vendedor'),
(3, 'José', 'Oliveira', 'Atendente'),
(4, 'Mariana', 'Santos', 'Vendedor'),
(5, 'Paulo', 'Gomes', 'Atendente');

-- Registre algumas vendas na tabela "Vendas", associando produtos a clientes
INSERT INTO Vendas (ID, ID_Produto, ID_Cliente, Data_Venda, Quantidade) VALUES
(1, 1, 1, '2024-04-01', 2),
(2, 2, 2, '2024-04-02', 1),
(3, 3, 3, '2024-04-03', 3),
(4, 4, 4, '2024-04-04', 1),
(5, 5, 5, '2024-04-05', 2);

-- Atualize o preço de um produto específico na tabela "Produtos"
UPDATE Produtos SET Preco = 55.00 WHERE ID = 1;

-- Atualize o cargo de um funcionário na tabela "Funcionários"
UPDATE Funcionarios SET Cargo = 'Supervisor' WHERE ID = 1;

-- Exclua um cliente da tabela "Clientes" e seus respectivos pedidos na tabela "Pedidos"

DELETE FROM Pedidos WHERE ID_Cliente = 1;
DELETE FROM Clientes WHERE ID = 1;

-- Exclua um produto da tabela "Produtos" e seus registros correspondentes na tabela "Pedidos_Produtos"

DELETE FROM Pedidos_Produtos WHERE ID_Produto = 1;
DELETE FROM Produtos WHERE ID = 1;

-- Exclua um funcionário da tabela "Funcionários"
DELETE FROM Funcionarios WHERE ID = 5;

-- Selecione todos os pedidos com status "Em andamento" na tabela "Pedidos"
SELECT * FROM Pedidos WHERE Status = 'Em andamento';

SELECT * from Pedidos;

-- Liste o nome do cliente, a data do pedido e o total de cada pedido feito nos últimos 30 dias na tabela "Pedidos"
SELECT c.Sobrenome, p.Data_Pedido, p.Total 
FROM Clientes c 
JOIN Pedidos p ON c.ID = p.ID_Cliente 
WHERE p.Data_Pedido >= CURRENT_DATE -30;

-- Liste todos os produtos de uma categoria específica na tabela "Produtos_Categorias"
SELECT p.Nome, p.Descricao, p.Preco 
FROM Produtos p 
JOIN Produtos_Categorias pc ON p.ID = pc.ID_Produto 
JOIN Categorias c ON pc.ID_Categoria = c.ID 
WHERE c.Nome = 'Eletrônicos';
