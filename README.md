# Projeto Lógico e Implementação SQL - KS Marketing

Este repositório contém a **Modelagem Lógica** (Diagrama Entidade-Relacionamento e Estrutura de Tabelas) e os **Scripts SQL** necessários para a criação e manipulação do banco de dados do sistema de gerenciamento da Agência de Marketing Digital **KS Marketing**.

## 🚀 Estrutura do Projeto

* **DDL_CREATION.sql:** Contém os comandos Data Definition Language (DDL - `CREATE TABLE`) para construir o esquema do banco de dados.
* **DML_INSERTS.sql:** Contém comandos Data Manipulation Language (DML - `INSERT INTO`) para popular as tabelas principais com dados iniciais de teste.
* **DML_QUERIES.sql:** Contém exemplos de consultas (`SELECT`) para extração de informações, utilizando `JOIN`, `WHERE`, `ORDER BY`, etc.
* **DML_UPD_DEL.sql:** Contém comandos de atualização e exclusão (`UPDATE` e `DELETE`) com condições, demonstrando a manipulação segura dos dados.

## 🛠️ Como Executar os Scripts

**Pré-requisitos:**
1. Um Sistema Gerenciador de Banco de Dados (SGBD) Relacional (Sugestão: **MySQL** ou **PostgreSQL**).
2. Uma ferramenta cliente para execução de scripts (ex: MySQL Workbench, pgAdmin, DBeaver).

**Passos para Execução:**
1.  **Criação do Schema:** Execute o script `DDL_CREATION.sql` para criar o banco de dados (`ks_marketing_db`) e todas as tabelas.
2.  **Carga Inicial de Dados:** Execute o script `DML_INSERTS.sql` para popular as tabelas com os dados de teste.
3.  **Testes de Manipulação:** Execute os scripts `DML_QUERIES.sql` e `DML_UPD_DEL.sql` para testar as operações de consulta e manipulação de dados.

## 📄 Estrutura do Modelo Lógico (3FN)

O modelo é composto pelas seguintes tabelas principais:

* **CLIENTE** (`ID_Cliente` CP)
* **PLANO_MENSAL** (`ID_Plano` CP)
* **CONTRATO** (`ID_Contrato` CP; `ID_Cliente` CE, `ID_Plano` CE)
* **PAGAMENTO** (`ID_Pagamento` CP; `ID_Contrato` CE)
* **DEMANDA** (`ID_Demanda` CP; `ID_Contrato` CE)
* **ENTREGA** (`ID_Entrega` CP; `ID_Demanda` CE)
* **CAMPANHA** (`ID_Campanha` CP; `ID_Contrato` CE)
* **RESULTADO_CAMPANHA** (`ID_Resultado` CP; `ID_Campanha` CE)
