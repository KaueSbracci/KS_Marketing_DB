-- DML_QUERIES.sql
-- Consultas complexas (SELECT)

-- 1. Clientes Ativos e Seus Respectivos Planos (JOIN e WHERE)
SELECT
    C.Nome_Empresa AS Empresa,
    C.Nome_Contato AS Contato,
    P.Nome_Plano AS Plano_Contratado,
    T.Data_Inicio
FROM CLIENTE C
JOIN CONTRATO T ON C.ID_Cliente = T.ID_Cliente
JOIN PLANO_MENSAL P ON T.ID_Plano = P.ID_Plano
WHERE T.Status_Contrato = 'Ativo'
ORDER BY C.Nome_Empresa;

-- 2. Demandas Pendentes de Entrega com Prazo Mais Próximo (ORDER BY, JOIN, LIMIT)
SELECT
    D.Titulo_Demanda,
    D.Data_Prazo,
    C.Nome_Empresa
FROM DEMANDA D
JOIN CONTRATO R ON D.ID_Contrato = R.ID_Contrato
JOIN CLIENTE C ON R.ID_Cliente = C.ID_Cliente
WHERE D.Status_Producao IN ('Em Revisão', 'Em Andamento')
ORDER BY D.Data_Prazo ASC
LIMIT 5;

-- 3. Valor Total Faturado (Pagamentos 'Pago') por Plano Mensal (JOIN, SUM e GROUP BY)
SELECT
    PM.Nome_Plano,
    SUM(P.Valor_Pago) AS Total_Faturado
FROM PAGAMENTO P
JOIN CONTRATO C ON P.ID_Contrato = C.ID_Contrato
JOIN PLANO_MENSAL PM ON C.ID_Plano = PM.ID_Plano
WHERE P.Status_Cobranca = 'Pago'
GROUP BY PM.Nome_Plano
ORDER BY Total_Faturado DESC;

-- 4. Detalhes de Campanhas e Seus Resultados (JOIN Múltiplo)
SELECT
    CP.Nome_Campanha,
    CP.Orcamento,
    RC.Alcance,
    RC.Cliques,
    CL.Nome_Empresa AS Cliente
FROM CAMPANHA CP
JOIN CONTRATO CT ON CP.ID_Contrato = CT.ID_Contrato
JOIN CLIENTE CL ON CT.ID_Cliente = CL.ID_Cliente
JOIN RESULTADO_CAMPANHA RC ON CP.ID_Campanha = RC.ID_Campanha
ORDER BY RC.Alcance DESC;
