CREATE DATABASE LOJA_E_COMERCE; 

USE LOJA_E_COMERCE;


CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    email VARCHAR(100),
    celular BIGINT,
    data_nascimento DATE
);


CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(7,2),
    descricao VARCHAR(500),
    quantidade_estoque INT
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_compra DATE,
    valor_total DECIMAL(10, 2),
    data_estimada_entrega DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    valor_unitario DECIMAL(10, 2),
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

insert into produto (nome, preco, descricao, quantidade_estoque)
values ("lucas tonto ",45.99,"um livro sobre america",49);
select * from produto;

insert into clientes (nome, endereco, email, celular, data_nascimento)
values("joao pedro sousa aguiar", "rua candido luzitano", "joaopedrosousaaguiar@gmail.com", 11953671972, '2007-09-09');
select * from clientes;

insert into pedidos (cliente_id, data_compra, valor_total ,data_estimada_entrega)
values (12, '2024-03-15', 139.97, '2024-03-19');
select * from pedidos;

INSERT INTO itens_pedidos (pedido_id, produto_id, quantidade, valor_unitario, valor_total)
values (1, 2, 3, 29.99, 89.97);
select * from itens_pedido;

UPDATE clientes
SET endereco = 'Rua X, 789'
WHERE id = 1;

UPDATE produtos
SET quantidade_estoque = quantidade_estoque + 10
WHERE id = 3;

UPDATE pedidos
SET data_estimada_entrega = '2024-04-02'
WHERE id = 5;

UPDATE itens_pedido
SET quantidade = 5,
    valor_total = 5 * valor_unitario
WHERE id = 8;

DROP TABLE produto;
DROP TABLE cliente