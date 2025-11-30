-- DML_UPD_DEL.sql
-- Comandos de Manipulação de Dados (UPDATE e DELETE)

-- ====================
-- COMANDOS UPDATE (3x)
-- ====================

-- 1. Mudar o status de pagamento de 'Pendente' para 'Pago' para o Contrato 1.
UPDATE PAGAMENTO
SET Status_Cobranca = 'Pago', Data_Pagamento = '2025-11-06'
WHERE ID_Contrato = 1 AND Status_Cobranca = 'Pendente';

-- 2. Aplicar um reajuste de 10% a todos os planos que custam menos de R$ 600.
UPDATE PLANO_MENSAL
SET Valor = Valor * 1.10
WHERE Valor < 600.00;

-- 3. Atualizar o status de produção para 'Atrasada' para demandas que passaram do prazo (usando uma data fictícia futura para simular o atraso).
UPDATE DEMANDA
SET Status_Producao = 'Atrasada'
WHERE Data_Prazo < '2025-09-01' AND Status_Producao NOT IN ('Concluída', 'Aprovada');


-- ====================
-- COMANDOS DELETE (3x)
-- ====================

-- 1. Excluir todas as entregas com status 'Pendente' relacionadas à DEMANDA com ID=2.
DELETE FROM ENTREGA
WHERE ID_Demanda = 2 AND Status_Aprovacao = 'Pendente';

-- 2. Excluir o registro de Resultados de Campanha com Alcance muito baixo (menos de 1000).
DELETE FROM RESULTADO_CAMPANHA
WHERE Alcance < 1000;
-- Excluir a Campanha sem orçamento que foi utilizada para teste (ID_Campanha = 1 no DML_INSERTS)
DELETE FROM CAMPANHA WHERE Orcamento = 500.00 AND ID_Contrato = 2; -- Excluindo a campanha 'Tráfego Frio - Novembro' para fins de exemplo.

-- 3. Excluir pagamentos pendentes muito antigos.
DELETE FROM PAGAMENTO
WHERE Status_Cobranca = 'Pendente' AND Data_Pagamento < '2025-10-01';
