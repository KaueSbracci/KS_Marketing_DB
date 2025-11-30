-- DML_INSERTS.sql
-- População inicial das tabelas principais.

-- Inserção em PLANO_MENSAL
INSERT INTO PLANO_MENSAL (Nome_Plano, Descricao, Valor) VALUES
('Pacote Essencial (20 Artes)', '20 artes estáticas para redes sociais.', 500.00),
('Pacote Pro (40 Artes)', '40 artes estáticas e animadas para redes sociais.', 850.00),
('Gestão de Campanhas', 'Criação e gestão mensal de campanhas de tráfego pago.', 1200.00);

-- Inserção em CLIENTE
INSERT INTO CLIENTE (Nome_Empresa, Nome_Contato, Telefone, Email) VALUES
('Academia Supera Fit', 'Ana Silva', '11987654321', 'ana.silva@superafit.com.br'),
('Restaurante Sabor Caseiro', 'João Santos', '21991234567', 'joao@saborcaseiro.com'),
('Loja Virtual Tech Prime', 'Carlos Lima', '31988776655', 'carlos@techprime.com');

-- Inserção em CONTRATO
INSERT INTO CONTRATO (ID_Cliente, ID_Plano, Data_Inicio, Data_Fim, Status_Contrato) VALUES
(1, 1, '2025-10-01', '2026-03-31', 'Ativo');
INSERT INTO CONTRATO (ID_Cliente, ID_Plano, Data_Inicio, Data_Fim, Status_Contrato) VALUES
(2, 3, '2025-11-01', '2026-05-31', 'Ativo');
INSERT INTO CONTRATO (ID_Cliente, ID_Plano, Data_Inicio, Data_Fim, Status_Contrato) VALUES
(3, 2, '2025-09-15', '2026-03-15', 'Concluído');

-- Inserção em PAGAMENTO
INSERT INTO PAGAMENTO (ID_Contrato, Data_Pagamento, Valor_Pago, Status_Cobranca) VALUES
(1, '2025-10-05', 500.00, 'Pago'),
(1, '2025-11-05', 500.00, 'Pendente'),
(2, '2025-11-01', 1200.00, 'Pago');

-- Inserção em DEMANDA
INSERT INTO DEMANDA (ID_Contrato, Titulo_Demanda, Descricao_Demanda, Data_Prazo, Status_Producao) VALUES
(1, 'Arte Carrosel Promoção Outubro', 'Criação de 5 slides sobre promoção de Outubro.', '2025-10-10', 'Concluída'),
(1, 'Arte Campanha Matrículas', 'Arte principal para divulgação de novas matrículas.', '2025-11-15', 'Em Revisão'),
(2, 'Briefing Lançamento Prato do Dia', 'Coletar briefing para nova campanha de prato do dia.', '2025-11-05', 'Concluída');

-- Inserção em ENTREGA
INSERT INTO ENTREGA (ID_Demanda, Data_Entrega, Arquivo_Nome, Status_Aprovacao) VALUES
(1, '2025-10-09', 'artes_outubro_vfinal.zip', 'Aprovada'),
(2, '2025-11-14', 'arte_matricula_v1.png', 'Pendente');

-- Inserção em CAMPANHA
INSERT INTO CAMPANHA (ID_Contrato, Nome_Campanha, Objetivo, Orcamento, Data_Inicio, Data_Fim) VALUES
(2, 'Tráfego Frio - Novembro', 'Aumentar reconhecimento de marca na região metropolitana.', 500.00, '2025-11-01', '2025-11-30');

-- Inserção em RESULTADO_CAMPANHA
INSERT INTO RESULTADO_CAMPANHA (ID_Campanha, Alcance, Cliques, Outros_Resultados) VALUES
(1, 50000, 1500, 'CTR: 3.0%');
