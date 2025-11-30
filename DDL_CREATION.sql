-- DDL_CREATION.sql
-- Script para criação do schema e tabelas do sistema KS Marketing.

CREATE DATABASE IF NOT EXISTS ks_marketing_db;
USE ks_marketing_db;

-- 1. Tabela PLANO_MENSAL
CREATE TABLE PLANO_MENSAL (
    ID_Plano INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Plano VARCHAR(50) NOT NULL,
    Descricao VARCHAR(255),
    Valor DECIMAL(8, 2) NOT NULL
);

-- 2. Tabela CLIENTE
CREATE TABLE CLIENTE (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Empresa VARCHAR(100) NOT NULL,
    Nome_Contato VARCHAR(100) NOT NULL,
    Telefone VARCHAR(15),
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- 3. Tabela CONTRATO
CREATE TABLE CONTRATO (
    ID_Contrato INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente INT NOT NULL,
    ID_Plano INT NOT NULL,
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE,
    Status_Contrato VARCHAR(20) NOT NULL,
    
    FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE(ID_Cliente),
    FOREIGN KEY (ID_Plano) REFERENCES PLANO_MENSAL(ID_Plano)
);

-- 4. Tabela PAGAMENTO
CREATE TABLE PAGAMENTO (
    ID_Pagamento INT PRIMARY KEY AUTO_INCREMENT,
    ID_Contrato INT NOT NULL,
    Data_Pagamento DATE NOT NULL,
    Valor_Pago DECIMAL(8, 2) NOT NULL,
    Status_Cobranca VARCHAR(20) NOT NULL,
    
    FOREIGN KEY (ID_Contrato) REFERENCES CONTRATO(ID_Contrato)
);

-- 5. Tabela DEMANDA
CREATE TABLE DEMANDA (
    ID_Demanda INT PRIMARY KEY AUTO_INCREMENT,
    ID_Contrato INT NOT NULL,
    Titulo_Demanda VARCHAR(100) NOT NULL,
    Descricao_Demanda TEXT,
    Data_Prazo DATE,
    Status_Producao VARCHAR(20) NOT NULL,
    
    FOREIGN KEY (ID_Contrato) REFERENCES CONTRATO(ID_Contrato)
);

-- 6. Tabela ENTREGA
CREATE TABLE ENTREGA (
    ID_Entrega INT PRIMARY KEY AUTO_INCREMENT,
    ID_Demanda INT NOT NULL,
    Data_Entrega DATE NOT NULL,
    Arquivo_Nome VARCHAR(255) NOT NULL,
    Status_Aprovacao VARCHAR(20) NOT NULL,
    
    FOREIGN KEY (ID_Demanda) REFERENCES DEMANDA(ID_Demanda)
);

-- 7. Tabela CAMPANHA
CREATE TABLE CAMPANHA (
    ID_Campanha INT PRIMARY KEY AUTO_INCREMENT,
    ID_Contrato INT NOT NULL,
    Nome_Campanha VARCHAR(100) NOT NULL,
    Objetivo VARCHAR(100),
    Orcamento DECIMAL(10, 2),
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE,
    
    FOREIGN KEY (ID_Contrato) REFERENCES CONTRATO(ID_Contrato)
);

-- 8. Tabela RESULTADO_CAMPANHA
CREATE TABLE RESULTADO_CAMPANHA (
    ID_Resultado INT PRIMARY KEY AUTO_INCREMENT,
    ID_Campanha INT UNIQUE NOT NULL, 
    Alcance INT,
    Cliques INT,
    Outros_Resultados TEXT,
    
    FOREIGN KEY (ID_Campanha) REFERENCES CAMPANHA(ID_Campanha)
);
