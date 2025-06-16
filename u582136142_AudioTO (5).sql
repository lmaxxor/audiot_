-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 15/06/2025 às 01:34
-- Versão do servidor: 10.11.10-MariaDB-log
-- Versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `u582136142_AudioTO`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `assinaturas_utilizador`
--

CREATE TABLE `assinaturas_utilizador` (
  `id_assinatura` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `id_plano` int(11) NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  `data_proxima_cobranca` datetime DEFAULT NULL,
  `estado_assinatura` enum('ativa','cancelada','expirada','pendente_pagamento','gratuita_teste') NOT NULL DEFAULT 'pendente_pagamento',
  `id_transacao_gateway` varchar(255) DEFAULT NULL,
  `data_criacao` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `assinaturas_utilizador`
--

INSERT INTO `assinaturas_utilizador` (`id_assinatura`, `id_utilizador`, `id_plano`, `data_inicio`, `data_fim`, `data_proxima_cobranca`, `estado_assinatura`, `id_transacao_gateway`, `data_criacao`) VALUES
(35, 1, 2, '2025-05-25 04:36:01', NULL, NULL, 'pendente_pagamento', 'f5dda94c51cb414fa604c002b06f559c', '2025-05-25 04:36:01'),
(36, 26, 2, '2025-05-25 05:24:08', '2025-06-25 05:24:08', '2025-06-25 05:24:08', 'ativa', 'cf5177fb381a40bab3c2a9cd3eab0b81', '2025-05-25 04:57:18'),
(37, 26, 2, '2025-05-28 02:32:16', NULL, NULL, 'pendente_pagamento', '629b6901a43143b79be7c64a546273da', '2025-05-28 02:32:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `assuntos_podcast`
--

CREATE TABLE `assuntos_podcast` (
  `id_assunto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `nome_assunto` varchar(200) NOT NULL,
  `descricao_assunto` text DEFAULT NULL,
  `icone_assunto` varchar(255) DEFAULT NULL,
  `cor_icone_assunto` varchar(20) DEFAULT NULL,
  `slug_assunto` varchar(200) NOT NULL,
  `url_audio` varchar(255) DEFAULT NULL,
  `url_pdf` varchar(255) DEFAULT NULL,
  `data_criacao` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `assuntos_podcast`
--

INSERT INTO `assuntos_podcast` (`id_assunto`, `id_categoria`, `nome_assunto`, `descricao_assunto`, `icone_assunto`, `cor_icone_assunto`, `slug_assunto`, `url_audio`, `url_pdf`, `data_criacao`) VALUES
(1367, 117, 'Assunto 1: Papel e Âmbito da TO', '', NULL, NULL, 'papel-e-ambito-da-to', NULL, NULL, '2025-06-08 02:47:58'),
(1368, 117, 'Assunto 2: Abordagem Centrada no Cliente', '', NULL, NULL, 'abordagem-centrada-no-cliente', NULL, NULL, '2025-06-08 02:47:58'),
(1369, 117, 'Assunto 3: História e Marcos da Profissão', '', NULL, NULL, 'historia-e-marcos-da-profissao', NULL, NULL, '2025-06-08 02:47:58'),
(1370, 117, 'Assunto 4: Áreas de Atuação e Populações', '', NULL, NULL, 'areas-de-atuacao-e-populacoes', NULL, NULL, '2025-06-08 02:47:58'),
(1371, 117, 'Assunto 5: Mercado de Trabalho e Perspectivas', '', NULL, NULL, 'mercado-de-trabalho-e-perspectivas', NULL, NULL, '2025-06-08 02:47:58'),
(1372, 118, 'Assunto 1: Sistema Musculoesquelético Básico', '', NULL, NULL, 'sistema-musculoesqueletico-basico', NULL, NULL, '2025-06-08 02:47:58'),
(1373, 118, 'Assunto 2: Principais Articulações e Movimento', '', NULL, NULL, 'principais-articulacoes-e-movimento', NULL, NULL, '2025-06-08 02:47:58'),
(1374, 118, 'Assunto 3: Anatomia do Tronco e Coluna', '', NULL, NULL, 'anatomia-do-tronco-e-coluna', NULL, NULL, '2025-06-08 02:47:58'),
(1375, 118, 'Assunto 4: Anatomia dos Membros Superiores', '', NULL, NULL, 'anatomia-dos-membros-superiores', NULL, NULL, '2025-06-08 02:47:58'),
(1376, 118, 'Assunto 5: Anatomia dos Membros Inferiores', '', NULL, NULL, 'anatomia-dos-membros-inferiores', NULL, NULL, '2025-06-08 02:47:58'),
(1377, 119, 'Assunto 1: Organização do SNC', '', NULL, NULL, 'organizacao-do-snc', NULL, NULL, '2025-06-08 02:47:58'),
(1378, 119, 'Assunto 2: Neurônios e Sinapses', '', NULL, NULL, 'neuronios-e-sinapses', NULL, NULL, '2025-06-08 02:47:58'),
(1379, 119, 'Assunto 3: Vias Sensoriais e Motores', '', NULL, NULL, 'vias-sensoriais-e-motoras', NULL, NULL, '2025-06-08 02:47:58'),
(1380, 119, 'Assunto 4: Plasticidade Neural', '', NULL, NULL, 'plasticidade-neural', NULL, NULL, '2025-06-08 02:47:58'),
(1381, 119, 'Assunto 5: Neurociência Aplicada à Função', '', NULL, NULL, 'neurociencia-aplicada-a-funcao', NULL, NULL, '2025-06-08 02:47:58'),
(1382, 120, 'Assunto 1: MOHO – Modelo de Ocupação Humana', '', NULL, NULL, 'moho-modelo-de-ocupacao-humana', NULL, NULL, '2025-06-08 02:47:58'),
(1383, 120, 'Assunto 2: CMOP-E – Modelo Canadense', '', NULL, NULL, 'cmop-e-modelo-canadense', NULL, NULL, '2025-06-08 02:47:58'),
(1384, 120, 'Assunto 3: Abordagem Biopsicossocial e CIF/OMS', '', NULL, NULL, 'abordagem-biopsicossocial-cif-oms', NULL, NULL, '2025-06-08 02:47:58'),
(1385, 120, 'Assunto 4: Teoria da Ocupação Centrada no Desempenho', '', NULL, NULL, 'teoria-ocupacao-centrada-no-desempenho', NULL, NULL, '2025-06-08 02:47:58'),
(1386, 120, 'Assunto 5: Integração de Modelos na Prática Clínica', '', NULL, NULL, 'integracao-modelos-pratica-clinica', NULL, NULL, '2025-06-08 02:47:58'),
(1387, 121, 'Assunto 1: Código de Ética do TO', '', NULL, NULL, 'codigo-de-etica-do-to', NULL, NULL, '2025-06-08 02:47:58'),
(1388, 121, 'Assunto 2: Regulamentação e CREFITO', '', NULL, NULL, 'regulamentacao-e-crefito', NULL, NULL, '2025-06-08 02:47:58'),
(1389, 121, 'Assunto 3: Direitos do Paciente e Consentimento', '', NULL, NULL, 'direitos-do-paciente-e-consentimento', NULL, NULL, '2025-06-08 02:47:58'),
(1390, 121, 'Assunto 4: Confidencialidade e Registro de Dados', '', NULL, NULL, 'confidencialidade-e-registro-de-dados', NULL, NULL, '2025-06-08 02:47:58'),
(1391, 121, 'Assunto 5: Responsabilidade Profissional', '', NULL, NULL, 'responsabilidade-profissional', NULL, NULL, '2025-06-08 02:47:58'),
(1392, 122, 'Assunto 1: Triagem Funcional (FIM, Barthel)', '', NULL, NULL, 'triagem-funcional-fim-barthel', NULL, NULL, '2025-06-08 02:47:58'),
(1393, 122, 'Assunto 2: History Taking e Entrevista', '', NULL, NULL, 'history-taking-entrevista', NULL, NULL, '2025-06-08 02:47:58'),
(1394, 122, 'Assunto 3: COPM – Medida Centrada no Cliente', '', NULL, NULL, 'copm-medida-centrada-no-cliente', NULL, NULL, '2025-06-08 02:47:58'),
(1395, 122, 'Assunto 4: Escalas de Qualidade de Vida', '', NULL, NULL, 'escalas-de-qualidade-de-vida', NULL, NULL, '2025-06-08 02:47:58'),
(1396, 122, 'Assunto 5: Relatórios de Avaliação Inicial', '', NULL, NULL, 'relatorios-avaliacao-inicial', NULL, NULL, '2025-06-08 02:47:58'),
(1397, 123, 'Assunto 1: Dinamometria e Força Muscular', '', NULL, NULL, 'dinamometria-e-forca-muscular', NULL, NULL, '2025-06-08 02:47:58'),
(1398, 123, 'Assunto 2: MFM – Função Motora Fina', '', NULL, NULL, 'mfm-funcao-motora-fina', NULL, NULL, '2025-06-08 02:47:58'),
(1399, 123, 'Assunto 3: AIMS – Escala de Movimento', '', NULL, NULL, 'aims-escala-de-movimento', NULL, NULL, '2025-06-08 02:47:58'),
(1400, 123, 'Assunto 4: CADL – Atividades de Vida Diária', '', NULL, NULL, 'cadl-atividades-vida-diaria', NULL, NULL, '2025-06-08 02:47:58'),
(1401, 123, 'Assunto 5: Interpretação de Resultados', '', NULL, NULL, 'interpretacao-de-resultados', NULL, NULL, '2025-06-08 02:47:58'),
(1402, 124, 'Assunto 1: Adaptações Domiciliares', '', NULL, NULL, 'adaptacoes-domiciliares', NULL, NULL, '2025-06-08 02:47:58'),
(1403, 124, 'Assunto 2: Treino de Transferências', '', NULL, NULL, 'treino-de-transferencias', NULL, NULL, '2025-06-08 02:47:58'),
(1404, 124, 'Assunto 3: Atividades Instrumentais de Vida Diária', '', NULL, NULL, 'atividades-instrumentais-vida-diaria', NULL, NULL, '2025-06-08 02:47:58'),
(1405, 124, 'Assunto 4: Tecnologias de Suporte para AVD', '', NULL, NULL, 'tecnologias-suporte-avd', NULL, NULL, '2025-06-08 02:47:58'),
(1406, 124, 'Assunto 5: Avaliação da Efetividade', '', NULL, NULL, 'avaliacao-da-efetividade', NULL, NULL, '2025-06-08 02:47:58'),
(1407, 125, 'Assunto 1: Órteses e Próteses', '', NULL, NULL, 'orteses-e-proteses', NULL, NULL, '2025-06-08 02:47:58'),
(1408, 125, 'Assunto 2: Recursos Eletrônicos Adaptativos', '', NULL, NULL, 'recursos-eletronicos-adaptativos', NULL, NULL, '2025-06-08 02:47:58'),
(1409, 125, 'Assunto 3: Softwares e Apps de Acessibilidade', '', NULL, NULL, 'softwares-apps-acessibilidade', NULL, NULL, '2025-06-08 02:47:58'),
(1410, 125, 'Assunto 4: Tecnologia Vestível em OT', '', NULL, NULL, 'tecnologia-vestivel-em-ot', NULL, NULL, '2025-06-08 02:47:58'),
(1411, 125, 'Assunto 5: Tendências em IA e Assistência', '', NULL, NULL, 'tendencias-em-ia-e-assistencia', NULL, NULL, '2025-06-08 02:47:58'),
(1412, 126, 'Assunto 1: Princípios Ergonômicos', '', NULL, NULL, 'principios-ergonomicos', NULL, NULL, '2025-06-08 02:47:58'),
(1413, 126, 'Assunto 2: Análise Ergonômica de Tarefas', '', NULL, NULL, 'analise-ergonomica-de-tarefas', NULL, NULL, '2025-06-08 02:47:58'),
(1414, 126, 'Assunto 3: Programas de Prevenção em Ambiente de Trabalho', '', NULL, NULL, 'programas-de-prevencao-ambiente-trabalho', NULL, NULL, '2025-06-08 02:47:58'),
(1415, 126, 'Assunto 4: Postura e Biomecânica', '', NULL, NULL, 'postura-e-biomecanica', NULL, NULL, '2025-06-08 02:47:58'),
(1416, 126, 'Assunto 5: Avaliação de Riscos Ocupacionais', '', NULL, NULL, 'avaliacao-de-riscos-ocupacionais', NULL, NULL, '2025-06-08 02:47:58'),
(1417, 127, 'Assunto 1: Abordagens Clínicas em Saúde Mental', '', NULL, NULL, 'abordagens-clinicas-saude-mental', NULL, NULL, '2025-06-08 02:47:58'),
(1418, 127, 'Assunto 2: Terapia de Grupo e Dinâmicas', '', NULL, NULL, 'terapia-de-grupo-dinamicas', NULL, NULL, '2025-06-08 02:47:58'),
(1419, 127, 'Assunto 3: Suporte Psicossocial', '', NULL, NULL, 'suporte-psicossocial', NULL, NULL, '2025-06-08 02:47:58'),
(1420, 127, 'Assunto 4: Intervenções em Trauma e PTSD', '', NULL, NULL, 'intervencoes-em-trauma-e-ptsd', NULL, NULL, '2025-06-08 02:47:58'),
(1421, 127, 'Assunto 5: Mindfulness e OT', '', NULL, NULL, 'mindfulness-e-ot', NULL, NULL, '2025-06-08 02:47:58'),
(1422, 128, 'Assunto 1: Pós-AVC – Protocolos Iniciais', '', NULL, NULL, 'pos-avc-protocolos-iniciais', NULL, NULL, '2025-06-08 02:47:58'),
(1423, 128, 'Assunto 2: Reabilitação em TCE', '', NULL, NULL, 'reabilitacao-em-tce', NULL, NULL, '2025-06-08 02:47:58'),
(1424, 128, 'Assunto 3: Doenças Neurodegenerativas', '', NULL, NULL, 'doencas-neurodegenerativas', NULL, NULL, '2025-06-08 02:47:58'),
(1425, 128, 'Assunto 4: Terapias Baseadas em Neuroplasticidade', '', NULL, NULL, 'terapias-neuroplasticidade', NULL, NULL, '2025-06-08 02:47:58'),
(1426, 128, 'Assunto 5: Tecnologia em Neuroreabilitação', '', NULL, NULL, 'tecnologia-neuroreabilitacao', NULL, NULL, '2025-06-08 02:47:58'),
(1427, 129, 'Assunto 1: Marco do Desenvolvimento Motor', '', NULL, NULL, 'marco-desenvolvimento-motor', NULL, NULL, '2025-06-08 02:47:58'),
(1428, 129, 'Assunto 2: Avaliação Precoce em Pediatria', '', NULL, NULL, 'avaliacao-precoce-pediatria', NULL, NULL, '2025-06-08 02:47:58'),
(1429, 129, 'Assunto 3: Intervenção em Primeiros Anos', '', NULL, NULL, 'intervencao-primeiros-anos', NULL, NULL, '2025-06-08 02:47:58'),
(1430, 129, 'Assunto 4: Família e Ambiente Terapêutico', '', NULL, NULL, 'familia-ambiente-terapeutico', NULL, NULL, '2025-06-08 02:47:58'),
(1431, 129, 'Assunto 5: Brincadeira como Terapia', '', NULL, NULL, 'brincadeira-como-terapia', NULL, NULL, '2025-06-08 02:47:58'),
(1432, 130, 'Assunto 1: Fragilidade e Avaliação Geriátrica', '', NULL, NULL, 'fragilidade-avaliacao-geriatrica', NULL, NULL, '2025-06-08 02:47:58'),
(1433, 130, 'Assunto 2: Demências e OT', '', NULL, NULL, 'demencias-e-ot', NULL, NULL, '2025-06-08 02:47:58'),
(1434, 130, 'Assunto 3: Cuidados Paliativos em Idosos', '', NULL, NULL, 'cuidados-paliativos-idosos', NULL, NULL, '2025-06-08 02:47:58'),
(1435, 130, 'Assunto 4: Envelhecimento Ativo', '', NULL, NULL, 'envelhecimento-ativo', NULL, NULL, '2025-06-08 02:47:58'),
(1436, 130, 'Assunto 5: Tecnologia Assistiva para Idosos', '', NULL, NULL, 'tecnologia-assistiva-idosos', NULL, NULL, '2025-06-08 02:47:58'),
(1437, 131, 'Assunto 1: Avaliação da Função Manual', '', NULL, NULL, 'avaliacao-funcao-manual', NULL, NULL, '2025-06-08 02:47:58'),
(1438, 131, 'Assunto 2: Técnicas de Mobilização Articular', '', NULL, NULL, 'tecnicas-mobilizacao-articular', NULL, NULL, '2025-06-08 02:47:58'),
(1439, 131, 'Assunto 3: Reabilitação Pós-Fratura de Mão', '', NULL, NULL, 'reabilitacao-pos-fratura-mao', NULL, NULL, '2025-06-08 02:47:58'),
(1440, 131, 'Assunto 4: Órteses de Mão e Pulso', '', NULL, NULL, 'orteses-de-mao-e-pulso', NULL, NULL, '2025-06-08 02:47:58'),
(1441, 131, 'Assunto 5: Terapia de Exercícios na Mão', '', NULL, NULL, 'terapia-exercicios-mao', NULL, NULL, '2025-06-08 02:47:58'),
(1442, 132, 'Assunto 1: Fundamentos da SI', '', NULL, NULL, 'fundamentos-integração-sensorial', NULL, NULL, '2025-06-08 02:47:58'),
(1443, 132, 'Assunto 2: Avaliação de SI em Crianças', '', NULL, NULL, 'avaliacao-integracao-sensorial-criancas', NULL, NULL, '2025-06-08 02:47:58'),
(1444, 132, 'Assunto 3: Estratégias de Intervenção SI', '', NULL, NULL, 'estrategias-intervencao-integracao', NULL, NULL, '2025-06-08 02:47:58'),
(1445, 132, 'Assunto 4: SI em TEA e TDAH', '', NULL, NULL, 'integração-sensorial-tea-tdah', NULL, NULL, '2025-06-08 02:47:58'),
(1446, 132, 'Assunto 5: Material e Espaços Terapêuticos', '', NULL, NULL, 'material-espacos-terapeuticos', NULL, NULL, '2025-06-08 02:47:58'),
(1447, 133, 'Assunto 1: Plataformas de Telereabilitação', '', NULL, NULL, 'plataformas-telereabilitacao', NULL, NULL, '2025-06-08 02:47:58'),
(1448, 133, 'Assunto 2: Protocolos Remotos em OT', '', NULL, NULL, 'protocolos-remotos-ot', NULL, NULL, '2025-06-08 02:47:58'),
(1449, 133, 'Assunto 3: Segurança e Privacidade de Dados', '', NULL, NULL, 'seguranca-privacidade-dados', NULL, NULL, '2025-06-08 02:47:58'),
(1450, 133, 'Assunto 4: Engajamento Online do Paciente', '', NULL, NULL, 'engajamento-online-paciente', NULL, NULL, '2025-06-08 02:47:58'),
(1451, 133, 'Assunto 5: Telemonitoramento e Feedback', '', NULL, NULL, 'telemonitoramento-feedback', NULL, NULL, '2025-06-08 02:47:58'),
(1452, 134, 'Assunto 1: Entrevista Motivacional', '', NULL, NULL, 'entrevista-motivacional', NULL, NULL, '2025-06-08 02:47:58'),
(1453, 134, 'Assunto 2: Rapport e Aliança Terapêutica', '', NULL, NULL, 'rapport-alianca-terapeutica', NULL, NULL, '2025-06-08 02:47:58'),
(1454, 134, 'Assunto 3: Comunicação Não-Verbal', '', NULL, NULL, 'comunicacao-nao-verbal', NULL, NULL, '2025-06-08 02:47:58'),
(1455, 134, 'Assunto 4: Feedback Construtivo', '', NULL, NULL, 'feedback-construtivo', NULL, NULL, '2025-06-08 02:47:58'),
(1456, 134, 'Assunto 5: Gestão de Conflitos em Clínica', '', NULL, NULL, 'gestao-de-conflitos-clinica', NULL, NULL, '2025-06-08 02:47:58'),
(1457, 135, 'Assunto 1: Prontuário Eletrônico', '', NULL, NULL, 'prontuario-eletronico', NULL, NULL, '2025-06-08 02:47:58'),
(1458, 135, 'Assunto 2: SOAP Notes', '', NULL, NULL, 'soap-notes', NULL, NULL, '2025-06-08 02:47:58'),
(1459, 135, 'Assunto 3: Indicadores de Resultado', '', NULL, NULL, 'indicadores-de-resultado', NULL, NULL, '2025-06-08 02:47:58'),
(1460, 135, 'Assunto 4: Padronização de Relatórios', '', NULL, NULL, 'padronizacao-de-relatorios', NULL, NULL, '2025-06-08 02:47:58'),
(1461, 135, 'Assunto 5: Gestão de Dados Clínicos', '', NULL, NULL, 'gestao-de-dados-clinicos', NULL, NULL, '2025-06-08 02:47:58'),
(1462, 136, 'Assunto 1: OT em Oncologia', '', NULL, NULL, 'ot-em-oncologia', NULL, NULL, '2025-06-08 02:47:58'),
(1463, 136, 'Assunto 2: OT em Cardiologia', '', NULL, NULL, 'ot-em-cardiologia', NULL, NULL, '2025-06-08 02:47:58'),
(1464, 136, 'Assunto 3: OT para Diabetes', '', NULL, NULL, 'ot-para-diabetes', NULL, NULL, '2025-06-08 02:47:58'),
(1465, 136, 'Assunto 4: OT em Saúde Mental Forense', '', NULL, NULL, 'ot-saude-mental-forense', NULL, NULL, '2025-06-08 02:47:58'),
(1466, 136, 'Assunto 5: OT em Cuidados Paliativos', '', NULL, NULL, 'ot-cuidados-paliativos', NULL, NULL, '2025-06-08 02:47:58'),
(1467, 137, 'Assunto 1: Estrutura de Caso Clínico', '', NULL, NULL, 'estrutura-de-caso-clinico', NULL, NULL, '2025-06-08 02:47:58'),
(1468, 137, 'Assunto 2: Análise de Avaliação Funcional', '', NULL, NULL, 'analise-avaliacao-funcional', NULL, NULL, '2025-06-08 02:47:58'),
(1469, 137, 'Assunto 3: Planejamento e Implementação', '', NULL, NULL, 'planejamento-implementacao', NULL, NULL, '2025-06-08 02:47:58'),
(1470, 137, 'Assunto 4: Resultados e Reflexões', '', NULL, NULL, 'resultados-e-reflexoes', NULL, NULL, '2025-06-08 02:47:58'),
(1471, 137, 'Assunto 5: Boas Práticas e Lições Aprendidas', '', NULL, NULL, 'boas-praticas-licoes-aprendidas', NULL, NULL, '2025-06-08 02:47:58'),
(1472, 138, 'Assunto 1: Métodos de Pesquisa em OT', '', NULL, NULL, 'metodos-de-pesquisa-em-ot', NULL, NULL, '2025-06-08 02:47:58'),
(1473, 138, 'Assunto 2: Bioestatística Aplicada', '', NULL, NULL, 'bioestatistica-aplicada', NULL, NULL, '2025-06-08 02:47:58'),
(1474, 138, 'Assunto 3: Crítica de Artigos Científicos', '', NULL, NULL, 'critica-de-artigos-cientificos', NULL, NULL, '2025-06-08 02:47:58'),
(1475, 138, 'Assunto 4: Elaboração de Projetos de Pesquisa', '', NULL, NULL, 'elaboracao-projetos-pesquisa', NULL, NULL, '2025-06-08 02:47:58'),
(1476, 138, 'Assunto 5: Ética em Pesquisa Clínica', '', NULL, NULL, 'etica-em-pesquisa-clinica', NULL, NULL, '2025-06-08 02:47:58'),
(1477, 139, 'Assunto 1: Modelos de Gestão em Saúde', '', NULL, NULL, 'modelos-de-gestao-em-saude', NULL, NULL, '2025-06-08 02:47:58'),
(1478, 139, 'Assunto 2: Coordenação de Equipes', '', NULL, NULL, 'coordenacao-de-equipes', NULL, NULL, '2025-06-08 02:47:58'),
(1479, 139, 'Assunto 3: Planejamento Estratégico', '', NULL, NULL, 'planejamento-estrategico', NULL, NULL, '2025-06-08 02:47:58'),
(1480, 139, 'Assunto 4: Qualidade e Acreditação', '', NULL, NULL, 'qualidade-e-acreditacao', NULL, NULL, '2025-06-08 02:47:58'),
(1481, 139, 'Assunto 5: Finanças em Clínica', '', NULL, NULL, 'financas-em-clinica', NULL, NULL, '2025-06-08 02:47:58'),
(1482, 140, 'Assunto 1: Princípios de Didática', '', NULL, NULL, 'principios-de-didatica', NULL, NULL, '2025-06-08 02:47:58'),
(1483, 140, 'Assunto 2: Supervisão Clínica', '', NULL, NULL, 'supervisao-clinica', NULL, NULL, '2025-06-08 02:47:58'),
(1484, 140, 'Assunto 3: Desenvolvimento de Materiais', '', NULL, NULL, 'desenvolvimento-de-materiais', NULL, NULL, '2025-06-08 02:47:58'),
(1485, 140, 'Assunto 4: Avaliação de Aprendizagem', '', NULL, NULL, 'avaliacao-de-aprendizagem', NULL, NULL, '2025-06-08 02:47:58'),
(1486, 140, 'Assunto 5: Educação Continuada', '', NULL, NULL, 'educacao-continuada', NULL, NULL, '2025-06-08 02:47:58'),
(1487, 141, 'Assunto 1: OT no Contexto Escolar', '', NULL, NULL, 'ot-no-contexto-escolar', NULL, NULL, '2025-06-08 02:47:58'),
(1488, 141, 'Assunto 2: Programas de Saúde Comunitária', '', NULL, NULL, 'programas-saude-comunitaria', NULL, NULL, '2025-06-08 02:47:58'),
(1489, 141, 'Assunto 3: Inclusão e Acessibilidade', '', NULL, NULL, 'inclusao-e-acessibilidade', NULL, NULL, '2025-06-08 02:47:58'),
(1490, 141, 'Assunto 4: Parcerias Intersetoriais', '', NULL, NULL, 'parcerias-intersetoriais', NULL, NULL, '2025-06-08 02:47:58'),
(1491, 141, 'Assunto 5: Advocacy e Políticas Locais', '', NULL, NULL, 'advocacy-politicas-locais', NULL, NULL, '2025-06-08 02:47:58'),
(1492, 142, 'Assunto 1: Riscos e Doenças Ocupacionais', '', NULL, NULL, 'riscos-doencas-ocupacionais', NULL, NULL, '2025-06-08 02:47:58'),
(1493, 142, 'Assunto 2: Programas de Ginástica Laboral', '', NULL, NULL, 'programas-ginastica-laboral', NULL, NULL, '2025-06-08 02:47:58'),
(1494, 142, 'Assunto 3: Ergonomia Ambiental', '', NULL, NULL, 'ergonomia-ambiental', NULL, NULL, '2025-06-08 02:47:58'),
(1495, 142, 'Assunto 4: Promoção da Saúde no Trabalho', '', NULL, NULL, 'promocao-saude-no-trabalho', NULL, NULL, '2025-06-08 02:47:58'),
(1496, 142, 'Assunto 5: Legislação em Saúde Ocupacional', '', NULL, NULL, 'legislacao-saude-ocupacional', NULL, NULL, '2025-06-08 02:47:58'),
(1497, 143, 'Assunto 1: Sistemas de Saúde Públicos e Privados', '', NULL, NULL, 'sistemas-de-saude-publicos-privados', NULL, NULL, '2025-06-08 02:47:58'),
(1498, 143, 'Assunto 2: Planos de Saúde e Reembolsos', '', NULL, NULL, 'planos-de-saude-reembolsos', NULL, NULL, '2025-06-08 02:47:58'),
(1499, 143, 'Assunto 3: Acesso a Serviços de OT', '', NULL, NULL, 'acesso-a-servicos-de-ot', NULL, NULL, '2025-06-08 02:47:58'),
(1500, 143, 'Assunto 4: Políticas de Inclusão Social', '', NULL, NULL, 'politicas-inclusao-social', NULL, NULL, '2025-06-08 02:47:58'),
(1501, 143, 'Assunto 5: Financiamento de Pesquisa', '', NULL, NULL, 'financiamento-de-pesquisa', NULL, NULL, '2025-06-08 02:47:58'),
(1502, 144, 'Assunto 1: Comitês de Ética e Consentimento', '', NULL, NULL, 'comites-de-etica-consentimento', NULL, NULL, '2025-06-08 02:47:58'),
(1503, 144, 'Assunto 2: Direitos do Participante', '', NULL, NULL, 'direitos-do-participante', NULL, NULL, '2025-06-08 02:47:58'),
(1504, 144, 'Assunto 3: Pesquisa Qualitativa em Saúde', '', NULL, NULL, 'pesquisa-qualitativa-em-saude', NULL, NULL, '2025-06-08 02:47:58'),
(1505, 144, 'Assunto 4: Publicação e Plágio', '', NULL, NULL, 'publicacao-e-plagio', NULL, NULL, '2025-06-08 02:47:58'),
(1506, 144, 'Assunto 5: Data Management em Pesquisas', '', NULL, NULL, 'data-management-pesquisas', NULL, NULL, '2025-06-08 02:47:58'),
(1507, 145, 'Assunto 1: Startups em Saúde', '', NULL, NULL, 'startups-em-saude', NULL, NULL, '2025-06-08 02:47:58'),
(1508, 145, 'Assunto 2: Desenvolvimento de Apps OT', '', NULL, NULL, 'desenvolvimento-apps-ot', NULL, NULL, '2025-06-08 02:47:58'),
(1509, 145, 'Assunto 3: Design Thinking em OT', '', NULL, NULL, 'design-thinking-em-ot', NULL, NULL, '2025-06-08 02:47:58'),
(1510, 145, 'Assunto 4: Modelos de Negócio e Financiamento', '', NULL, NULL, 'modelos-de-negocio-e-financiamento', NULL, NULL, '2025-06-08 02:47:58'),
(1511, 145, 'Assunto 5: Casos de Sucesso e Lições', '', NULL, NULL, 'casos-de-sucesso-e-licoes', NULL, NULL, '2025-06-08 02:47:58'),
(1512, 146, 'Assunto 1: Principais Congressos em OT', '', NULL, NULL, 'principais-congressos-em-ot', NULL, NULL, '2025-06-08 02:47:58'),
(1513, 146, 'Assunto 2: Sociedades Científicas', '', NULL, NULL, 'sociedades-cientificas', NULL, NULL, '2025-06-08 02:47:58'),
(1514, 146, 'Assunto 3: Grupos de Estudo e Fóruns', '', NULL, NULL, 'grupos-de-estudo-e-foruns', NULL, NULL, '2025-06-08 02:47:58'),
(1515, 146, 'Assunto 4: Publicação de Notícias e Blogs', '', NULL, NULL, 'publicacao-de-noticias-e-blogs', NULL, NULL, '2025-06-08 02:47:58'),
(1516, 146, 'Assunto 5: Ferramentas de Networking Online', '', NULL, NULL, 'ferramentas-de-networking-online', NULL, NULL, '2025-06-08 02:47:58');

-- --------------------------------------------------------

--
-- Estrutura para tabela `audioto_emails`
--

CREATE TABLE `audioto_emails` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `audioto_emails`
--

INSERT INTO `audioto_emails` (`id`, `email`, `created_at`) VALUES
(1, 'allexandrinoinc@gmail.com', '2025-05-14 23:21:05'),
(3, 'dossantossilvadaniela3@gmail.com', '2025-05-19 15:15:14'),
(4, 'jessica.afonso.greve87@gmail.com', '2025-05-19 15:25:40'),
(5, 'rafaela95@outlook.com.br', '2025-05-19 15:36:43'),
(6, 'daniel-amaro08@hotmail.com', '2025-05-19 15:40:04'),
(7, 'nga250585@gmail.com', '2025-05-19 15:45:12'),
(8, 'marilourdesvieira@yahoo.com', '2025-05-19 16:31:41'),
(9, 'daguisouza1984@gmail.com', '2025-05-19 16:34:04'),
(10, 'rosetomazdecastro@gmail.com', '2025-05-19 17:24:10'),
(11, 'jacque.profa@gmail.com', '2025-05-19 18:43:08'),
(12, 'simonehartt@yahoo.com.br', '2025-05-19 20:36:28'),
(13, 'profeliese.smo@gmail.com', '2025-05-19 20:41:40'),
(14, 'fsadria@yahoo.com.br', '2025-05-19 20:45:43'),
(15, 'ana_angra@hotmail.com', '2025-05-19 20:51:09'),
(16, 'rosangela.tessalia@gmail.com', '2025-05-19 21:16:27'),
(17, 'fac.saulo@gmail.com', '2025-05-19 21:26:27'),
(18, 'marciaveiga385@gmail.com', '2025-05-19 22:13:39'),
(19, 'julianatriquez@gmail.com', '2025-05-19 23:28:17'),
(20, 'ernandorena.sheila@gmail.com', '2025-05-19 23:38:51'),
(21, 'reabilita.to.yris@gmail.com', '2025-05-20 15:46:27'),
(22, 'genirasouza19@gmail.com', '2025-05-20 15:54:50'),
(23, 'Rafaellarodrigues749@gmail.com', '2025-05-21 07:29:50'),
(24, 'suzanajk20@gmail.com', '2025-05-21 08:37:36'),
(25, 'ddeboracristina76@gmail.com', '2025-05-21 08:39:37'),
(26, 'iris.lahu@gmail.com', '2025-05-21 09:17:34'),
(27, 'leuyasmin46@gmail.com', '2025-05-21 09:19:49'),
(28, 'keniacardonski@hotmail.com', '2025-05-21 09:20:01'),
(29, 'alveskallyne46@gmail.com', '2025-05-21 09:39:33'),
(30, 'habilita.to.yris@gmail.com', '2025-05-21 09:42:49'),
(31, 'terapeutiando.lc@gmail.com', '2025-05-21 09:49:07'),
(32, 'naireslima1@gmail.com', '2025-05-21 09:56:51'),
(33, 'naireslimaandrade@gmail.com', '2025-05-21 09:57:04'),
(34, 'jaqueline@netscs.com.br', '2025-05-21 09:58:38'),
(35, 'evecj.souza@gmail.com', '2025-05-21 10:25:17'),
(36, 'jamissonr1405@gmail.com', '2025-05-21 11:00:48'),
(37, 'elisaanjosilva@gmail.com', '2025-05-21 11:02:42'),
(38, 'adenisalimoeiro@gmail.com', '2025-05-21 11:03:35'),
(39, 'fa.f.medeiros@hotmail.com', '2025-05-21 14:12:11'),
(40, 'marianadfa2015@gmail.com', '2025-05-21 18:59:24'),
(41, 'valdenia.f.azevedo@gmail.com', '2025-05-21 20:37:09'),
(42, 'tfachiolli@hotmail.com', '2025-05-21 20:37:42'),
(43, 'francineliayres@gmail.com', '2025-05-21 20:38:24'),
(44, 'karoline.jacques85@yahoo.com.br', '2025-05-21 20:38:40'),
(45, 'edneia.terapeutaocupacional@gmail.com', '2025-05-21 20:39:07'),
(46, 'jjowientais@gmail.com', '2025-05-21 20:42:59'),
(47, 'contato@vivairis.com', '2025-05-21 20:46:16'),
(48, 'aurianesv@hotmail.com', '2025-05-21 20:50:43'),
(49, 'thainmirandaaa@gmail.com', '2025-05-21 21:02:44'),
(50, 'denise_ico@hotmail.com', '2025-05-21 21:09:27'),
(51, 'jeannetorres9@outlook.com', '2025-05-21 21:14:03'),
(52, 'joeloliveira686@gmail.com', '2025-05-21 21:35:32'),
(53, 'angelica.souza93@gmail.com', '2025-05-21 21:40:19'),
(54, 'annamafarapereira@gmail.com', '2025-05-21 21:56:19'),
(55, 'giselemoura030811@gmail.com', '2025-05-21 22:02:39'),
(56, 'gresiribeiromotta@gmail.com', '2025-05-21 22:23:03'),
(57, 'tatiteixeira007@gmail.com', '2025-05-22 23:26:19'),
(58, 'sara77929@gmail.com', '2025-05-23 01:26:57'),
(59, 'monisefcrodrigues@outlook.com', '2025-05-23 10:25:50'),
(60, 'emilysantiagodasilva6@gmail.com', '2025-05-23 14:31:05'),
(61, 'annamafara04@gmail.com', '2025-05-23 16:42:57'),
(62, 'adenisaas2025@gamil.com', '2025-05-30 23:28:48');

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacoes_podcast`
--

CREATE TABLE `avaliacoes_podcast` (
  `id_avaliacao` int(11) NOT NULL,
  `id_podcast` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `nota` tinyint(4) NOT NULL CHECK (`nota` >= 1 and `nota` <= 5),
  `data_avaliacao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias_podcast`
--

CREATE TABLE `categorias_podcast` (
  `id_categoria` int(11) NOT NULL,
  `nome_categoria` varchar(150) NOT NULL,
  `descricao_categoria` text DEFAULT NULL,
  `slug_categoria` varchar(150) NOT NULL,
  `icone_categoria` varchar(255) DEFAULT NULL,
  `cor_icone` varchar(7) DEFAULT NULL,
  `data_criacao` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `categorias_podcast`
--

INSERT INTO `categorias_podcast` (`id_categoria`, `nome_categoria`, `descricao_categoria`, `slug_categoria`, `icone_categoria`, `cor_icone`, `data_criacao`) VALUES
(117, 'Introdução à Terapia Ocupacional', 'História, campos de atuação e princípios básicos da profissão.', 'introducao-terapia-ocupacional', 'fa-solid fa-book-open', '#0066cc', '2025-06-08 02:35:10'),
(118, 'Anatomia Funcional', 'Sistemas do corpo humano e sua relação com as ocupações.', 'anatomia-funcional', 'fa-solid fa-heart-pulse', '#cc0033', '2025-06-08 02:35:10'),
(119, 'Neurociência Básica', 'Fundamentos de neuroanatomia e neurofisiologia para OT.', 'neurociencia-basica', 'fa-solid fa-brain', '#009933', '2025-06-08 02:35:10'),
(120, 'Modelos e Teorias em OT', 'MOHO, CMOP-E, Biopsicossocial, CIF/OMS e afins.', 'modelos-teorias-ot', 'fa-solid fa-lightbulb', '#ff9900', '2025-06-08 02:35:10'),
(121, 'Ética e Legislação', 'Código de ética, regulamentação profissional e responsabilidade legal.', 'etica-legislacao', 'fa-solid fa-gavel', '#993399', '2025-06-08 02:35:10'),
(122, 'Avaliação Inicial', 'Triagens e escalas simples: FIM, Barthel, COPM.', 'avaliacao-inicial', 'fa-solid fa-stethoscope', '#20c997', '2025-06-08 02:35:10'),
(123, 'Avaliação Avançada', 'Testes específicos: dinamometria, MFM, AIMS, CADL.', 'avaliacao-avancada', 'fa-solid fa-vial', '#cc9900', '2025-06-08 02:35:10'),
(124, 'Intervenções em Atividades de Vida Diária (AVD)', 'Planejamento de AVD, adaptação domiciliar e treino funcional.', 'intervencoes-avd', 'fa-solid fa-hand-holding-medical', '#ff3300', '2025-06-08 02:35:10'),
(125, 'Tecnologias Assistivas', 'Órteses, próteses, recursos eletrônicos e adaptações.', 'tecnologias-assistivas', 'fa-solid fa-cogs', '#3399ff', '2025-06-08 02:35:10'),
(126, 'Ergonomia e Prevenção de Lesões', 'Postura, análise ergonômica e programas de prevenção.', 'ergonomia-prevencao', 'fa-solid fa-user-md', '#800080', '2025-06-08 02:35:10'),
(127, 'Saúde Mental em OT', 'Intervenções em saúde mental, terapia de grupo e apoio psicossocial.', 'saude-mental-ot', 'fa-solid fa-brain-circuit', '#006699', '2025-06-08 02:35:10'),
(128, 'Reabilitação Neurológica', 'Protocolos pós-AVC, TCE e doenças neurodegenerativas.', 'reabilitacao-neurologica', 'fa-solid fa-lungs', '#cc6600', '2025-06-08 02:35:10'),
(129, 'Desenvolvimento Infantil', 'Intervenção precoce, avaliação e terapia em pediatria.', 'desenvolvimento-infantil', 'fa-solid fa-child', '#0099cc', '2025-06-08 02:35:10'),
(130, 'Geriatria e Envelhecimento', 'Abordagens para idosos, demências e fragilidade.', 'geriatria-envelhecimento', 'fa-solid fa-wheelchair', '#cc0066', '2025-06-08 02:35:10'),
(131, 'Terapia de Mãos', 'Avaliação e tratamentos específicos de mão e membro superior.', 'terapia-de-maos', 'fa-solid fa-hand-paper', '#ff6600', '2025-06-08 02:35:10'),
(132, 'Integração Sensorial', 'Técnicas de SI para autismo, TDAH e distúrbios sensoriais.', 'integracao-sensorial', 'fa-solid fa-wave-square', '#33cc33', '2025-06-08 02:35:10'),
(133, 'Telereabilitação e e-health', 'Ferramentas e protocolos de OT remota.', 'telereabilitacao', 'fa-solid fa-headset', '#3366ff', '2025-06-08 02:35:10'),
(134, 'Comunicação e Relacionamento Terapêutico', 'Entrevista motivacional, rapport e trabalho em equipe.', 'comunicacao-terapeutica', 'fa-solid fa-comments', '#ff0066', '2025-06-08 02:35:10'),
(135, 'Documentação e Registro Clínico', 'Prontuário, SOAP notes e indicadores de resultado.', 'documentacao-registro', 'fa-solid fa-file-medical', '#9900cc', '2025-06-08 02:35:10'),
(136, 'Populações Especiais', 'OT em oncologia, cardiologia, diabetes e outras comorbidades.', 'populacoes-especiais', 'fa-solid fa-users-medical', '#cc3300', '2025-06-08 02:35:10'),
(137, 'Estudos de Caso Clínico', 'Análises passo a passo de casos reais.', 'estudos-caso', 'fa-solid fa-notes-medical', '#006633', '2025-06-08 02:35:10'),
(138, 'Pesquisa e Estatística', 'Métodos de pesquisa, bioestatística e crítica de artigos.', 'pesquisa-estatistica', 'fa-solid fa-flask', '#ff9900', '2025-06-08 02:35:10'),
(139, 'Liderança e Gestão de Serviços', 'Coordenação de equipes, gestão de clínicas e qualidade.', 'lideranca-gestao', 'fa-solid fa-briefcase', '#993333', '2025-06-08 02:35:10'),
(140, 'Educação e Treinamento', 'Didática, supervisão e capacitação continuada.', 'educacao-treinamento', 'fa-solid fa-chalkboard-teacher', '#009966', '2025-06-08 02:35:10'),
(141, 'Intervenções Comunitárias', 'OT no contexto escolar, trabalho e comunidade.', 'intervencoes-comunitarias', 'fa-solid fa-people-arrows', '#336633', '2025-06-08 02:35:10'),
(142, 'Saúde Ocupacional', 'Programas de prevenção e promoção em empresas.', 'saude-ocupacional', 'fa-solid fa-hard-hat', '#cc9933', '2025-06-08 02:35:10'),
(143, 'Financiamento e Políticas Públicas', 'Sistemas de saúde, planos, reembolso e acesso.', 'politicas-publicas', 'fa-solid fa-landmark', '#333399', '2025-06-08 02:35:10'),
(144, 'Ética em Pesquisa e Humanidades', 'Consentimento, comitês e abordagens qualitativas.', 'etica-pesquisa', 'fa-solid fa-book', '#660066', '2025-06-08 02:35:10'),
(145, 'Inovação e Empreendedorismo', 'Startups, desenvolvimento de apps e ideias de negócio.', 'inovacao-empreendedorismo', 'fa-solid fa-rocket', '#00cccc', '2025-06-08 02:35:10'),
(146, 'Atualização Profissional e Networking', 'Congressos, eventos e sociedades científicas.', 'atualizacao-networking', 'fa-solid fa-network-wired', '#cc00cc', '2025-06-08 02:35:10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentarios_conteudo`
--

CREATE TABLE `comentarios_conteudo` (
  `id_comentario` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `tipo_conteudo_principal` enum('podcast','oportunidade') NOT NULL,
  `id_conteudo_principal` int(11) NOT NULL,
  `id_comentario_pai` int(11) DEFAULT NULL,
  `texto_comentario` text NOT NULL,
  `data_comentario` timestamp NULL DEFAULT current_timestamp(),
  `data_ultima_edicao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `editado` tinyint(1) DEFAULT 0,
  `total_curtidas` int(11) DEFAULT 0,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `comentarios_conteudo`
--

INSERT INTO `comentarios_conteudo` (`id_comentario`, `id_utilizador`, `tipo_conteudo_principal`, `id_conteudo_principal`, `id_comentario_pai`, `texto_comentario`, `data_comentario`, `data_ultima_edicao`, `editado`, `total_curtidas`, `ativo`) VALUES
(1, 1, 'podcast', 1, NULL, 'oi', '2025-05-18 02:20:33', '2025-05-18 02:20:37', 0, 0, 0),
(2, 1, 'podcast', 1, NULL, 'oi', '2025-05-18 02:35:06', '2025-05-18 02:35:11', 0, 0, 0),
(31, 1, 'podcast', 19, NULL, 'oi', '2025-05-20 02:45:16', NULL, 0, 0, 1),
(32, 1, 'podcast', 19, NULL, 'oi', '2025-06-06 23:20:26', NULL, 0, 0, 1),
(33, 1, 'podcast', 24, NULL, 'oi', '2025-06-06 23:28:14', NULL, 0, 0, 1),
(34, 1, 'podcast', 24, NULL, 'oi', '2025-06-06 23:28:16', NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `comunidade_comentarios`
--

CREATE TABLE `comunidade_comentarios` (
  `id_comentario` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `texto` text NOT NULL,
  `data_criacao` timestamp NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `comunidade_curtidas`
--

CREATE TABLE `comunidade_curtidas` (
  `id_like` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `data_like` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `comunidade_curtidas`
--

INSERT INTO `comunidade_curtidas` (`id_like`, `id_post`, `id_utilizador`, `data_like`) VALUES
(4, 1, 1, '2025-06-09 05:52:35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `comunidade_posts`
--

CREATE TABLE `comunidade_posts` (
  `id_post` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `texto` text NOT NULL,
  `data_criacao` timestamp NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `ativo` tinyint(1) DEFAULT 1,
  `total_curtidas` int(11) DEFAULT 0,
  `total_comentarios` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `comunidade_posts`
--

INSERT INTO `comunidade_posts` (`id_post`, `id_utilizador`, `titulo`, `texto`, `data_criacao`, `data_atualizacao`, `ativo`, `total_curtidas`, `total_comentarios`) VALUES
(1, 1, 'ff', 'fff', '2025-06-05 03:02:23', '2025-06-09 05:52:35', 1, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `configuracoes_smtp`
--

CREATE TABLE `configuracoes_smtp` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL COMMENT 'Ex: Servidor Principal, SMTP Gmail',
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_user` varchar(255) NOT NULL,
  `smtp_pass` varchar(255) NOT NULL COMMENT 'Considere criptografar este campo',
  `smtp_secure` varchar(10) DEFAULT NULL COMMENT 'tls, ssl ou vazio',
  `remetente_email_padrao` varchar(255) NOT NULL,
  `remetente_nome_padrao` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 para padrão, 0 para outros',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `configuracoes_smtp`
--

INSERT INTO `configuracoes_smtp` (`id`, `descricao`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `smtp_secure`, `remetente_email_padrao`, `remetente_nome_padrao`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'SMTP Principal', 'smtp.hostinger.com', 587, 'admin@audioto.com.br', 'Aceleron0_', 'tls', 'admin@audioto.com.br', 'AudioTO - TO em áudio: aprenda onde e quando quiser', 1, '2025-05-31 02:58:26', '2025-05-31 03:14:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `curtidas_conteudo`
--

CREATE TABLE `curtidas_conteudo` (
  `id_curtida` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `tipo_conteudo` enum('podcast','oportunidade','comentario') NOT NULL,
  `id_conteudo` int(11) NOT NULL,
  `data_curtida` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `curtidas_conteudo`
--

INSERT INTO `curtidas_conteudo` (`id_curtida`, `id_utilizador`, `tipo_conteudo`, `id_conteudo`, `data_curtida`) VALUES
(62, 26, 'podcast', 24, '2025-05-25 05:28:36'),
(63, 26, 'podcast', 15, '2025-05-26 02:56:59'),
(69, 26, 'podcast', 26, '2025-05-26 04:40:09'),
(71, 26, 'podcast', 21, '2025-05-26 05:02:08'),
(72, 26, 'podcast', 20, '2025-05-26 05:08:09'),
(73, 1, 'podcast', 27, '2025-05-31 03:25:27'),
(74, 26, 'podcast', 27, '2025-06-05 02:22:36'),
(75, 1, 'podcast', 32, '2025-06-06 04:26:00'),
(77, 1, 'podcast', 19, '2025-06-06 23:20:08'),
(78, 1, 'podcast', 24, '2025-06-06 23:28:18');

-- --------------------------------------------------------

--
-- Estrutura para tabela `favoritos`
--

CREATE TABLE `favoritos` (
  `id_favorito` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `tipo_conteudo` enum('podcast','oportunidade') NOT NULL,
  `id_conteudo` int(11) NOT NULL,
  `data_favoritado` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `favoritos_oportunidade`
--

CREATE TABLE `favoritos_oportunidade` (
  `id_favorito` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `id_oportunidade` int(11) NOT NULL,
  `data_favorito` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fila_reproducao_utilizador`
--

CREATE TABLE `fila_reproducao_utilizador` (
  `id_fila` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `id_podcast` int(11) NOT NULL,
  `ordem` int(11) DEFAULT 0,
  `data_adicao` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `flashcards`
--

CREATE TABLE `flashcards` (
  `id_flashcard` int(11) NOT NULL,
  `id_assunto` int(11) NOT NULL,
  `pergunta` text NOT NULL,
  `resposta` text NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `flashcards`
--

INSERT INTO `flashcards` (`id_flashcard`, `id_assunto`, `pergunta`, `resposta`, `ativo`, `data_criacao`) VALUES
(2264, 1367, 'O que é Terapia Ocupacional?', 'É uma profissão da saúde dedicada a ajudar pessoas a desenvolver, recuperar ou manter habilidades necessárias para as atividades do dia a dia.', 1, '2025-06-11 21:26:08'),
(2265, 1367, 'Qual o principal objetivo da Terapia Ocupacional?', 'Promover autonomia e independência por meio de ocupações significativas.', 1, '2025-06-11 21:26:08'),
(2266, 1367, 'Como a Terapia Ocupacional pode contribuir para a qualidade de vida?', 'Ao adaptar tarefas e ambientes, ajudando o indivíduo a participar plenamente de suas atividades diárias.', 1, '2025-06-11 21:26:08'),
(2267, 1367, 'Em quais contextos a Terapia Ocupacional pode atuar?', 'Hospitais, escolas, domicílios, clínicas, centros de reabilitação e comunidades.', 1, '2025-06-11 21:26:08'),
(2268, 1367, 'O que significa “ocupação” para a Terapia Ocupacional?', 'São atividades cotidianas com significado e propósito para o indivíduo, como autocuidado, trabalho e lazer.', 1, '2025-06-11 21:26:08'),
(2269, 1367, 'Quem pode se beneficiar da Terapia Ocupacional?', 'Qualquer pessoa com dificuldades temporárias ou permanentes nas atividades da vida diária.', 1, '2025-06-11 21:26:08'),
(2270, 1367, 'Como a TO aborda a reabilitação de um paciente?', 'De forma holística, considerando aspectos físicos, cognitivos, emocionais e sociais.', 1, '2025-06-11 21:26:08'),
(2271, 1367, 'Qual a diferença entre Terapia Ocupacional e outras terapias?', 'A TO foca nas atividades do dia a dia e na adaptação do ambiente, priorizando a funcionalidade.', 1, '2025-06-11 21:26:08'),
(2272, 1367, 'Cite um exemplo prático de intervenção da TO.', 'Ensinar o uso de utensílios adaptados para alimentação a uma pessoa com limitação motora.', 1, '2025-06-11 21:26:08'),
(2273, 1367, 'Por que o trabalho interdisciplinar é importante na Terapia Ocupacional?', 'Porque favorece uma abordagem integral e potencializa os resultados para o paciente.', 1, '2025-06-11 21:26:08'),
(2274, 1368, 'O que significa uma abordagem centrada no cliente?', 'É colocar o paciente no centro do processo terapêutico, considerando seus valores, preferências e necessidades.', 1, '2025-06-11 21:26:08'),
(2275, 1368, 'Por que a participação do cliente é essencial na TO?', 'Porque aumenta o engajamento, a adesão ao tratamento e a satisfação com os resultados.', 1, '2025-06-11 21:26:08'),
(2276, 1368, 'Como a TO identifica os objetivos do cliente?', 'Por meio de entrevistas, escuta ativa e utilização de instrumentos padronizados de avaliação.', 1, '2025-06-11 21:26:08'),
(2277, 1368, 'O que é plano terapêutico compartilhado?', 'É o planejamento das metas e estratégias em conjunto com o cliente e sua família.', 1, '2025-06-11 21:26:08'),
(2278, 1368, 'Dê um exemplo de adaptação feita considerando a vontade do cliente.', 'Modificar uma rotina doméstica para respeitar crenças culturais ou preferências pessoais.', 1, '2025-06-11 21:26:08'),
(2279, 1368, 'Como a autonomia do cliente é respeitada na TO?', 'Dando voz ao cliente nas decisões e escolhas do tratamento.', 1, '2025-06-11 21:26:08'),
(2280, 1368, 'Qual o papel da família numa abordagem centrada no cliente?', 'Apoiar, colaborar e participar do processo terapêutico conforme as necessidades do paciente.', 1, '2025-06-11 21:26:08'),
(2281, 1368, 'Como lidar com divergências entre o cliente e a equipe?', 'Negociando e buscando consenso, sempre priorizando o melhor interesse do cliente.', 1, '2025-06-11 21:26:08'),
(2282, 1368, 'A abordagem centrada no cliente é aplicada em todas as faixas etárias?', 'Sim, adaptando-se às necessidades e possibilidades de cada fase da vida.', 1, '2025-06-11 21:26:08'),
(2283, 1368, 'Cite um benefício de envolver o cliente na escolha das atividades.', 'Aumenta a motivação e o significado das intervenções, facilitando a recuperação.', 1, '2025-06-11 21:26:08'),
(2284, 1369, 'Quando surgiu a Terapia Ocupacional como profissão?', 'No início do século XX, especialmente após a Primeira Guerra Mundial.', 1, '2025-06-11 21:26:08'),
(2285, 1369, 'Qual evento mundial contribuiu para o desenvolvimento da TO?', 'A Primeira Guerra Mundial, devido à necessidade de reabilitação de soldados feridos.', 1, '2025-06-11 21:26:08'),
(2286, 1369, 'Quem são considerados pioneiros da Terapia Ocupacional?', 'Eleanor Clarke Slagle, George Barton e outros membros fundadores da profissão.', 1, '2025-06-11 21:26:08'),
(2287, 1369, 'O que motivou a criação da Terapia Ocupacional?', 'A necessidade de ajudar pessoas a retomar a vida cotidiana após lesões ou doenças.', 1, '2025-06-11 21:26:08'),
(2288, 1369, 'Quando a Terapia Ocupacional foi regulamentada no Brasil?', 'Em 1969, com a Lei Federal nº 3.999.', 1, '2025-06-11 21:26:08'),
(2289, 1369, 'Como a TO evoluiu ao longo do tempo?', 'De uma prática artesanal e voluntária para uma profissão científica e regulamentada.', 1, '2025-06-11 21:26:08'),
(2290, 1369, 'Qual foi a primeira associação internacional da TO?', 'A World Federation of Occupational Therapists (WFOT), fundada em 1952.', 1, '2025-06-11 21:26:08'),
(2291, 1369, 'Por que a história da TO é importante para a profissão?', 'Porque resgata a identidade, os valores e a evolução dos métodos e práticas.', 1, '2025-06-11 21:26:08'),
(2292, 1369, 'Cite um marco recente para a TO no Brasil.', 'Reconhecimento do papel da TO no SUS e em equipes multidisciplinares.', 1, '2025-06-11 21:26:08'),
(2293, 1369, 'Como a TO contribuiu para a reabilitação após grandes guerras?', 'Promovendo a reinserção de soldados e civis com sequelas físicas e emocionais.', 1, '2025-06-11 21:26:08'),
(2294, 1370, 'Quais são as principais áreas de atuação do terapeuta ocupacional?', 'Saúde física, saúde mental, pediatria, geriatria, educação, trabalho e contexto social.', 1, '2025-06-11 21:26:08'),
(2295, 1370, 'Em que ambientes o terapeuta ocupacional pode trabalhar?', 'Hospitais, clínicas, escolas, centros de reabilitação, domicílios e instituições sociais.', 1, '2025-06-11 21:26:08'),
(2296, 1370, 'A TO pode atuar com pessoas com deficiência?', 'Sim, promovendo autonomia e inclusão social.', 1, '2025-06-11 21:26:08'),
(2297, 1370, 'Como a TO contribui na saúde mental?', 'Através de intervenções para autonomia, integração social e rotina saudável.', 1, '2025-06-11 21:26:08'),
(2298, 1370, 'Qual o papel do TO em reabilitação física?', 'Recuperar habilidades funcionais para as atividades da vida diária.', 1, '2025-06-11 21:26:08'),
(2299, 1370, 'O que a TO faz em ambientes escolares?', 'Auxilia alunos com dificuldades a participarem plenamente do processo educativo.', 1, '2025-06-11 21:26:08'),
(2300, 1370, 'A TO pode atuar em empresas?', 'Sim, promovendo saúde ocupacional e prevenção de lesões.', 1, '2025-06-11 21:26:08'),
(2301, 1370, 'Qual a importância da TO na geriatria?', 'Estimular o envelhecimento ativo, autonomia e prevenção de dependências.', 1, '2025-06-11 21:26:08'),
(2302, 1370, 'A atuação da TO é restrita a algum público?', 'Não, atende todas as idades e condições clínicas.', 1, '2025-06-11 21:26:08'),
(2303, 1370, 'Dê exemplo de atuação em saúde coletiva.', 'Participação em programas comunitários para promoção de saúde e inclusão.', 1, '2025-06-11 21:26:08'),
(2304, 1371, 'O mercado de trabalho para TO está em crescimento?', 'Sim, especialmente com a ampliação de políticas de inclusão e saúde.', 1, '2025-06-11 21:26:08'),
(2305, 1371, 'Onde um terapeuta ocupacional pode atuar profissionalmente?', 'Setor público, privado, terceiro setor, consultoria, docência e pesquisa.', 1, '2025-06-11 21:26:08'),
(2306, 1371, 'Quais habilidades são valorizadas no mercado de TO?', 'Empatia, criatividade, comunicação, trabalho em equipe e atualização constante.', 1, '2025-06-11 21:26:08'),
(2307, 1371, 'TO pode atuar como autônomo?', 'Sim, oferecendo atendimento domiciliar, consultoria e assessoria.', 1, '2025-06-11 21:26:08'),
(2308, 1371, 'Quais são os desafios atuais da profissão?', 'Reconhecimento profissional, remuneração adequada e ampliação de campos de atuação.', 1, '2025-06-11 21:26:08'),
(2309, 1371, 'A especialização é importante em TO?', 'Sim, permite aprofundar conhecimentos e melhorar a qualidade da atuação.', 1, '2025-06-11 21:26:08'),
(2310, 1371, 'Existe demanda para TO em saúde pública?', 'Sim, especialmente em equipes multiprofissionais do SUS e NASF.', 1, '2025-06-11 21:26:08'),
(2311, 1371, 'Como a inovação impacta a profissão?', 'Novas tecnologias e abordagens ampliam possibilidades de intervenção.', 1, '2025-06-11 21:26:08'),
(2312, 1371, 'O que esperar do futuro da TO?', 'Expansão das áreas de atuação, maior reconhecimento social e científico.', 1, '2025-06-11 21:26:08'),
(2313, 1371, 'É possível atuar internacionalmente como TO?', 'Sim, desde que atenda às exigências legais de cada país e busque certificações.', 1, '2025-06-11 21:26:08'),
(2314, 1371, 'O mercado de trabalho para TO está em crescimento?', 'Sim, especialmente com a ampliação de políticas de inclusão e saúde.', 1, '2025-06-11 21:26:08'),
(2315, 1371, 'Onde um terapeuta ocupacional pode atuar profissionalmente?', 'Setor público, privado, terceiro setor, consultoria, docência e pesquisa.', 1, '2025-06-11 21:26:08'),
(2316, 1371, 'Quais habilidades são valorizadas no mercado de TO?', 'Empatia, criatividade, comunicação, trabalho em equipe e atualização constante.', 1, '2025-06-11 21:26:08'),
(2317, 1371, 'TO pode atuar como autônomo?', 'Sim, oferecendo atendimento domiciliar, consultoria e assessoria.', 1, '2025-06-11 21:26:08'),
(2318, 1371, 'Quais são os desafios atuais da profissão?', 'Reconhecimento profissional, remuneração adequada e ampliação de campos de atuação.', 1, '2025-06-11 21:26:08'),
(2319, 1371, 'A especialização é importante em TO?', 'Sim, permite aprofundar conhecimentos e melhorar a qualidade da atuação.', 1, '2025-06-11 21:26:08'),
(2320, 1371, 'Existe demanda para TO em saúde pública?', 'Sim, especialmente em equipes multiprofissionais do SUS e NASF.', 1, '2025-06-11 21:26:08'),
(2321, 1371, 'Como a inovação impacta a profissão?', 'Novas tecnologias e abordagens ampliam possibilidades de intervenção.', 1, '2025-06-11 21:26:08'),
(2322, 1371, 'O que esperar do futuro da TO?', 'Expansão das áreas de atuação, maior reconhecimento social e científico.', 1, '2025-06-11 21:26:08'),
(2323, 1371, 'É possível atuar internacionalmente como TO?', 'Sim, desde que atenda às exigências legais de cada país e busque certificações.', 1, '2025-06-11 21:26:08'),
(2324, 1372, 'O que compõe o sistema musculoesquelético?', 'Ossos, músculos, articulações, ligamentos e tendões.', 1, '2025-06-11 21:29:25'),
(2325, 1372, 'Qual a principal função dos ossos?', 'Dar sustentação ao corpo, proteger órgãos e permitir movimento.', 1, '2025-06-11 21:29:25'),
(2326, 1372, 'Para que servem os músculos no corpo humano?', 'Permitem movimentos, postura e produção de calor.', 1, '2025-06-11 21:29:25'),
(2327, 1372, 'O que são articulações?', 'Estruturas que conectam dois ou mais ossos e permitem movimento.', 1, '2025-06-11 21:29:25'),
(2328, 1372, 'O que é esqueleto axial?', 'É formado por crânio, coluna vertebral, costelas e esterno.', 1, '2025-06-11 21:29:25'),
(2329, 1372, 'O que é esqueleto apendicular?', 'Inclui membros superiores e inferiores, cintura escapular e pélvica.', 1, '2025-06-11 21:29:25'),
(2330, 1372, 'Cite uma função dos tendões.', 'Fixar o músculo ao osso, transmitindo força para o movimento.', 1, '2025-06-11 21:29:25'),
(2331, 1372, 'Como os ligamentos atuam no corpo?', 'Unem ossos entre si, estabilizando as articulações.', 1, '2025-06-11 21:29:25'),
(2332, 1372, 'Qual a importância do sistema musculoesquelético para a TO?', 'É essencial para a análise e reabilitação do movimento e das funções diárias.', 1, '2025-06-11 21:29:25'),
(2333, 1372, 'O que pode causar alterações no sistema musculoesquelético?', 'Lesões, doenças, envelhecimento ou falta de uso.', 1, '2025-06-11 21:29:25'),
(2334, 1373, 'O que é uma articulação sinovial?', 'É uma articulação móvel, com cápsula articular e líquido sinovial, como o joelho.', 1, '2025-06-11 21:29:25'),
(2335, 1373, 'Qual a articulação mais móvel do corpo?', 'O ombro (glenoumeral).', 1, '2025-06-11 21:29:25'),
(2336, 1373, 'O que é amplitude de movimento?', 'É o grau de movimento que uma articulação permite.', 1, '2025-06-11 21:29:25'),
(2337, 1373, 'Para que serve o líquido sinovial?', 'Lubrificar a articulação e nutrir a cartilagem.', 1, '2025-06-11 21:29:25'),
(2338, 1373, 'O que é uma articulação fixa?', 'Articulação sem movimento, como as suturas do crânio.', 1, '2025-06-11 21:29:25'),
(2339, 1373, 'Cite um exemplo de articulação elipsoide.', 'O punho (radiocárpica).', 1, '2025-06-11 21:29:25'),
(2340, 1373, 'O que é flexão?', 'Movimento que diminui o ângulo entre dois ossos.', 1, '2025-06-11 21:29:25'),
(2341, 1373, 'O que é extensão?', 'Movimento que aumenta o ângulo entre dois ossos.', 1, '2025-06-11 21:29:25'),
(2342, 1373, 'O que é abdução?', 'Movimento de afastar um membro do plano médio do corpo.', 1, '2025-06-11 21:29:25'),
(2343, 1373, 'Como a TO avalia articulações?', 'Observando amplitude, força, dor e funcionalidade nos movimentos.', 1, '2025-06-11 21:29:25'),
(2344, 1374, 'Quais são as regiões da coluna vertebral?', 'Cervical, torácica, lombar, sacral e coccígea.', 1, '2025-06-11 21:29:25'),
(2345, 1374, 'Quantas vértebras possui a coluna humana?', 'Em média, 33 vértebras.', 1, '2025-06-11 21:29:25'),
(2346, 1374, 'Para que serve o disco intervertebral?', 'Absorve impactos e permite mobilidade entre as vértebras.', 1, '2025-06-11 21:29:25'),
(2347, 1374, 'O que é lordose?', 'Curvatura fisiológica da coluna cervical e lombar.', 1, '2025-06-11 21:29:25'),
(2348, 1374, 'O que é cifose?', 'Curvatura fisiológica da coluna torácica e sacral.', 1, '2025-06-11 21:29:25'),
(2349, 1374, 'Quais principais músculos do tronco auxiliam na postura?', 'Eretor da espinha, reto abdominal, oblíquos, entre outros.', 1, '2025-06-11 21:29:25'),
(2350, 1374, 'O que pode causar dor lombar?', 'Má postura, fraqueza muscular, hérnia de disco, entre outros.', 1, '2025-06-11 21:29:25'),
(2351, 1374, 'Como a TO pode atuar em alterações posturais?', 'Orientando exercícios, adaptações e cuidados ergonômicos.', 1, '2025-06-11 21:29:25'),
(2352, 1374, 'Qual a função do sacro?', 'Unir a coluna à pelve e dar estabilidade.', 1, '2025-06-11 21:29:25'),
(2353, 1374, 'Como prevenir problemas na coluna?', 'Adotando postura correta, fortalecendo músculos e evitando sobrecarga.', 1, '2025-06-11 21:29:25'),
(2354, 1374, 'Quais são as regiões da coluna vertebral?', 'Cervical, torácica, lombar, sacral e coccígea.', 1, '2025-06-11 21:29:25'),
(2355, 1374, 'Quantas vértebras possui a coluna humana?', 'Em média, 33 vértebras.', 1, '2025-06-11 21:29:25'),
(2356, 1374, 'Para que serve o disco intervertebral?', 'Absorve impactos e permite mobilidade entre as vértebras.', 1, '2025-06-11 21:29:25'),
(2357, 1374, 'O que é lordose?', 'Curvatura fisiológica da coluna cervical e lombar.', 1, '2025-06-11 21:29:25'),
(2358, 1374, 'O que é cifose?', 'Curvatura fisiológica da coluna torácica e sacral.', 1, '2025-06-11 21:29:25'),
(2359, 1374, 'Quais principais músculos do tronco auxiliam na postura?', 'Eretor da espinha, reto abdominal, oblíquos, entre outros.', 1, '2025-06-11 21:29:25'),
(2360, 1374, 'O que pode causar dor lombar?', 'Má postura, fraqueza muscular, hérnia de disco, entre outros.', 1, '2025-06-11 21:29:25'),
(2361, 1374, 'Como a TO pode atuar em alterações posturais?', 'Orientando exercícios, adaptações e cuidados ergonômicos.', 1, '2025-06-11 21:29:25'),
(2362, 1374, 'Qual a função do sacro?', 'Unir a coluna à pelve e dar estabilidade.', 1, '2025-06-11 21:29:25'),
(2363, 1374, 'Como prevenir problemas na coluna?', 'Adotando postura correta, fortalecendo músculos e evitando sobrecarga.', 1, '2025-06-11 21:29:25'),
(2364, 1375, 'Quais ossos compõem o membro superior?', 'Úmero, rádio, ulna, ossos do carpo, metacarpos e falanges.', 1, '2025-06-11 21:29:25'),
(2365, 1375, 'Qual a principal função do ombro?', 'Permitir ampla variedade de movimentos do braço.', 1, '2025-06-11 21:29:25'),
(2366, 1375, 'O que é túnel do carpo?', 'Passagem no punho por onde passam nervo mediano e tendões.', 1, '2025-06-11 21:29:25'),
(2367, 1375, 'Quais músculos são responsáveis pela flexão do cotovelo?', 'Bíceps braquial, braquial e braquiorradial.', 1, '2025-06-11 21:29:25'),
(2368, 1375, 'O que é pronação do antebraço?', 'Movimento que gira a palma da mão para baixo.', 1, '2025-06-11 21:29:25'),
(2369, 1375, 'Qual a função dos dedos na preensão?', 'Permitem segurar, manipular e explorar objetos.', 1, '2025-06-11 21:29:25'),
(2370, 1375, 'Como ocorre a extensão do punho?', 'Através da contração dos músculos extensores do antebraço.', 1, '2025-06-11 21:29:25'),
(2371, 1375, 'O que é a articulação do cotovelo?', 'Articulação entre úmero, rádio e ulna, responsável por flexão e extensão.', 1, '2025-06-11 21:29:25'),
(2372, 1375, 'Por que a integridade do membro superior é importante para a TO?', 'Porque afeta diretamente as atividades manuais e de autocuidado.', 1, '2025-06-11 21:29:25'),
(2373, 1375, 'Cite um exemplo de lesão comum no membro superior.', 'Síndrome do túnel do carpo.', 1, '2025-06-11 21:29:25'),
(2374, 1376, 'Quais ossos formam o membro inferior?', 'Fêmur, patela, tíbia, fíbula, ossos do tarso, metatarsos e falanges.', 1, '2025-06-11 21:29:25'),
(2375, 1376, 'O que é articulação do quadril?', 'Articulação entre o fêmur e o osso do quadril, responsável por grande mobilidade.', 1, '2025-06-11 21:29:25'),
(2376, 1376, 'Quais músculos realizam a extensão do joelho?', 'Quadríceps femoral.', 1, '2025-06-11 21:29:25'),
(2377, 1376, 'O que é tornozelo?', 'Articulação que conecta a perna ao pé, permitindo flexão e extensão.', 1, '2025-06-11 21:29:25'),
(2378, 1376, 'Qual a principal função do pé?', 'Dar suporte, equilíbrio e permitir a locomoção.', 1, '2025-06-11 21:29:25'),
(2379, 1376, 'O que é arco plantar?', 'Estrutura do pé que absorve impacto e distribui o peso corporal.', 1, '2025-06-11 21:29:25'),
(2380, 1376, 'O que pode causar dor no joelho?', 'Lesões ligamentares, sobrecarga, artrose, desalinhamento.', 1, '2025-06-11 21:29:25'),
(2381, 1376, 'Como a TO atua em alterações nos membros inferiores?', 'Orientando exercícios, uso de órteses e adaptações para marcha.', 1, '2025-06-11 21:29:25'),
(2382, 1376, 'O que é a marcha?', 'Sequência de movimentos que permite caminhar.', 1, '2025-06-11 21:29:25'),
(2383, 1376, 'Por que a integridade dos membros inferiores é importante?', 'Garante independência em locomoção e realização das atividades diárias.', 1, '2025-06-11 21:29:25'),
(2384, 1377, 'O que significa SNC?', 'Sistema Nervoso Central.', 1, '2025-06-11 21:36:35'),
(2385, 1377, 'Quais estruturas formam o SNC?', 'Encéfalo (cérebro, cerebelo, tronco encefálico) e medula espinhal.', 1, '2025-06-11 21:36:35'),
(2386, 1377, 'Qual a principal função do cérebro?', 'Processar informações, controlar movimentos e funções cognitivas.', 1, '2025-06-11 21:36:35'),
(2387, 1377, 'O que faz o cerebelo?', 'Coordena movimentos, equilíbrio e postura.', 1, '2025-06-11 21:36:35'),
(2388, 1377, 'Para que serve o tronco encefálico?', 'Controla funções vitais como respiração, batimentos cardíacos e reflexos.', 1, '2025-06-11 21:36:35'),
(2389, 1377, 'Qual o papel da medula espinhal?', 'Transmitir sinais entre o corpo e o cérebro.', 1, '2025-06-11 21:36:35'),
(2390, 1377, 'O que é substância branca?', 'Região do SNC rica em fibras nervosas mielinizadas, responsável pela condução rápida de sinais.', 1, '2025-06-11 21:36:35'),
(2391, 1377, 'O que é substância cinzenta?', 'Área composta principalmente por corpos de neurônios, responsável pelo processamento de informações.', 1, '2025-06-11 21:36:35'),
(2392, 1377, 'O que são meninges?', 'Membranas protetoras que envolvem o SNC.', 1, '2025-06-11 21:36:35'),
(2393, 1377, 'Qual a importância do SNC para a Terapia Ocupacional?', 'É essencial para entender movimentos, sensações e comportamentos dos pacientes.', 1, '2025-06-11 21:36:35'),
(2394, 1378, 'O que é um neurônio?', 'É a célula responsável pela transmissão de impulsos nervosos.', 1, '2025-06-11 21:36:35'),
(2395, 1378, 'Quais as partes principais de um neurônio?', 'Dendritos, corpo celular (soma) e axônio.', 1, '2025-06-11 21:36:35'),
(2396, 1378, 'O que é sinapse?', 'É a conexão entre dois neurônios, permitindo a comunicação entre eles.', 1, '2025-06-11 21:36:35'),
(2397, 1378, 'Qual substância é liberada na sinapse?', 'Neurotransmissores.', 1, '2025-06-11 21:36:35'),
(2398, 1378, 'O que são neurotransmissores?', 'Moléculas químicas que transmitem sinais entre neurônios.', 1, '2025-06-11 21:36:35'),
(2399, 1378, 'Como os neurônios transmitem sinais elétricos?', 'Através do potencial de ação.', 1, '2025-06-11 21:36:35'),
(2400, 1378, 'Qual a função da bainha de mielina?', 'Aumentar a velocidade da condução do impulso nervoso.', 1, '2025-06-11 21:36:35'),
(2401, 1378, 'O que acontece em doenças desmielinizantes?', 'A transmissão de sinais é prejudicada, como na esclerose múltipla.', 1, '2025-06-11 21:36:35'),
(2402, 1378, 'O que é plasticidade sináptica?', 'Capacidade das sinapses de se modificarem em resposta à experiência.', 1, '2025-06-11 21:36:35'),
(2403, 1378, 'Por que entender neurônios e sinapses é importante para a TO?', 'Ajuda a compreender o impacto das lesões e potencial de reabilitação.', 1, '2025-06-11 21:36:35'),
(2404, 1379, 'O que são vias sensoriais?', 'Caminhos que levam informações do corpo ao cérebro.', 1, '2025-06-11 21:36:35'),
(2405, 1379, 'O que são vias motoras?', 'Caminhos que levam comandos do cérebro aos músculos.', 1, '2025-06-11 21:36:35'),
(2406, 1379, 'Qual a principal via motora?', 'Via piramidal (trato corticoespinhal).', 1, '2025-06-11 21:36:35'),
(2407, 1379, 'Para que serve a via extrapiramidal?', 'Controla movimentos automáticos e postura.', 1, '2025-06-11 21:36:35'),
(2408, 1379, 'O que é lesão medular?', 'Dano à medula espinhal que pode comprometer vias sensoriais e motoras.', 1, '2025-06-11 21:36:35'),
(2409, 1379, 'Qual o papel dos nervos periféricos?', 'Transmitir sinais entre o SNC e o resto do corpo.', 1, '2025-06-11 21:36:35'),
(2410, 1379, 'O que acontece se uma via sensorial é lesionada?', 'Há perda de sensibilidade em determinada região do corpo.', 1, '2025-06-11 21:36:35'),
(2411, 1379, 'Como a TO utiliza o conhecimento de vias motoras?', 'Planeja reabilitação de movimentos e coordenação.', 1, '2025-06-11 21:36:35'),
(2412, 1379, 'Cite um exemplo de via sensorial.', 'Via espinotalâmica (sensação de dor e temperatura).', 1, '2025-06-11 21:36:35'),
(2413, 1379, 'Por que conhecer essas vias é essencial?', 'Permite avaliação funcional detalhada e intervenções mais precisas.', 1, '2025-06-11 21:36:35'),
(2414, 1380, 'O que é plasticidade neural?', 'Capacidade do sistema nervoso de se modificar e adaptar em resposta a experiências ou lesões.', 1, '2025-06-11 21:36:35'),
(2415, 1380, 'Como ocorre a plasticidade neural após um AVC?', 'Outras áreas do cérebro assumem funções perdidas por meio de treino e reabilitação.', 1, '2025-06-11 21:36:35'),
(2416, 1380, 'Plasticidade neural é limitada à infância?', 'Não, ocorre durante toda a vida, embora seja maior na infância.', 1, '2025-06-11 21:36:35'),
(2417, 1380, 'Como a terapia ocupacional estimula a plasticidade?', 'Oferecendo atividades repetitivas e desafiadoras para promover novas conexões neurais.', 1, '2025-06-11 21:36:35'),
(2418, 1380, 'Dê um exemplo prático de plasticidade neural.', 'Aprender a escrever com a mão não dominante após lesão.', 1, '2025-06-11 21:36:35'),
(2419, 1380, 'O que são sinapses novas?', 'Conexões recém-formadas entre neurônios durante a aprendizagem.', 1, '2025-06-11 21:36:35'),
(2420, 1380, 'Como a aprendizagem motora se relaciona à plasticidade?', 'Envolve adaptação e reorganização de circuitos neurais.', 1, '2025-06-11 21:36:35'),
(2421, 1380, 'Lesão cerebral pode ser superada totalmente?', 'Nem sempre, mas a plasticidade permite melhoras significativas.', 1, '2025-06-11 21:36:35'),
(2422, 1380, 'Qual a importância da reabilitação precoce?', 'Aumenta as chances de recuperação por aproveitar o auge da plasticidade.', 1, '2025-06-11 21:36:35'),
(2423, 1380, 'A plasticidade pode ser negativa?', 'Sim, quando o cérebro “aprende” padrões não funcionais, como movimentos compensatórios.', 1, '2025-06-11 21:36:35'),
(2424, 1381, 'O que é neurociência aplicada?', 'É o uso do conhecimento sobre o sistema nervoso para entender e melhorar o desempenho funcional das pessoas.', 1, '2025-06-11 21:36:35'),
(2425, 1381, 'Como a TO utiliza neurociência na prática clínica?', 'Planejando intervenções baseadas na reorganização cerebral e nos processos de aprendizagem.', 1, '2025-06-11 21:36:35'),
(2426, 1381, 'Dê um exemplo de aplicação da neurociência em reabilitação.', 'Treinar funções motoras com repetição para estimular novas conexões neurais.', 1, '2025-06-11 21:36:35'),
(2427, 1381, 'Como a dor é interpretada pelo cérebro?', 'É resultado da integração de sinais sensoriais e emocionais.', 1, '2025-06-11 21:36:35'),
(2428, 1381, 'A neurociência pode explicar mudanças de comportamento após lesão cerebral?', 'Sim, por meio do entendimento das áreas afetadas e suas funções.', 1, '2025-06-11 21:36:35'),
(2429, 1381, 'O que é aprendizagem motora?', 'Processo de aquisição e aperfeiçoamento de habilidades por meio de prática e repetição.', 1, '2025-06-11 21:36:35'),
(2430, 1381, 'Como o conhecimento neurocientífico ajuda na adaptação de atividades?', 'Permite criar estratégias específicas para cada limitação do paciente.', 1, '2025-06-11 21:36:35'),
(2431, 1381, 'O que é mapeamento cerebral?', 'Identificação das áreas cerebrais responsáveis por funções específicas.', 1, '2025-06-11 21:36:35'),
(2432, 1381, 'Por que a avaliação cognitiva é importante?', 'Ajuda a identificar déficits e planejar intervenções direcionadas.', 1, '2025-06-11 21:36:35'),
(2433, 1381, 'Cite uma ferramenta neurocientífica usada na TO.', 'Testes neuropsicológicos e escalas funcionais.', 1, '2025-06-11 21:36:35'),
(2434, 1382, 'O que significa MOHO?', 'Modelo de Ocupação Humana, utilizado na Terapia Ocupacional.', 1, '2025-06-11 21:39:34'),
(2435, 1382, 'Quais são os componentes principais do MOHO?', 'Volição, habituação, desempenho e ambiente.', 1, '2025-06-11 21:39:34'),
(2436, 1382, 'O que é volição no MOHO?', 'Motivação e desejo de agir e se engajar em atividades.', 1, '2025-06-11 21:39:34'),
(2437, 1382, 'O que significa habituação?', 'Processo de adquirir hábitos e rotinas na vida diária.', 1, '2025-06-11 21:39:34'),
(2438, 1382, 'Como o MOHO vê o ambiente?', 'Como fator que pode influenciar positiva ou negativamente o desempenho ocupacional.', 1, '2025-06-11 21:39:34'),
(2439, 1382, 'Como a avaliação é feita no MOHO?', 'Por meio de observação, entrevistas e escalas específicas do modelo.', 1, '2025-06-11 21:39:34'),
(2440, 1382, 'Cite um instrumento de avaliação baseado no MOHO.', 'OPHI-II (Entrevista de História Ocupacional).', 1, '2025-06-11 21:39:34'),
(2441, 1382, 'O MOHO pode ser usado em todas as faixas etárias?', 'Sim, é aplicável desde crianças até idosos.', 1, '2025-06-11 21:39:34'),
(2442, 1382, 'Qual o objetivo principal do MOHO?', 'Compreender e promover participação significativa nas ocupações do cotidiano.', 1, '2025-06-11 21:39:34'),
(2443, 1382, 'Por que o MOHO é importante na prática clínica?', 'Permite avaliação holística e centrada no cliente.', 1, '2025-06-11 21:39:34'),
(2444, 1383, 'O que significa CMOP-E?', 'Modelo Canadense de Desempenho Ocupacional e Engajamento.', 1, '2025-06-11 21:39:34'),
(2445, 1383, 'Quais são os componentes do CMOP-E?', 'Pessoa, ambiente e ocupação.', 1, '2025-06-11 21:39:34'),
(2446, 1383, 'O que é considerado ocupação no CMOP-E?', 'Atividades que dão significado à vida, como autocuidado, lazer e trabalho.', 1, '2025-06-11 21:39:34'),
(2447, 1383, 'Qual a importância do ambiente segundo o CMOP-E?', 'Ambiente influencia diretamente o desempenho ocupacional.', 1, '2025-06-11 21:39:34'),
(2448, 1383, 'Como é feita a avaliação no CMOP-E?', 'Através do COPM (Medida Canadense de Desempenho Ocupacional).', 1, '2025-06-11 21:39:34'),
(2449, 1383, 'Como o engajamento é visto no CMOP-E?', 'Como elemento central para promover saúde e bem-estar.', 1, '2025-06-11 21:39:34'),
(2450, 1383, 'CMOP-E é aplicável em quais contextos?', 'Todos: hospitalar, escolar, domiciliar e comunitário.', 1, '2025-06-11 21:39:34'),
(2451, 1383, 'Qual o diferencial do CMOP-E?', 'Valoriza a perspectiva e escolhas do cliente na terapia.', 1, '2025-06-11 21:39:34'),
(2452, 1383, 'O que significa desempenho ocupacional?', 'Realização de atividades de forma eficaz e satisfatória.', 1, '2025-06-11 21:39:34'),
(2453, 1383, 'Por que o CMOP-E é importante para a TO?', 'Fortalece a abordagem centrada no cliente e a visão holística.', 1, '2025-06-11 21:39:34'),
(2454, 1384, 'O que é a abordagem biopsicossocial?', 'Modelo que considera fatores biológicos, psicológicos e sociais na saúde.', 1, '2025-06-11 21:39:34'),
(2455, 1384, 'O que significa CIF?', 'Classificação Internacional de Funcionalidade, Incapacidade e Saúde.', 1, '2025-06-11 21:39:34'),
(2456, 1384, 'Quem desenvolveu a CIF?', 'Organização Mundial da Saúde (OMS).', 1, '2025-06-11 21:39:34'),
(2457, 1384, 'Qual objetivo da CIF?', 'Padronizar a descrição da saúde e dos fatores associados.', 1, '2025-06-11 21:39:34'),
(2458, 1384, 'Como a TO utiliza a CIF?', 'Para avaliar e descrever limitações, capacidades e participação.', 1, '2025-06-11 21:39:34'),
(2459, 1384, 'Quais domínios são avaliados pela CIF?', 'Funções e estruturas do corpo, atividades, participação, fatores ambientais.', 1, '2025-06-11 21:39:34'),
(2460, 1384, 'Como a abordagem biopsicossocial influencia o tratamento?', 'Considera o paciente como um todo, não apenas sua doença.', 1, '2025-06-11 21:39:34'),
(2461, 1384, 'Por que a CIF é importante?', 'Permite comunicação padronizada entre profissionais e sistemas de saúde.', 1, '2025-06-11 21:39:34'),
(2462, 1384, 'A abordagem biopsicossocial pode ser usada na prevenção?', 'Sim, pois considera contexto e fatores de risco ampliados.', 1, '2025-06-11 21:39:34'),
(2463, 1384, 'Cite um exemplo de aplicação da CIF.', 'Descrever as barreiras ambientais que dificultam a participação de um paciente.', 1, '2025-06-11 21:39:34'),
(2464, 1385, 'O que é ocupação centrada no desempenho?', 'Enfoque no desempenho eficaz das atividades significativas para o cliente.', 1, '2025-06-11 21:39:34'),
(2465, 1385, 'Qual o objetivo da teoria da ocupação centrada no desempenho?', 'Ajudar o cliente a alcançar participação plena em suas ocupações.', 1, '2025-06-11 21:39:34'),
(2466, 1385, 'O que significa desempenho ocupacional?', 'Capacidade de realizar tarefas do cotidiano de forma satisfatória.', 1, '2025-06-11 21:39:34'),
(2467, 1385, 'Como a TO avalia o desempenho ocupacional?', 'Por meio de observação e instrumentos padronizados.', 1, '2025-06-11 21:39:34'),
(2468, 1385, 'Qual a importância de identificar ocupações significativas?', 'Elas aumentam motivação e adesão ao tratamento.', 1, '2025-06-11 21:39:34'),
(2469, 1385, 'Essa teoria considera fatores ambientais?', 'Sim, pois o ambiente impacta o desempenho.', 1, '2025-06-11 21:39:34'),
(2470, 1385, 'Como a abordagem centrada no desempenho é implementada?', 'Com escolhas baseadas nos desejos e necessidades do cliente.', 1, '2025-06-11 21:39:34'),
(2471, 1385, 'Qual a diferença entre desempenho e capacidade?', 'Desempenho é o que se faz de fato; capacidade é o potencial para realizar.', 1, '2025-06-11 21:39:34'),
(2472, 1385, 'Por que adaptar tarefas pode ser necessário?', 'Para garantir o sucesso e a autonomia do cliente.', 1, '2025-06-11 21:39:34'),
(2473, 1385, 'Como a teoria contribui para a prática da TO?', 'Oferece base para planos terapêuticos personalizados.', 1, '2025-06-11 21:39:34'),
(2474, 1386, 'O que significa integrar modelos na TO?', 'Combinar diferentes teorias e modelos para melhor atender o paciente.', 1, '2025-06-11 21:39:34'),
(2475, 1386, 'Por que integrar modelos é importante?', 'Aumenta a flexibilidade e a eficácia das intervenções.', 1, '2025-06-11 21:39:34'),
(2476, 1386, 'Dê um exemplo de integração de modelos.', 'Utilizar o MOHO junto ao CMOP-E para avaliação e intervenção.', 1, '2025-06-11 21:39:34'),
(2477, 1386, 'Como escolher quais modelos integrar?', 'De acordo com as necessidades e contexto do cliente.', 1, '2025-06-11 21:39:34'),
(2478, 1386, 'A integração de modelos exige atualização constante?', 'Sim, pois novos modelos e evidências surgem frequentemente.', 1, '2025-06-11 21:39:34'),
(2479, 1386, 'Quais benefícios a integração traz ao cliente?', 'Intervenções mais abrangentes e personalizadas.', 1, '2025-06-11 21:39:34'),
(2480, 1386, 'O que deve ser considerado ao integrar modelos?', 'Coerência teórica, aplicabilidade e preferência do cliente.', 1, '2025-06-11 21:39:34'),
(2481, 1386, 'É possível usar abordagens biomédica e biopsicossocial juntas?', 'Sim, para uma visão integral da saúde.', 1, '2025-06-11 21:39:34'),
(2482, 1386, 'Como registrar a integração de modelos na documentação?', 'Explicitar quais modelos e abordagens estão sendo usados e por quê.', 1, '2025-06-11 21:39:34'),
(2483, 1386, 'A integração é recomendada em casos complexos?', 'Sim, pois permite múltiplas perspectivas para resolução de problemas.', 1, '2025-06-11 21:39:34'),
(2484, 1387, 'O que é o Código de Ética do Terapeuta Ocupacional?', 'É o conjunto de princípios e normas que orientam a conduta do profissional de Terapia Ocupacional.', 1, '2025-06-11 21:41:45'),
(2485, 1387, 'Por que o Código de Ética é importante para o TO?', 'Garante respeito ao paciente, à profissão e à sociedade, além de nortear decisões e condutas.', 1, '2025-06-11 21:41:45'),
(2486, 1387, 'O TO deve manter sigilo profissional?', 'Sim, o sigilo é uma obrigação ética e legal do terapeuta ocupacional.', 1, '2025-06-11 21:41:45'),
(2487, 1387, 'É permitido ao TO recusar atendimento?', 'Sim, em casos justificados e desde que não prejudique o paciente, devendo encaminhá-lo a outro profissional.', 1, '2025-06-11 21:41:45'),
(2488, 1387, 'Como o TO deve agir em casos de conflito de interesse?', 'Deve priorizar o bem-estar do paciente e agir com transparência.', 1, '2025-06-11 21:41:45'),
(2489, 1387, 'O que o Código de Ética orienta sobre propaganda profissional?', 'Deve ser verdadeira, discreta e não induzir o público ao erro.', 1, '2025-06-11 21:41:45'),
(2490, 1387, 'É permitido divulgar imagens de pacientes?', 'Somente com autorização expressa e respeitando o sigilo e a dignidade.', 1, '2025-06-11 21:41:45'),
(2491, 1387, 'O que é responsabilidade ética?', 'É cumprir as obrigações legais, morais e profissionais em todas as ações.', 1, '2025-06-11 21:41:45'),
(2492, 1387, 'Como agir diante de uma infração ética?', 'Comunicar ao conselho profissional e adotar medidas corretivas.', 1, '2025-06-11 21:41:45'),
(2493, 1387, 'Qual órgão regula o exercício ético do TO no Brasil?', 'O CREFITO e o COFFITO são responsáveis pela fiscalização e orientação ética.', 1, '2025-06-11 21:41:45'),
(2494, 1388, 'O que significa CREFITO?', 'Conselho Regional de Fisioterapia e Terapia Ocupacional.', 1, '2025-06-11 21:41:45'),
(2495, 1388, 'Qual a função do CREFITO?', 'Fiscalizar e regulamentar o exercício profissional da Fisioterapia e da Terapia Ocupacional em sua região.', 1, '2025-06-11 21:41:45'),
(2496, 1388, 'Por que a regulamentação da profissão é importante?', 'Garante a qualidade do serviço e protege a sociedade contra práticas inadequadas.', 1, '2025-06-11 21:41:45'),
(2497, 1388, 'O que é COFFITO?', 'Conselho Federal de Fisioterapia e Terapia Ocupacional, órgão nacional de regulação.', 1, '2025-06-11 21:41:45'),
(2498, 1388, 'Quais são as principais atribuições do CREFITO?', 'Registrar profissionais, fiscalizar, orientar e apurar infrações éticas.', 1, '2025-06-11 21:41:45'),
(2499, 1388, 'É obrigatório registro no CREFITO para atuar como TO?', 'Sim, o exercício da profissão exige registro ativo.', 1, '2025-06-11 21:41:45'),
(2500, 1388, 'O que acontece com quem atua sem registro?', 'Está em situação ilegal, sujeito a penalidades e multa.', 1, '2025-06-11 21:41:45'),
(2501, 1388, 'O CREFITO pode aplicar penalidades?', 'Sim, pode advertir, multar, suspender ou até cassar o registro.', 1, '2025-06-11 21:41:45'),
(2502, 1388, 'Como denunciar irregularidades profissionais?', 'Por meio dos canais oficiais do CREFITO.', 1, '2025-06-11 21:41:45'),
(2503, 1388, 'O que são resoluções do COFFITO?', 'Normas que detalham regras e procedimentos para a atuação dos profissionais.', 1, '2025-06-11 21:41:45'),
(2504, 1389, 'O que são direitos do paciente?', 'Conjunto de garantias legais e éticas voltadas à proteção e respeito ao indivíduo durante o cuidado em saúde.', 1, '2025-06-11 21:41:45'),
(2505, 1389, 'O que é consentimento informado?', 'Processo pelo qual o paciente autoriza procedimentos após receber todas as informações necessárias.', 1, '2025-06-11 21:41:45'),
(2506, 1389, 'Por que é importante obter o consentimento do paciente?', 'Garante respeito à autonomia e protege o profissional e o paciente.', 1, '2025-06-11 21:41:45'),
(2507, 1389, 'O paciente pode recusar tratamento?', 'Sim, exceto em situações que envolvam risco à vida ou saúde pública.', 1, '2025-06-11 21:41:45'),
(2508, 1389, 'Quais informações devem ser fornecidas no consentimento?', 'Riscos, benefícios, alternativas e consequências do procedimento.', 1, '2025-06-11 21:41:45'),
(2509, 1389, 'Como deve ser feito o registro do consentimento?', 'Por escrito, com assinatura do paciente e do profissional.', 1, '2025-06-11 21:41:45'),
(2510, 1389, 'Em que casos é necessário consentimento dos responsáveis?', 'Quando o paciente é menor de idade ou incapaz legalmente.', 1, '2025-06-11 21:41:45'),
(2511, 1389, 'O que é confidencialidade?', 'Dever de manter em sigilo todas as informações do paciente.', 1, '2025-06-11 21:41:45'),
(2512, 1389, 'O que acontece se o profissional não respeitar o consentimento?', 'Pode ser responsabilizado ética, civil e penalmente.', 1, '2025-06-11 21:41:45'),
(2513, 1389, 'O paciente tem direito à segunda opinião?', 'Sim, esse direito é garantido por lei.', 1, '2025-06-11 21:41:45'),
(2514, 1390, 'O que significa confidencialidade?', 'Manter em segredo todas as informações obtidas durante o atendimento.', 1, '2025-06-11 21:41:45'),
(2515, 1390, 'Qual a importância do sigilo profissional?', 'Garante confiança na relação terapêutica e protege a privacidade do paciente.', 1, '2025-06-11 21:41:45'),
(2516, 1390, 'Quais dados devem ser registrados pelo TO?', 'Dados clínicos, evolução, intervenções e informações relevantes ao tratamento.', 1, '2025-06-11 21:41:45'),
(2517, 1390, 'Como devem ser armazenados os registros do paciente?', 'De forma segura, protegendo o acesso não autorizado.', 1, '2025-06-11 21:41:45'),
(2518, 1390, 'Por quanto tempo os registros clínicos devem ser guardados?', 'De acordo com normas do COFFITO e legislações locais (geralmente 5 anos ou mais).', 1, '2025-06-11 21:41:45'),
(2519, 1390, 'É permitido compartilhar dados de pacientes?', 'Somente com autorização ou quando exigido por lei.', 1, '2025-06-11 21:41:45'),
(2520, 1390, 'O que é prontuário eletrônico?', 'Sistema informatizado para registro e gestão dos dados clínicos.', 1, '2025-06-11 21:41:45'),
(2521, 1390, 'Como garantir a segurança das informações?', 'Utilizar sistemas protegidos por senha e criptografia.', 1, '2025-06-11 21:41:45'),
(2522, 1390, 'O que fazer em caso de violação de confidencialidade?', 'Comunicar o fato, reparar o dano e adotar medidas preventivas.', 1, '2025-06-11 21:41:45'),
(2523, 1390, 'O registro inadequado pode gerar consequências?', 'Sim, incluindo infração ética e processos legais.', 1, '2025-06-11 21:41:45'),
(2524, 1391, 'O que é responsabilidade profissional?', 'É o dever de agir com competência, ética e dentro dos limites da profissão.', 1, '2025-06-11 21:41:45'),
(2525, 1391, 'Quando ocorre negligência profissional?', 'Quando o profissional deixa de cumprir suas obrigações básicas.', 1, '2025-06-11 21:41:45'),
(2526, 1391, 'O que é imprudência?', 'Agir sem cautela ou sem observar regras técnicas.', 1, '2025-06-11 21:41:45'),
(2527, 1391, 'O que é imperícia?', 'Falta de conhecimento técnico para exercer o ato profissional.', 1, '2025-06-11 21:41:45'),
(2528, 1391, 'Quais as consequências de atos irresponsáveis?', 'Processos éticos, civis e até criminais.', 1, '2025-06-11 21:41:45'),
(2529, 1391, 'O TO responde por atos de terceiros?', 'Pode responder, caso haja omissão ou conivência.', 1, '2025-06-11 21:41:45'),
(2530, 1391, 'A responsabilidade é apenas individual?', 'Pode ser compartilhada em equipes multiprofissionais.', 1, '2025-06-11 21:41:45'),
(2531, 1391, 'Como prevenir problemas de responsabilidade?', 'Atuar sempre conforme a legislação, ética e atualizar conhecimentos.', 1, '2025-06-11 21:41:45'),
(2532, 1391, 'Qual a importância dos registros para a responsabilidade?', 'Servem como prova do que foi feito e protegem o profissional.', 1, '2025-06-11 21:41:45'),
(2533, 1391, 'O TO pode se recusar a realizar procedimento não permitido?', 'Sim, é um dever ético recusar atos fora de sua competência.', 1, '2025-06-11 21:41:45'),
(2534, 1392, 'O que é a triagem funcional?', 'É a avaliação inicial das capacidades e limitações de uma pessoa para atividades diárias.', 1, '2025-06-11 22:24:50'),
(2535, 1392, 'O que significa FIM?', 'Medida de Independência Funcional, utilizada para avaliar a autonomia do paciente.', 1, '2025-06-11 22:24:50'),
(2536, 1392, 'Para que serve a escala de Barthel?', 'Avalia o grau de independência nas atividades básicas da vida diária.', 1, '2025-06-11 22:24:50'),
(2537, 1392, 'Quais atividades são avaliadas pela FIM?', 'Compreendem autocuidado, mobilidade, comunicação e cognição.', 1, '2025-06-11 22:24:50'),
(2538, 1392, 'Como a pontuação do Barthel é utilizada?', 'Quanto maior a pontuação, maior o grau de independência.', 1, '2025-06-11 22:24:50'),
(2539, 1392, 'O que indica um baixo escore na FIM?', 'Dependência significativa para realizar atividades diárias.', 1, '2025-06-11 22:24:50'),
(2540, 1392, 'Como aplicar a escala de Barthel?', 'Através de observação e entrevista sobre desempenho em tarefas básicas.', 1, '2025-06-11 22:24:50'),
(2541, 1392, 'A FIM é usada em quais contextos?', 'Hospitais, reabilitação e acompanhamento domiciliar.', 1, '2025-06-11 22:24:50'),
(2542, 1392, 'Por que a triagem funcional é importante?', 'Auxilia no planejamento do tratamento e na definição de metas realistas.', 1, '2025-06-11 22:24:50'),
(2543, 1392, 'Qual a diferença entre FIM e Barthel?', 'Ambas avaliam funcionalidade, mas FIM inclui aspectos cognitivos e sociais.', 1, '2025-06-11 22:24:50'),
(2544, 1393, 'O que é history taking?', 'É a coleta sistemática da história clínica e ocupacional do paciente.', 1, '2025-06-11 22:24:50'),
(2545, 1393, 'Por que a entrevista é importante na avaliação?', 'Permite conhecer necessidades, desejos e rotina do paciente.', 1, '2025-06-11 22:24:50'),
(2546, 1393, 'Quais dados são essenciais na entrevista inicial?', 'Dados pessoais, queixas, histórico de saúde e contexto social.', 1, '2025-06-11 22:24:50'),
(2547, 1393, 'Como garantir uma entrevista eficaz?', 'Usando escuta ativa, empatia e perguntas abertas.', 1, '2025-06-11 22:24:50'),
(2548, 1393, 'O que são perguntas abertas?', 'São questões que estimulam respostas mais elaboradas, não apenas “sim” ou “não”.', 1, '2025-06-11 22:24:50'),
(2549, 1393, 'Quando iniciar a entrevista?', 'No primeiro contato com o paciente ou responsável.', 1, '2025-06-11 22:24:50'),
(2550, 1393, 'Como registrar informações obtidas na entrevista?', 'Deve-se anotar de forma clara, organizada e objetiva.', 1, '2025-06-11 22:24:50'),
(2551, 1393, 'Quais instrumentos podem ajudar na entrevista?', 'Roteiros, formulários e escalas padronizadas.', 1, '2025-06-11 22:24:50'),
(2552, 1393, 'A entrevista pode ser adaptada?', 'Sim, conforme a faixa etária, condição clínica e contexto.', 1, '2025-06-11 22:24:50'),
(2553, 1393, 'Qual a importância da confidencialidade?', 'Garante a privacidade e confiança do paciente no processo.', 1, '2025-06-11 22:24:50'),
(2554, 1394, 'O que significa COPM?', 'Canadian Occupational Performance Measure, medida centrada no cliente.', 1, '2025-06-11 22:24:50'),
(2555, 1394, 'Para que serve o COPM?', 'Identificar, priorizar e avaliar mudanças na percepção do cliente sobre seu desempenho ocupacional.', 1, '2025-06-11 22:24:50'),
(2556, 1394, 'Como o COPM é aplicado?', 'Por meio de entrevista estruturada e autoavaliação do cliente.', 1, '2025-06-11 22:24:50'),
(2557, 1394, 'Quais áreas da vida são abordadas pelo COPM?', 'Autocuidado, produtividade e lazer.', 1, '2025-06-11 22:24:50'),
(2558, 1394, 'O que diferencia o COPM de outras avaliações?', 'Envolve diretamente o cliente na definição de metas e prioridades.', 1, '2025-06-11 22:24:50'),
(2559, 1394, 'O COPM pode ser usado em qualquer idade?', 'Sim, adaptando a linguagem e abordagem conforme o público.', 1, '2025-06-11 22:24:50'),
(2560, 1394, 'Como registrar resultados do COPM?', 'Através de escores e notas de progresso ao longo do tempo.', 1, '2025-06-11 22:24:50'),
(2561, 1394, 'Qual a vantagem de usar o COPM na TO?', 'Promove engajamento, autonomia e satisfação do cliente.', 1, '2025-06-11 22:24:50'),
(2562, 1394, 'O COPM é utilizado só na avaliação inicial?', 'Não, pode ser reaplicado para medir evolução durante o tratamento.', 1, '2025-06-11 22:24:50'),
(2563, 1394, 'Por que o COPM é considerado centrado no cliente?', 'Porque respeita escolhas, valores e preferências individuais.', 1, '2025-06-11 22:24:50'),
(2564, 1395, 'O que são escalas de qualidade de vida?', 'Instrumentos para avaliar o bem-estar físico, psicológico e social de uma pessoa.', 1, '2025-06-11 22:24:50'),
(2565, 1395, 'Cite uma escala de qualidade de vida utilizada em saúde.', 'SF-36 (Short Form Health Survey).', 1, '2025-06-11 22:24:50'),
(2566, 1395, 'Por que medir a qualidade de vida?', 'Para compreender o impacto da doença ou deficiência na vida do paciente.', 1, '2025-06-11 22:24:50'),
(2567, 1395, 'A qualidade de vida influencia o tratamento?', 'Sim, pode afetar motivação, adesão e resultados terapêuticos.', 1, '2025-06-11 22:24:50'),
(2568, 1395, 'Como aplicar uma escala de qualidade de vida?', 'Por meio de questionários, entrevistas e observação.', 1, '2025-06-11 22:24:50'),
(2569, 1395, 'Qual o papel da TO na promoção da qualidade de vida?', 'Ajudar o paciente a retomar papéis sociais e atividades significativas.', 1, '2025-06-11 22:24:50'),
(2570, 1395, 'Escalas de qualidade de vida são padronizadas?', 'Sim, permitindo comparações entre grupos e períodos.', 1, '2025-06-11 22:24:50'),
(2571, 1395, 'Como registrar resultados dessas escalas?', 'Em gráficos, relatórios e evolução clínica.', 1, '2025-06-11 22:24:50'),
(2572, 1395, 'Qual a relação entre funcionalidade e qualidade de vida?', 'Quanto maior a funcionalidade, melhor tende a ser a qualidade de vida.', 1, '2025-06-11 22:24:50'),
(2573, 1395, 'Essas escalas são usadas só na reabilitação?', 'Não, também em prevenção e promoção de saúde.', 1, '2025-06-11 22:24:50'),
(2574, 1396, 'O que é um relatório de avaliação inicial?', 'Documento que reúne os dados coletados na primeira avaliação do paciente.', 1, '2025-06-11 22:24:50'),
(2575, 1396, 'Qual a importância do relatório inicial?', 'Serve como base para o planejamento terapêutico e acompanhamento da evolução.', 1, '2025-06-11 22:24:50'),
(2576, 1396, 'Quais informações devem constar no relatório?', 'Dados pessoais, história clínica, avaliação funcional e objetivos.', 1, '2025-06-11 22:24:50'),
(2577, 1396, 'O relatório inicial deve ser padronizado?', 'Sim, para garantir clareza, objetividade e facilitar a comunicação.', 1, '2025-06-11 22:24:50'),
(2578, 1396, 'Como garantir a confidencialidade do relatório?', 'Armazenar em local seguro e restringir o acesso.', 1, '2025-06-11 22:24:50'),
(2579, 1396, 'Relatório inicial pode ser usado legalmente?', 'Sim, como documento em processos judiciais ou administrativos.', 1, '2025-06-11 22:24:50'),
(2580, 1396, 'Qual a periodicidade da atualização do relatório?', 'Conforme evolução do paciente ou novas avaliações.', 1, '2025-06-11 22:24:50'),
(2581, 1396, 'Relatório pode ser compartilhado?', 'Apenas com consentimento do paciente ou responsável.', 1, '2025-06-11 22:24:50'),
(2582, 1396, 'O que fazer em caso de erro no relatório?', 'Registrar a correção, justificando o motivo.', 1, '2025-06-11 22:24:50'),
(2583, 1396, 'Qual o papel do relatório na equipe multiprofissional?', 'Facilita integração e definição de condutas conjuntas.', 1, '2025-06-11 22:24:50'),
(2584, 1397, 'O que é dinamometria?', 'É o teste utilizado para medir a força muscular.', 1, '2025-06-11 22:31:49'),
(2585, 1397, 'Para que serve o dinamômetro?', 'Para quantificar a força de preensão manual ou de outros grupos musculares.', 1, '2025-06-11 22:31:49'),
(2586, 1397, 'Como a força muscular é classificada?', 'Geralmente em escalas de 0 a 5, onde 5 é força normal.', 1, '2025-06-11 22:31:49'),
(2587, 1397, 'Qual instrumento mede a força de preensão da mão?', 'Dinamômetro manual.', 1, '2025-06-11 22:31:49'),
(2588, 1397, 'Por que medir força muscular na reabilitação?', 'Para acompanhar evolução e planejar intervenções adequadas.', 1, '2025-06-11 22:31:49'),
(2589, 1397, 'O que pode interferir no resultado da dinamometria?', 'Dor, fadiga, falta de cooperação ou técnica incorreta.', 1, '2025-06-11 22:31:49'),
(2590, 1397, 'Como realizar dinamometria corretamente?', 'Posicionando o paciente adequadamente e seguindo protocolo padronizado.', 1, '2025-06-11 22:31:49'),
(2591, 1397, 'Em que situações a força muscular pode estar diminuída?', 'Lesões nervosas, doenças musculares, imobilização prolongada.', 1, '2025-06-11 22:31:49'),
(2592, 1397, 'Como registrar o resultado da dinamometria?', 'Em quilogramas, libras ou percentual esperado para idade/gênero.', 1, '2025-06-11 22:31:49'),
(2593, 1397, 'A avaliação da força muscular é importante para TO?', 'Sim, orienta o planejamento de exercícios e adaptações.', 1, '2025-06-11 22:31:49'),
(2594, 1398, 'O que significa MFM?', 'Medida de Função Motora Fina.', 1, '2025-06-11 22:31:49'),
(2595, 1398, 'O que avalia a função motora fina?', 'Coordenação, destreza e precisão dos movimentos das mãos e dedos.', 1, '2025-06-11 22:31:49'),
(2596, 1398, 'Por que avaliar a motricidade fina?', 'Para identificar dificuldades em atividades como escrita, abotoar roupas ou manipular objetos.', 1, '2025-06-11 22:31:49');
INSERT INTO `flashcards` (`id_flashcard`, `id_assunto`, `pergunta`, `resposta`, `ativo`, `data_criacao`) VALUES
(2597, 1398, 'Dê um exemplo de teste de motricidade fina.', 'Teste dos nove pinos ou teste de rosca e porca.', 1, '2025-06-11 22:31:49'),
(2598, 1398, 'Quais fatores podem afetar a função motora fina?', 'Lesões neurológicas, artrite, doenças musculares ou desenvolvimento infantil atrasado.', 1, '2025-06-11 22:31:49'),
(2599, 1398, 'Como a TO pode melhorar a motricidade fina?', 'Através de exercícios, jogos terapêuticos e adaptações de utensílios.', 1, '2025-06-11 22:31:49'),
(2600, 1398, 'A motricidade fina é importante para quais atividades?', 'Escrita, alimentação, higiene pessoal e uso de tecnologia.', 1, '2025-06-11 22:31:49'),
(2601, 1398, 'Qual a diferença entre motricidade fina e grossa?', 'A fina envolve movimentos pequenos e precisos; a grossa, grandes grupos musculares.', 1, '2025-06-11 22:31:49'),
(2602, 1398, 'Como registrar o desempenho em MFM?', 'Com escalas padronizadas, tempo de execução ou observação qualitativa.', 1, '2025-06-11 22:31:49'),
(2603, 1398, 'A avaliação de MFM pode ser usada em crianças?', 'Sim, é fundamental para diagnóstico e intervenção precoce.', 1, '2025-06-11 22:31:49'),
(2604, 1399, 'O que significa AIMS?', 'Alberta Infant Motor Scale, utilizada para avaliar desenvolvimento motor de bebês.', 1, '2025-06-11 22:31:49'),
(2605, 1399, 'Para que serve a AIMS?', 'Detectar atrasos ou alterações no desenvolvimento motor infantil.', 1, '2025-06-11 22:31:49'),
(2606, 1399, 'Em que faixa etária a AIMS é indicada?', 'Do nascimento até 18 meses de idade.', 1, '2025-06-11 22:31:49'),
(2607, 1399, 'Como a avaliação AIMS é realizada?', 'Observando posturas e movimentos espontâneos do bebê em diferentes posições.', 1, '2025-06-11 22:31:49'),
(2608, 1399, 'Quais são as posições avaliadas na AIMS?', 'Supino, prono, sentado e em pé.', 1, '2025-06-11 22:31:49'),
(2609, 1399, 'Qual a vantagem da AIMS?', 'É rápida, não invasiva e baseada na observação natural do bebê.', 1, '2025-06-11 22:31:49'),
(2610, 1399, 'O que um baixo escore na AIMS pode indicar?', 'Atraso motor ou risco para alterações no desenvolvimento.', 1, '2025-06-11 22:31:49'),
(2611, 1399, 'Como registrar resultados da AIMS?', 'Atribuindo pontos para cada item observado e somando o total.', 1, '2025-06-11 22:31:49'),
(2612, 1399, 'A AIMS pode ser usada para acompanhar evolução?', 'Sim, pode ser repetida periodicamente para monitorar progresso.', 1, '2025-06-11 22:31:49'),
(2613, 1399, 'Por que a avaliação motora precoce é importante?', 'Permite intervenção rápida e melhora prognóstico.', 1, '2025-06-11 22:31:49'),
(2614, 1400, 'O que significa CADL?', 'Capacidade de Atividades de Vida Diária.', 1, '2025-06-11 22:31:49'),
(2615, 1400, 'Quais atividades fazem parte das AVD?', 'Alimentação, higiene pessoal, banho, vestir-se, mobilidade e continência.', 1, '2025-06-11 22:31:49'),
(2616, 1400, 'Por que avaliar AVD?', 'Para identificar grau de independência e necessidade de suporte.', 1, '2025-06-11 22:31:49'),
(2617, 1400, 'O que são atividades instrumentais de vida diária?', 'Atividades como usar telefone, preparar refeições, administrar dinheiro e tomar remédios.', 1, '2025-06-11 22:31:49'),
(2618, 1400, 'Como é feita a avaliação das AVDs?', 'Através de observação, questionários e entrevistas.', 1, '2025-06-11 22:31:49'),
(2619, 1400, 'Como registrar os resultados das AVD?', 'Utilizando escalas padronizadas e evolução no prontuário.', 1, '2025-06-11 22:31:49'),
(2620, 1400, 'O que indica dependência em AVD?', 'Necessidade de auxílio parcial ou total para realizar atividades básicas.', 1, '2025-06-11 22:31:49'),
(2621, 1400, 'A avaliação das AVDs é importante em quais contextos?', 'Reabilitação, geriatria, neurologia e saúde mental.', 1, '2025-06-11 22:31:49'),
(2622, 1400, 'Quais fatores podem interferir nas AVDs?', 'Limitações físicas, cognitivas, emocionais ou ambientais.', 1, '2025-06-11 22:31:49'),
(2623, 1400, 'Como a TO pode promover independência nas AVDs?', 'Por meio de adaptações, treinamentos e uso de tecnologias assistivas.', 1, '2025-06-11 22:31:49'),
(2624, 1401, 'Por que é importante interpretar resultados da avaliação?', 'Para identificar necessidades, planejar intervenções e monitorar progresso.', 1, '2025-06-11 22:31:49'),
(2625, 1401, 'O que significa escore baixo em um teste?', 'Indica maior grau de comprometimento ou dependência.', 1, '2025-06-11 22:31:49'),
(2626, 1401, 'Como comparar resultados de diferentes avaliações?', 'Analisando tendências, diferenças e similaridades nos desempenhos.', 1, '2025-06-11 22:31:49'),
(2627, 1401, 'Quais fatores podem influenciar resultados?', 'Motivação, fadiga, dor, ambiente e instruções.', 1, '2025-06-11 22:31:49'),
(2628, 1401, 'O que fazer diante de resultados inconsistentes?', 'Repetir a avaliação, revisar metodologia e considerar fatores externos.', 1, '2025-06-11 22:31:49'),
(2629, 1401, 'Como registrar interpretações de resultados?', 'No prontuário, com linguagem clara, objetiva e fundamentada.', 1, '2025-06-11 22:31:49'),
(2630, 1401, 'O que são metas terapêuticas baseadas em resultados?', 'Objetivos realistas definidos conforme a avaliação do paciente.', 1, '2025-06-11 22:31:49'),
(2631, 1401, 'Como comunicar resultados ao paciente e família?', 'De forma simples, respeitosa e aberta a esclarecimentos.', 1, '2025-06-11 22:31:49'),
(2632, 1401, 'A interpretação de resultados pode influenciar o prognóstico?', 'Sim, pois determina estratégias e expectativas do tratamento.', 1, '2025-06-11 22:31:49'),
(2633, 1401, 'Por que discutir resultados com a equipe multiprofissional?', 'Para alinhar condutas e promover reabilitação integrada.', 1, '2025-06-11 22:31:49'),
(2634, 1402, 'O que são adaptações domiciliares?', 'Mudanças no ambiente da casa para promover segurança, acessibilidade e independência.', 1, '2025-06-11 22:41:56'),
(2635, 1402, 'Cite um exemplo de adaptação para banheiro.', 'Instalação de barras de apoio e tapetes antiderrapantes.', 1, '2025-06-11 22:41:56'),
(2636, 1402, 'Por que adaptar o domicílio?', 'Para prevenir acidentes e facilitar a realização de atividades diárias.', 1, '2025-06-11 22:41:56'),
(2637, 1402, 'Como a TO identifica necessidades de adaptação?', 'Avaliando as dificuldades e riscos do paciente em casa.', 1, '2025-06-11 22:41:56'),
(2638, 1402, 'O que são rampas de acesso?', 'Estruturas que substituem degraus, facilitando entrada e saída para pessoas com mobilidade reduzida.', 1, '2025-06-11 22:41:56'),
(2639, 1402, 'Quais adaptações podem ser feitas na cozinha?', 'Bancadas rebaixadas, utensílios adaptados e organização acessível.', 1, '2025-06-11 22:41:56'),
(2640, 1402, 'A iluminação influencia na autonomia?', 'Sim, boa iluminação reduz riscos e facilita o desempenho das tarefas.', 1, '2025-06-11 22:41:56'),
(2641, 1402, 'Como adaptar quartos para idosos?', 'Eliminando obstáculos, usando camas com altura adequada e criando rotas de fácil circulação.', 1, '2025-06-11 22:41:56'),
(2642, 1402, 'Qual o papel do TO nas adaptações domiciliares?', 'Avaliar, orientar e planejar mudanças adequadas ao perfil do paciente.', 1, '2025-06-11 22:41:56'),
(2643, 1402, 'Adaptações domiciliares devem considerar opinião do paciente?', 'Sim, as preferências e necessidades individuais são fundamentais.', 1, '2025-06-11 22:41:56'),
(2644, 1403, 'O que são transferências em TO?', 'Mudanças de posição, como passar da cama para a cadeira ou do chão para a cama.', 1, '2025-06-11 22:41:56'),
(2645, 1403, 'Por que treinar transferências?', 'Para garantir segurança e independência ao paciente.', 1, '2025-06-11 22:41:56'),
(2646, 1403, 'Cite uma técnica de transferência segura.', 'Uso do apoio dos braços e movimentos coordenados para evitar quedas.', 1, '2025-06-11 22:41:56'),
(2647, 1403, 'Quando indicar treino de transferências?', 'Quando o paciente apresenta dificuldade ou risco ao realizar mudanças de posição.', 1, '2025-06-11 22:41:56'),
(2648, 1403, 'Quais equipamentos podem ajudar nas transferências?', 'Pranchas de transferência, barras de apoio e cadeiras com rodas.', 1, '2025-06-11 22:41:56'),
(2649, 1403, 'Como evitar lesões durante transferências?', 'Orientando postura correta e uso de equipamentos de auxílio.', 1, '2025-06-11 22:41:56'),
(2650, 1403, 'Treino de transferências é importante para quem?', 'Idosos, pessoas com deficiência física ou após lesões.', 1, '2025-06-11 22:41:56'),
(2651, 1403, 'Como registrar evolução no treino de transferências?', 'Através de observação, anotações e escalas funcionais.', 1, '2025-06-11 22:41:56'),
(2652, 1403, 'Família pode ser envolvida no treino?', 'Sim, deve ser orientada para garantir continuidade e segurança.', 1, '2025-06-11 22:41:56'),
(2653, 1403, 'Transferências independentes contribuem para quê?', 'Aumentam autoestima e autonomia do paciente.', 1, '2025-06-11 22:41:56'),
(2654, 1404, 'O que são atividades instrumentais de vida diária (AIVD)?', 'Atividades mais complexas, como preparar refeições, usar telefone, cuidar do dinheiro e da casa.', 1, '2025-06-11 22:41:56'),
(2655, 1404, 'Por que avaliar AIVD?', 'Para identificar limitações que afetam a independência fora de casa.', 1, '2025-06-11 22:41:56'),
(2656, 1404, 'Como treinar uso de transporte público?', 'Simulando trajetos, orientando leitura de horários e adaptação a rotinas.', 1, '2025-06-11 22:41:56'),
(2657, 1404, 'Quais recursos podem ajudar na administração de medicamentos?', 'Organizadores de comprimidos, alarmes e lembretes visuais.', 1, '2025-06-11 22:41:56'),
(2658, 1404, 'Como a TO pode atuar no preparo de refeições?', 'Ensinando técnicas seguras e adaptando utensílios.', 1, '2025-06-11 22:41:56'),
(2659, 1404, 'AIVD são importantes para qual público?', 'Idosos, pessoas em reabilitação, autistas, TDAH e quem busca autonomia ampliada.', 1, '2025-06-11 22:41:56'),
(2660, 1404, 'Quais adaptações para comunicação telefônica?', 'Uso de telefones de teclas grandes, agenda visual e orientações passo a passo.', 1, '2025-06-11 22:41:56'),
(2661, 1404, 'Como registrar progresso em AIVD?', 'Por meio de escalas, observação direta e relatos do paciente.', 1, '2025-06-11 22:41:56'),
(2662, 1404, 'Dê um exemplo de adaptação para limpeza da casa.', 'Uso de ferramentas leves, cabos alongados e divisão de tarefas.', 1, '2025-06-11 22:41:56'),
(2663, 1404, 'Independência em AIVD impacta como a vida do paciente?', 'Aumenta inclusão social, autoestima e participação ativa na comunidade.', 1, '2025-06-11 22:41:56'),
(2664, 1405, 'O que são tecnologias de suporte para AVD?', 'Equipamentos, dispositivos e adaptações que facilitam a realização das atividades diárias.', 1, '2025-06-11 22:41:56'),
(2665, 1405, 'Cite um exemplo de tecnologia de suporte para alimentação.', 'Talheres adaptados com cabos grossos e antiderrapantes.', 1, '2025-06-11 22:41:56'),
(2666, 1405, 'Como a tecnologia pode auxiliar no banho?', 'Cadeiras de banho, barras de apoio e duchas manuais.', 1, '2025-06-11 22:41:56'),
(2667, 1405, 'O que são órteses?', 'Dispositivos que estabilizam, apoiam ou auxiliam um membro durante as atividades.', 1, '2025-06-11 22:41:56'),
(2668, 1405, 'Tecnologias digitais podem ser usadas nas AVD?', 'Sim, como lembretes eletrônicos, aplicativos de rotina e agendas digitais.', 1, '2025-06-11 22:41:56'),
(2669, 1405, 'Quais adaptações para vestuário podem ser feitas?', 'Botões magnéticos, zíperes fáceis e sapatos com velcro.', 1, '2025-06-11 22:41:56'),
(2670, 1405, 'A tecnologia de suporte é só para idosos?', 'Não, pode beneficiar qualquer pessoa com limitação funcional.', 1, '2025-06-11 22:41:56'),
(2671, 1405, 'Como o TO seleciona a tecnologia adequada?', 'Avalia as necessidades, preferências e contexto do paciente.', 1, '2025-06-11 22:41:56'),
(2672, 1405, 'As tecnologias devem ser testadas antes?', 'Sim, para garantir adaptação e segurança.', 1, '2025-06-11 22:41:56'),
(2673, 1405, 'Quais cuidados ao prescrever tecnologia de suporte?', 'Treinar o uso correto e monitorar possíveis dificuldades.', 1, '2025-06-11 22:41:56'),
(2674, 1406, 'O que é avaliação da efetividade?', 'Processo para verificar se as intervenções alcançaram os objetivos planejados.', 1, '2025-06-11 22:41:56'),
(2675, 1406, 'Por que avaliar a efetividade das intervenções?', 'Para ajustar condutas e garantir melhores resultados.', 1, '2025-06-11 22:41:56'),
(2676, 1406, 'Como medir a efetividade em AVD?', 'Comparando desempenho antes e depois das intervenções, usando escalas padronizadas.', 1, '2025-06-11 22:41:56'),
(2677, 1406, 'Quais instrumentos podem ser utilizados?', 'Escalas de independência, questionários de satisfação e relatos do paciente.', 1, '2025-06-11 22:41:56'),
(2678, 1406, 'A opinião do paciente é importante na avaliação?', 'Sim, ele deve relatar percepções sobre avanços e dificuldades.', 1, '2025-06-11 22:41:56'),
(2679, 1406, 'Como registrar a efetividade?', 'Em relatórios, gráficos de evolução e feedbacks periódicos.', 1, '2025-06-11 22:41:56'),
(2680, 1406, 'A avaliação é feita apenas no final?', 'Não, deve ser contínua para ajustes durante o tratamento.', 1, '2025-06-11 22:41:56'),
(2681, 1406, 'O que fazer se não houver progresso?', 'Reavaliar estratégias, objetivos e considerar novas adaptações.', 1, '2025-06-11 22:41:56'),
(2682, 1406, 'Por que envolver a família na avaliação?', 'Ajuda a identificar avanços percebidos no cotidiano.', 1, '2025-06-11 22:41:56'),
(2683, 1406, 'Efetividade nas AVDs impacta o quê?', 'Qualidade de vida, autonomia e participação social do paciente.', 1, '2025-06-11 22:41:56'),
(2684, 1407, 'O que são órteses?', 'Dispositivos usados para apoiar, alinhar ou corrigir deformidades de partes do corpo.', 1, '2025-06-11 22:41:56'),
(2685, 1407, 'O que são próteses?', 'Aparelhos que substituem total ou parcialmente um membro ou segmento ausente.', 1, '2025-06-11 22:41:56'),
(2686, 1407, 'Cite um exemplo de órtese de membro superior.', 'Taladeira para punho, utilizada em lesões do nervo radial.', 1, '2025-06-11 22:41:56'),
(2687, 1407, 'Como a TO atua na adaptação de próteses?', 'Treinando o paciente para uso funcional e autonomia.', 1, '2025-06-11 22:41:56'),
(2688, 1407, 'Órteses são apenas para membros?', 'Não, podem ser usadas em coluna, pés, mãos, etc.', 1, '2025-06-11 22:41:56'),
(2689, 1407, 'Qual o objetivo do uso de órtese?', 'Promover função, prevenir deformidades e aliviar dor.', 1, '2025-06-11 22:41:56'),
(2690, 1407, 'Como avaliar a necessidade de prótese?', 'Analisando a funcionalidade e potencial de reabilitação do paciente.', 1, '2025-06-11 22:41:56'),
(2691, 1407, 'Próteses podem ser personalizadas?', 'Sim, são feitas sob medida para atender necessidades individuais.', 1, '2025-06-11 22:41:56'),
(2692, 1407, 'A adaptação de órteses é definitiva?', 'Pode ser temporária ou permanente, dependendo do caso.', 1, '2025-06-11 22:41:56'),
(2693, 1407, 'O que considerar ao prescrever órtese/prótese?', 'Conforto, funcionalidade, aceitação e objetivos terapêuticos.', 1, '2025-06-11 22:41:56'),
(2694, 1408, 'O que são recursos eletrônicos adaptativos?', 'Dispositivos eletrônicos modificados para facilitar o uso por pessoas com limitações.', 1, '2025-06-11 22:41:56'),
(2695, 1408, 'Cite um exemplo de recurso eletrônico adaptativo.', 'Teclado ampliado para pessoas com dificuldade motora.', 1, '2025-06-11 22:41:56'),
(2696, 1408, 'Como a tecnologia assistiva pode ajudar na comunicação?', 'Através de softwares e aplicativos de comunicação alternativa.', 1, '2025-06-11 22:41:56'),
(2697, 1408, 'Quais adaptações podem ser feitas em computadores?', 'Mouse adaptado, softwares leitores de tela e comandos por voz.', 1, '2025-06-11 22:41:56'),
(2698, 1408, 'Quem pode se beneficiar desses recursos?', 'Pessoas com deficiência física, visual, intelectual ou múltipla.', 1, '2025-06-11 22:41:56'),
(2699, 1408, 'Como avaliar a necessidade de recurso eletrônico adaptativo?', 'Analisando limitações, habilidades e demandas do cotidiano.', 1, '2025-06-11 22:41:56'),
(2700, 1408, 'Quais são os benefícios desses dispositivos?', 'Maior autonomia, inclusão digital e participação social.', 1, '2025-06-11 22:41:56'),
(2701, 1408, 'Recursos eletrônicos adaptativos são caros?', 'Existem opções acessíveis e até gratuitas, dependendo da necessidade.', 1, '2025-06-11 22:41:56'),
(2702, 1408, 'É necessário treinamento para usar esses recursos?', 'Sim, para garantir uso eficiente e seguro.', 1, '2025-06-11 22:41:56'),
(2703, 1408, 'A família deve participar do processo de adaptação?', 'Sim, para apoiar e incentivar o uso dos dispositivos.', 1, '2025-06-11 22:41:56'),
(2704, 1409, 'O que são softwares de acessibilidade?', 'Programas desenvolvidos para facilitar o uso de dispositivos digitais por pessoas com deficiência.', 1, '2025-06-11 22:41:56'),
(2705, 1409, 'Cite um aplicativo útil para acessibilidade.', 'Leitor de tela para pessoas com deficiência visual.', 1, '2025-06-11 22:41:56'),
(2706, 1409, 'Qual a importância dos apps de acessibilidade?', 'Promovem independência, comunicação e acesso à informação.', 1, '2025-06-11 22:41:56'),
(2707, 1409, 'Softwares de acessibilidade são compatíveis com todos os dispositivos?', 'Nem sempre, é preciso verificar requisitos técnicos.', 1, '2025-06-11 22:41:56'),
(2708, 1409, 'Quais recursos um app de acessibilidade pode ter?', 'Comandos por voz, legendas automáticas, ampliação de texto, etc.', 1, '2025-06-11 22:41:56'),
(2709, 1409, 'Como selecionar o melhor app para o paciente?', 'Avaliando suas necessidades, habilidades e preferências.', 1, '2025-06-11 22:41:56'),
(2710, 1409, 'Apps de acessibilidade podem ser gratuitos?', 'Sim, muitas opções são gratuitas ou de baixo custo.', 1, '2025-06-11 22:41:56'),
(2711, 1409, 'Quais cuidados ao instalar apps de acessibilidade?', 'Verificar segurança, compatibilidade e facilidade de uso.', 1, '2025-06-11 22:41:56'),
(2712, 1409, 'Como a TO pode apoiar o uso desses softwares?', 'Orientando, treinando e ajustando conforme o progresso do paciente.', 1, '2025-06-11 22:41:56'),
(2713, 1409, 'Apps de acessibilidade ajudam apenas na tecnologia?', 'Não, também contribuem para educação, lazer e vida social.', 1, '2025-06-11 22:41:56'),
(2714, 1410, 'O que é tecnologia vestível?', 'Dispositivos eletrônicos usados no corpo para monitoramento ou assistência.', 1, '2025-06-11 22:41:56'),
(2715, 1410, 'Cite um exemplo de tecnologia vestível.', 'Relógios inteligentes para monitorar sinais vitais.', 1, '2025-06-11 22:41:56'),
(2716, 1410, 'Como a tecnologia vestível auxilia na TO?', 'Permite monitoramento de atividades, envio de alertas e feedback em tempo real.', 1, '2025-06-11 22:41:56'),
(2717, 1410, 'Tecnologia vestível é útil em qual público?', 'Pessoas com risco de quedas, idosos, pacientes em reabilitação.', 1, '2025-06-11 22:41:56'),
(2718, 1410, 'Pode-se usar sensores de movimento em terapia?', 'Sim, para acompanhar progresso e adaptar intervenções.', 1, '2025-06-11 22:41:56'),
(2719, 1410, 'Qual o benefício de roupas adaptadas?', 'Facilitam o vestir e aumentam autonomia em AVD.', 1, '2025-06-11 22:41:56'),
(2720, 1410, 'Como a tecnologia vestível pode prevenir acidentes?', 'Emitindo alertas em caso de quedas ou eventos inesperados.', 1, '2025-06-11 22:41:56'),
(2721, 1410, 'Quais cuidados ao recomendar tecnologia vestível?', 'Conforto, usabilidade e adaptação à rotina do usuário.', 1, '2025-06-11 22:41:56'),
(2722, 1410, 'Essas tecnologias exigem manutenção?', 'Sim, é preciso carregar baterias e checar o funcionamento regularmente.', 1, '2025-06-11 22:41:56'),
(2723, 1410, 'Tecnologia vestível pode ser integrada a outros sistemas?', 'Sim, conectando-se a celulares, computadores e sistemas de saúde.', 1, '2025-06-11 22:41:56'),
(2724, 1411, 'O que é inteligência artificial (IA) em tecnologia assistiva?', 'Uso de sistemas computacionais para auxiliar pessoas com deficiência em atividades diárias.', 1, '2025-06-11 22:41:56'),
(2725, 1411, 'Cite um exemplo de IA aplicada à acessibilidade.', 'Leitores automáticos de texto para deficientes visuais.', 1, '2025-06-11 22:41:56'),
(2726, 1411, 'Como a IA pode ajudar na comunicação?', 'Traduzindo voz em texto, facilitando a comunicação alternativa.', 1, '2025-06-11 22:41:56'),
(2727, 1411, 'Quais são os benefícios da IA em assistência?', 'Personalização, autonomia e aumento da eficiência de intervenções.', 1, '2025-06-11 22:41:56'),
(2728, 1411, 'IA pode ser usada na reabilitação?', 'Sim, com softwares adaptativos e robôs de apoio terapêutico.', 1, '2025-06-11 22:41:56'),
(2729, 1411, 'IA é acessível a todos?', 'Nem sempre, pois pode depender de recursos financeiros e conhecimento.', 1, '2025-06-11 22:41:56'),
(2730, 1411, 'O que são casas inteligentes?', 'Ambientes adaptados com IA para controle de luz, temperatura e segurança por voz ou aplicativo.', 1, '2025-06-11 22:41:56'),
(2731, 1411, 'Quais cuidados éticos ao usar IA?', 'Privacidade, consentimento e transparência no uso dos dados.', 1, '2025-06-11 22:41:56'),
(2732, 1411, 'TO pode atuar no desenvolvimento de soluções em IA?', 'Sim, colaborando com equipes multidisciplinares.', 1, '2025-06-11 22:41:56'),
(2733, 1411, 'Quais tendências futuras em IA para TO?', 'Assistentes virtuais personalizados e monitoramento remoto inteligente.', 1, '2025-06-11 22:41:56'),
(2734, 1412, 'O que é ergonomia?', 'Ciência que estuda a adaptação do trabalho ao ser humano, visando conforto, segurança e eficiência.', 1, '2025-06-11 22:41:56'),
(2735, 1412, 'Qual o objetivo principal da ergonomia?', 'Prevenir lesões e melhorar a saúde ocupacional.', 1, '2025-06-11 22:41:56'),
(2736, 1412, 'O que são princípios ergonômicos?', 'Regras e recomendações para adaptar tarefas, ambiente e ferramentas às capacidades humanas.', 1, '2025-06-11 22:41:56'),
(2737, 1412, 'Dê um exemplo de adaptação ergonômica.', 'Ajuste da altura da cadeira e mesa de trabalho.', 1, '2025-06-11 22:41:56'),
(2738, 1412, 'Como a iluminação influencia na ergonomia?', 'Iluminação adequada previne fadiga ocular e aumenta a produtividade.', 1, '2025-06-11 22:41:56'),
(2739, 1412, 'Por que pausas são importantes no trabalho?', 'Reduzem fadiga muscular e mental, prevenindo lesões.', 1, '2025-06-11 22:41:56'),
(2740, 1412, 'Qual o papel do TO na ergonomia?', 'Avaliar e propor adaptações no ambiente de trabalho.', 1, '2025-06-11 22:41:56'),
(2741, 1412, 'Quais fatores influenciam a ergonomia?', 'Postura, repetição de movimentos, força aplicada e ambiente.', 1, '2025-06-11 22:41:56'),
(2742, 1412, 'Ergonomia é importante só para escritórios?', 'Não, é relevante em qualquer ambiente de trabalho.', 1, '2025-06-11 22:41:56'),
(2743, 1412, 'O que são lesões por esforço repetitivo (LER)?', 'Lesões causadas por movimentos repetidos e postura inadequada.', 1, '2025-06-11 22:41:56'),
(2744, 1413, 'O que é análise ergonômica de tarefas?', 'Avaliação detalhada das atividades para identificar riscos e propor melhorias.', 1, '2025-06-11 22:41:56'),
(2745, 1413, 'Por que realizar análise ergonômica?', 'Para prevenir acidentes e aumentar a eficiência das tarefas.', 1, '2025-06-11 22:41:56'),
(2746, 1413, 'Quais etapas da análise ergonômica?', 'Observação, entrevista, coleta de dados e recomendações.', 1, '2025-06-11 22:41:56'),
(2747, 1413, 'O que é mapa de risco?', 'Representação visual dos perigos existentes no ambiente de trabalho.', 1, '2025-06-11 22:41:56'),
(2748, 1413, 'Como registrar uma análise ergonômica?', 'Por meio de laudos, relatórios e documentação fotográfica.', 1, '2025-06-11 22:41:56'),
(2749, 1413, 'Quem pode solicitar análise ergonômica?', 'Empresas, trabalhadores ou profissionais de saúde.', 1, '2025-06-11 22:41:56'),
(2750, 1413, 'Análise ergonômica pode ser preventiva?', 'Sim, identificando riscos antes que ocorram lesões.', 1, '2025-06-11 22:41:56'),
(2751, 1413, 'Como a TO contribui na análise ergonômica?', 'Avaliando as capacidades e limitações dos trabalhadores.', 1, '2025-06-11 22:41:56'),
(2752, 1413, 'Quais ferramentas auxiliam a análise?', 'Checklists, questionários e softwares específicos.', 1, '2025-06-11 22:41:56'),
(2753, 1413, 'Qual a importância do envolvimento dos funcionários?', 'Ajuda na identificação de problemas reais e adesão às mudanças.', 1, '2025-06-11 22:41:56'),
(2754, 1414, 'O que são programas de prevenção em ambiente de trabalho?', 'Conjuntos de ações para evitar acidentes e doenças ocupacionais.', 1, '2025-06-11 22:41:56'),
(2755, 1414, 'Cite um exemplo de ação preventiva.', 'Treinamento de postura e uso correto de equipamentos.', 1, '2025-06-11 22:41:56'),
(2756, 1414, 'Por que criar programas de prevenção?', 'Para proteger a saúde dos trabalhadores e reduzir custos com afastamentos.', 1, '2025-06-11 22:41:56'),
(2757, 1414, 'Quem participa dos programas de prevenção?', 'Todos os colaboradores e gestores da empresa.', 1, '2025-06-11 22:41:56'),
(2758, 1414, 'Como avaliar a efetividade dos programas?', 'Por meio de indicadores, relatórios e acompanhamento de casos.', 1, '2025-06-11 22:41:56'),
(2759, 1414, 'O que é ginástica laboral?', 'Exercícios realizados no ambiente de trabalho para prevenir lesões.', 1, '2025-06-11 22:41:56'),
(2760, 1414, 'TO pode coordenar programas de prevenção?', 'Sim, elaborando e executando estratégias específicas.', 1, '2025-06-11 22:41:56'),
(2761, 1414, 'Como motivar funcionários a participar?', 'Através de campanhas educativas e integração no dia a dia.', 1, '2025-06-11 22:41:56'),
(2762, 1414, 'Programas de prevenção são obrigatórios?', 'Em muitos setores, sim, por normas de segurança e saúde do trabalho.', 1, '2025-06-11 22:41:56'),
(2763, 1414, 'Quais benefícios esses programas trazem?', 'Melhora da qualidade de vida, redução de acidentes e maior produtividade.', 1, '2025-06-11 22:41:56'),
(2764, 1415, 'O que é postura corporal?', 'Alinhamento adequado das partes do corpo durante atividades ou repouso.', 1, '2025-06-11 22:41:56'),
(2765, 1415, 'Por que postura correta é importante?', 'Previne dores, lesões e melhora o desempenho nas atividades.', 1, '2025-06-11 22:41:56'),
(2766, 1415, 'O que é biomecânica?', 'Estudo dos movimentos e das forças atuantes no corpo humano.', 1, '2025-06-11 22:41:56'),
(2767, 1415, 'Como avaliar postura?', 'Observando alinhamento, simetria e padrão de movimentos.', 1, '2025-06-11 22:41:56'),
(2768, 1415, 'Quais fatores afetam a postura?', 'Músculos fracos, lesões, maus hábitos e mobiliário inadequado.', 1, '2025-06-11 22:41:56'),
(2769, 1415, 'Como prevenir má postura?', 'Orientando exercícios, pausas e ajustes no ambiente.', 1, '2025-06-11 22:41:56'),
(2770, 1415, 'O que são vícios posturais?', 'Hábitos repetitivos de postura inadequada.', 1, '2025-06-11 22:41:56'),
(2771, 1415, 'A biomecânica influencia a prevenção de lesões?', 'Sim, permitindo identificar riscos e corrigir movimentos.', 1, '2025-06-11 22:41:56'),
(2772, 1415, 'Qual o papel do TO na orientação postural?', 'Educar e treinar o paciente para posições e movimentos corretos.', 1, '2025-06-11 22:41:56'),
(2773, 1415, 'A análise biomecânica é usada em esportes?', 'Sim, para prevenir lesões e otimizar desempenho.', 1, '2025-06-11 22:41:56'),
(2774, 1416, 'O que é risco ocupacional?', 'É a possibilidade de ocorrer dano à saúde devido às condições do trabalho.', 1, '2025-06-11 22:41:56'),
(2775, 1416, 'Quais são os tipos de riscos ocupacionais?', 'Físicos, químicos, biológicos, ergonômicos e psicossociais.', 1, '2025-06-11 22:41:56'),
(2776, 1416, 'Como identificar riscos no ambiente de trabalho?', 'Por meio de observação, entrevistas e análise documental.', 1, '2025-06-11 22:41:56'),
(2777, 1416, 'O que é PPRA?', 'Programa de Prevenção de Riscos Ambientais.', 1, '2025-06-11 22:41:56'),
(2778, 1416, 'Por que avaliar riscos ocupacionais?', 'Para evitar acidentes, doenças e garantir ambiente seguro.', 1, '2025-06-11 22:41:56'),
(2779, 1416, 'Quais medidas reduzem riscos ergonômicos?', 'Adaptação do posto, pausas e orientação postural.', 1, '2025-06-11 22:41:56'),
(2780, 1416, 'O que é EPI?', 'Equipamento de Proteção Individual, como luvas, capacetes e óculos.', 1, '2025-06-11 22:41:56'),
(2781, 1416, 'TO pode atuar na avaliação de riscos?', 'Sim, identificando fatores que impactam a funcionalidade.', 1, '2025-06-11 22:41:56'),
(2782, 1416, 'Como registrar os riscos encontrados?', 'Em laudos, mapas de risco e relatórios técnicos.', 1, '2025-06-11 22:41:56'),
(2783, 1416, 'Avaliar riscos é dever de qual profissional?', 'De todos, especialmente da equipe de saúde e segurança do trabalho.', 1, '2025-06-11 22:41:56'),
(2784, 1417, 'O que é Terapia Ocupacional em Saúde Mental?', 'É a aplicação de atividades terapêuticas para promover autonomia, autoestima e reinserção social de pessoas com transtornos mentais.', 1, '2025-06-11 22:41:56'),
(2785, 1417, 'Quais são as principais abordagens clínicas em saúde mental?', 'Abordagem psicossocial, cognitivo-comportamental, humanista, entre outras.', 1, '2025-06-11 22:41:56'),
(2786, 1417, 'O que caracteriza a abordagem psicossocial?', 'Enfoque no suporte social, participação em grupos e construção de redes de apoio.', 1, '2025-06-11 22:41:56'),
(2787, 1417, 'Como a abordagem cognitivo-comportamental pode ser usada na TO?', 'Por meio de reestruturação de pensamentos e treinamento de habilidades funcionais.', 1, '2025-06-11 22:41:56'),
(2788, 1417, 'Qual o papel da TO na reabilitação psicossocial?', 'Facilitar a participação em atividades cotidianas e comunitárias.', 1, '2025-06-11 22:41:56'),
(2789, 1417, 'TO pode atuar em transtornos de ansiedade?', 'Sim, ajudando no enfrentamento de situações e reorganização da rotina.', 1, '2025-06-11 22:41:56'),
(2790, 1417, 'A TO trabalha em hospitais psiquiátricos?', 'Sim, além de CAPS, residências terapêuticas e serviços comunitários.', 1, '2025-06-11 22:41:56'),
(2791, 1417, 'Qual a importância das atividades expressivas em saúde mental?', 'Ajudam na expressão de sentimentos, criatividade e autoconhecimento.', 1, '2025-06-11 22:41:56'),
(2792, 1417, 'Como a TO pode atuar na prevenção do suicídio?', 'Através de escuta ativa, promoção de sentido para a vida e fortalecimento de vínculos.', 1, '2025-06-11 22:41:56'),
(2793, 1417, 'Reabilitação em saúde mental envolve família?', 'Sim, a participação da família potencializa os resultados.', 1, '2025-06-11 22:41:56'),
(2794, 1418, 'O que é terapia de grupo em TO?', 'É a realização de atividades terapêuticas em grupo para promover socialização e troca de experiências.', 1, '2025-06-11 22:41:56'),
(2795, 1418, 'Por que usar dinâmicas em grupo?', 'Para desenvolver habilidades sociais, autoestima e integração entre participantes.', 1, '2025-06-11 22:41:56'),
(2796, 1418, 'Quais são exemplos de atividades em grupo?', 'Oficinas de arte, rodas de conversa, jogos cooperativos e grupos de habilidades sociais.', 1, '2025-06-11 22:41:56'),
(2797, 1418, 'A terapia de grupo pode ser usada com crianças?', 'Sim, adaptando as atividades à faixa etária e interesses.', 1, '2025-06-11 22:41:56'),
(2798, 1418, 'Como a TO conduz uma dinâmica de grupo?', 'Planejando objetivos claros e promovendo ambiente acolhedor e seguro.', 1, '2025-06-11 22:41:56'),
(2799, 1418, 'Quais benefícios da terapia de grupo?', 'Apoio mútuo, partilha de experiências e fortalecimento de vínculos.', 1, '2025-06-11 22:41:56'),
(2800, 1418, 'Como avaliar resultados em terapia de grupo?', 'Por meio de observação, autoavaliação e feedback dos participantes.', 1, '2025-06-11 22:41:56'),
(2801, 1418, 'TO pode trabalhar com grupos de familiares?', 'Sim, para orientação e apoio em saúde mental.', 1, '2025-06-11 22:41:56'),
(2802, 1418, 'Qual o papel do mediador na dinâmica de grupo?', 'Facilitar participação, estimular reflexão e resolver conflitos.', 1, '2025-06-11 22:41:56'),
(2803, 1418, 'Como adaptar dinâmicas para diferentes públicos?', 'Considerando interesses, necessidades e limitações dos participantes.', 1, '2025-06-11 22:41:56'),
(2804, 1419, 'O que é suporte psicossocial?', 'Apoio oferecido para fortalecer vínculos, autonomia e enfrentamento de dificuldades emocionais e sociais.', 1, '2025-06-11 22:41:56'),
(2805, 1419, 'Por que o suporte psicossocial é importante em saúde mental?', 'Promove inclusão social, autoestima e melhoria da qualidade de vida.', 1, '2025-06-11 22:41:56'),
(2806, 1419, 'Como a TO pode oferecer suporte psicossocial?', 'Através de grupos terapêuticos, visitas domiciliares e orientações.', 1, '2025-06-11 22:41:56'),
(2807, 1419, 'O que são redes de apoio?', 'Conjunto de pessoas e instituições que colaboram com o cuidado do indivíduo.', 1, '2025-06-11 22:41:56'),
(2808, 1419, 'A família participa do suporte psicossocial?', 'Sim, é fundamental na construção de estratégias e suporte contínuo.', 1, '2025-06-11 22:41:56'),
(2809, 1419, 'Qual o papel do TO no suporte comunitário?', 'Facilitar acesso a recursos e inclusão em atividades locais.', 1, '2025-06-11 22:41:56'),
(2810, 1419, 'Suporte psicossocial pode evitar recaídas?', 'Sim, pois mantém o acompanhamento e reforça estratégias de enfrentamento.', 1, '2025-06-11 22:41:56'),
(2811, 1419, 'Como registrar intervenções psicossociais?', 'Em relatórios clínicos, destacando ações e resultados observados.', 1, '2025-06-11 22:41:56'),
(2812, 1419, 'O suporte psicossocial é só para pacientes?', 'Não, pode envolver familiares e cuidadores.', 1, '2025-06-11 22:41:56'),
(2813, 1419, 'Quais recursos podem ser usados no suporte psicossocial?', 'Grupos de apoio, oficinas, acompanhamento individualizado e atividades culturais.', 1, '2025-06-11 22:41:56'),
(2814, 1420, 'O que é trauma psicológico?', 'Experiência emocional intensa que pode deixar marcas duradouras na vida do indivíduo.', 1, '2025-06-11 22:41:56'),
(2815, 1420, 'O que significa PTSD?', 'Transtorno de Estresse Pós-Traumático.', 1, '2025-06-11 22:41:56'),
(2816, 1420, 'Quais sintomas podem estar presentes no PTSD?', 'Flashbacks, ansiedade, insônia, evitação de situações relacionadas ao trauma.', 1, '2025-06-11 22:41:56'),
(2817, 1420, 'Como a TO atua em casos de trauma?', 'Oferecendo ambiente seguro, atividades expressivas e estratégias para retomada da rotina.', 1, '2025-06-11 22:41:56'),
(2818, 1420, 'Por que as atividades expressivas ajudam em traumas?', 'Permitem expressão simbólica das emoções e elaboração do sofrimento.', 1, '2025-06-11 22:41:56'),
(2819, 1420, 'Intervenções em trauma devem ser individualizadas?', 'Sim, considerando tempo, contexto e necessidades do paciente.', 1, '2025-06-11 22:41:56'),
(2820, 1420, 'TO pode trabalhar com vítimas de violência?', 'Sim, atuando na reconstrução de autonomia e confiança.', 1, '2025-06-11 22:41:56'),
(2821, 1420, 'Quais estratégias podem ajudar na reintegração social após trauma?', 'Grupos terapêuticos, oficinas de habilidades e apoio psicossocial.', 1, '2025-06-11 22:41:56'),
(2822, 1420, 'O que evitar em intervenções pós-trauma?', 'Exposição forçada ao evento traumático e julgamento das emoções.', 1, '2025-06-11 22:41:56'),
(2823, 1420, 'Família deve ser envolvida no tratamento?', 'Sim, para oferecer suporte e acolhimento durante o processo de recuperação.', 1, '2025-06-11 22:41:56'),
(2824, 1421, 'O que é mindfulness?', 'Prática de atenção plena, focando o momento presente de forma consciente e sem julgamento.', 1, '2025-06-11 22:41:56'),
(2825, 1421, 'Como mindfulness pode ser usado na TO?', 'Ajudando o paciente a lidar com ansiedade, estresse e dor crônica.', 1, '2025-06-11 22:41:56'),
(2826, 1421, 'Quais benefícios do mindfulness?', 'Redução do estresse, melhora do sono e maior autoconhecimento.', 1, '2025-06-11 22:41:56'),
(2827, 1421, 'A prática de mindfulness pode ser ensinada em grupo?', 'Sim, com exercícios guiados de respiração e meditação.', 1, '2025-06-11 22:41:56'),
(2828, 1421, 'Mindfulness pode ser integrado à rotina diária?', 'Sim, através de práticas rápidas e observação consciente das atividades.', 1, '2025-06-11 22:41:56'),
(2829, 1421, 'Qual a relação entre mindfulness e saúde mental?', 'Contribui para o equilíbrio emocional e manejo de pensamentos negativos.', 1, '2025-06-11 22:41:56'),
(2830, 1421, 'Como medir resultados da prática de mindfulness?', 'Por meio de relatos subjetivos e questionários de qualidade de vida.', 1, '2025-06-11 22:41:56'),
(2831, 1421, 'Mindfulness é indicado para todos?', 'Deve ser adaptado às necessidades e limites do indivíduo.', 1, '2025-06-11 22:41:56'),
(2832, 1421, 'TO pode orientar práticas de mindfulness?', 'Sim, após treinamento adequado na técnica.', 1, '2025-06-11 22:41:56'),
(2833, 1421, 'Como introduzir mindfulness em terapia ocupacional?', 'Por meio de conversas, dinâmicas e exercícios corporais conscientes.', 1, '2025-06-11 22:41:56'),
(2834, 1422, 'O que significa AVC?', 'Acidente Vascular Cerebral, interrupção do fluxo sanguíneo no cérebro.', 1, '2025-06-11 22:48:32'),
(2835, 1422, 'Quais sintomas podem indicar um AVC?', 'Fraqueza em um lado do corpo, dificuldade de fala, perda de equilíbrio e visão alterada.', 1, '2025-06-11 22:48:32'),
(2836, 1422, 'O que é reabilitação pós-AVC?', 'Conjunto de intervenções para recuperar funções e promover autonomia após um AVC.', 1, '2025-06-11 22:48:32'),
(2837, 1422, 'Por que iniciar a reabilitação cedo após um AVC?', 'Para aproveitar a plasticidade cerebral e melhorar prognóstico.', 1, '2025-06-11 22:48:32'),
(2838, 1422, 'Qual o papel da TO nos primeiros dias pós-AVC?', 'Prevenir complicações, estimular movimentos e orientar família.', 1, '2025-06-11 22:48:32'),
(2839, 1422, 'O que é protocolo inicial pós-AVC?', 'Avaliação das funções, posicionamento adequado e início de exercícios leves.', 1, '2025-06-11 22:48:32'),
(2840, 1422, 'Como prevenir contraturas após AVC?', 'Com mudanças frequentes de posição e alongamentos.', 1, '2025-06-11 22:48:32'),
(2841, 1422, 'Família deve ser orientada logo após o AVC?', 'Sim, para colaborar na prevenção de complicações e no estímulo ao paciente.', 1, '2025-06-11 22:48:32'),
(2842, 1422, 'O que observar antes de iniciar mobilizações?', 'Estado clínico, sinais vitais e nível de consciência do paciente.', 1, '2025-06-11 22:48:32'),
(2843, 1422, 'A recuperação pós-AVC é igual para todos?', 'Não, depende do tipo de AVC, extensão da lesão e condições individuais.', 1, '2025-06-11 22:48:32'),
(2844, 1423, 'O que é TCE?', 'Traumatismo Cranioencefálico, lesão causada por impacto na cabeça.', 1, '2025-06-11 22:48:32'),
(2845, 1423, 'Quais as causas mais comuns de TCE?', 'Acidentes de trânsito, quedas e agressões.', 1, '2025-06-11 22:48:32'),
(2846, 1423, 'Por que a reabilitação é importante após TCE?', 'Para recuperar funções motoras, cognitivas e sociais afetadas pela lesão.', 1, '2025-06-11 22:48:32'),
(2847, 1423, 'TO pode atuar logo após o TCE?', 'Sim, com intervenções adaptadas ao estado clínico do paciente.', 1, '2025-06-11 22:48:32'),
(2848, 1423, 'Quais déficits são comuns após TCE?', 'Alterações motoras, cognitivas, comportamentais e emocionais.', 1, '2025-06-11 22:48:32'),
(2849, 1423, 'Como a TO contribui para a reabilitação cognitiva?', 'Utilizando atividades que estimulem memória, atenção e resolução de problemas.', 1, '2025-06-11 22:48:32'),
(2850, 1423, 'Quais adaptações podem ser necessárias após TCE?', 'Adaptações no ambiente, uso de agendas e treino de rotina.', 1, '2025-06-11 22:48:32'),
(2851, 1423, 'Família deve ser envolvida na reabilitação?', 'Sim, para apoiar a reinserção e o tratamento contínuo.', 1, '2025-06-11 22:48:32'),
(2852, 1423, 'TO pode atuar na reintegração escolar ou ao trabalho?', 'Sim, ajudando na readaptação e planejamento de atividades.', 1, '2025-06-11 22:48:32'),
(2853, 1423, 'Como avaliar progresso após TCE?', 'Através de escalas funcionais, relatos da família e evolução das atividades.', 1, '2025-06-11 22:48:32'),
(2854, 1424, 'O que são doenças neurodegenerativas?', 'Doenças que causam degeneração progressiva do sistema nervoso, como Alzheimer e Parkinson.', 1, '2025-06-11 22:48:32'),
(2855, 1424, 'Quais sintomas são comuns em doenças neurodegenerativas?', 'Perda de memória, tremores, rigidez muscular, dificuldades motoras e cognitivas.', 1, '2025-06-11 22:48:32'),
(2856, 1424, 'TO pode atuar em Alzheimer?', 'Sim, estimulando funções cognitivas, orientação temporal e manutenção da autonomia.', 1, '2025-06-11 22:48:32'),
(2857, 1424, 'Como a TO auxilia no Parkinson?', 'Trabalhando coordenação motora, adaptação de atividades e exercícios de ritmo.', 1, '2025-06-11 22:48:32'),
(2858, 1424, 'Por que adaptar o ambiente para esses pacientes?', 'Para prevenir acidentes e facilitar o desempenho das atividades diárias.', 1, '2025-06-11 22:48:32'),
(2859, 1424, 'O que é reabilitação funcional?', 'Processo de promover independência nas funções afetadas.', 1, '2025-06-11 22:48:32'),
(2860, 1424, 'Quais estratégias ajudam a compensar déficits?', 'Uso de agendas, lembretes visuais e divisão de tarefas em etapas.', 1, '2025-06-11 22:48:32'),
(2861, 1424, 'Família deve ser orientada sobre evolução da doença?', 'Sim, para adaptar cuidados e expectativas.', 1, '2025-06-11 22:48:32'),
(2862, 1424, 'TO pode atuar em estágios avançados?', 'Sim, priorizando conforto, prevenção de complicações e bem-estar.', 1, '2025-06-11 22:48:32'),
(2863, 1424, 'Qual o objetivo principal da TO em doenças neurodegenerativas?', 'Manter a maior independência possível e promover qualidade de vida.', 1, '2025-06-11 22:48:32'),
(2864, 1425, 'O que é neuroplasticidade?', 'Capacidade do sistema nervoso de se reorganizar e criar novas conexões.', 1, '2025-06-11 22:48:32'),
(2865, 1425, 'Por que neuroplasticidade é importante na reabilitação?', 'Permite recuperação parcial de funções após lesões.', 1, '2025-06-11 22:48:32'),
(2866, 1425, 'Quais terapias estimulam a neuroplasticidade?', 'Treino repetitivo, atividades desafiadoras e uso de novas tarefas.', 1, '2025-06-11 22:48:32'),
(2867, 1425, 'TO pode usar realidade virtual na reabilitação?', 'Sim, para estimular aprendizado motor e engajamento.', 1, '2025-06-11 22:48:32'),
(2868, 1425, 'Como avaliar se houve neuroplasticidade?', 'Através de evolução funcional, testes específicos e relatos do paciente.', 1, '2025-06-11 22:48:32'),
(2869, 1425, 'Quais atividades favorecem novas conexões neurais?', 'Aprendizagem de tarefas novas e prática regular de atividades.', 1, '2025-06-11 22:48:32'),
(2870, 1425, 'Neuroplasticidade é maior em qual idade?', 'Na infância, mas ocorre durante toda a vida.', 1, '2025-06-11 22:48:32'),
(2871, 1425, 'O que são terapias baseadas em tarefas?', 'Atividades focadas em movimentos e funções reais do cotidiano.', 1, '2025-06-11 22:48:32'),
(2872, 1425, 'TO pode trabalhar com espelhamento motor?', 'Sim, usando o movimento de um lado saudável para estimular o lado afetado.', 1, '2025-06-11 22:48:32'),
(2873, 1425, 'Família pode ajudar no estímulo à neuroplasticidade?', 'Sim, reforçando o uso das habilidades em casa.', 1, '2025-06-11 22:48:32'),
(2874, 1426, 'O que é neuroreabilitação?', 'Conjunto de intervenções para recuperar funções do sistema nervoso após lesão ou doença.', 1, '2025-06-11 22:48:32'),
(2875, 1426, 'Quais tecnologias podem ser usadas na neuroreabilitação?', 'Robótica, realidade virtual, eletroestimulação e softwares terapêuticos.', 1, '2025-06-11 22:48:32'),
(2876, 1426, 'Como a robótica auxilia na reabilitação?', 'Oferece treino de movimentos repetitivos e precisos.', 1, '2025-06-11 22:48:32'),
(2877, 1426, 'TO pode usar jogos virtuais em terapia?', 'Sim, para motivar e engajar o paciente nas atividades.', 1, '2025-06-11 22:48:32'),
(2878, 1426, 'Eletroestimulação pode ajudar na recuperação motora?', 'Sim, em alguns casos, estimula músculos e nervos para facilitar movimento.', 1, '2025-06-11 22:48:32'),
(2879, 1426, 'Quais cuidados ao utilizar tecnologia?', 'Avaliar segurança, necessidade real e adaptação do paciente.', 1, '2025-06-11 22:48:32'),
(2880, 1426, 'Tecnologia substitui o terapeuta?', 'Não, é um recurso complementar à intervenção humana.', 1, '2025-06-11 22:48:32'),
(2881, 1426, 'Como medir evolução na neuroreabilitação?', 'Usando escalas funcionais, testes motores e feedback do paciente.', 1, '2025-06-11 22:48:32'),
(2882, 1426, 'Quais vantagens da tecnologia na reabilitação?', 'Maior precisão, repetição e possibilidade de feedback imediato.', 1, '2025-06-11 22:48:32'),
(2883, 1426, 'TO deve se atualizar sobre novas tecnologias?', 'Sim, para oferecer intervenções modernas e eficazes.', 1, '2025-06-11 22:48:32'),
(2884, 1427, 'O que são marcos do desenvolvimento motor?', 'Etapas típicas de aquisição de habilidades motoras ao longo do crescimento infantil.', 1, '2025-06-11 22:48:32'),
(2885, 1427, 'Qual a importância de observar os marcos motores?', 'Permite identificar atrasos e planejar intervenções precoces.', 1, '2025-06-11 22:48:32'),
(2886, 1427, 'Cite um marco motor típico aos 6 meses.', 'Sentar sem apoio.', 1, '2025-06-11 22:48:32'),
(2887, 1427, 'Quando geralmente ocorre o início da marcha?', 'Por volta de 12 meses.', 1, '2025-06-11 22:48:32'),
(2888, 1427, 'O que pode influenciar o desenvolvimento motor?', 'Genética, ambiente, estímulos e condições de saúde.', 1, '2025-06-11 22:48:32'),
(2889, 1427, 'O atraso em marcos motores é sempre patológico?', 'Não, pode haver variações individuais, mas deve ser acompanhado.', 1, '2025-06-11 22:48:32'),
(2890, 1427, 'Qual profissional pode avaliar o desenvolvimento motor?', 'Terapeuta ocupacional, fisioterapeuta, médico pediatra, entre outros.', 1, '2025-06-11 22:48:32'),
(2891, 1427, 'Por que estimular o movimento desde bebê?', 'Favorece coordenação, força muscular e independência.', 1, '2025-06-11 22:48:32'),
(2892, 1427, 'Quais marcos devem ser avaliados no primeiro ano?', 'Controle cervical, rolar, sentar, engatinhar e andar.', 1, '2025-06-11 22:48:32'),
(2893, 1427, 'Como registrar os marcos do desenvolvimento?', 'Utilizando protocolos, escalas e acompanhamento em prontuário.', 1, '2025-06-11 22:48:32'),
(2894, 1428, 'O que é avaliação precoce em pediatria?', 'Processo de identificar alterações ou atrasos no desenvolvimento infantil logo nos primeiros anos de vida.', 1, '2025-06-11 22:48:32'),
(2895, 1428, 'Por que a avaliação precoce é importante?', 'Permite intervenções rápidas, aumentando as chances de melhores resultados.', 1, '2025-06-11 22:48:32'),
(2896, 1428, 'Quais áreas são avaliadas na pediatria?', 'Motora, cognitiva, comunicativa, social e adaptativa.', 1, '2025-06-11 22:48:32'),
(2897, 1428, 'Quais instrumentos podem ser usados na avaliação precoce?', 'Escalas de desenvolvimento, observação direta e entrevistas com responsáveis.', 1, '2025-06-11 22:48:32'),
(2898, 1428, 'Como envolver a família na avaliação?', 'Solicitando relatos sobre comportamento e rotina da criança.', 1, '2025-06-11 22:48:32'),
(2899, 1428, 'O que fazer diante de um atraso detectado?', 'Encaminhar para intervenção multidisciplinar e monitorar evolução.', 1, '2025-06-11 22:48:32'),
(2900, 1428, 'Avaliação precoce pode prevenir deficiências?', 'Pode minimizar impactos e otimizar habilidades.', 1, '2025-06-11 22:48:32'),
(2901, 1428, 'Quem pode solicitar avaliação precoce?', 'Profissionais de saúde, educação e os próprios responsáveis.', 1, '2025-06-11 22:48:32'),
(2902, 1428, 'A avaliação precoce é só para crianças com suspeita?', 'Não, é indicada também para monitorar crianças sem fatores de risco.', 1, '2025-06-11 22:48:32'),
(2903, 1428, 'Como registrar a avaliação precoce?', 'Em relatórios detalhados e evoluções clínicas.', 1, '2025-06-11 22:48:32'),
(2904, 1429, 'O que é intervenção precoce?', 'Atendimento especializado para crianças de 0 a 6 anos com atraso ou risco de atraso no desenvolvimento.', 1, '2025-06-11 22:48:32'),
(2905, 1429, 'Por que os primeiros anos são importantes?', 'É o período de maior plasticidade cerebral e formação de habilidades.', 1, '2025-06-11 22:48:32'),
(2906, 1429, 'Como a TO atua na intervenção precoce?', 'Através de atividades lúdicas, orientações à família e adaptação do ambiente.', 1, '2025-06-11 22:48:32'),
(2907, 1429, 'Quais estratégias são usadas na intervenção precoce?', 'Brincadeiras direcionadas, estímulos sensoriais e treino de habilidades cotidianas.', 1, '2025-06-11 22:48:32'),
(2908, 1429, 'A intervenção precoce pode ser feita em casa?', 'Sim, com orientação de profissionais e participação da família.', 1, '2025-06-11 22:48:32'),
(2909, 1429, 'Qual o papel da família na intervenção precoce?', 'É fundamental, pois reforça estímulos no dia a dia.', 1, '2025-06-11 22:48:32'),
(2910, 1429, 'Intervenção precoce é indicada para autismo?', 'Sim, quanto antes iniciar, melhores os resultados.', 1, '2025-06-11 22:48:32'),
(2911, 1429, 'Como monitorar evolução da intervenção?', 'Com avaliações periódicas, feedback da família e observação direta.', 1, '2025-06-11 22:48:32'),
(2912, 1429, 'Quais benefícios da intervenção precoce?', 'Maior independência, melhor socialização e desempenho escolar futuro.', 1, '2025-06-11 22:48:32'),
(2913, 1429, 'A intervenção deve ser individualizada?', 'Sim, considerando o perfil, interesses e necessidades da criança.', 1, '2025-06-11 22:48:32'),
(2914, 1430, 'Por que envolver a família no tratamento?', 'A família é a principal fonte de estímulos e reforço fora das sessões.', 1, '2025-06-11 22:48:32'),
(2915, 1430, 'Como orientar a família?', 'Com instruções claras, apoio emocional e treinamento de atividades para casa.', 1, '2025-06-11 22:48:32'),
(2916, 1430, 'O que é ambiente terapêutico?', 'Espaço planejado para estimular o desenvolvimento e promover segurança.', 1, '2025-06-11 22:48:32'),
(2917, 1430, 'A adaptação do ambiente influencia o desenvolvimento?', 'Sim, ambientes ricos em estímulos facilitam aquisições motoras, cognitivas e sociais.', 1, '2025-06-11 22:48:32'),
(2918, 1430, 'Como garantir continuidade do tratamento em casa?', 'Envolvendo familiares e tornando as atividades parte da rotina.', 1, '2025-06-11 22:48:32'),
(2919, 1430, 'A comunicação entre profissionais e família deve ser como?', 'Clara, aberta e constante, para troca de informações e acompanhamento.', 1, '2025-06-11 22:48:32'),
(2920, 1430, 'O que é plano terapêutico familiar?', 'Estratégias construídas junto à família para objetivos comuns de desenvolvimento.', 1, '2025-06-11 22:48:32'),
(2921, 1430, 'Família pode participar das sessões?', 'Sim, especialmente nos atendimentos de intervenção precoce.', 1, '2025-06-11 22:48:32'),
(2922, 1430, 'Quais cuidados ao orientar familiares?', 'Respeitar limites, cultura, rotina e disponibilidade de cada um.', 1, '2025-06-11 22:48:32'),
(2923, 1430, 'Como avaliar o impacto da família no tratamento?', 'Observando evolução e recebendo feedback dos responsáveis.', 1, '2025-06-11 22:48:32'),
(2924, 1431, 'Por que brincar é importante no desenvolvimento?', 'Brincar estimula a criatividade, coordenação, linguagem e socialização.', 1, '2025-06-11 22:48:32');
INSERT INTO `flashcards` (`id_flashcard`, `id_assunto`, `pergunta`, `resposta`, `ativo`, `data_criacao`) VALUES
(2925, 1431, 'Como a brincadeira pode ser usada como terapia?', 'Através de jogos e atividades direcionadas para estimular áreas específicas do desenvolvimento.', 1, '2025-06-11 22:48:32'),
(2926, 1431, 'TO pode usar brinquedos adaptados?', 'Sim, para facilitar a participação e superar limitações.', 1, '2025-06-11 22:48:32'),
(2927, 1431, 'Qual o papel do brincar na inclusão?', 'Favorece interação com outras crianças e promove respeito à diversidade.', 1, '2025-06-11 22:48:32'),
(2928, 1431, 'Quais tipos de brincadeiras estimulam motricidade?', 'Brincadeiras de construção, circuitos, jogos de correr e pular.', 1, '2025-06-11 22:48:32'),
(2929, 1431, 'Brincadeiras simbólicas ajudam em quê?', 'No desenvolvimento do pensamento, imaginação e resolução de problemas.', 1, '2025-06-11 22:48:32'),
(2930, 1431, 'Como adaptar o brincar para crianças com deficiência?', 'Ajustando regras, materiais e oferecendo apoio quando necessário.', 1, '2025-06-11 22:48:32'),
(2931, 1431, 'Família deve brincar junto?', 'Sim, isso fortalece vínculos e multiplica os estímulos.', 1, '2025-06-11 22:48:32'),
(2932, 1431, 'A brincadeira pode ser estruturada?', 'Sim, direcionando para objetivos terapêuticos sem perder o caráter lúdico.', 1, '2025-06-11 22:48:32'),
(2933, 1431, 'Como registrar a evolução por meio do brincar?', 'Observando participação, progresso nas habilidades e relatando no prontuário.', 1, '2025-06-11 22:48:32'),
(2970, 1435, 'A sala de integração sensorial serve só para crianças?', 'Não, adultos também podem se beneficiar em reabilitação.', 1, '2025-06-11 22:48:32'),
(2971, 1435, 'Quais atividades podem ser feitas?', 'Circuitos motores, relaxamento, exploração tátil e visual.', 1, '2025-06-11 22:48:32'),
(2972, 1435, 'Como registrar o uso da sala?', 'Por meio de relatórios de frequência, progresso e observação.', 1, '2025-06-11 22:48:32'),
(2973, 1435, 'Família pode participar das sessões?', 'Sim, sendo orientada sobre como potencializar os resultados em casa.', 1, '2025-06-11 22:48:32'),
(2974, 1436, 'Por que avaliar resultados da intervenção em integração sensorial?', 'Para verificar se houve melhoria na participação e no comportamento.', 1, '2025-06-11 22:48:32'),
(2975, 1436, 'Quais instrumentos podem ser usados?', 'Escalas de perfil sensorial, questionários e observação direta.', 1, '2025-06-11 22:48:32'),
(2976, 1436, 'Como saber se uma estratégia foi eficaz?', 'Observando mudanças nas respostas sensoriais e nas atividades diárias.', 1, '2025-06-11 22:48:32'),
(2977, 1436, 'A avaliação deve ser contínua?', 'Sim, para ajustar intervenções conforme evolução do paciente.', 1, '2025-06-11 22:48:32'),
(2978, 1436, 'Família pode relatar resultados em casa?', 'Sim, seus relatos são essenciais para o acompanhamento.', 1, '2025-06-11 22:48:32'),
(2979, 1436, 'Avaliação de resultados inclui participação escolar?', 'Sim, pois o desempenho em sala de aula é indicador importante.', 1, '2025-06-11 22:48:32'),
(2980, 1436, 'Quais sinais de sucesso da intervenção?', 'Maior autonomia, redução de crises e melhor desempenho em atividades.', 1, '2025-06-11 22:48:32'),
(2981, 1436, 'A avaliação pode envolver outros profissionais?', 'Sim, equipe multidisciplinar enriquece a análise.', 1, '2025-06-11 22:48:32'),
(2982, 1436, 'Resultados da IS impactam outras áreas?', 'Sim, influenciam socialização, aprendizagem e autoestima.', 1, '2025-06-11 22:48:32'),
(2983, 1436, 'Como documentar os resultados?', 'Em relatórios objetivos, fotos, vídeos e gráficos de evolução.', 1, '2025-06-11 22:48:32'),
(2984, 1437, 'O que é o Transtorno do Espectro Autista (TEA)?', 'É uma condição do neurodesenvolvimento caracterizada por dificuldades na comunicação, interação social e comportamento repetitivo.', 1, '2025-06-11 22:48:32'),
(2985, 1437, 'Quais são as principais características do TEA?', 'Alterações na linguagem, interesse restrito, padrões repetitivos e sensibilidade sensorial.', 1, '2025-06-11 22:48:32'),
(2986, 1437, 'O TEA afeta mais meninos ou meninas?', 'A incidência é maior em meninos, mas pode afetar ambos os sexos.', 1, '2025-06-11 22:48:32'),
(2987, 1437, 'O que é hiperfoco no autismo?', 'Interesse intenso e exclusivo em determinados assuntos ou atividades.', 1, '2025-06-11 22:48:32'),
(2988, 1437, 'TEA é uma doença?', 'Não, é uma condição do neurodesenvolvimento.', 1, '2025-06-11 22:48:32'),
(2989, 1437, 'O TEA pode ter diferentes graus de comprometimento?', 'Sim, por isso é chamado de espectro.', 1, '2025-06-11 22:48:32'),
(2990, 1437, 'O diagnóstico de TEA é feito em que idade?', 'Geralmente entre 2 e 4 anos, mas pode variar.', 1, '2025-06-11 22:48:32'),
(2991, 1437, 'Quais sinais precoces do TEA?', 'Pouco contato visual, ausência de fala ou atraso e falta de resposta ao nome.', 1, '2025-06-11 22:48:32'),
(2992, 1437, 'Autistas podem frequentar escola regular?', 'Sim, com apoio e adaptações necessárias.', 1, '2025-06-11 22:48:32'),
(2993, 1437, 'TEA tem cura?', 'Não, mas intervenções precoces melhoram muito a qualidade de vida.', 1, '2025-06-11 22:48:32'),
(2994, 1438, 'Por que é importante identificar sinais precoces do TEA?', 'Para iniciar intervenção precoce e melhorar o desenvolvimento.', 1, '2025-06-11 22:48:32'),
(2995, 1438, 'Quais profissionais participam do diagnóstico?', 'Médicos, terapeutas ocupacionais, fonoaudiólogos, psicólogos e pedagogos.', 1, '2025-06-11 22:48:32'),
(2996, 1438, 'O que é triagem de desenvolvimento?', 'Processo para identificar sinais de atraso ou alteração no desenvolvimento infantil.', 1, '2025-06-11 22:48:32'),
(2997, 1438, 'Quais sinais podem indicar TEA aos 2 anos?', 'Pouca fala, falta de interesse por outras crianças, comportamentos repetitivos.', 1, '2025-06-11 22:48:32'),
(2998, 1438, 'Como a família pode contribuir no diagnóstico?', 'Relatando comportamentos e marcos do desenvolvimento.', 1, '2025-06-11 22:48:32'),
(2999, 1438, 'O diagnóstico de TEA é clínico ou laboratorial?', 'Principalmente clínico, baseado em observação e testes padronizados.', 1, '2025-06-11 22:48:32'),
(3000, 1438, 'TEA pode ser confundido com outras condições?', 'Sim, como TDAH ou deficiência intelectual.', 1, '2025-06-11 22:48:32'),
(3001, 1438, 'Qual a importância da equipe multidisciplinar?', 'Garante diagnóstico mais completo e plano de intervenção adequado.', 1, '2025-06-11 22:48:32'),
(3002, 1438, 'Diagnóstico precoce muda o prognóstico?', 'Sim, quanto antes o apoio, melhores os resultados.', 1, '2025-06-11 22:48:32'),
(3003, 1438, 'Família deve ser orientada durante diagnóstico?', 'Sim, para compreender o processo e iniciar intervenções.', 1, '2025-06-11 22:48:32'),
(3004, 1439, 'Quais são as principais intervenções em TEA?', 'Terapia ocupacional, fonoaudiologia, psicologia, ABA e intervenções escolares.', 1, '2025-06-11 22:48:32'),
(3005, 1439, 'Como a TO atua no TEA?', 'Estimula autonomia, comunicação, socialização e adaptação do ambiente.', 1, '2025-06-11 22:48:32'),
(3006, 1439, 'ABA é indicada para todos os autistas?', 'Não, a escolha deve ser individualizada conforme o perfil e necessidades.', 1, '2025-06-11 22:48:32'),
(3007, 1439, 'O que são intervenções baseadas em rotina?', 'Estratégias que organizam o dia a dia e aumentam previsibilidade.', 1, '2025-06-11 22:48:32'),
(3008, 1439, 'TEA pode ter acesso a tecnologias assistivas?', 'Sim, recursos digitais facilitam comunicação e aprendizagem.', 1, '2025-06-11 22:48:32'),
(3009, 1439, 'A família deve ser incluída na intervenção?', 'Sim, é fundamental para reforço das estratégias em casa.', 1, '2025-06-11 22:48:32'),
(3010, 1439, 'O que é comunicação alternativa?', 'Uso de imagens, gestos ou aparelhos para facilitar a comunicação.', 1, '2025-06-11 22:48:32'),
(3011, 1439, 'Como trabalhar comportamento desafiador no TEA?', 'Com estratégias positivas, reforço e compreensão das causas.', 1, '2025-06-11 22:48:32'),
(3012, 1439, 'Intervenções precoces têm impacto?', 'Sim, favorecem desenvolvimento global e inclusão.', 1, '2025-06-11 22:48:32'),
(3013, 1439, 'TO pode orientar escola sobre TEA?', 'Sim, colaborando para adaptações e inclusão efetiva.', 1, '2025-06-11 22:48:32'),
(3014, 1440, 'O que é inclusão escolar?', 'Processo de garantir participação de todos os alunos, inclusive autistas, na escola regular.', 1, '2025-06-11 22:48:32'),
(3015, 1440, 'Como adaptar o ambiente escolar para autistas?', 'Com rotinas visuais, espaços de calma e apoio de profissionais.', 1, '2025-06-11 22:48:32'),
(3016, 1440, 'Por que adaptar atividades escolares?', 'Para atender diferentes estilos de aprendizagem e necessidades sensoriais.', 1, '2025-06-11 22:48:32'),
(3017, 1440, 'O que são adaptações curriculares?', 'Mudanças nos conteúdos, métodos e avaliações para promover participação.', 1, '2025-06-11 22:48:32'),
(3018, 1440, 'Quem participa da inclusão escolar?', 'Professores, terapeutas, família e colegas de classe.', 1, '2025-06-11 22:48:32'),
(3019, 1440, 'TO pode treinar equipe escolar?', 'Sim, para estratégias de apoio ao aluno autista.', 1, '2025-06-11 22:48:32'),
(3020, 1440, 'Tecnologia pode ajudar na inclusão?', 'Sim, através de softwares educativos e comunicação alternativa.', 1, '2025-06-11 22:48:32'),
(3021, 1440, 'Como registrar evolução escolar?', 'Com relatórios, avaliações adaptadas e portfólios.', 1, '2025-06-11 22:48:32'),
(3022, 1440, 'Quais desafios na inclusão de autistas?', 'Falta de informação, resistência e necessidade de adaptações constantes.', 1, '2025-06-11 22:48:32'),
(3023, 1440, 'A inclusão beneficia apenas o autista?', 'Não, favorece a diversidade e respeito no ambiente escolar.', 1, '2025-06-11 22:48:32'),
(3024, 1441, 'Por que orientar a família de autistas?', 'Porque a família é responsável pela maior parte do apoio e estimulação diária.', 1, '2025-06-11 22:48:32'),
(3025, 1441, 'Como a família pode apoiar intervenções?', 'Participando de orientações, reforçando estratégias e adaptando o ambiente.', 1, '2025-06-11 22:48:32'),
(3026, 1441, 'Quais dúvidas são comuns para familiares?', 'Sobre prognóstico, intervenções e inclusão.', 1, '2025-06-11 22:48:32'),
(3027, 1441, 'Família pode participar de grupos de apoio?', 'Sim, é importante para troca de experiências e suporte emocional.', 1, '2025-06-11 22:48:32'),
(3028, 1441, 'Como lidar com crises sensoriais em casa?', 'Identificar gatilhos, criar ambientes seguros e usar estratégias de modulação.', 1, '2025-06-11 22:48:32'),
(3029, 1441, 'TO pode fornecer orientações à família?', 'Sim, sobre manejo de rotina, brincadeiras e adaptação do lar.', 1, '2025-06-11 22:48:32'),
(3030, 1441, 'Por que envolver irmãos na rotina?', 'Para favorecer integração, respeito e empatia.', 1, '2025-06-11 22:48:32'),
(3031, 1441, 'Quais recursos podem ser indicados à família?', 'Livros, vídeos, redes de apoio e profissionais especializados.', 1, '2025-06-11 22:48:32'),
(3032, 1441, 'A família pode sugerir adaptações na escola?', 'Sim, deve ser parceira ativa no processo.', 1, '2025-06-11 22:48:32'),
(3033, 1441, 'Orientação contínua é importante?', 'Sim, pois o autismo é uma condição dinâmica, com demandas que mudam ao longo do tempo.', 1, '2025-06-11 22:48:32'),
(3034, 1402, 'O que é fragilidade em idosos?', 'É uma condição clínica caracterizada pela diminuição das reservas funcionais e maior vulnerabilidade a eventos adversos.', 1, '2025-06-11 23:00:23'),
(3035, 1402, 'Quais instrumentos podem ser usados na avaliação geriátrica?', 'Mini Exame do Estado Mental, Índice de Barthel, Escala de Fragilidade de Fried.', 1, '2025-06-11 23:00:23'),
(3036, 1402, 'Por que realizar avaliação multidimensional no idoso?', 'Porque permite identificar riscos físicos, cognitivos, sociais e emocionais.', 1, '2025-06-11 23:00:23'),
(3037, 1402, 'O que é avaliação geriátrica ampla?', 'Avaliação que abrange aspectos físicos, funcionais, sociais e emocionais do idoso.', 1, '2025-06-11 23:00:23'),
(3038, 1402, 'Como identificar risco de quedas em idosos?', 'Através de testes de equilíbrio, força muscular e histórico de quedas.', 1, '2025-06-11 23:00:23'),
(3039, 1402, 'O que pode causar fragilidade em idosos?', 'Doenças crônicas, imobilidade, desnutrição e isolamento social.', 1, '2025-06-11 23:00:23'),
(3040, 1402, 'Quais consequências da fragilidade não tratada?', 'Aumento do risco de hospitalização, perda de autonomia e mortalidade.', 1, '2025-06-11 23:00:23'),
(3041, 1402, 'Por que envolver família na avaliação do idoso?', 'Para coletar informações, garantir adesão ao plano e suporte ao paciente.', 1, '2025-06-11 23:00:23'),
(3042, 1402, 'Como a Terapia Ocupacional pode atuar na fragilidade?', 'Com intervenções para melhorar equilíbrio, força, adaptação ambiental e rotina.', 1, '2025-06-11 23:00:23'),
(3043, 1402, 'O que é prevenção de fragilidade?', 'Ações para manter força, mobilidade, nutrição adequada e participação social.', 1, '2025-06-11 23:00:23'),
(3044, 1403, 'O que são demências?', 'Síndromes caracterizadas por declínio cognitivo progressivo que interfere nas atividades diárias.', 1, '2025-06-11 23:00:23'),
(3045, 1403, 'Como a TO pode atuar com idosos com demência?', 'Promovendo estimulação cognitiva, adaptação ambiental e treinamento de AVD.', 1, '2025-06-11 23:00:23'),
(3046, 1403, 'Quais são os tipos mais comuns de demência?', 'Doença de Alzheimer, demência vascular, demência com corpos de Lewy.', 1, '2025-06-11 23:00:23'),
(3047, 1403, 'Por que a rotina é importante para idosos com demência?', 'Rotinas estruturadas reduzem ansiedade e facilitam a orientação temporal.', 1, '2025-06-11 23:00:23'),
(3048, 1403, 'Quais atividades ajudam na estimulação cognitiva?', 'Jogos de memória, leitura, artesanato e música.', 1, '2025-06-11 23:00:23'),
(3049, 1403, 'Família deve participar das intervenções?', 'Sim, para reforçar estratégias e dar suporte emocional.', 1, '2025-06-11 23:00:23'),
(3050, 1403, 'Quais adaptações são importantes no ambiente doméstico?', 'Sinalização, eliminação de riscos e organização dos espaços.', 1, '2025-06-11 23:00:23'),
(3051, 1403, 'Como lidar com alterações de comportamento?', 'Com abordagem calma, distração positiva e evitando confrontos.', 1, '2025-06-11 23:00:23'),
(3052, 1403, 'Demências têm cura?', 'Não, mas intervenções podem desacelerar a progressão e melhorar a qualidade de vida.', 1, '2025-06-11 23:00:23'),
(3053, 1403, 'Como avaliar evolução de idosos com demência?', 'Com escalas funcionais, relatos da família e observação direta.', 1, '2025-06-11 23:00:23'),
(3054, 1404, 'O que são cuidados paliativos?', 'Ações voltadas para conforto e qualidade de vida de pacientes com doenças graves e sem cura.', 1, '2025-06-11 23:00:23'),
(3055, 1404, 'Qual o papel da TO nos cuidados paliativos?', 'Promover autonomia, adaptar ambientes e apoiar família e paciente.', 1, '2025-06-11 23:00:23'),
(3056, 1404, 'Quando indicar cuidados paliativos em idosos?', 'Em doenças crônicas avançadas, sofrimento persistente ou prognóstico limitado.', 1, '2025-06-11 23:00:23'),
(3057, 1404, 'Por que tratar dor e desconforto em paliativos?', 'Alivia sofrimento e permite melhor aproveitamento do tempo com família.', 1, '2025-06-11 23:00:23'),
(3058, 1404, 'A comunicação é importante nos paliativos?', 'Sim, para entender desejos, limites e informar família e paciente.', 1, '2025-06-11 23:00:23'),
(3059, 1404, 'Família participa dos cuidados?', 'Sim, com suporte emocional, prático e nas decisões sobre o cuidado.', 1, '2025-06-11 23:00:23'),
(3060, 1404, 'Quais intervenções a TO pode realizar?', 'Treino de funções remanescentes, orientação de cuidadores e adaptações.', 1, '2025-06-11 23:00:23'),
(3061, 1404, 'Paliativos envolvem só terminalidade?', 'Não, também englobam promoção de conforto em doenças prolongadas.', 1, '2025-06-11 23:00:23'),
(3062, 1404, 'Como garantir dignidade ao paciente?', 'Respeitando preferências, valores e promovendo autonomia.', 1, '2025-06-11 23:00:23'),
(3063, 1404, 'TO pode ajudar na prevenção de lesões?', 'Sim, com orientações para posicionamento e movimentação segura.', 1, '2025-06-11 23:00:23'),
(3064, 1405, 'O que é envelhecimento ativo?', 'Processo de otimizar oportunidades para saúde, participação e segurança ao envelhecer.', 1, '2025-06-11 23:00:23'),
(3065, 1405, 'Como estimular participação social no idoso?', 'Com atividades de grupo, voluntariado e convívio comunitário.', 1, '2025-06-11 23:00:23'),
(3066, 1405, 'Qual o papel da atividade física?', 'Manter força, equilíbrio, autonomia e prevenir doenças.', 1, '2025-06-11 23:00:23'),
(3067, 1405, 'Por que estimular hobbies e lazer?', 'Favorecem saúde mental, criatividade e satisfação pessoal.', 1, '2025-06-11 23:00:23'),
(3068, 1405, 'Como TO pode atuar no envelhecimento ativo?', 'Planejando atividades, adaptando ambientes e promovendo autonomia.', 1, '2025-06-11 23:00:23'),
(3069, 1405, 'A alimentação saudável é importante?', 'Sim, previne doenças e mantém funcionalidade.', 1, '2025-06-11 23:00:23'),
(3070, 1405, 'Envelhecimento ativo previne dependência?', 'Sim, favorecendo manutenção da capacidade funcional.', 1, '2025-06-11 23:00:23'),
(3071, 1405, 'Tecnologia pode ajudar o idoso?', 'Sim, com apps de comunicação, monitoramento e estimulação cognitiva.', 1, '2025-06-11 23:00:23'),
(3072, 1405, 'Como combater o isolamento social?', 'Estimulando redes de apoio, convívio familiar e participação em grupos.', 1, '2025-06-11 23:00:23'),
(3073, 1405, 'O que dificulta envelhecimento ativo?', 'Sedentarismo, doenças crônicas, exclusão social e ambientes inacessíveis.', 1, '2025-06-11 23:00:23'),
(3074, 1406, 'O que é tecnologia assistiva?', 'Conjunto de recursos que ampliam habilidades funcionais de pessoas com limitações.', 1, '2025-06-11 23:00:23'),
(3075, 1406, 'Dê exemplo de tecnologia assistiva para idosos.', 'Bengalas, andadores, telefones adaptados e alarmes.', 1, '2025-06-11 23:00:23'),
(3076, 1406, 'Qual o papel da TO na tecnologia assistiva?', 'Avaliar necessidades, orientar uso e adaptar recursos.', 1, '2025-06-11 23:00:23'),
(3077, 1406, 'Por que avaliar risco de quedas antes de prescrever tecnologia?', 'Para selecionar o recurso mais seguro e eficaz.', 1, '2025-06-11 23:00:23'),
(3078, 1406, 'Como orientar o idoso sobre uso de tecnologia?', 'Com treino, supervisão inicial e explicação simples.', 1, '2025-06-11 23:00:23'),
(3079, 1406, 'Tecnologia assistiva pode ser personalizada?', 'Sim, adaptando ao perfil, ambiente e necessidades do idoso.', 1, '2025-06-11 23:00:23'),
(3080, 1406, 'Quais recursos favorecem comunicação?', 'Celulares de botão grande, alarmes de voz e tablets.', 1, '2025-06-11 23:00:23'),
(3081, 1406, 'Como garantir adesão ao uso?', 'Envolvendo família, mostrando benefícios e adaptando às rotinas.', 1, '2025-06-11 23:00:23'),
(3082, 1406, 'Tecnologia assistiva previne dependência?', 'Sim, aumenta autonomia e segurança no dia a dia.', 1, '2025-06-11 23:00:23'),
(3083, 1406, 'A TO deve acompanhar uso contínuo?', 'Sim, para ajustar, prevenir complicações e motivar o uso.', 1, '2025-06-11 23:00:23'),
(3134, 1432, 'O que é fragilidade em idosos?', 'É a diminuição das reservas funcionais e aumento do risco de eventos adversos, como quedas e hospitalização.', 1, '2025-06-11 23:18:02'),
(3135, 1432, 'Qual instrumento pode ser usado para avaliar fragilidade?', 'Escala de Fragilidade de Fried.', 1, '2025-06-11 23:18:02'),
(3136, 1432, 'Por que realizar avaliação geriátrica ampla?', 'Para identificar riscos físicos, cognitivos, emocionais e sociais.', 1, '2025-06-11 23:18:02'),
(3137, 1432, 'Como identificar risco de quedas?', 'Observando equilíbrio, força muscular e histórico de quedas.', 1, '2025-06-11 23:18:02'),
(3138, 1432, 'O que significa polifarmácia?', 'Uso de múltiplos medicamentos, comum em idosos e aumenta risco de efeitos adversos.', 1, '2025-06-11 23:18:02'),
(3139, 1432, 'Como a TO pode atuar na fragilidade?', 'Estimulação de equilíbrio, força, adaptação ambiental e rotina diária.', 1, '2025-06-11 23:18:02'),
(3140, 1432, 'Quais consequências da fragilidade?', 'Maior risco de dependência, internação e mortalidade.', 1, '2025-06-11 23:18:02'),
(3141, 1432, 'O que é avaliação multidimensional?', 'Avaliação de saúde, cognição, funcionalidade e contexto social.', 1, '2025-06-11 23:18:02'),
(3142, 1432, 'A família deve participar da avaliação?', 'Sim, para fornecer informações e apoiar o idoso.', 1, '2025-06-11 23:18:02'),
(3143, 1432, 'Como prevenir fragilidade?', 'Com exercícios, alimentação adequada e participação social.', 1, '2025-06-11 23:18:02'),
(3144, 1433, 'O que são demências?', 'Declínio cognitivo progressivo que interfere nas atividades diárias.', 1, '2025-06-11 23:18:02'),
(3145, 1433, 'Quais os tipos mais comuns de demência?', 'Alzheimer, demência vascular e com corpos de Lewy.', 1, '2025-06-11 23:18:02'),
(3146, 1433, 'Como a TO atua em demência?', 'Estimulação cognitiva, treino de AVD e adaptação ambiental.', 1, '2025-06-11 23:18:02'),
(3147, 1433, 'Por que a rotina é importante em demências?', 'Reduz ansiedade e ajuda na orientação temporal.', 1, '2025-06-11 23:18:02'),
(3148, 1433, 'Quais sinais iniciais de demência?', 'Esquecimento, desorientação e dificuldade em tarefas cotidianas.', 1, '2025-06-11 23:18:02'),
(3149, 1433, 'O ambiente precisa ser adaptado?', 'Sim, para evitar acidentes e facilitar autonomia.', 1, '2025-06-11 23:18:02'),
(3150, 1433, 'Como orientar a família?', 'Fornecendo estratégias para comunicação e manejo de comportamento.', 1, '2025-06-11 23:18:02'),
(3151, 1433, 'Demências têm cura?', 'Não, mas intervenções melhoram a qualidade de vida.', 1, '2025-06-11 23:18:02'),
(3152, 1433, 'O que é estimulação cognitiva?', 'Atividades que mantêm ou melhoram funções mentais.', 1, '2025-06-11 23:18:02'),
(3153, 1433, 'Como lidar com alterações de humor?', 'Manter calma, redirecionar atenção e evitar confrontos.', 1, '2025-06-11 23:18:02'),
(3154, 1434, 'O que são cuidados paliativos?', 'Ações para conforto e qualidade de vida de quem tem doença grave, sem cura.', 1, '2025-06-11 23:18:02'),
(3155, 1434, 'Qual papel da TO em cuidados paliativos?', 'Promoção de autonomia e adaptação do ambiente.', 1, '2025-06-11 23:18:02'),
(3156, 1434, 'Quando iniciar cuidados paliativos?', 'Quando o paciente tem doença progressiva, sofrimento ou limitação funcional.', 1, '2025-06-11 23:18:02'),
(3157, 1434, 'Por que controlar dor em paliativos?', 'Para melhorar o conforto e o bem-estar.', 1, '2025-06-11 23:18:02'),
(3158, 1434, 'Família participa dos cuidados?', 'Sim, com apoio emocional e prático.', 1, '2025-06-11 23:18:02'),
(3159, 1434, 'O que é plano de cuidado individualizado?', 'Estratégias adaptadas às necessidades e desejos do paciente.', 1, '2025-06-11 23:18:02'),
(3160, 1434, 'A comunicação é essencial em paliativos?', 'Sim, para entender limites e desejos do paciente.', 1, '2025-06-11 23:18:02'),
(3161, 1434, 'Como a TO pode prevenir complicações?', 'Orientando posicionamento, movimentação e autocuidado.', 1, '2025-06-11 23:18:02'),
(3162, 1434, 'Paliativos envolvem só terminalidade?', 'Não, também acolhem em doenças crônicas e sem previsão de cura.', 1, '2025-06-11 23:18:02'),
(3163, 1434, 'Como garantir dignidade?', 'Respeitando valores, preferências e autonomia do idoso.', 1, '2025-06-11 23:18:02'),
(3164, 1435, 'O que é envelhecimento ativo?', 'Processo de manter saúde, participação social e segurança ao envelhecer.', 1, '2025-06-11 23:18:02'),
(3165, 1435, 'Quais fatores favorecem envelhecimento ativo?', 'Atividade física, lazer, convívio social e alimentação saudável.', 1, '2025-06-11 23:18:02'),
(3166, 1435, 'Como a TO estimula participação social?', 'Propondo atividades em grupo e engajamento comunitário.', 1, '2025-06-11 23:18:02'),
(3167, 1435, 'Por que incentivar hobbies?', 'Favorecem saúde mental e satisfação pessoal.', 1, '2025-06-11 23:18:02'),
(3168, 1435, 'Exercício físico é importante?', 'Sim, mantém força, equilíbrio e independência.', 1, '2025-06-11 23:18:02'),
(3169, 1435, 'O que dificulta envelhecimento ativo?', 'Sedentarismo, doenças crônicas e isolamento social.', 1, '2025-06-11 23:18:02'),
(3170, 1435, 'Como combater isolamento social?', 'Estimulando grupos, laços familiares e voluntariado.', 1, '2025-06-11 23:18:02'),
(3171, 1435, 'Tecnologia pode ajudar o idoso?', 'Sim, facilita comunicação e acesso a serviços.', 1, '2025-06-11 23:18:02'),
(3172, 1435, 'O que é participação social?', 'Envolvimento do idoso em atividades da comunidade.', 1, '2025-06-11 23:18:02'),
(3173, 1435, 'Como prevenir dependência?', 'Com estímulo à autonomia e manutenção das funções.', 1, '2025-06-11 23:18:02'),
(3174, 1436, 'O que é tecnologia assistiva?', 'Recursos que aumentam habilidades funcionais de pessoas com limitações.', 1, '2025-06-11 23:18:02'),
(3175, 1436, 'Exemplo de tecnologia assistiva para idosos?', 'Bengalas, andadores, telefones adaptados.', 1, '2025-06-11 23:18:02'),
(3176, 1436, 'Como a TO atua com tecnologia assistiva?', 'Avalia, orienta e adapta recursos conforme a necessidade.', 1, '2025-06-11 23:18:02'),
(3177, 1436, 'Quando prescrever tecnologia assistiva?', 'Ao identificar barreiras à autonomia ou segurança.', 1, '2025-06-11 23:18:02'),
(3178, 1436, 'Como garantir adesão ao uso?', 'Treinando idoso e família e adaptando à rotina.', 1, '2025-06-11 23:18:02'),
(3179, 1436, 'Tecnologia assistiva previne quedas?', 'Sim, oferece mais segurança na locomoção.', 1, '2025-06-11 23:18:02'),
(3180, 1436, 'Como adaptar telefone para idoso?', 'Com botões grandes e números de emergência visíveis.', 1, '2025-06-11 23:18:02'),
(3181, 1436, 'Por que envolver família?', 'Para auxiliar no uso e manutenção dos recursos.', 1, '2025-06-11 23:18:02'),
(3182, 1436, 'A TO deve acompanhar o uso?', 'Sim, para ajustar e prevenir complicações.', 1, '2025-06-11 23:18:02'),
(3183, 1436, 'Tecnologia assistiva é personalizada?', 'Sim, conforme perfil e necessidade funcional.', 1, '2025-06-11 23:18:02'),
(3184, 1437, 'O que é avaliação da função manual?', 'Análise de força, destreza, sensibilidade e mobilidade da mão.', 1, '2025-06-11 23:18:02'),
(3185, 1437, 'Como testar força de preensão?', 'Usando dinamômetro ou outros instrumentos padronizados.', 1, '2025-06-11 23:18:02'),
(3186, 1437, 'Por que avaliar sensibilidade?', 'Para identificar alterações neurológicas e direcionar reabilitação.', 1, '2025-06-11 23:18:02'),
(3187, 1437, 'O que é destreza manual?', 'Capacidade de realizar movimentos finos e coordenados com as mãos.', 1, '2025-06-11 23:18:02'),
(3188, 1437, 'Como avaliar dor na mão?', 'Por escalas de dor, palpação e relato do paciente.', 1, '2025-06-11 23:18:02'),
(3189, 1437, 'Quais testes de destreza podem ser usados?', 'Purdue Pegboard, Nine Hole Peg Test.', 1, '2025-06-11 23:18:02'),
(3190, 1437, 'Como registrar evolução?', 'Com escalas padronizadas e reavaliação periódica.', 1, '2025-06-11 23:18:02'),
(3191, 1437, 'Por que comparar com a mão contralateral?', 'Para identificar diferenças funcionais.', 1, '2025-06-11 23:18:02'),
(3192, 1437, 'O que observar na avaliação visual?', 'Edema, coloração, deformidades, cicatrizes.', 1, '2025-06-11 23:18:02'),
(3193, 1437, 'Avaliação manual é importante em crianças?', 'Sim, para detectar atrasos no desenvolvimento.', 1, '2025-06-11 23:18:02'),
(3194, 1438, 'O que é mobilização articular?', 'Movimentação passiva ou ativa das articulações para restaurar amplitude de movimento.', 1, '2025-06-11 23:18:02'),
(3195, 1438, 'Quando iniciar mobilização articular?', 'Após liberação médica e consolidação óssea adequada.', 1, '2025-06-11 23:18:02'),
(3196, 1438, 'Diferença entre mobilização passiva e ativa?', 'Passiva é feita pelo terapeuta, ativa pelo paciente.', 1, '2025-06-11 23:18:02'),
(3197, 1438, 'Quais riscos da mobilização inadequada?', 'Dor, lesões, instabilidade articular.', 1, '2025-06-11 23:18:02'),
(3198, 1438, 'Por que evitar dor na mobilização?', 'Para garantir adesão e não agravar lesões.', 1, '2025-06-11 23:18:02'),
(3199, 1438, 'Quais instrumentos auxiliam mobilização?', 'Talas, órteses, faixas elásticas.', 1, '2025-06-11 23:18:02'),
(3200, 1438, 'Como registrar evolução?', 'Anotar ganhos de amplitude e ausência de dor.', 1, '2025-06-11 23:18:02'),
(3201, 1438, 'Mobilização pode ser feita em casa?', 'Sim, após orientação adequada.', 1, '2025-06-11 23:18:02'),
(3202, 1438, 'Como avaliar amplitude?', 'Com goniômetro ou comparação visual.', 1, '2025-06-11 23:18:02'),
(3203, 1438, 'Mobilização articular melhora funcionalidade?', 'Sim, devolve mobilidade e desempenho manual.', 1, '2025-06-11 23:18:02'),
(3204, 1439, 'O que é reabilitação pós-fratura?', 'Conjunto de intervenções para restaurar função após consolidação óssea.', 1, '2025-06-11 23:18:02'),
(3205, 1439, 'Quais etapas principais da reabilitação?', 'Controle de dor, mobilização, fortalecimento, treino funcional.', 1, '2025-06-11 23:18:02'),
(3206, 1439, 'Por que mobilizar cedo?', 'Para evitar rigidez e perda de função.', 1, '2025-06-11 23:18:02'),
(3207, 1439, 'Como tratar edema?', 'Elevação, massagem e exercícios leves.', 1, '2025-06-11 23:18:02'),
(3208, 1439, 'Quando iniciar exercícios ativos?', 'Após liberação médica.', 1, '2025-06-11 23:18:02'),
(3209, 1439, 'Quais exercícios usar?', 'Flexão/extensão dos dedos, preensão, rotação de punho.', 1, '2025-06-11 23:18:02'),
(3210, 1439, 'Por que treinar AVD?', 'Para recuperar habilidades funcionais essenciais.', 1, '2025-06-11 23:18:02'),
(3211, 1439, 'Família pode ajudar?', 'Sim, orientando e supervisionando exercícios.', 1, '2025-06-11 23:18:02'),
(3212, 1439, 'Como prevenir aderências?', 'Com mobilização precoce e massagem.', 1, '2025-06-11 23:18:02'),
(3213, 1439, 'A reabilitação é individualizada?', 'Sim, conforme tipo de fratura e objetivos.', 1, '2025-06-11 23:18:02'),
(3214, 1440, 'O que são órteses de mão?', 'Dispositivos para imobilizar, proteger ou facilitar movimento da mão/pulso.', 1, '2025-06-11 23:18:02'),
(3215, 1440, 'Quando usar órtese?', 'Pós-lesão, cirurgia ou em doenças inflamatórias.', 1, '2025-06-11 23:18:02'),
(3216, 1440, 'Órteses podem ser funcionais?', 'Sim, para facilitar movimentos ou repouso.', 1, '2025-06-11 23:18:02'),
(3217, 1440, 'Como garantir conforto?', 'Adaptação correta e materiais adequados.', 1, '2025-06-11 23:18:02'),
(3218, 1440, 'Família deve ser orientada?', 'Sim, sobre uso e manutenção.', 1, '2025-06-11 23:18:02'),
(3219, 1440, 'Órteses são usadas à noite?', 'Sim, conforme indicação.', 1, '2025-06-11 23:18:02'),
(3220, 1440, 'Como higienizar órtese?', 'Pano úmido, evitando calor e umidade.', 1, '2025-06-11 23:18:02'),
(3221, 1440, 'Quando suspender uso?', 'Com autorização do profissional.', 1, '2025-06-11 23:18:02'),
(3222, 1440, 'Órteses podem ser personalizadas?', 'Sim, conforme necessidade funcional.', 1, '2025-06-11 23:18:02'),
(3223, 1440, 'O que observar durante uso?', 'Ajuste, conforto e ausência de lesão.', 1, '2025-06-11 23:18:02'),
(3224, 1441, 'O que é terapia de exercícios na mão?', 'Exercícios prescritos para restaurar força, mobilidade e função.', 1, '2025-06-11 23:18:02'),
(3225, 1441, 'Quais exercícios são usados?', 'Flexão/extensão dos dedos, pinça, preensão, alongamentos.', 1, '2025-06-11 23:18:02'),
(3226, 1441, 'Por que variar exercícios?', 'Para estimular diferentes músculos e funções.', 1, '2025-06-11 23:18:02'),
(3227, 1441, 'Quando iniciar exercícios resistidos?', 'Após avaliação funcional e liberação médica.', 1, '2025-06-11 23:18:02'),
(3228, 1441, 'Como adaptar para dor?', 'Movimentos leves e mais repetições.', 1, '2025-06-11 23:18:02'),
(3229, 1441, 'Que materiais usar?', 'Bolinha, argila, elásticos, objetos caseiros.', 1, '2025-06-11 23:18:02'),
(3230, 1441, 'Exercícios em grupo são benéficos?', 'Sim, para motivação.', 1, '2025-06-11 23:18:02'),
(3231, 1441, 'Família pode supervisionar?', 'Sim, após orientação.', 1, '2025-06-11 23:18:02'),
(3232, 1441, 'Como registrar progresso?', 'Escalas de força, amplitude, relatos do paciente.', 1, '2025-06-11 23:18:02'),
(3233, 1441, 'Exercício previne complicações?', 'Sim, evita rigidez e perda de função.', 1, '2025-06-11 23:18:02'),
(3234, 1442, 'O que é Integração Sensorial?', 'Processo neurológico que organiza informações dos sentidos para uso funcional no dia a dia.', 1, '2025-06-11 23:20:54'),
(3235, 1442, 'Quem criou a teoria da Integração Sensorial?', 'A. Jean Ayres, terapeuta ocupacional norte-americana.', 1, '2025-06-11 23:20:54'),
(3236, 1442, 'Quais são os principais sistemas sensoriais abordados?', 'Tátil, vestibular e proprioceptivo.', 1, '2025-06-11 23:20:54'),
(3237, 1442, 'Qual o papel da SI no desenvolvimento infantil?', 'Permitir respostas adaptadas aos estímulos do ambiente.', 1, '2025-06-11 23:20:54'),
(3238, 1442, 'O que pode indicar disfunção de integração sensorial?', 'Dificuldades em atenção, coordenação motora e comportamento.', 1, '2025-06-11 23:20:54'),
(3239, 1442, 'Como a TO utiliza a SI?', 'Por meio de atividades planejadas que promovem organização sensorial.', 1, '2025-06-11 23:20:54'),
(3240, 1442, 'SI é importante só na infância?', 'Não, mas tem papel crítico nos primeiros anos de vida.', 1, '2025-06-11 23:20:54'),
(3241, 1442, 'Quais sinais de problemas sensoriais?', 'Hipersensibilidade, hipossensibilidade, busca ou esquiva de estímulos.', 1, '2025-06-11 23:20:54'),
(3242, 1442, 'A SI pode influenciar a aprendizagem?', 'Sim, impacta concentração, leitura, escrita e socialização.', 1, '2025-06-11 23:20:54'),
(3243, 1442, 'Exemplos de atividades de SI?', 'Brincadeiras de textura, balanço, obstáculos, massagem, saltos.', 1, '2025-06-11 23:20:54'),
(3244, 1443, 'O que é avaliação sensorial?', 'Processo de identificar padrões de resposta a estímulos sensoriais.', 1, '2025-06-11 23:20:54'),
(3245, 1443, 'Quais instrumentos TO pode usar na avaliação de SI?', 'Perfil Sensorial, Sensory Integration and Praxis Tests (SIPT).', 1, '2025-06-11 23:20:54'),
(3246, 1443, 'Por que é importante avaliar em diferentes ambientes?', 'Para identificar padrões e gatilhos sensoriais.', 1, '2025-06-11 23:20:54'),
(3247, 1443, 'Como a família contribui na avaliação?', 'Relatando comportamentos e reações do cotidiano da criança.', 1, '2025-06-11 23:20:54'),
(3248, 1443, 'Avaliação de SI deve ser multidisciplinar?', 'Sim, para uma visão mais ampla do desenvolvimento.', 1, '2025-06-11 23:20:54'),
(3249, 1443, 'Quais áreas a avaliação de SI pode impactar?', 'Desempenho escolar, socialização e habilidades motoras.', 1, '2025-06-11 23:20:54'),
(3250, 1443, 'O que observar na avaliação direta?', 'Reações a sons, toque, movimento, alimentos e luzes.', 1, '2025-06-11 23:20:54'),
(3251, 1443, 'Avaliação de SI é única para cada criança?', 'Sim, cada uma tem perfil sensorial individual.', 1, '2025-06-11 23:20:54'),
(3252, 1443, 'Quando indicar avaliação de SI?', 'Se houver atrasos, dificuldades motoras ou comportamentos atípicos.', 1, '2025-06-11 23:20:54'),
(3253, 1443, 'Como registrar avaliação?', 'Com relatórios, escalas e observação funcional.', 1, '2025-06-11 23:20:54'),
(3254, 1444, 'Quais estratégias para hipersensibilidade tátil?', 'Exposição gradual a diferentes texturas e massagens leves.', 1, '2025-06-11 23:20:54'),
(3255, 1444, 'Como trabalhar hipossensibilidade vestibular?', 'Atividades de balanço, giro, saltos e movimento de cabeça.', 1, '2025-06-11 23:20:54'),
(3256, 1444, 'Por que usar rotinas sensoriais?', 'Para organizar o sistema nervoso e melhorar a adaptação.', 1, '2025-06-11 23:20:54'),
(3257, 1444, 'Exemplo de atividade para SI em casa?', 'Circuitos motores com objetos domésticos.', 1, '2025-06-11 23:20:54'),
(3258, 1444, 'Como TO adapta sala de aula para SI?', 'Reduz estímulos, organiza espaço e usa materiais sensoriais.', 1, '2025-06-11 23:20:54'),
(3259, 1444, 'Família pode aplicar estratégias de SI?', 'Sim, após orientação da TO.', 1, '2025-06-11 23:20:54'),
(3260, 1444, 'Quais recursos ajudam modulação sensorial?', 'Abafadores, óculos escuros, roupas macias.', 1, '2025-06-11 23:20:54'),
(3261, 1444, 'O que evitar em SI?', 'Exposição a estímulos extremos sem preparo ou supervisão.', 1, '2025-06-11 23:20:54'),
(3262, 1444, 'Como avaliar resposta às intervenções?', 'Observar mudanças em comportamento e desempenho.', 1, '2025-06-11 23:20:54'),
(3263, 1444, 'SI pode melhorar participação social?', 'Sim, reduz crises e facilita interações.', 1, '2025-06-11 23:20:54'),
(3264, 1445, 'Por que SI é importante no TEA?', 'Pessoas com TEA apresentam muitos desafios sensoriais.', 1, '2025-06-11 23:20:54'),
(3265, 1445, 'Como a SI pode ajudar no TDAH?', 'Melhora autorregulação, foco e organização corporal.', 1, '2025-06-11 23:20:54'),
(3266, 1445, 'Que adaptações sensoriais beneficiam autistas?', 'Espaço calmo, redução de estímulos e uso de rotinas visuais.', 1, '2025-06-11 23:20:54'),
(3267, 1445, 'SI pode ajudar no comportamento?', 'Sim, reduz ansiedade, agitação e comportamentos repetitivos.', 1, '2025-06-11 23:20:54'),
(3268, 1445, 'Como envolver a escola no SI?', 'Orientando professores e adaptando atividades sensoriais.', 1, '2025-06-11 23:20:54'),
(3269, 1445, 'Quais sinais de sobrecarga sensorial?', 'Irritabilidade, evasão, agitação e crises.', 1, '2025-06-11 23:20:54'),
(3270, 1445, 'Família pode colaborar no SI?', 'Sim, ajustando ambiente e reforçando estratégias.', 1, '2025-06-11 23:20:54'),
(3271, 1445, 'Como a TO orienta para casa?', 'Com sugestões práticas de rotina e adaptação.', 1, '2025-06-11 23:20:54'),
(3272, 1445, 'SI deve ser personalizada?', 'Sempre, pois cada criança responde de forma única.', 1, '2025-06-11 23:20:54'),
(3273, 1445, 'Quais resultados esperar?', 'Melhora da atenção, interação e autonomia.', 1, '2025-06-11 23:20:54'),
(3274, 1446, 'O que é sala de integração sensorial?', 'Ambiente planejado com equipamentos para experiências sensoriais controladas.', 1, '2025-06-11 23:20:54'),
(3275, 1446, 'Que materiais são usados em SI?', 'Balanços, bolas, texturas, escorregador, colchonetes.', 1, '2025-06-11 23:20:54'),
(3276, 1446, 'Por que a variedade de materiais é importante?', 'Oferece estímulos para todos os sistemas sensoriais.', 1, '2025-06-11 23:20:54'),
(3277, 1446, 'Como garantir segurança no espaço terapêutico?', 'Supervisão constante e escolha de materiais apropriados.', 1, '2025-06-11 23:20:54'),
(3278, 1446, 'Espaço de SI pode ser montado em casa?', 'Sim, adaptando conforme a necessidade e orientação.', 1, '2025-06-11 23:20:54'),
(3279, 1446, 'Qual objetivo do espaço terapêutico?', 'Proporcionar experiências para organização sensorial e motora.', 1, '2025-06-11 23:20:54'),
(3280, 1446, 'Como registrar uso do espaço?', 'Com relatórios, fotos e acompanhamento do progresso.', 1, '2025-06-11 23:20:54'),
(3281, 1446, 'Família pode participar das sessões?', 'Sim, sendo orientada pela TO.', 1, '2025-06-11 23:20:54'),
(3282, 1446, 'Quais adaptações podem ser feitas?', 'Iluminação, sons, disposição de objetos e mobiliário.', 1, '2025-06-11 23:20:54'),
(3283, 1446, 'Espaço sensorial ajuda na socialização?', 'Sim, permite brincadeiras e atividades em grupo.', 1, '2025-06-11 23:20:54'),
(3284, 1447, 'O que é telereabilitação?', 'Reabilitação feita à distância, por plataformas digitais.', 1, '2025-06-11 23:21:01'),
(3285, 1447, 'Quais plataformas são usadas em telereabilitação?', 'Zoom, Google Meet, plataformas próprias de saúde.', 1, '2025-06-11 23:21:01'),
(3286, 1447, 'Como escolher uma plataforma segura?', 'Checar criptografia, políticas de privacidade e estabilidade.', 1, '2025-06-11 23:21:01'),
(3287, 1447, 'Telereabilitação pode ser síncrona e assíncrona?', 'Sim, em tempo real ou com conteúdos gravados.', 1, '2025-06-11 23:21:01'),
(3288, 1447, 'Vantagem da telereabilitação?', 'Acessibilidade e continuidade do cuidado mesmo à distância.', 1, '2025-06-11 23:21:01'),
(3289, 1447, 'Qual papel da TO na telereabilitação?', 'Planejar e orientar sessões online e avaliar progressos.', 1, '2025-06-11 23:21:01'),
(3290, 1447, 'Quais limitações da telereabilitação?', 'Falta de contato físico e dependência de tecnologia.', 1, '2025-06-11 23:21:01'),
(3291, 1447, 'É necessário consentimento do paciente?', 'Sim, sempre deve ser obtido.', 1, '2025-06-11 23:21:01'),
(3292, 1447, 'Plataformas devem ter registro?', 'Sim, registro na Anvisa ou órgão responsável.', 1, '2025-06-11 23:21:01'),
(3293, 1447, 'Telereabilitação pode ser usada com crianças?', 'Sim, com envolvimento da família.', 1, '2025-06-11 23:21:01'),
(3294, 1448, 'O que são protocolos remotos em OT?', 'Procedimentos padronizados para atendimento terapêutico online.', 1, '2025-06-11 23:21:01'),
(3295, 1448, 'Como adaptar protocolos para cada paciente?', 'Personalizando atividades e acompanhando evolução.', 1, '2025-06-11 23:21:01'),
(3296, 1448, 'Quais cuidados ao aplicar protocolo remoto?', 'Clareza nas orientações, segurança e acessibilidade.', 1, '2025-06-11 23:21:01'),
(3297, 1448, 'Exemplo de atividade remota?', 'Treino de AVD guiado por vídeo.', 1, '2025-06-11 23:21:01'),
(3298, 1448, 'TO pode monitorar progresso online?', 'Sim, por chamadas de vídeo, questionários e registros digitais.', 1, '2025-06-11 23:21:01'),
(3299, 1448, 'Como documentar sessões remotas?', 'Anotações, gravações autorizadas e relatórios.', 1, '2025-06-11 23:21:01'),
(3300, 1448, 'Família pode ser facilitadora?', 'Sim, fundamental no ambiente domiciliar.', 1, '2025-06-11 23:21:01'),
(3301, 1448, 'Quais limitações dos protocolos remotos?', 'Dificuldade de avaliação física direta.', 1, '2025-06-11 23:21:01'),
(3302, 1448, 'Como avaliar segurança em casa?', 'Solicitar vídeo do ambiente e orientar adaptações.', 1, '2025-06-11 23:21:01'),
(3303, 1448, 'É possível treinar habilidades motoras remotamente?', 'Sim, com orientação clara e supervisão.', 1, '2025-06-11 23:21:01'),
(3304, 1449, 'Por que privacidade é essencial na telereabilitação?', 'Para proteger informações sensíveis do paciente.', 1, '2025-06-11 23:21:01'),
(3305, 1449, 'Como garantir confidencialidade online?', 'Usar plataformas seguras e orientar paciente e família.', 1, '2025-06-11 23:21:01'),
(3306, 1449, 'Quais leis regulam segurança de dados?', 'LGPD (Brasil), GDPR (Europa), HIPAA (EUA).', 1, '2025-06-11 23:21:01'),
(3307, 1449, 'Como obter consentimento informado?', 'Explicando riscos e registrando aceitação.', 1, '2025-06-11 23:21:01'),
(3308, 1449, 'Pode-se gravar sessões sem autorização?', 'Não, é obrigatório obter consentimento.', 1, '2025-06-11 23:21:01'),
(3309, 1449, 'Quais cuidados com senhas?', 'Usar senhas fortes e não compartilhar acessos.', 1, '2025-06-11 23:21:01'),
(3310, 1449, 'Como evitar vazamento de dados?', 'Atualizar sistemas e restringir acessos.', 1, '2025-06-11 23:21:01'),
(3311, 1449, 'Teleconsultas devem ser feitas em ambientes privados?', 'Sim, para garantir sigilo.', 1, '2025-06-11 23:21:01'),
(3312, 1449, 'Como armazenar registros digitais?', 'Em sistemas criptografados e autorizados.', 1, '2025-06-11 23:21:01'),
(3313, 1449, 'O que fazer em caso de violação?', 'Notificar autoridade e paciente, corrigir falhas.', 1, '2025-06-11 23:21:01'),
(3314, 1450, 'O que é engajamento do paciente?', 'Participação ativa do paciente no tratamento.', 1, '2025-06-11 23:21:01'),
(3315, 1450, 'Como motivar pacientes online?', 'Usar metas claras, reforço positivo e feedback constante.', 1, '2025-06-11 23:21:01'),
(3316, 1450, 'Família pode aumentar engajamento?', 'Sim, sendo parte ativa nas sessões e rotina.', 1, '2025-06-11 23:21:01'),
(3317, 1450, 'O que dificulta engajamento remoto?', 'Desatenção, baixa motivação e ambiente inadequado.', 1, '2025-06-11 23:21:01'),
(3318, 1450, 'Como adaptar linguagem para online?', 'Ser direto, objetivo e usar recursos visuais.', 1, '2025-06-11 23:21:01'),
(3319, 1450, 'Quais ferramentas melhoram engajamento?', 'Vídeos, jogos digitais, aplicativos de tarefas.', 1, '2025-06-11 23:21:01'),
(3320, 1450, 'Como acompanhar adesão?', 'Questionários, auto-registros e avaliações frequentes.', 1, '2025-06-11 23:21:01'),
(3321, 1450, 'A TO deve dar retorno frequente?', 'Sim, para motivar e ajustar o plano.', 1, '2025-06-11 23:21:01'),
(3322, 1450, 'Como lidar com desistências?', 'Reavaliar barreiras e adaptar abordagem.', 1, '2025-06-11 23:21:01'),
(3323, 1450, 'Metas online devem ser realistas?', 'Sempre, para evitar frustração.', 1, '2025-06-11 23:21:01'),
(3324, 1451, 'O que é telemonitoramento?', 'Acompanhamento remoto do progresso do paciente.', 1, '2025-06-11 23:21:01'),
(3325, 1451, 'Como coletar dados no telemonitoramento?', 'Por vídeos, fotos, relatórios digitais e autoavaliação.', 1, '2025-06-11 23:21:01'),
(3326, 1451, 'Família pode colaborar no monitoramento?', 'Sim, enviando informações e registros à TO.', 1, '2025-06-11 23:21:01'),
(3327, 1451, 'Feedback deve ser frequente?', 'Sim, para ajustar intervenções e motivar.', 1, '2025-06-11 23:21:01'),
(3328, 1451, 'Quais indicadores podem ser monitorados?', 'Participação, execução de tarefas, autonomia.', 1, '2025-06-11 23:21:01'),
(3329, 1451, 'Como usar aplicativos para feedback?', 'Solicitando preenchimento e acompanhando gráficos de evolução.', 1, '2025-06-11 23:21:01'),
(3330, 1451, 'Quais benefícios do feedback digital?', 'Rapidez, personalização e registro histórico.', 1, '2025-06-11 23:21:01'),
(3331, 1451, 'TO pode corrigir exercícios à distância?', 'Sim, orientando com vídeos e mensagens.', 1, '2025-06-11 23:21:01'),
(3332, 1451, 'Quais limites do telemonitoramento?', 'Depende da adesão do paciente e recursos tecnológicos.', 1, '2025-06-11 23:21:01'),
(3333, 1451, 'Telemonitoramento substitui acompanhamento presencial?', 'Não totalmente, mas complementa e amplia o cuidado.', 1, '2025-06-11 23:21:01'),
(3334, 1452, 'O que é entrevista motivacional?', 'É uma técnica de comunicação focada em fortalecer a motivação do paciente para mudanças positivas.', 1, '2025-06-12 00:07:00'),
(3335, 1452, 'Qual objetivo da entrevista motivacional?', 'Ajudar o paciente a superar ambivalências e promover escolhas saudáveis.', 1, '2025-06-12 00:07:00'),
(3336, 1452, 'Como iniciar uma entrevista motivacional?', 'Com escuta ativa, acolhimento e perguntas abertas.', 1, '2025-06-12 00:07:00'),
(3337, 1452, 'O que evitar durante a entrevista motivacional?', 'Julgamentos, imposições e respostas automáticas.', 1, '2025-06-12 00:07:00'),
(3338, 1452, 'Como a TO pode aplicar entrevista motivacional?', 'Explorando metas, dificuldades e encorajando pequenas mudanças.', 1, '2025-06-12 00:07:00'),
(3339, 1452, 'Qual o papel da empatia?', 'Fundamental para construir vínculo e promover confiança.', 1, '2025-06-12 00:07:00'),
(3340, 1452, 'O que significa “ambivalência”?', 'Sentimentos ou pensamentos contraditórios em relação à mudança.', 1, '2025-06-12 00:07:00'),
(3341, 1452, 'Quando usar reforço positivo?', 'Sempre que identificar avanços ou tentativas de mudança.', 1, '2025-06-12 00:07:00'),
(3342, 1452, 'Como lidar com resistência do paciente?', 'Respeitando tempo, reforçando autonomia e oferecendo alternativas.', 1, '2025-06-12 00:07:00'),
(3343, 1452, 'Qual benefício da entrevista motivacional?', 'Aumenta adesão ao tratamento e protagonismo do paciente.', 1, '2025-06-12 00:07:00'),
(3344, 1453, 'O que é rapport?', 'Relação de confiança, respeito e colaboração entre terapeuta e paciente.', 1, '2025-06-12 00:07:00'),
(3345, 1453, 'Como construir rapport?', 'Com escuta ativa, respeito às diferenças e comunicação aberta.', 1, '2025-06-12 00:07:00'),
(3346, 1453, 'Por que a aliança terapêutica é importante?', 'Facilita o engajamento e o sucesso do tratamento.', 1, '2025-06-12 00:07:00'),
(3347, 1453, 'Como lidar com quebra de confiança?', 'Reconhecendo falhas, pedindo desculpas e buscando reparar o vínculo.', 1, '2025-06-12 00:07:00'),
(3348, 1453, 'Rapport é construído só na primeira sessão?', 'Não, é fortalecido ao longo de todo o processo.', 1, '2025-06-12 00:07:00'),
(3349, 1453, 'Como a TO demonstra respeito à individualidade?', 'Personalizando intervenções e ouvindo as necessidades do paciente.', 1, '2025-06-12 00:07:00'),
(3350, 1453, 'Quais sinais de bom rapport?', 'Colaboração, abertura e comunicação fluida.', 1, '2025-06-12 00:07:00'),
(3351, 1453, 'Como abordar temas delicados?', 'Com sensibilidade, linguagem clara e permissão do paciente.', 1, '2025-06-12 00:07:00'),
(3352, 1453, 'O que fazer diante de resistência?', 'Buscar compreender causas e ajustar abordagem.', 1, '2025-06-12 00:07:00'),
(3353, 1453, 'Aliança terapêutica pode ser mensurada?', 'Sim, por meio de questionários e feedback direto.', 1, '2025-06-12 00:07:00'),
(3354, 1454, 'O que é comunicação não-verbal?', 'Expressão de sentimentos, intenções e informações sem uso de palavras.', 1, '2025-06-12 00:07:00'),
(3355, 1454, 'Exemplo de comunicação não-verbal?', 'Gestos, posturas, expressões faciais e contato visual.', 1, '2025-06-12 00:07:00'),
(3356, 1454, 'Por que observar sinais não-verbais?', 'Ajudam a compreender emoções e intenções do paciente.', 1, '2025-06-12 00:07:00'),
(3357, 1454, 'A comunicação não-verbal pode contradizer a fala?', 'Sim, por isso é importante observar incongruências.', 1, '2025-06-12 00:07:00'),
(3358, 1454, 'Como usar o toque terapêutico?', 'Com consentimento, respeito e atenção à reação do paciente.', 1, '2025-06-12 00:07:00'),
(3359, 1454, 'Quais cuidados ao interpretar sinais não-verbais?', 'Considerar contexto cultural e individual.', 1, '2025-06-12 00:07:00'),
(3360, 1454, 'Como a postura influencia a comunicação?', 'Postura aberta transmite acolhimento, fechada pode indicar barreira.', 1, '2025-06-12 00:07:00'),
(3361, 1454, 'Sorrisos são sempre sinais de alegria?', 'Não, podem expressar desconforto ou insegurança.', 1, '2025-06-12 00:07:00'),
(3362, 1454, 'Olhar nos olhos é sempre positivo?', 'Depende da cultura e preferência do paciente.', 1, '2025-06-12 00:07:00'),
(3363, 1454, 'Como aprimorar comunicação não-verbal?', 'Com auto-observação, feedback e treinamento.', 1, '2025-06-12 00:07:00'),
(3364, 1455, 'O que é feedback construtivo?', 'Retorno dado ao paciente com foco no crescimento e melhora, de maneira respeitosa.', 1, '2025-06-12 00:07:00'),
(3365, 1455, 'Quando dar feedback ao paciente?', 'Durante todo o processo terapêutico, sempre que necessário.', 1, '2025-06-12 00:07:00'),
(3366, 1455, 'Como dar feedback sem desmotivar?', 'Focar em pontos fortes e sugerir melhorias de forma empática.', 1, '2025-06-12 00:07:00'),
(3367, 1455, 'Por que feedback é importante?', 'Ajuda o paciente a perceber avanços e desafios.', 1, '2025-06-12 00:07:00'),
(3368, 1455, 'Como receber feedback do paciente?', 'Com abertura e disposição para ajustes.', 1, '2025-06-12 00:07:00'),
(3369, 1455, 'Feedback deve ser imediato?', 'Sempre que possível, para maior impacto.', 1, '2025-06-12 00:07:00'),
(3370, 1455, 'Quais cuidados ao corrigir paciente?', 'Ser claro, objetivo e acolhedor.', 1, '2025-06-12 00:07:00'),
(3371, 1455, 'Feedback pode ser negativo?', 'Sim, desde que seja construtivo e respeitoso.', 1, '2025-06-12 00:07:00');
INSERT INTO `flashcards` (`id_flashcard`, `id_assunto`, `pergunta`, `resposta`, `ativo`, `data_criacao`) VALUES
(3372, 1455, 'Como estimular autoavaliação?', 'Perguntando ao paciente sobre suas percepções e sentimentos.', 1, '2025-06-12 00:07:00'),
(3373, 1455, 'O feedback deve ser personalizado?', 'Sim, adaptado ao perfil e momento do paciente.', 1, '2025-06-12 00:07:00'),
(3374, 1456, 'O que é gestão de conflitos?', 'Processo de identificar, lidar e resolver desentendimentos entre pacientes ou equipe.', 1, '2025-06-12 00:07:00'),
(3375, 1456, 'Conflitos são sempre negativos?', 'Não, podem gerar crescimento se bem conduzidos.', 1, '2025-06-12 00:07:00'),
(3376, 1456, 'Como prevenir conflitos?', 'Com comunicação clara, regras e respeito mútuo.', 1, '2025-06-12 00:07:00'),
(3377, 1456, 'O que fazer diante de conflito entre paciente e terapeuta?', 'Ouvir ambas as partes, manter calma e buscar solução conjunta.', 1, '2025-06-12 00:07:00'),
(3378, 1456, 'Qual o papel do terapeuta em conflitos?', 'Medir, facilitar o diálogo e buscar consenso.', 1, '2025-06-12 00:07:00'),
(3379, 1456, 'Como registrar conflitos na clínica?', 'Em prontuário, de modo objetivo e ético.', 1, '2025-06-12 00:07:00'),
(3380, 1456, 'Quais habilidades ajudam na gestão de conflitos?', 'Empatia, escuta ativa e assertividade.', 1, '2025-06-12 00:07:00'),
(3381, 1456, 'Quando envolver equipe na resolução?', 'Quando o conflito afeta mais de uma pessoa ou o ambiente clínico.', 1, '2025-06-12 00:07:00'),
(3382, 1456, 'Conflitos podem afetar o tratamento?', 'Sim, prejudicando vínculo e adesão.', 1, '2025-06-12 00:07:00'),
(3383, 1456, 'Como lidar com conflitos recorrentes?', 'Reavaliar abordagens, buscar mediação externa e fortalecer comunicação.', 1, '2025-06-12 00:07:00'),
(3384, 1457, 'O que é prontuário eletrônico?', 'Sistema digital para registro, organização e consulta de dados clínicos do paciente.', 1, '2025-06-12 00:08:15'),
(3385, 1457, 'Quais vantagens do prontuário eletrônico?', 'Agilidade, segurança, acesso remoto e redução de erros.', 1, '2025-06-12 00:08:15'),
(3386, 1457, 'Como garantir sigilo no prontuário eletrônico?', 'Com senhas, criptografia e acesso restrito.', 1, '2025-06-12 00:08:15'),
(3387, 1457, 'Quem pode acessar o prontuário eletrônico?', 'Profissionais autorizados pela instituição.', 1, '2025-06-12 00:08:15'),
(3388, 1457, 'Por que registrar todas as intervenções?', 'Para garantir rastreabilidade e continuidade do cuidado.', 1, '2025-06-12 00:08:15'),
(3389, 1457, 'É possível anexar documentos ao prontuário eletrônico?', 'Sim, como laudos, exames e imagens.', 1, '2025-06-12 00:08:15'),
(3390, 1457, 'Prontuário eletrônico pode ser impresso?', 'Sim, quando necessário, mantendo sigilo.', 1, '2025-06-12 00:08:15'),
(3391, 1457, 'Quais riscos do prontuário eletrônico?', 'Vazamento de dados e falhas técnicas.', 1, '2025-06-12 00:08:15'),
(3392, 1457, 'Prontuário eletrônico substitui papel?', 'Sim, em instituições autorizadas e com backup seguro.', 1, '2025-06-12 00:08:15'),
(3393, 1457, 'O que fazer em caso de erro no registro?', 'Registrar a correção, sem apagar o dado anterior.', 1, '2025-06-12 00:08:15'),
(3394, 1458, 'O que são SOAP Notes?', 'Método padronizado para registrar atendimentos clínicos: Subjetivo, Objetivo, Avaliação e Plano.', 1, '2025-06-12 00:08:15'),
(3395, 1458, 'O que significa o S em SOAP?', 'Subjetivo: informações relatadas pelo paciente.', 1, '2025-06-12 00:08:15'),
(3396, 1458, 'O que significa o O em SOAP?', 'Objetivo: dados observados e medidos pelo terapeuta.', 1, '2025-06-12 00:08:15'),
(3397, 1458, 'Como preencher a Avaliação nas SOAP Notes?', 'Interpretando dados coletados e evoluções percebidas.', 1, '2025-06-12 00:08:15'),
(3398, 1458, 'O que incluir no Plano?', 'Orientações, metas e próximos passos do tratamento.', 1, '2025-06-12 00:08:15'),
(3399, 1458, 'Por que usar SOAP Notes?', 'Para padronizar registros e facilitar comunicação entre equipe.', 1, '2025-06-12 00:08:15'),
(3400, 1458, 'SOAP Notes são obrigatórias?', 'Depende da instituição, mas são amplamente recomendadas.', 1, '2025-06-12 00:08:15'),
(3401, 1458, 'Quais erros evitar nas SOAP Notes?', 'Omissão de informações, julgamentos e falta de clareza.', 1, '2025-06-12 00:08:15'),
(3402, 1458, 'Como organizar SOAP Notes?', 'Registrar de forma cronológica e objetiva.', 1, '2025-06-12 00:08:15'),
(3403, 1458, 'Quem pode acessar SOAP Notes?', 'Somente profissionais autorizados e equipe de saúde.', 1, '2025-06-12 00:08:15'),
(3404, 1459, 'O que são indicadores de resultado?', 'Medidas utilizadas para avaliar a efetividade das intervenções terapêuticas.', 1, '2025-06-12 00:08:15'),
(3405, 1459, 'Dê exemplo de indicador em OT.', 'Ganho de autonomia em AVD, aumento de força, redução de quedas.', 1, '2025-06-12 00:08:15'),
(3406, 1459, 'Por que monitorar indicadores?', 'Para avaliar progresso e ajustar o plano terapêutico.', 1, '2025-06-12 00:08:15'),
(3407, 1459, 'Indicadores devem ser quantitativos ou qualitativos?', 'Podem ser ambos, dependendo do objetivo.', 1, '2025-06-12 00:08:15'),
(3408, 1459, 'Como escolher indicadores?', 'Definindo metas claras e relevantes para o paciente.', 1, '2025-06-12 00:08:15'),
(3409, 1459, 'Quando revisar indicadores?', 'Periodicamente, conforme evolução do tratamento.', 1, '2025-06-12 00:08:15'),
(3410, 1459, 'Como documentar resultados?', 'No prontuário, com dados, gráficos e observações.', 1, '2025-06-12 00:08:15'),
(3411, 1459, 'Quais benefícios dos indicadores?', 'Melhoram tomada de decisão e justificam intervenções.', 1, '2025-06-12 00:08:15'),
(3412, 1459, 'Como engajar o paciente nos resultados?', 'Mostrando avanços e ajustando metas junto ao paciente.', 1, '2025-06-12 00:08:15'),
(3413, 1459, 'Indicadores são exigidos por órgãos reguladores?', 'Sim, para controle de qualidade e auditoria.', 1, '2025-06-12 00:08:15'),
(3414, 1460, 'Por que padronizar relatórios?', 'Para garantir clareza, objetividade e facilitar auditorias.', 1, '2025-06-12 00:08:15'),
(3415, 1460, 'O que deve conter um relatório clínico?', 'Identificação, avaliação, intervenção, evolução e plano.', 1, '2025-06-12 00:08:15'),
(3416, 1460, 'Quais benefícios da padronização?', 'Facilita leitura, evita erros e agiliza comunicação.', 1, '2025-06-12 00:08:15'),
(3417, 1460, 'Como organizar o relatório?', 'Seguindo tópicos lógicos e linguagem clara.', 1, '2025-06-12 00:08:15'),
(3418, 1460, 'Relatórios devem ser assinados?', 'Sim, por profissional responsável e com registro.', 1, '2025-06-12 00:08:15'),
(3419, 1460, 'Como proteger informações no relatório?', 'Evitar dados desnecessários e seguir normas de sigilo.', 1, '2025-06-12 00:08:15'),
(3420, 1460, 'Quando revisar relatórios?', 'Antes de finalizar e periodicamente em auditorias.', 1, '2025-06-12 00:08:15'),
(3421, 1460, 'Pode-se anexar fotos e exames?', 'Sim, quando relevante para o caso.', 1, '2025-06-12 00:08:15'),
(3422, 1460, 'Erros em relatórios podem ser corrigidos?', 'Sim, com adendos devidamente registrados.', 1, '2025-06-12 00:08:15'),
(3423, 1460, 'Relatórios devem ter linguagem técnica?', 'Sim, mas acessível à equipe multiprofissional.', 1, '2025-06-12 00:08:15'),
(3424, 1461, 'O que é gestão de dados clínicos?', 'Processo de coleta, armazenamento, proteção e uso de informações de pacientes.', 1, '2025-06-12 00:08:15'),
(3425, 1461, 'Por que proteger dados clínicos?', 'Para garantir sigilo, segurança e respeito ao paciente.', 1, '2025-06-12 00:08:15'),
(3426, 1461, 'Quais leis protegem dados clínicos?', 'LGPD (Brasil), HIPAA (EUA) e outras normas específicas.', 1, '2025-06-12 00:08:15'),
(3427, 1461, 'Como armazenar dados com segurança?', 'Em sistemas criptografados, com backup e acesso restrito.', 1, '2025-06-12 00:08:15'),
(3428, 1461, 'Quem pode acessar dados clínicos?', 'Apenas profissionais autorizados e responsáveis pelo cuidado.', 1, '2025-06-12 00:08:15'),
(3429, 1461, 'Como evitar vazamento de informações?', 'Treinar equipe, atualizar sistemas e revisar acessos.', 1, '2025-06-12 00:08:15'),
(3430, 1461, 'Pode-se compartilhar dados com terceiros?', 'Apenas com autorização do paciente ou exigência legal.', 1, '2025-06-12 00:08:15'),
(3431, 1461, 'Por que registrar acessos aos dados?', 'Para rastrear movimentações e evitar uso indevido.', 1, '2025-06-12 00:08:15'),
(3432, 1461, 'Como garantir integridade dos dados?', 'Manter backups, evitar alterações indevidas e registrar correções.', 1, '2025-06-12 00:08:15'),
(3433, 1461, 'Gestão de dados clínicos é responsabilidade de quem?', 'De toda equipe de saúde e instituição.', 1, '2025-06-12 00:08:15'),
(3434, 1502, 'O que é um comitê de ética?', 'Grupo responsável por avaliar se pesquisas respeitam direitos e segurança dos participantes.', 1, '2025-06-12 00:17:16'),
(3435, 1502, 'Quando submeter projeto ao comitê?', 'Antes de iniciar qualquer pesquisa envolvendo pessoas.', 1, '2025-06-12 00:17:16'),
(3436, 1502, 'O que é consentimento livre e esclarecido?', 'Permissão dada pelo participante, após ser informado sobre a pesquisa.', 1, '2025-06-12 00:17:16'),
(3437, 1502, 'O que faz o CEP?', 'Analisa riscos, benefícios e adequação ética dos estudos.', 1, '2025-06-12 00:17:16'),
(3438, 1502, 'Comitê de ética pode reprovar projetos?', 'Sim, se houver riscos não justificados ou falhas éticas.', 1, '2025-06-12 00:17:16'),
(3439, 1502, 'Quem precisa assinar o consentimento?', 'O participante e, em caso de incapaz, seu responsável.', 1, '2025-06-12 00:17:16'),
(3440, 1502, 'Consentimento pode ser retirado?', 'Sim, o participante pode desistir a qualquer momento.', 1, '2025-06-12 00:17:16'),
(3441, 1502, 'Pesquisa sem consentimento é válida?', 'Não, viola princípios éticos e legais.', 1, '2025-06-12 00:17:16'),
(3442, 1502, 'Comitê de ética avalia apenas pesquisa clínica?', 'Não, avalia qualquer estudo com seres humanos.', 1, '2025-06-12 00:17:16'),
(3443, 1502, 'Quais documentos enviar ao CEP?', 'Projeto, formulário de consentimento e anexos pertinentes.', 1, '2025-06-12 00:17:16'),
(3444, 1503, 'Quais são direitos do participante?', 'Informação, autonomia, confidencialidade e segurança durante a pesquisa.', 1, '2025-06-12 00:17:16'),
(3445, 1503, 'Participante pode desistir?', 'Sim, em qualquer momento e sem prejuízo.', 1, '2025-06-12 00:17:16'),
(3446, 1503, 'O que é confidencialidade?', 'Proteção das informações pessoais do participante.', 1, '2025-06-12 00:17:16'),
(3447, 1503, 'Como garantir respeito ao participante?', 'Com informações claras e atendimento humanizado.', 1, '2025-06-12 00:17:16'),
(3448, 1503, 'Pesquisador pode obrigar participação?', 'Nunca, deve ser sempre voluntária.', 1, '2025-06-12 00:17:16'),
(3449, 1503, 'Participante pode pedir esclarecimentos?', 'Sim, o pesquisador deve estar disponível para dúvidas.', 1, '2025-06-12 00:17:16'),
(3450, 1503, 'Como registrar que o participante foi respeitado?', 'Por meio de consentimento e registros no projeto.', 1, '2025-06-12 00:17:16'),
(3451, 1503, 'O que é dano mínimo?', 'Risco que não ultrapassa desconfortos do cotidiano.', 1, '2025-06-12 00:17:16'),
(3452, 1503, 'Participante recebe compensação?', 'Pode haver reembolso, mas não pode ser incentivo para risco.', 1, '2025-06-12 00:17:16'),
(3453, 1503, 'Quais órgãos fiscalizam direitos dos participantes?', 'CEP, CONEP e autoridades de saúde.', 1, '2025-06-12 00:17:16'),
(3454, 1504, 'O que é pesquisa qualitativa?', 'Estudo que explora significados, experiências e opiniões dos participantes.', 1, '2025-06-12 00:17:16'),
(3455, 1504, 'Exemplo de método qualitativo?', 'Entrevistas, grupos focais, observação participante.', 1, '2025-06-12 00:17:16'),
(3456, 1504, 'Por que usar pesquisa qualitativa?', 'Para aprofundar compreensão de fenômenos complexos em saúde.', 1, '2025-06-12 00:17:16'),
(3457, 1504, 'Como coletar dados qualitativos?', 'Com entrevistas gravadas, anotações e registros de campo.', 1, '2025-06-12 00:17:16'),
(3458, 1504, 'Como analisar dados qualitativos?', 'Por análise de conteúdo, categorias e temas emergentes.', 1, '2025-06-12 00:17:16'),
(3459, 1504, 'Qual o papel do pesquisador?', 'Ser sensível, ético e aberto a interpretações.', 1, '2025-06-12 00:17:16'),
(3460, 1504, 'Como garantir rigor em pesquisa qualitativa?', 'Com transparência, triangulação de dados e validação por pares.', 1, '2025-06-12 00:17:16'),
(3461, 1504, 'Pesquisa qualitativa precisa de comitê de ética?', 'Sim, quando envolve pessoas.', 1, '2025-06-12 00:17:16'),
(3462, 1504, 'Como registrar resultados qualitativos?', 'Por relatos detalhados e trechos de falas.', 1, '2025-06-12 00:17:16'),
(3463, 1504, 'Limites da pesquisa qualitativa?', 'Subjetividade, menor generalização e demanda de tempo.', 1, '2025-06-12 00:17:16'),
(3464, 1505, 'O que é plágio?', 'Uso de ideias ou textos de outros sem dar o devido crédito.', 1, '2025-06-12 00:17:16'),
(3465, 1505, 'Como evitar plágio?', 'Citanto corretamente autores e fontes utilizadas.', 1, '2025-06-12 00:17:16'),
(3466, 1505, 'O que é autoplágio?', 'Reutilização de trabalhos próprios sem referência ou autorização.', 1, '2025-06-12 00:17:16'),
(3467, 1505, 'Por que publicar resultados?', 'Para compartilhar conhecimento e permitir avanços na área.', 1, '2025-06-12 00:17:16'),
(3468, 1505, 'O que são revistas indexadas?', 'Publicações reconhecidas por bases científicas.', 1, '2025-06-12 00:17:16'),
(3469, 1505, 'Como escolher revista para publicar?', 'Considerar escopo, fator de impacto e acesso aberto.', 1, '2025-06-12 00:17:16'),
(3470, 1505, 'Publicação pode ser recusada?', 'Sim, após revisão por pares.', 1, '2025-06-12 00:17:16'),
(3471, 1505, 'Consequências do plágio?', 'Descredenciamento, perda de título e danos à reputação.', 1, '2025-06-12 00:17:16'),
(3472, 1505, 'Como reconhecer plágio?', 'Por softwares antiplágio e análise de originalidade.', 1, '2025-06-12 00:17:16'),
(3473, 1505, 'Publicar resultados negativos é válido?', 'Sim, contribui para conhecimento científico.', 1, '2025-06-12 00:17:16'),
(3474, 1506, 'O que é data management?', 'Gestão adequada de coleta, armazenamento e uso de dados em pesquisa.', 1, '2025-06-12 00:17:16'),
(3475, 1506, 'Por que proteger dados de pesquisa?', 'Para garantir ética, sigilo e validade dos resultados.', 1, '2025-06-12 00:17:16'),
(3476, 1506, 'Como armazenar dados?', 'Com segurança, backup e restrição de acesso.', 1, '2025-06-12 00:17:16'),
(3477, 1506, 'Quem pode acessar dados?', 'Somente pesquisadores autorizados pelo projeto.', 1, '2025-06-12 00:17:16'),
(3478, 1506, 'Como documentar etapas de data management?', 'Com registros detalhados de cada fase da pesquisa.', 1, '2025-06-12 00:17:16'),
(3479, 1506, 'Quais normas regem data management?', 'LGPD, políticas institucionais e regulamentos internacionais.', 1, '2025-06-12 00:17:16'),
(3480, 1506, 'Pode-se compartilhar dados com outros pesquisadores?', 'Sim, se houver consentimento e autorização ética.', 1, '2025-06-12 00:17:16'),
(3481, 1506, 'O que é anonimização?', 'Remover informações que permitam identificar participantes.', 1, '2025-06-12 00:17:16'),
(3482, 1506, 'Como registrar destruição de dados?', 'Em atas, relatórios e documentação de encerramento.', 1, '2025-06-12 00:17:16'),
(3483, 1506, 'Por que revisar data management?', 'Para garantir boas práticas e evitar erros.', 1, '2025-06-12 00:17:16'),
(3484, 1502, 'O que é um comitê de ética?', 'Grupo responsável por avaliar se pesquisas respeitam direitos e segurança dos participantes.', 1, '2025-06-12 00:19:52'),
(3485, 1502, 'Quando submeter projeto ao comitê?', 'Antes de iniciar qualquer pesquisa envolvendo pessoas.', 1, '2025-06-12 00:19:52'),
(3486, 1502, 'O que é consentimento livre e esclarecido?', 'Permissão dada pelo participante, após ser informado sobre a pesquisa.', 1, '2025-06-12 00:19:52'),
(3487, 1502, 'O que faz o CEP?', 'Analisa riscos, benefícios e adequação ética dos estudos.', 1, '2025-06-12 00:19:52'),
(3488, 1502, 'Comitê de ética pode reprovar projetos?', 'Sim, se houver riscos não justificados ou falhas éticas.', 1, '2025-06-12 00:19:52'),
(3489, 1502, 'Quem precisa assinar o consentimento?', 'O participante e, em caso de incapaz, seu responsável.', 1, '2025-06-12 00:19:52'),
(3490, 1502, 'Consentimento pode ser retirado?', 'Sim, o participante pode desistir a qualquer momento.', 1, '2025-06-12 00:19:52'),
(3491, 1502, 'Pesquisa sem consentimento é válida?', 'Não, viola princípios éticos e legais.', 1, '2025-06-12 00:19:52'),
(3492, 1502, 'Comitê de ética avalia apenas pesquisa clínica?', 'Não, avalia qualquer estudo com seres humanos.', 1, '2025-06-12 00:19:52'),
(3493, 1502, 'Quais documentos enviar ao CEP?', 'Projeto, formulário de consentimento e anexos pertinentes.', 1, '2025-06-12 00:19:52'),
(3494, 1503, 'Quais são direitos do participante?', 'Informação, autonomia, confidencialidade e segurança durante a pesquisa.', 1, '2025-06-12 00:19:52'),
(3495, 1503, 'Participante pode desistir?', 'Sim, em qualquer momento e sem prejuízo.', 1, '2025-06-12 00:19:52'),
(3496, 1503, 'O que é confidencialidade?', 'Proteção das informações pessoais do participante.', 1, '2025-06-12 00:19:52'),
(3497, 1503, 'Como garantir respeito ao participante?', 'Com informações claras e atendimento humanizado.', 1, '2025-06-12 00:19:52'),
(3498, 1503, 'Pesquisador pode obrigar participação?', 'Nunca, deve ser sempre voluntária.', 1, '2025-06-12 00:19:52'),
(3499, 1503, 'Participante pode pedir esclarecimentos?', 'Sim, o pesquisador deve estar disponível para dúvidas.', 1, '2025-06-12 00:19:52'),
(3500, 1503, 'Como registrar que o participante foi respeitado?', 'Por meio de consentimento e registros no projeto.', 1, '2025-06-12 00:19:52'),
(3501, 1503, 'O que é dano mínimo?', 'Risco que não ultrapassa desconfortos do cotidiano.', 1, '2025-06-12 00:19:52'),
(3502, 1503, 'Participante recebe compensação?', 'Pode haver reembolso, mas não pode ser incentivo para risco.', 1, '2025-06-12 00:19:52'),
(3503, 1503, 'Quais órgãos fiscalizam direitos dos participantes?', 'CEP, CONEP e autoridades de saúde.', 1, '2025-06-12 00:19:52'),
(3504, 1504, 'O que é pesquisa qualitativa?', 'Estudo que explora significados, experiências e opiniões dos participantes.', 1, '2025-06-12 00:19:52'),
(3505, 1504, 'Exemplo de método qualitativo?', 'Entrevistas, grupos focais, observação participante.', 1, '2025-06-12 00:19:52'),
(3506, 1504, 'Por que usar pesquisa qualitativa?', 'Para aprofundar compreensão de fenômenos complexos em saúde.', 1, '2025-06-12 00:19:52'),
(3507, 1504, 'Como coletar dados qualitativos?', 'Com entrevistas gravadas, anotações e registros de campo.', 1, '2025-06-12 00:19:52'),
(3508, 1504, 'Como analisar dados qualitativos?', 'Por análise de conteúdo, categorias e temas emergentes.', 1, '2025-06-12 00:19:52'),
(3509, 1504, 'Qual o papel do pesquisador?', 'Ser sensível, ético e aberto a interpretações.', 1, '2025-06-12 00:19:52'),
(3510, 1504, 'Como garantir rigor em pesquisa qualitativa?', 'Com transparência, triangulação de dados e validação por pares.', 1, '2025-06-12 00:19:52'),
(3511, 1504, 'Pesquisa qualitativa precisa de comitê de ética?', 'Sim, quando envolve pessoas.', 1, '2025-06-12 00:19:52'),
(3512, 1504, 'Como registrar resultados qualitativos?', 'Por relatos detalhados e trechos de falas.', 1, '2025-06-12 00:19:52'),
(3513, 1504, 'Limites da pesquisa qualitativa?', 'Subjetividade, menor generalização e demanda de tempo.', 1, '2025-06-12 00:19:52'),
(3514, 1505, 'O que é plágio?', 'Uso de ideias ou textos de outros sem dar o devido crédito.', 1, '2025-06-12 00:19:52'),
(3515, 1505, 'Como evitar plágio?', 'Citanto corretamente autores e fontes utilizadas.', 1, '2025-06-12 00:19:52'),
(3516, 1505, 'O que é autoplágio?', 'Reutilização de trabalhos próprios sem referência ou autorização.', 1, '2025-06-12 00:19:52'),
(3517, 1505, 'Por que publicar resultados?', 'Para compartilhar conhecimento e permitir avanços na área.', 1, '2025-06-12 00:19:52'),
(3518, 1505, 'O que são revistas indexadas?', 'Publicações reconhecidas por bases científicas.', 1, '2025-06-12 00:19:52'),
(3519, 1505, 'Como escolher revista para publicar?', 'Considerar escopo, fator de impacto e acesso aberto.', 1, '2025-06-12 00:19:52'),
(3520, 1505, 'Publicação pode ser recusada?', 'Sim, após revisão por pares.', 1, '2025-06-12 00:19:52'),
(3521, 1505, 'Consequências do plágio?', 'Descredenciamento, perda de título e danos à reputação.', 1, '2025-06-12 00:19:52'),
(3522, 1505, 'Como reconhecer plágio?', 'Por softwares antiplágio e análise de originalidade.', 1, '2025-06-12 00:19:52'),
(3523, 1505, 'Publicar resultados negativos é válido?', 'Sim, contribui para conhecimento científico.', 1, '2025-06-12 00:19:52'),
(3524, 1506, 'O que é data management?', 'Gestão adequada de coleta, armazenamento e uso de dados em pesquisa.', 1, '2025-06-12 00:19:52'),
(3525, 1506, 'Por que proteger dados de pesquisa?', 'Para garantir ética, sigilo e validade dos resultados.', 1, '2025-06-12 00:19:52'),
(3526, 1506, 'Como armazenar dados?', 'Com segurança, backup e restrição de acesso.', 1, '2025-06-12 00:19:52'),
(3527, 1506, 'Quem pode acessar dados?', 'Somente pesquisadores autorizados pelo projeto.', 1, '2025-06-12 00:19:52'),
(3528, 1506, 'Como documentar etapas de data management?', 'Com registros detalhados de cada fase da pesquisa.', 1, '2025-06-12 00:19:52'),
(3529, 1506, 'Quais normas regem data management?', 'LGPD, políticas institucionais e regulamentos internacionais.', 1, '2025-06-12 00:19:52'),
(3530, 1506, 'Pode-se compartilhar dados com outros pesquisadores?', 'Sim, se houver consentimento e autorização ética.', 1, '2025-06-12 00:19:52'),
(3531, 1506, 'O que é anonimização?', 'Remover informações que permitam identificar participantes.', 1, '2025-06-12 00:19:52'),
(3532, 1506, 'Como registrar destruição de dados?', 'Em atas, relatórios e documentação de encerramento.', 1, '2025-06-12 00:19:52'),
(3533, 1506, 'Por que revisar data management?', 'Para garantir boas práticas e evitar erros.', 1, '2025-06-12 00:19:52'),
(3534, 1507, 'O que é uma startup em saúde?', 'Empresa inovadora com foco em soluções tecnológicas para saúde.', 1, '2025-06-12 00:20:43'),
(3535, 1507, 'Qual diferencial das startups?', 'Agilidade, inovação e uso intensivo de tecnologia.', 1, '2025-06-12 00:20:43'),
(3536, 1507, 'Exemplo de produto de startup em saúde?', 'Apps de telemedicina, wearables e plataformas de gestão.', 1, '2025-06-12 00:20:43'),
(3537, 1507, 'Como nasce uma startup?', 'A partir de uma ideia inovadora e identificação de demanda.', 1, '2025-06-12 00:20:43'),
(3538, 1507, 'O que é MVP?', 'Produto Mínimo Viável, versão simplificada para testar ideia no mercado.', 1, '2025-06-12 00:20:43'),
(3539, 1507, 'Por que buscar investimento?', 'Para escalar soluções e ampliar impacto.', 1, '2025-06-12 00:20:43'),
(3540, 1507, 'Quais desafios das startups em saúde?', 'Regulação, validação científica e acesso ao mercado.', 1, '2025-06-12 00:20:43'),
(3541, 1507, 'Como proteger inovação?', 'Com registros de patente e propriedade intelectual.', 1, '2025-06-12 00:20:43'),
(3542, 1507, 'Startups podem atuar em OT?', 'Sim, criando soluções para avaliação, intervenção e gestão.', 1, '2025-06-12 00:20:43'),
(3543, 1507, 'Por que startups buscam incubadoras?', 'Para apoio técnico, financeiro e networking.', 1, '2025-06-12 00:20:43'),
(3544, 1508, 'Por que desenvolver apps para OT?', 'Para ampliar acesso, engajamento e resultados em terapia ocupacional.', 1, '2025-06-12 00:20:43'),
(3545, 1508, 'Que funcionalidades apps de OT podem ter?', 'Agenda, avaliação, exercícios guiados e acompanhamento.', 1, '2025-06-12 00:20:43'),
(3546, 1508, 'Apps substituem o terapeuta?', 'Não, são ferramentas de apoio ao trabalho do profissional.', 1, '2025-06-12 00:20:43'),
(3547, 1508, 'Como garantir acessibilidade em apps?', 'Com design inclusivo e opções adaptadas a diferentes perfis.', 1, '2025-06-12 00:20:43'),
(3548, 1508, 'Qual importância de testes de usabilidade?', 'Garantem que o app seja fácil de usar e útil.', 1, '2025-06-12 00:20:43'),
(3549, 1508, 'Como monetizar apps em saúde?', 'Com vendas, assinaturas ou licenciamento para clínicas.', 1, '2025-06-12 00:20:43'),
(3550, 1508, 'Apps de OT devem proteger dados?', 'Sim, com segurança e respeito à LGPD.', 1, '2025-06-12 00:20:43'),
(3551, 1508, 'Como divulgar um app?', 'Com marketing digital, parcerias e eventos da área.', 1, '2025-06-12 00:20:43'),
(3552, 1508, 'Profissional de OT pode criar app?', 'Sim, com apoio de programadores e designers.', 1, '2025-06-12 00:20:43'),
(3553, 1508, 'Feedback dos usuários é importante?', 'Sim, para melhorias e atualizações constantes.', 1, '2025-06-12 00:20:43'),
(3554, 1509, 'O que é design thinking?', 'Metodologia de inovação focada no usuário e solução de problemas.', 1, '2025-06-12 00:20:43'),
(3555, 1509, 'Como aplicar design thinking em OT?', 'Observando demandas do usuário e co-criando soluções.', 1, '2025-06-12 00:20:43'),
(3556, 1509, 'Quais etapas do design thinking?', 'Empatia, definição, ideação, prototipagem e teste.', 1, '2025-06-12 00:20:43'),
(3557, 1509, 'Empatia é importante em design thinking?', 'Sim, para entender necessidades reais do usuário.', 1, '2025-06-12 00:20:43'),
(3558, 1509, 'Por que prototipar soluções?', 'Para testar ideias rapidamente antes de investir.', 1, '2025-06-12 00:20:43'),
(3559, 1509, 'Design thinking serve para serviços?', 'Sim, pode ser aplicado em processos, produtos e atendimentos.', 1, '2025-06-12 00:20:43'),
(3560, 1509, 'O que é co-criação?', 'Construção conjunta entre usuários e profissionais.', 1, '2025-06-12 00:20:43'),
(3561, 1509, 'Feedback faz parte do processo?', 'Sim, para ajustar e evoluir a solução.', 1, '2025-06-12 00:20:43'),
(3562, 1509, 'Como registrar resultados do design thinking?', 'Com relatórios, fotos, vídeos e avaliações.', 1, '2025-06-12 00:20:43'),
(3563, 1509, 'Design thinking pode inovar na OT?', 'Sim, trazendo novas abordagens e ferramentas.', 1, '2025-06-12 00:20:43'),
(3564, 1510, 'O que é modelo de negócio?', 'Estrutura que define como a empresa cria, entrega e captura valor.', 1, '2025-06-12 00:20:43'),
(3565, 1510, 'Exemplo de modelo em saúde?', 'Clínica particular, SaaS, marketplace de profissionais.', 1, '2025-06-12 00:20:43'),
(3566, 1510, 'Por que planejar o modelo?', 'Para identificar clientes, canais, recursos e receitas.', 1, '2025-06-12 00:20:43'),
(3567, 1510, 'O que é fluxo de receitas?', 'Formas como a empresa obtém dinheiro, como vendas e assinaturas.', 1, '2025-06-12 00:20:43'),
(3568, 1510, 'Como captar investimento?', 'Com pitch, participação em editais e networking.', 1, '2025-06-12 00:20:43'),
(3569, 1510, 'O que são investidores anjo?', 'Pessoas que investem capital próprio em negócios inovadores.', 1, '2025-06-12 00:20:43'),
(3570, 1510, 'Qual importância do plano de negócios?', 'Direciona ações e previne riscos.', 1, '2025-06-12 00:20:43'),
(3571, 1510, 'Como avaliar viabilidade financeira?', 'Analisando custos, mercado e potencial de lucro.', 1, '2025-06-12 00:20:43'),
(3572, 1510, 'TO pode empreender?', 'Sim, criando clínicas, consultorias ou soluções digitais.', 1, '2025-06-12 00:20:43'),
(3573, 1510, 'Negócios em saúde precisam de regulação?', 'Sim, por normas da ANVISA, CREFITO e outros órgãos.', 1, '2025-06-12 00:20:43'),
(3574, 1511, 'Por que estudar casos de sucesso?', 'Para aprender estratégias que funcionaram e adaptar à realidade local.', 1, '2025-06-12 00:20:43'),
(3575, 1511, 'Exemplo de sucesso em OT?', 'Projetos inovadores, apps premiados, clínicas de referência.', 1, '2025-06-12 00:20:43'),
(3576, 1511, 'O que é benchmarking?', 'Análise de práticas e resultados de organizações líderes.', 1, '2025-06-12 00:20:43'),
(3577, 1511, 'Lições comuns em cases de sucesso?', 'Foco no usuário, resiliência, equipe qualificada e inovação.', 1, '2025-06-12 00:20:43'),
(3578, 1511, 'Como documentar lições aprendidas?', 'Com relatórios, artigos e apresentações.', 1, '2025-06-12 00:20:43'),
(3579, 1511, 'Erros podem gerar aprendizado?', 'Sim, ajudam a aprimorar práticas e evitar repetição.', 1, '2025-06-12 00:20:43'),
(3580, 1511, 'Por que buscar mentoria?', 'Para acelerar aprendizado e evitar erros comuns.', 1, '2025-06-12 00:20:43'),
(3581, 1511, 'Como compartilhar cases de sucesso?', 'Em congressos, redes sociais e publicações.', 1, '2025-06-12 00:20:43'),
(3582, 1511, 'Casos de sucesso garantem repetição?', 'Não, cada contexto exige adaptações.', 1, '2025-06-12 00:20:43'),
(3583, 1511, 'Qual papel do usuário no sucesso?', 'Fundamental, pois sua satisfação define resultados.', 1, '2025-06-12 00:20:43'),
(3584, 1512, 'O que é congresso em OT?', 'Evento que reúne profissionais para troca de experiências, palestras e atualizações.', 1, '2025-06-12 00:21:44'),
(3585, 1512, 'Exemplo de congresso nacional de OT?', 'Congresso Brasileiro de Terapia Ocupacional (CBTO).', 1, '2025-06-12 00:21:44'),
(3586, 1512, 'Por que participar de congressos?', 'Para se atualizar, fazer networking e conhecer novas práticas.', 1, '2025-06-12 00:21:44'),
(3587, 1512, 'Como apresentar trabalho em congresso?', 'Inscrevendo resumo, sendo aprovado e preparando apresentação.', 1, '2025-06-12 00:21:44'),
(3588, 1512, 'Congressos são apenas presenciais?', 'Não, muitos têm versão online ou híbrida.', 1, '2025-06-12 00:21:44'),
(3589, 1512, 'O que é certificado de participação?', 'Comprovante de presença ou apresentação no evento.', 1, '2025-06-12 00:21:44'),
(3590, 1512, 'Como escolher qual congresso participar?', 'Considerando tema, local, palestrantes e relevância.', 1, '2025-06-12 00:21:44'),
(3591, 1512, 'Congressos ajudam na carreira?', 'Sim, agregam valor ao currículo e ampliam a rede de contatos.', 1, '2025-06-12 00:21:44'),
(3592, 1512, 'Quais benefícios de apresentar trabalho?', 'Visibilidade, troca de feedback e reconhecimento.', 1, '2025-06-12 00:21:44'),
(3593, 1512, 'Participação em congresso conta como educação continuada?', 'Sim, na maioria dos conselhos profissionais.', 1, '2025-06-12 00:21:44'),
(3594, 1513, 'O que são sociedades científicas?', 'Associações que reúnem profissionais de uma área para promoção do conhecimento.', 1, '2025-06-12 00:21:44'),
(3595, 1513, 'Exemplo de sociedade em OT?', 'Associação Brasileira de Terapia Ocupacional (ABRATO).', 1, '2025-06-12 00:21:44'),
(3596, 1513, 'Quais vantagens de ser sócio?', 'Acesso a eventos, revistas, descontos e atualização.', 1, '2025-06-12 00:21:44'),
(3597, 1513, 'Sociedade científica pode propor normas?', 'Sim, comitês técnicos colaboram na regulamentação.', 1, '2025-06-12 00:21:44'),
(3598, 1513, 'Como se associar?', 'Fazendo inscrição e pagando anuidade.', 1, '2025-06-12 00:21:44'),
(3599, 1513, 'Por que participar de sociedades?', 'Para fortalecer a profissão e influenciar políticas.', 1, '2025-06-12 00:21:44'),
(3600, 1513, 'Quais produtos sociedades oferecem?', 'Cursos, congressos, revistas e certificados.', 1, '2025-06-12 00:21:44'),
(3601, 1513, 'Sociedades apoiam pesquisa?', 'Sim, com editais, prêmios e grupos de estudo.', 1, '2025-06-12 00:21:44'),
(3602, 1513, 'Como encontrar sociedade científica?', 'Pesquisando na internet ou em conselhos de classe.', 1, '2025-06-12 00:21:44'),
(3603, 1513, 'Participar de sociedade é obrigatório?', 'Não, mas é recomendado para engajamento profissional.', 1, '2025-06-12 00:21:44'),
(3604, 1514, 'O que são grupos de estudo?', 'Reuniões regulares para debate e atualização de temas específicos.', 1, '2025-06-12 00:21:44'),
(3605, 1514, 'Como organizar um grupo de estudo?', 'Definindo tema, cronograma e participantes.', 1, '2025-06-12 00:21:44'),
(3606, 1514, 'Quais benefícios dos fóruns?', 'Troca de experiências, dúvidas e construção coletiva do conhecimento.', 1, '2025-06-12 00:21:44'),
(3607, 1514, 'Participar de grupo é bom para quem?', 'Estudantes e profissionais em busca de atualização.', 1, '2025-06-12 00:21:44'),
(3608, 1514, 'Como registrar atividades de grupos?', 'Com atas, listas de presença e resumos das discussões.', 1, '2025-06-12 00:21:44'),
(3609, 1514, 'Grupos podem ser online?', 'Sim, usando plataformas digitais e redes sociais.', 1, '2025-06-12 00:21:44'),
(3610, 1514, 'Fóruns podem ser temáticos?', 'Sim, focando em áreas como autismo, reabilitação, gestão.', 1, '2025-06-12 00:21:44'),
(3611, 1514, 'Por que rotacionar liderança em grupos?', 'Para desenvolver habilidades de todos os membros.', 1, '2025-06-12 00:21:44'),
(3612, 1514, 'Como avaliar aprendizado nos grupos?', 'Com debates, resumos e autoavaliação.', 1, '2025-06-12 00:21:44'),
(3613, 1514, 'Grupos ajudam na pesquisa?', 'Sim, colaborando na revisão e elaboração de projetos.', 1, '2025-06-12 00:21:44'),
(3614, 1515, 'Por que publicar notícias em OT?', 'Para divulgar avanços, oportunidades e temas relevantes.', 1, '2025-06-12 00:21:44'),
(3615, 1515, 'Blogs são úteis para OT?', 'Sim, aproximam profissionais e disseminam conhecimento.', 1, '2025-06-12 00:21:44'),
(3616, 1515, 'Como criar conteúdo relevante?', 'Estudando temas atuais e utilizando linguagem acessível.', 1, '2025-06-12 00:21:44'),
(3617, 1515, 'O que evitar em publicações?', 'Fake news, informações sem fonte e plágio.', 1, '2025-06-12 00:21:44'),
(3618, 1515, 'Como divulgar blog?', 'Com redes sociais, parcerias e SEO.', 1, '2025-06-12 00:21:44'),
(3619, 1515, 'Notícias precisam de revisão?', 'Sim, para garantir qualidade e veracidade.', 1, '2025-06-12 00:21:44'),
(3620, 1515, 'Publicação pode ser colaborativa?', 'Sim, com textos de diferentes autores.', 1, '2025-06-12 00:21:44'),
(3621, 1515, 'Como citar fontes em blogs?', 'Referenciando corretamente no final do texto.', 1, '2025-06-12 00:21:44'),
(3622, 1515, 'Blogs podem receber comentários?', 'Sim, estimulando debate e troca de experiências.', 1, '2025-06-12 00:21:44'),
(3623, 1515, 'Notícias de OT têm impacto?', 'Sim, podem influenciar decisões e práticas profissionais.', 1, '2025-06-12 00:21:44'),
(3624, 1516, 'O que é networking?', 'Construção de uma rede de contatos profissionais.', 1, '2025-06-12 00:21:44'),
(3625, 1516, 'Exemplo de ferramenta de networking online?', 'LinkedIn, grupos de WhatsApp, fóruns especializados.', 1, '2025-06-12 00:21:44'),
(3626, 1516, 'Por que investir em networking?', 'Para oportunidades de trabalho, parcerias e atualização.', 1, '2025-06-12 00:21:44'),
(3627, 1516, 'Como se apresentar em redes?', 'Com perfil completo, foto profissional e descrição clara.', 1, '2025-06-12 00:21:44'),
(3628, 1516, 'Participar de grupos online ajuda?', 'Sim, amplia contatos e troca de informações.', 1, '2025-06-12 00:21:44'),
(3629, 1516, 'Como manter networking ativo?', 'Interagindo, compartilhando conteúdos e participando de eventos.', 1, '2025-06-12 00:21:44'),
(3630, 1516, 'Quais riscos do networking online?', 'Exposição a golpes, fake news e excesso de informações.', 1, '2025-06-12 00:21:44'),
(3631, 1516, 'Como usar networking para pesquisa?', 'Buscando parcerias e divulgação de estudos.', 1, '2025-06-12 00:21:44'),
(3632, 1516, 'O que evitar em redes profissionais?', 'Excesso de autopromoção e postagens irrelevantes.', 1, '2025-06-12 00:21:44'),
(3633, 1516, 'Networking influencia carreira?', 'Sim, pode abrir portas e acelerar crescimento profissional.', 1, '2025-06-12 00:21:44'),
(3634, 1462, 'O que é OT em oncologia?', 'É a atuação da terapia ocupacional no cuidado a pacientes com câncer, focando em autonomia e qualidade de vida.', 1, '2025-06-12 00:27:46'),
(3635, 1462, 'Como a OT auxilia pacientes em quimioterapia?', 'Adaptando rotinas, controlando fadiga e promovendo estratégias para autocuidado.', 1, '2025-06-12 00:27:46'),
(3636, 1462, 'Por que avaliar impacto emocional na oncologia?', 'O câncer afeta não só o corpo, mas também a saúde mental e a motivação do paciente.', 1, '2025-06-12 00:27:46'),
(3637, 1462, 'Quais atividades podem ser adaptadas?', 'Atividades de vida diária, lazer, trabalho e relações sociais.', 1, '2025-06-12 00:27:46'),
(3638, 1462, 'Como a OT atua na prevenção de linfedema?', 'Orientando exercícios e cuidados durante e após o tratamento.', 1, '2025-06-12 00:27:46'),
(3639, 1462, 'A família deve ser envolvida?', 'Sim, para apoio emocional e manutenção da rotina em casa.', 1, '2025-06-12 00:27:46'),
(3640, 1462, 'Qual objetivo da OT em cuidados paliativos oncológicos?', 'Promover conforto, alívio de sintomas e bem-estar.', 1, '2025-06-12 00:27:46'),
(3641, 1462, 'Como identificar limitações funcionais?', 'Por meio de avaliações físicas, cognitivas e relatos do paciente.', 1, '2025-06-12 00:27:46'),
(3642, 1462, 'A TO pode atuar em hospitais e domicílio?', 'Sim, conforme as necessidades e o contexto do paciente.', 1, '2025-06-12 00:27:46'),
(3643, 1462, 'Quais estratégias para motivação?', 'Estabelecer metas pequenas, celebrar conquistas e respeitar o ritmo.', 1, '2025-06-12 00:27:46'),
(3644, 1463, 'Qual o papel da OT na cardiologia?', 'Favorecer reabilitação funcional após eventos cardíacos e promover autocuidado.', 1, '2025-06-12 00:27:46'),
(3645, 1463, 'Por que adaptar as atividades após infarto?', 'Para respeitar limites físicos e evitar complicações.', 1, '2025-06-12 00:27:46'),
(3646, 1463, 'O que a OT avalia em pacientes cardíacos?', 'Capacidade funcional, nível de fadiga, ansiedade e barreiras ambientais.', 1, '2025-06-12 00:27:46'),
(3647, 1463, 'Quais atividades podem ser trabalhadas?', 'Atividades de vida diária, mobilidade, lazer e participação social.', 1, '2025-06-12 00:27:46'),
(3648, 1463, 'Como promover engajamento em exercício físico?', 'Com atividades prazerosas, adaptadas e orientadas pela equipe.', 1, '2025-06-12 00:27:46'),
(3649, 1463, 'Qual importância da educação em saúde?', 'Reduz riscos de novos eventos e melhora adesão ao tratamento.', 1, '2025-06-12 00:27:46'),
(3650, 1463, 'A TO pode orientar sobre retorno ao trabalho?', 'Sim, analisando demandas e propondo adaptações.', 1, '2025-06-12 00:27:46'),
(3651, 1463, 'Por que avaliar o ambiente domiciliar?', 'Para prevenir quedas e facilitar as rotinas.', 1, '2025-06-12 00:27:46'),
(3652, 1463, 'Como trabalhar controle de estresse?', 'Técnicas de relaxamento, respiração e organização da rotina.', 1, '2025-06-12 00:27:46'),
(3653, 1463, 'A família participa da reabilitação cardíaca?', 'Sim, para apoiar e estimular o paciente nas mudanças de hábito.', 1, '2025-06-12 00:27:46'),
(3654, 1464, 'Como a OT pode ajudar pessoas com diabetes?', 'Promovendo adesão ao autocuidado, organização da rotina e adaptação de atividades.', 1, '2025-06-12 00:27:46'),
(3655, 1464, 'Por que adaptar alimentação e medicação?', 'Para garantir regularidade e controle glicêmico.', 1, '2025-06-12 00:27:46'),
(3656, 1464, 'O que a OT avalia em pacientes diabéticos?', 'Barreiras para adesão ao tratamento e dificuldades de AVD.', 1, '2025-06-12 00:27:46'),
(3657, 1464, 'Como prevenir complicações?', 'Orientando cuidado com os pés, exercícios e monitoramento.', 1, '2025-06-12 00:27:46'),
(3658, 1464, 'A tecnologia pode ajudar no controle?', 'Sim, com uso de aplicativos e lembretes eletrônicos.', 1, '2025-06-12 00:27:46'),
(3659, 1464, 'Como a família contribui no controle do diabetes?', 'Apoiando na rotina, alimentação e acompanhamento de exames.', 1, '2025-06-12 00:27:46'),
(3660, 1464, 'TO pode atuar em grupo de educação em saúde?', 'Sim, para troca de experiências e motivação.', 1, '2025-06-12 00:27:46'),
(3661, 1464, 'Qual objetivo da adaptação ambiental?', 'Reduzir riscos e facilitar o autocuidado.', 1, '2025-06-12 00:27:46'),
(3662, 1464, 'O que são complicações do diabetes?', 'Neuropatias, lesões nos pés, retinopatia e outras doenças associadas.', 1, '2025-06-12 00:27:46'),
(3663, 1464, 'Como trabalhar motivação?', 'Com metas realistas, feedback positivo e reforço dos benefícios.', 1, '2025-06-12 00:27:46'),
(3664, 1465, 'O que é saúde mental forense?', 'Área que atua com pessoas envolvidas com sistema de justiça e transtornos mentais.', 1, '2025-06-12 00:27:46'),
(3665, 1465, 'Como a OT atua nesse contexto?', 'Promove reabilitação, ressocialização e autonomia de pessoas em conflito com a lei.', 1, '2025-06-12 00:27:46'),
(3666, 1465, 'Quais atividades são trabalhadas?', 'Autocuidado, manejo de emoções, habilidades sociais e ocupacionais.', 1, '2025-06-12 00:27:46'),
(3667, 1465, 'Qual importância do trabalho interdisciplinar?', 'Para abordagem ampla das necessidades do indivíduo.', 1, '2025-06-12 00:27:46'),
(3668, 1465, 'Como a OT pode contribuir para prevenção de reincidência?', 'Reforçando habilidades de vida e integração social.', 1, '2025-06-12 00:27:46'),
(3669, 1465, 'Por que avaliar contexto de vida e histórico?', 'Para planejar intervenções realistas e eficazes.', 1, '2025-06-12 00:27:46'),
(3670, 1465, 'TO pode atuar em medida socioeducativa?', 'Sim, promovendo rotinas e autonomia.', 1, '2025-06-12 00:27:46'),
(3671, 1465, 'Como abordar resistência do paciente?', 'Com empatia, escuta ativa e valorização de conquistas.', 1, '2025-06-12 00:27:46'),
(3672, 1465, 'Quais barreiras para reabilitação?', 'Estigma, exclusão social, falta de oportunidades.', 1, '2025-06-12 00:27:46'),
(3673, 1465, 'Como documentar evolução?', 'Com relatórios objetivos, respeitando sigilo.', 1, '2025-06-12 00:27:46'),
(3674, 1466, 'Qual objetivo da OT em cuidados paliativos?', 'Promover conforto, dignidade e autonomia até o fim da vida.', 1, '2025-06-12 00:27:46'),
(3675, 1466, 'Como a TO pode aliviar sintomas?', 'Com técnicas de relaxamento, adaptação postural e estratégias de lazer.', 1, '2025-06-12 00:27:46'),
(3676, 1466, 'A família participa dos cuidados?', 'Sim, sendo orientada e apoiada em todo o processo.', 1, '2025-06-12 00:27:46'),
(3677, 1466, 'Quais atividades são priorizadas?', 'Aquelas mais significativas para o paciente.', 1, '2025-06-12 00:27:46'),
(3678, 1466, 'Como a OT lida com sofrimento emocional?', 'Com escuta ativa, acolhimento e orientação para enfrentamento.', 1, '2025-06-12 00:27:46'),
(3679, 1466, 'TO pode atuar em hospital e domicílio?', 'Sim, conforme contexto do paciente.', 1, '2025-06-12 00:27:46'),
(3680, 1466, 'Como adaptar o ambiente?', 'Eliminando barreiras e facilitando o conforto e segurança.', 1, '2025-06-12 00:27:46'),
(3681, 1466, 'O que é plano de cuidado individualizado?', 'Estratégia personalizada para cada paciente e família.', 1, '2025-06-12 00:27:46'),
(3682, 1466, 'Por que registrar desejos do paciente?', 'Para respeitar suas vontades e preferências.', 1, '2025-06-12 00:27:46'),
(3683, 1466, 'Como registrar evolução em cuidados paliativos?', 'Com observações objetivas e orientações claras.', 1, '2025-06-12 00:27:46'),
(3684, 1467, 'O que é um caso clínico?', 'É uma descrição detalhada de uma situação real de atendimento, usada para estudo e reflexão.', 1, '2025-06-12 00:27:46'),
(3685, 1467, 'Quais partes compõem um caso clínico?', 'Identificação, histórico, avaliação, intervenção, resultados e discussão.', 1, '2025-06-12 00:27:46'),
(3686, 1467, 'Por que descrever objetivos no caso clínico?', 'Para deixar claro o foco do tratamento e os critérios de sucesso.', 1, '2025-06-12 00:27:46'),
(3687, 1467, 'Como garantir anonimato?', 'Omitindo dados pessoais e trocando nomes e locais.', 1, '2025-06-12 00:27:46'),
(3688, 1467, 'O que não pode faltar no caso clínico?', 'Dados completos, coerência, sigilo e análise crítica.', 1, '2025-06-12 00:27:46'),
(3689, 1467, 'Para que servem casos clínicos na formação?', 'Para exercitar raciocínio clínico e análise de situações reais.', 1, '2025-06-12 00:27:46'),
(3690, 1467, 'Como apresentar contexto socioambiental?', 'Relatando condições de vida, rede de apoio e recursos.', 1, '2025-06-12 00:27:46'),
(3691, 1467, 'Qual o papel da família no caso clínico?', 'Pode ser fonte de informações e apoio terapêutico.', 1, '2025-06-12 00:27:46'),
(3692, 1467, 'Como documentar evolução?', 'Registrando etapas, respostas às intervenções e mudanças observadas.', 1, '2025-06-12 00:27:46'),
(3693, 1467, 'Por que registrar limitações do caso?', 'Para demonstrar ética e realismo na análise.', 1, '2025-06-12 00:27:46'),
(3694, 1468, 'O que é avaliação funcional?', 'Análise das capacidades e limitações do paciente em atividades diárias.', 1, '2025-06-12 00:27:46'),
(3695, 1468, 'Por que utilizar escalas padronizadas?', 'Para obter dados objetivos e comparáveis.', 1, '2025-06-12 00:27:46'),
(3696, 1468, 'Como avaliar AVD no estudo de caso?', 'Observando desempenho em tarefas como banho, alimentação e locomoção.', 1, '2025-06-12 00:27:46'),
(3697, 1468, 'Quando envolver equipe multiprofissional?', 'Sempre que houver demandas complexas ou múltiplas áreas afetadas.', 1, '2025-06-12 00:27:46'),
(3698, 1468, 'Como registrar evolução funcional?', 'Com gráficos, descrições detalhadas e feedback do paciente.', 1, '2025-06-12 00:27:46'),
(3699, 1468, 'A avaliação funcional é contínua?', 'Sim, deve ser feita periodicamente ao longo do processo.', 1, '2025-06-12 00:27:46'),
(3700, 1468, 'Quais fatores influenciam avaliação?', 'Motivação, ambiente, saúde geral e apoio familiar.', 1, '2025-06-12 00:27:46'),
(3701, 1468, 'Como adaptar avaliação para populações especiais?', 'Usando instrumentos específicos e comunicação acessível.', 1, '2025-06-12 00:27:46'),
(3702, 1468, 'Por que incluir o paciente na avaliação?', 'Para garantir protagonismo e realismo nas metas.', 1, '2025-06-12 00:27:46'),
(3703, 1468, 'Quais documentos devem ser anexados?', 'Escalas aplicadas, laudos, fotos e registros de evolução.', 1, '2025-06-12 00:27:46'),
(3704, 1469, 'O que é planejamento terapêutico?', 'Processo de definir objetivos, estratégias e recursos para intervenção.', 1, '2025-06-12 00:27:46'),
(3705, 1469, 'Por que envolver o paciente no plano?', 'Para aumentar engajamento e adesão ao tratamento.', 1, '2025-06-12 00:27:46'),
(3706, 1469, 'Como escolher prioridades?', 'Analisando urgência, impacto e preferências do paciente.', 1, '2025-06-12 00:27:46'),
(3707, 1469, 'O que são metas SMART?', 'Metas Específicas, Mensuráveis, Alcançáveis, Relevantes e Temporais.', 1, '2025-06-12 00:27:46'),
(3708, 1469, 'Como registrar o plano?', 'Em relatório detalhado, com objetivos e cronograma.', 1, '2025-06-12 00:27:46'),
(3709, 1469, 'Qual a importância de reavaliar o plano?', 'Para ajustar intervenções e responder à evolução do paciente.', 1, '2025-06-12 00:27:46'),
(3710, 1469, 'Como implementar intervenções?', 'Com estratégias baseadas em evidências e feedback contínuo.', 1, '2025-06-12 00:27:46'),
(3711, 1469, 'Família pode ajudar na implementação?', 'Sim, apoiando em casa e reforçando estratégias.', 1, '2025-06-12 00:27:46'),
(3712, 1469, 'Como avaliar adesão ao plano?', 'Por registros de presença, participação e feedback.', 1, '2025-06-12 00:27:46'),
(3713, 1469, 'Quando alterar o plano?', 'Se não houver progresso ou surgirem novas demandas.', 1, '2025-06-12 00:27:46'),
(3714, 1470, 'Por que registrar resultados?', 'Para medir efetividade e justificar continuidade ou alta.', 1, '2025-06-12 00:27:46'),
(3715, 1470, 'Como comparar resultados?', 'Usando indicadores pré e pós-intervenção.', 1, '2025-06-12 00:27:46'),
(3716, 1470, 'Qual a importância da reflexão crítica?', 'Para aprender com erros, acertos e melhorar práticas futuras.', 1, '2025-06-12 00:27:46'),
(3717, 1470, 'Como descrever evolução do paciente?', 'Relatando ganhos, desafios e impacto das intervenções.', 1, '2025-06-12 00:27:46'),
(3718, 1470, 'Resultados negativos devem ser registrados?', 'Sim, para garantir transparência e aprendizado.', 1, '2025-06-12 00:27:46'),
(3719, 1470, 'O que fazer diante de resultados insatisfatórios?', 'Analisar causas e ajustar intervenções.', 1, '2025-06-12 00:27:46'),
(3720, 1470, 'Como compartilhar reflexões?', 'Em reuniões, relatórios ou publicações científicas.', 1, '2025-06-12 00:27:46'),
(3721, 1470, 'Resultados parciais são importantes?', 'Sim, demonstram processo e ajustam expectativas.', 1, '2025-06-12 00:27:46'),
(3722, 1470, 'Família pode opinar sobre resultados?', 'Sim, trazendo percepções do cotidiano.', 1, '2025-06-12 00:27:46'),
(3723, 1470, 'Reflexão pós-caso contribui para a equipe?', 'Sim, fortalece aprendizado coletivo.', 1, '2025-06-12 00:27:46'),
(3724, 1471, 'O que são boas práticas clínicas?', 'Ações baseadas em ética, evidência científica e respeito ao paciente.', 1, '2025-06-12 00:27:46'),
(3725, 1471, 'Por que registrar lições aprendidas?', 'Para melhorar processos e evitar repetição de erros.', 1, '2025-06-12 00:27:46'),
(3726, 1471, 'Como disseminar boas práticas?', 'Com treinamentos, protocolos e reuniões de equipe.', 1, '2025-06-12 00:27:46'),
(3727, 1471, 'Qual a importância do feedback entre profissionais?', 'Enriquece as intervenções e amplia o olhar sobre o caso.', 1, '2025-06-12 00:27:46'),
(3728, 1471, 'Como garantir ética nas boas práticas?', 'Respeitando autonomia, confidencialidade e consentimento.', 1, '2025-06-12 00:27:46'),
(3729, 1471, 'O que evitar nas práticas clínicas?', 'Condutas sem respaldo técnico ou científico.', 1, '2025-06-12 00:27:46'),
(3730, 1471, 'Lições aprendidas devem ser documentadas?', 'Sim, para consulta futura e desenvolvimento institucional.', 1, '2025-06-12 00:27:46'),
(3731, 1471, 'Como estimular cultura de aprendizado?', 'Com incentivo à troca de experiências e humildade.', 1, '2025-06-12 00:27:46'),
(3732, 1471, 'Boas práticas envolvem atualização contínua?', 'Sim, mantendo-se informado sobre avanços na área.', 1, '2025-06-12 00:27:46'),
(3733, 1471, 'Como avaliar impacto das boas práticas?', 'Monitorando indicadores e satisfação dos pacientes.', 1, '2025-06-12 00:27:46'),
(3734, 1472, 'O que são métodos qualitativos?', 'São pesquisas que exploram experiências, sentimentos e percepções, com dados descritivos.', 1, '2025-06-12 00:30:15'),
(3735, 1472, 'O que são métodos quantitativos?', 'São pesquisas baseadas em dados numéricos, análises estatísticas e resultados objetivos.', 1, '2025-06-12 00:30:15'),
(3736, 1472, 'Para que servem os estudos de caso?', 'Para analisar profundamente situações individuais e contextos clínicos.', 1, '2025-06-12 00:30:15'),
(3737, 1472, 'O que é revisão sistemática?', 'Análise rigorosa da literatura sobre um tema, com critérios definidos de inclusão.', 1, '2025-06-12 00:30:15'),
(3738, 1472, 'Qual objetivo da pesquisa em OT?', 'Melhorar práticas, avaliar intervenções e fundamentar decisões clínicas.', 1, '2025-06-12 00:30:15'),
(3739, 1472, 'O que é grupo controle?', 'Grupo que não recebe intervenção, usado para comparar resultados.', 1, '2025-06-12 00:30:15'),
(3740, 1472, 'O que é hipótese de pesquisa?', 'Suposição inicial que será testada durante o estudo.', 1, '2025-06-12 00:30:15'),
(3741, 1472, 'Como garantir validade de uma pesquisa?', 'Com métodos claros, amostra adequada e controle de vieses.', 1, '2025-06-12 00:30:15'),
(3742, 1472, 'O que é amostragem?', 'Processo de seleção de participantes para um estudo.', 1, '2025-06-12 00:30:15'),
(3743, 1472, 'Por que registrar limitações do estudo?', 'Para transparência e reflexão sobre os resultados.', 1, '2025-06-12 00:30:15');
INSERT INTO `flashcards` (`id_flashcard`, `id_assunto`, `pergunta`, `resposta`, `ativo`, `data_criacao`) VALUES
(3744, 1473, 'O que é bioestatística?', 'Aplicação da estatística em estudos biológicos e de saúde.', 1, '2025-06-12 00:30:15'),
(3745, 1473, 'Como calcular média?', 'Somando os valores e dividindo pelo número de observações.', 1, '2025-06-12 00:30:15'),
(3746, 1473, 'O que é desvio padrão?', 'Medida que indica o grau de dispersão dos dados em relação à média.', 1, '2025-06-12 00:30:15'),
(3747, 1473, 'O que significa p < 0,05?', 'Indica que o resultado é estatisticamente significativo.', 1, '2025-06-12 00:30:15'),
(3748, 1473, 'Como identificar uma variável dependente?', 'É aquela afetada pela intervenção ou condição estudada.', 1, '2025-06-12 00:30:15'),
(3749, 1473, 'Para que serve o teste t de Student?', 'Comparar médias entre dois grupos.', 1, '2025-06-12 00:30:15'),
(3750, 1473, 'O que é correlação?', 'Relação entre duas variáveis, podendo ser positiva ou negativa.', 1, '2025-06-12 00:30:15'),
(3751, 1473, 'Diferença entre população e amostra?', 'População é o grupo total, amostra é uma parte representativa.', 1, '2025-06-12 00:30:15'),
(3752, 1473, 'Como representar dados graficamente?', 'Com tabelas, gráficos de barras, pizza ou dispersão.', 1, '2025-06-12 00:30:15'),
(3753, 1473, 'Por que usar estatística em OT?', 'Para validar resultados, orientar decisões e publicar pesquisas.', 1, '2025-06-12 00:30:15'),
(3754, 1474, 'O que é crítica de artigo?', 'Avaliação dos pontos fortes e limitações de um artigo científico.', 1, '2025-06-12 00:30:15'),
(3755, 1474, 'Por que analisar metodologia?', 'Para garantir validade e reprodutibilidade do estudo.', 1, '2025-06-12 00:30:15'),
(3756, 1474, 'Como identificar conflito de interesses?', 'Verificando fontes de financiamento e possíveis influências.', 1, '2025-06-12 00:30:15'),
(3757, 1474, 'O que observar nas conclusões?', 'Se estão alinhadas aos resultados apresentados.', 1, '2025-06-12 00:30:15'),
(3758, 1474, 'Como avaliar revisão bibliográfica?', 'Checando atualidade e relevância das fontes citadas.', 1, '2025-06-12 00:30:15'),
(3759, 1474, 'Quais erros comuns em artigos?', 'Amostra pequena, vieses e ausência de controle.', 1, '2025-06-12 00:30:15'),
(3760, 1474, 'Por que verificar ética em pesquisa?', 'Para garantir respeito aos participantes e validade ética.', 1, '2025-06-12 00:30:15'),
(3761, 1474, 'O que é revisão por pares?', 'Avaliação de especialistas antes da publicação.', 1, '2025-06-12 00:30:15'),
(3762, 1474, 'Como analisar gráficos e tabelas?', 'Conferindo se representam corretamente os dados.', 1, '2025-06-12 00:30:15'),
(3763, 1474, 'O que é fator de impacto?', 'Mede a relevância de uma revista científica.', 1, '2025-06-12 00:30:15'),
(3764, 1475, 'Por que planejar antes de pesquisar?', 'Para definir objetivos, métodos e evitar desperdício de recursos.', 1, '2025-06-12 00:30:15'),
(3765, 1475, 'O que é cronograma em pesquisa?', 'Planejamento das etapas do estudo ao longo do tempo.', 1, '2025-06-12 00:30:15'),
(3766, 1475, 'Como definir amostra?', 'Baseando-se nos critérios do estudo e disponibilidade.', 1, '2025-06-12 00:30:15'),
(3767, 1475, 'O que é orçamento de pesquisa?', 'Estimativa de custos para cada etapa do projeto.', 1, '2025-06-12 00:30:15'),
(3768, 1475, 'Por que incluir revisão bibliográfica?', 'Para fundamentar o projeto e identificar lacunas.', 1, '2025-06-12 00:30:15'),
(3769, 1475, 'Como estruturar objetivos?', 'De forma clara, específica e mensurável.', 1, '2025-06-12 00:30:15'),
(3770, 1475, 'O que é justificativa?', 'Explicação da relevância e impacto do estudo.', 1, '2025-06-12 00:30:15'),
(3771, 1475, 'Quais etapas de um projeto?', 'Introdução, objetivos, métodos, análise, cronograma e orçamento.', 1, '2025-06-12 00:30:15'),
(3772, 1475, 'Como revisar um projeto antes de submeter?', 'Checando coerência, clareza e viabilidade.', 1, '2025-06-12 00:30:15'),
(3773, 1475, 'Quem deve aprovar o projeto?', 'Comitê de ética e, quando necessário, órgão financiador.', 1, '2025-06-12 00:30:15'),
(3774, 1476, 'Por que ética é fundamental em pesquisa clínica?', 'Para proteger participantes e garantir validade científica.', 1, '2025-06-12 00:30:15'),
(3775, 1476, 'O que é consentimento informado?', 'Ato de esclarecer e obter permissão do participante antes da pesquisa.', 1, '2025-06-12 00:30:15'),
(3776, 1476, 'Quais são princípios éticos em pesquisa?', 'Autonomia, beneficência, não maleficência e justiça.', 1, '2025-06-12 00:30:15'),
(3777, 1476, 'Como garantir sigilo dos dados?', 'Com armazenamento seguro e anonimização dos participantes.', 1, '2025-06-12 00:30:15'),
(3778, 1476, 'Por que submeter ao comitê de ética?', 'Para garantir que os direitos dos participantes sejam respeitados.', 1, '2025-06-12 00:30:15'),
(3779, 1476, 'O que é termo de assentimento?', 'Documento para crianças ou incapazes, junto ao responsável.', 1, '2025-06-12 00:30:15'),
(3780, 1476, 'Como lidar com riscos na pesquisa?', 'Avaliar, minimizar e comunicar claramente aos participantes.', 1, '2025-06-12 00:30:15'),
(3781, 1476, 'O que fazer diante de evento adverso?', 'Registrar, comunicar ao comitê e cuidar do participante.', 1, '2025-06-12 00:30:15'),
(3782, 1476, 'Quem fiscaliza ética em pesquisa no Brasil?', 'Comitês de ética em pesquisa (CEP) e CONEP.', 1, '2025-06-12 00:30:15'),
(3783, 1476, 'Pode-se interromper estudo por questões éticas?', 'Sim, sempre que houver risco ou violação de direitos.', 1, '2025-06-12 00:30:15'),
(3784, 1482, 'O que é didática?', 'É a ciência e arte de ensinar de forma clara, eficiente e adaptada ao público.', 1, '2025-06-12 00:30:15'),
(3785, 1482, 'Quais são os principais princípios didáticos?', 'Clareza, participação ativa, contextualização e feedback.', 1, '2025-06-12 00:30:15'),
(3786, 1482, 'Como estimular o interesse do aluno?', 'Utilizando exemplos práticos e conectando ao cotidiano.', 1, '2025-06-12 00:30:15'),
(3787, 1482, 'Por que variar metodologias?', 'Para atender diferentes estilos de aprendizagem.', 1, '2025-06-12 00:30:15'),
(3788, 1482, 'Qual a importância do feedback?', 'Ajuda no ajuste das estratégias e reforça a aprendizagem.', 1, '2025-06-12 00:30:15'),
(3789, 1482, 'O que é ensino ativo?', 'Metodologia que envolve o estudante no processo, com discussões e prática.', 1, '2025-06-12 00:30:15'),
(3790, 1482, 'Como lidar com dificuldades de aprendizagem?', 'Identificando causas e adaptando estratégias.', 1, '2025-06-12 00:30:15'),
(3791, 1482, 'Qual o papel da avaliação diagnóstica?', 'Mapear conhecimentos prévios e direcionar o ensino.', 1, '2025-06-12 00:30:15'),
(3792, 1482, 'Como promover aprendizagem significativa?', 'Relacionando novos conteúdos a experiências anteriores.', 1, '2025-06-12 00:30:15'),
(3793, 1482, 'Por que usar recursos visuais?', 'Facilitam compreensão, memorização e motivação.', 1, '2025-06-12 00:30:15'),
(3794, 1483, 'O que é supervisão clínica?', 'Acompanhamento e orientação de profissionais ou alunos durante prática clínica.', 1, '2025-06-12 00:30:15'),
(3795, 1483, 'Qual o objetivo da supervisão?', 'Garantir qualidade, segurança e aprendizado na prática.', 1, '2025-06-12 00:30:15'),
(3796, 1483, 'Como dar feedback construtivo?', 'Com respeito, foco no desempenho e sugestões claras.', 1, '2025-06-12 00:30:15'),
(3797, 1483, 'Quais habilidades são essenciais ao supervisor?', 'Comunicação, empatia, organização e conhecimento técnico.', 1, '2025-06-12 00:30:15'),
(3798, 1483, 'Como lidar com erros na supervisão?', 'Tratando como oportunidades de aprendizado.', 1, '2025-06-12 00:30:15'),
(3799, 1483, 'Por que registrar observações da supervisão?', 'Para monitorar evolução e fundamentar avaliações.', 1, '2025-06-12 00:30:15'),
(3800, 1483, 'Como planejar a supervisão?', 'Definindo objetivos, atividades e critérios de avaliação.', 1, '2025-06-12 00:30:15'),
(3801, 1483, 'A supervisão pode ser individual ou em grupo?', 'Sim, dependendo do contexto e objetivos.', 1, '2025-06-12 00:30:15'),
(3802, 1483, 'Como lidar com conflitos na supervisão?', 'Mediando, ouvindo e buscando soluções colaborativas.', 1, '2025-06-12 00:30:15'),
(3803, 1483, 'Qual o papel do supervisionado?', 'Ser participativo, receptivo ao feedback e buscar aprimoramento.', 1, '2025-06-12 00:30:15'),
(3804, 1484, 'Por que desenvolver materiais didáticos?', 'Para apoiar e enriquecer o processo de ensino-aprendizagem.', 1, '2025-06-12 00:30:15'),
(3805, 1484, 'Exemplos de materiais didáticos em OT?', 'Manuais, cartilhas, vídeos, jogos e slides.', 1, '2025-06-12 00:30:15'),
(3806, 1484, 'O que considerar na criação de materiais?', 'Clareza, acessibilidade, adequação ao público e objetivos.', 1, '2025-06-12 00:30:15'),
(3807, 1484, 'Materiais devem ser atualizados?', 'Sim, para refletir avanços científicos e necessidades dos alunos.', 1, '2025-06-12 00:30:15'),
(3808, 1484, 'Como avaliar a eficácia do material?', 'Aplicando e coletando feedback dos usuários.', 1, '2025-06-12 00:30:15'),
(3809, 1484, 'Materiais digitais têm vantagens?', 'Sim, são dinâmicos, interativos e facilmente distribuídos.', 1, '2025-06-12 00:30:15'),
(3810, 1484, 'Por que incluir ilustrações?', 'Facilitam compreensão e memorização.', 1, '2025-06-12 00:30:15'),
(3811, 1484, 'Como garantir acessibilidade?', 'Usando linguagem clara, fontes legíveis e recursos inclusivos.', 1, '2025-06-12 00:30:15'),
(3812, 1484, 'Materiais podem ser adaptados para deficiência?', 'Devem ser adaptados para atender diferentes necessidades.', 1, '2025-06-12 00:30:15'),
(3813, 1484, 'Quem deve revisar materiais didáticos?', 'Especialistas, pares e, se possível, alunos.', 1, '2025-06-12 00:30:15'),
(3814, 1485, 'O que é avaliação de aprendizagem?', 'Processo de verificar o que o aluno aprendeu e como pode evoluir.', 1, '2025-06-12 00:30:15'),
(3815, 1485, 'Quais tipos de avaliação existem?', 'Diagnóstica, formativa e somativa.', 1, '2025-06-12 00:30:15'),
(3816, 1485, 'Por que usar diferentes formas de avaliação?', 'Para captar todas as dimensões do aprendizado.', 1, '2025-06-12 00:30:15'),
(3817, 1485, 'Como dar devolutiva da avaliação?', 'Com clareza, foco no desenvolvimento e sugestões de melhoria.', 1, '2025-06-12 00:30:15'),
(3818, 1485, 'Avaliação deve ser transparente?', 'Sim, critérios e objetivos devem ser claros.', 1, '2025-06-12 00:30:15'),
(3819, 1485, 'O que é autoavaliação?', 'O aluno reflete sobre o próprio desempenho.', 1, '2025-06-12 00:30:15'),
(3820, 1485, 'Avaliação prática é importante?', 'Sim, sobretudo em áreas aplicadas como OT.', 1, '2025-06-12 00:30:15'),
(3821, 1485, 'Como registrar avaliações?', 'Em atas, relatórios ou plataformas digitais.', 1, '2025-06-12 00:30:15'),
(3822, 1485, 'Avaliações devem ser revisadas?', 'Sim, para corrigir possíveis erros e injustiças.', 1, '2025-06-12 00:30:15'),
(3823, 1485, 'Avaliação pode ser coletiva?', 'Sim, como debates, trabalhos em grupo e projetos.', 1, '2025-06-12 00:30:15'),
(3824, 1486, 'O que é educação continuada?', 'Processo permanente de atualização e aperfeiçoamento profissional.', 1, '2025-06-12 00:30:15'),
(3825, 1486, 'Por que investir em educação continuada?', 'Para acompanhar avanços e garantir qualidade no atendimento.', 1, '2025-06-12 00:30:15'),
(3826, 1486, 'Exemplo de educação continuada?', 'Cursos, workshops, congressos, leituras e grupos de estudo.', 1, '2025-06-12 00:30:15'),
(3827, 1486, 'Como escolher temas para atualização?', 'Identificando demandas da prática e novas tendências.', 1, '2025-06-12 00:30:15'),
(3828, 1486, 'Quem é responsável pela educação continuada?', 'O próprio profissional, apoiado por instituições e entidades.', 1, '2025-06-12 00:30:15'),
(3829, 1486, 'Por que registrar participação em eventos?', 'Para comprovar atualização e valorizar currículo.', 1, '2025-06-12 00:30:15'),
(3830, 1486, 'A educação continuada é obrigatória?', 'Não sempre, mas é recomendada e em alguns casos exigida por conselhos.', 1, '2025-06-12 00:30:15'),
(3831, 1486, 'Como disseminar o aprendizado?', 'Compartilhando em reuniões, grupos e orientando colegas.', 1, '2025-06-12 00:30:15'),
(3832, 1486, 'O que dificulta a educação continuada?', 'Falta de tempo, recursos e acesso a eventos.', 1, '2025-06-12 00:30:15'),
(3833, 1486, 'Como manter motivação para estudar?', 'Estabelecendo metas, rotina e buscando temas de interesse.', 1, '2025-06-12 00:30:15'),
(3834, 1487, 'O que faz a TO no contexto escolar?', 'Promove inclusão, adaptações e apoio ao desenvolvimento de estudantes com necessidades especiais.', 1, '2025-06-12 00:30:15'),
(3835, 1487, 'Como identificar barreiras na escola?', 'Observando ambiente, rotina e interações entre alunos e professores.', 1, '2025-06-12 00:30:15'),
(3836, 1487, 'Qual o papel do TO no trabalho em equipe escolar?', 'Colaborar com professores e familiares para criar estratégias inclusivas.', 1, '2025-06-12 00:30:15'),
(3837, 1487, 'Por que adaptar atividades na escola?', 'Para garantir participação de todos os alunos.', 1, '2025-06-12 00:30:15'),
(3838, 1487, 'Quais instrumentos TO pode usar na escola?', 'Checklists, escalas de participação e observação direta.', 1, '2025-06-12 00:30:15'),
(3839, 1487, 'Como trabalhar autonomia de alunos?', 'Encorajando escolhas e oferecendo apoios graduais.', 1, '2025-06-12 00:30:15'),
(3840, 1487, 'TO pode orientar professores?', 'Sim, com estratégias para manejo de dificuldades em sala.', 1, '2025-06-12 00:30:15'),
(3841, 1487, 'Como registrar intervenções escolares?', 'Com relatórios, fichas de acompanhamento e reuniões com equipe.', 1, '2025-06-12 00:30:15'),
(3842, 1487, 'TO pode atuar em projetos escolares?', 'Sim, promovendo inclusão e saúde no ambiente.', 1, '2025-06-12 00:30:15'),
(3843, 1487, 'Por que envolver família na escola?', 'Para reforçar intervenções e ampliar os ganhos fora do ambiente escolar.', 1, '2025-06-12 00:30:15'),
(3844, 1488, 'O que são programas de saúde comunitária?', 'Ações que visam promover saúde, prevenção e qualidade de vida em grupos sociais.', 1, '2025-06-12 00:30:15'),
(3845, 1488, 'Qual o papel da TO em programas comunitários?', 'Facilitar acesso a recursos, promover autonomia e estimular participação social.', 1, '2025-06-12 00:30:15'),
(3846, 1488, 'Por que realizar diagnóstico comunitário?', 'Para identificar demandas, recursos e vulnerabilidades.', 1, '2025-06-12 00:30:15'),
(3847, 1488, 'Como planejar ações comunitárias?', 'Com participação dos moradores e levantamento de prioridades.', 1, '2025-06-12 00:30:15'),
(3848, 1488, 'TO pode atuar em campanhas de saúde?', 'Sim, com educação em saúde, prevenção e reabilitação.', 1, '2025-06-12 00:30:15'),
(3849, 1488, 'Quais parceiros podem fortalecer ações comunitárias?', 'Unidades de saúde, escolas, associações e igrejas.', 1, '2025-06-12 00:30:15'),
(3850, 1488, 'Como avaliar resultados das ações?', 'Com indicadores, relatos dos participantes e análise de impacto.', 1, '2025-06-12 00:30:15'),
(3851, 1488, 'O que é empoderamento comunitário?', 'Processo de fortalecimento das capacidades individuais e coletivas.', 1, '2025-06-12 00:30:15'),
(3852, 1488, 'Como registrar ações comunitárias?', 'Com atas, relatórios e fotos.', 1, '2025-06-12 00:30:15'),
(3853, 1488, 'TO pode atuar em políticas públicas?', 'Sim, contribuindo para elaboração, execução e avaliação.', 1, '2025-06-12 00:30:15'),
(3854, 1489, 'O que é inclusão?', 'Garantia de participação plena de todas as pessoas na sociedade, independentemente de suas condições.', 1, '2025-06-12 00:30:15'),
(3855, 1489, 'Como promover acessibilidade física?', 'Adaptando espaços, mobiliários e recursos para facilitar acesso.', 1, '2025-06-12 00:30:15'),
(3856, 1489, 'TO pode atuar na acessibilidade atitudinal?', 'Sim, sensibilizando equipes e comunidade para respeito à diversidade.', 1, '2025-06-12 00:30:15'),
(3857, 1489, 'Quais leis garantem acessibilidade?', 'Lei Brasileira de Inclusão (LBI) e normas da ABNT.', 1, '2025-06-12 00:30:15'),
(3858, 1489, 'Como avaliar barreiras de acessibilidade?', 'Com visitas técnicas e escuta dos usuários.', 1, '2025-06-12 00:30:15'),
(3859, 1489, 'Acessibilidade tecnológica é importante?', 'Sim, para uso de aplicativos, sites e comunicação digital.', 1, '2025-06-12 00:30:15'),
(3860, 1489, 'TO pode criar materiais acessíveis?', 'Sim, com linguagem clara, recursos visuais e formatos alternativos.', 1, '2025-06-12 00:30:15'),
(3861, 1489, 'Qual importância da inclusão escolar?', 'Promove desenvolvimento, autonomia e respeito à diversidade.', 1, '2025-06-12 00:30:15'),
(3862, 1489, 'Como envolver comunidade na inclusão?', 'Promovendo campanhas e projetos de sensibilização.', 1, '2025-06-12 00:30:15'),
(3863, 1489, 'Quais desafios para inclusão?', 'Preconceito, falta de estrutura e desconhecimento.', 1, '2025-06-12 00:30:15'),
(3864, 1490, 'O que são parcerias intersetoriais?', 'Ações integradas entre diferentes setores para resolver demandas sociais.', 1, '2025-06-12 00:30:15'),
(3865, 1490, 'Por que buscar parcerias?', 'Para ampliar recursos, expertise e alcance das ações.', 1, '2025-06-12 00:30:15'),
(3866, 1490, 'Quais setores podem ser parceiros da TO?', 'Saúde, educação, assistência social, cultura, esporte e trabalho.', 1, '2025-06-12 00:30:15'),
(3867, 1490, 'Como iniciar uma parceria?', 'Estabelecendo diálogo, objetivos comuns e formalizando acordos.', 1, '2025-06-12 00:30:15'),
(3868, 1490, 'Como avaliar resultados das parcerias?', 'Acompanhando indicadores, satisfação e relatos dos envolvidos.', 1, '2025-06-12 00:30:15'),
(3869, 1490, 'O que dificulta parcerias?', 'Falta de comunicação, burocracia e interesses divergentes.', 1, '2025-06-12 00:30:15'),
(3870, 1490, 'Parcerias precisam ser documentadas?', 'Sim, com contratos, termos de cooperação ou convênios.', 1, '2025-06-12 00:30:15'),
(3871, 1490, 'Como manter parcerias sustentáveis?', 'Com diálogo frequente, divisão de tarefas e avaliação conjunta.', 1, '2025-06-12 00:30:15'),
(3872, 1490, 'Parcerias intersetoriais podem inovar?', 'Sim, promovendo soluções criativas e abrangentes.', 1, '2025-06-12 00:30:15'),
(3873, 1490, 'TO pode coordenar parcerias?', 'Sim, articulando ações e monitorando processos.', 1, '2025-06-12 00:30:15'),
(3874, 1491, 'O que é advocacy?', 'Ações de defesa de direitos e promoção de mudanças sociais.', 1, '2025-06-12 00:30:15'),
(3875, 1491, 'TO pode fazer advocacy?', 'Sim, lutando por acesso, inclusão e políticas públicas justas.', 1, '2025-06-12 00:30:15'),
(3876, 1491, 'Por que participar de conselhos municipais?', 'Para influenciar decisões e representar demandas da comunidade.', 1, '2025-06-12 00:30:15'),
(3877, 1491, 'Como propor políticas locais?', 'Apresentando projetos, dialogando com gestores e mobilizando sociedade.', 1, '2025-06-12 00:30:15'),
(3878, 1491, 'O que são políticas inclusivas?', 'Aquelas que promovem participação plena e combate à discriminação.', 1, '2025-06-12 00:30:15'),
(3879, 1491, 'Quais estratégias para advocacy?', 'Campanhas, petições, mobilização de redes e articulação política.', 1, '2025-06-12 00:30:15'),
(3880, 1491, 'TO pode atuar junto a vereadores?', 'Sim, defendendo leis e projetos relevantes à área.', 1, '2025-06-12 00:30:15'),
(3881, 1491, 'Por que registrar ações de advocacy?', 'Para avaliar impacto e dar transparência à atuação.', 1, '2025-06-12 00:30:15'),
(3882, 1491, 'Como mobilizar a comunidade?', 'Com informação, diálogo e participação em decisões.', 1, '2025-06-12 00:30:15'),
(3883, 1491, 'Advocacy é importante para saúde?', 'Sim, influencia políticas que afetam prevenção, reabilitação e acesso.', 1, '2025-06-12 00:30:15'),
(3884, 1492, 'O que são riscos ocupacionais?', 'Situações no ambiente de trabalho que podem afetar a saúde do trabalhador.', 1, '2025-06-12 00:34:07'),
(3885, 1492, 'Exemplo de doença ocupacional?', 'LER/DORT, asma ocupacional, perda auditiva induzida por ruído.', 1, '2025-06-12 00:34:07'),
(3886, 1492, 'Por que identificar riscos no trabalho?', 'Para prevenir acidentes e adoecimentos.', 1, '2025-06-12 00:34:07'),
(3887, 1492, 'O que é mapa de riscos?', 'Ferramenta visual para identificar e classificar perigos no ambiente.', 1, '2025-06-12 00:34:07'),
(3888, 1492, 'Como prevenir doenças ocupacionais?', 'Com EPIs, pausas regulares e adaptação do posto de trabalho.', 1, '2025-06-12 00:34:07'),
(3889, 1492, 'TO pode atuar na prevenção de riscos?', 'Sim, analisando tarefas e propondo adaptações.', 1, '2025-06-12 00:34:07'),
(3890, 1492, 'Qual papel da CIPA?', 'Promover saúde e segurança entre trabalhadores.', 1, '2025-06-12 00:34:07'),
(3891, 1492, 'O que são riscos físicos?', 'Ruído, calor, radiações, vibração, frio e outros.', 1, '2025-06-12 00:34:07'),
(3892, 1492, 'Doenças ocupacionais têm direito a benefício?', 'Sim, garantido pela legislação previdenciária.', 1, '2025-06-12 00:34:07'),
(3893, 1492, 'Por que treinar trabalhadores sobre riscos?', 'Para criar cultura de prevenção e segurança.', 1, '2025-06-12 00:34:07'),
(3894, 1493, 'O que é ginástica laboral?', 'Exercícios físicos realizados no ambiente de trabalho para prevenção de lesões.', 1, '2025-06-12 00:34:07'),
(3895, 1493, 'Quais tipos de ginástica laboral existem?', 'Preparatória, compensatória, relaxamento e correção postural.', 1, '2025-06-12 00:34:07'),
(3896, 1493, 'Por que implementar ginástica laboral?', 'Reduz afastamentos, melhora bem-estar e produtividade.', 1, '2025-06-12 00:34:07'),
(3897, 1493, 'Quem pode aplicar ginástica laboral?', 'Profissionais de saúde habilitados, como TO e fisioterapeutas.', 1, '2025-06-12 00:34:07'),
(3898, 1493, 'Ginástica laboral pode prevenir doenças?', 'Sim, principalmente LER/DORT e dores musculares.', 1, '2025-06-12 00:34:07'),
(3899, 1493, 'Como medir resultados do programa?', 'Com avaliação de sintomas, produtividade e satisfação dos funcionários.', 1, '2025-06-12 00:34:07'),
(3900, 1493, 'Ginástica laboral é obrigatória?', 'Não, mas recomendada para empresas preocupadas com saúde.', 1, '2025-06-12 00:34:07'),
(3901, 1493, 'Quanto tempo deve durar uma sessão?', 'Geralmente de 10 a 15 minutos.', 1, '2025-06-12 00:34:07'),
(3902, 1493, 'Ginástica laboral pode ser personalizada?', 'Sim, conforme demanda da empresa e perfil dos trabalhadores.', 1, '2025-06-12 00:34:07'),
(3903, 1493, 'Quais barreiras para adesão?', 'Falta de tempo, interesse ou apoio da gestão.', 1, '2025-06-12 00:34:07'),
(3904, 1494, 'O que é ergonomia ambiental?', 'Estudo e adaptação do ambiente de trabalho para conforto e segurança.', 1, '2025-06-12 00:34:07'),
(3905, 1494, 'Como avaliar iluminação no trabalho?', 'Verificando intensidade, reflexos e adaptação ao tipo de tarefa.', 1, '2025-06-12 00:34:07'),
(3906, 1494, 'Ergonomia influencia produtividade?', 'Sim, ao reduzir desconforto e prevenir lesões.', 1, '2025-06-12 00:34:07'),
(3907, 1494, 'Quais fatores considerar na ergonomia ambiental?', 'Ruído, temperatura, ventilação, iluminação e mobiliário.', 1, '2025-06-12 00:34:07'),
(3908, 1494, 'Como adaptar mobiliário?', 'Ajustando altura, profundidade e suporte para postura correta.', 1, '2025-06-12 00:34:07'),
(3909, 1494, 'O que é ergonomia participativa?', 'Quando trabalhadores colaboram na identificação de melhorias.', 1, '2025-06-12 00:34:07'),
(3910, 1494, 'Como medir conforto ambiental?', 'Com pesquisas de satisfação e avaliação técnica.', 1, '2025-06-12 00:34:07'),
(3911, 1494, 'TO pode propor adaptações ambientais?', 'Sim, com foco em funcionalidade e segurança.', 1, '2025-06-12 00:34:07'),
(3912, 1494, 'Ergonomia ambiental é investimento ou custo?', 'Investimento, pois reduz afastamentos e aumenta desempenho.', 1, '2025-06-12 00:34:07'),
(3913, 1494, 'Como registrar análise ergonômica?', 'Com laudos, relatórios e fotos do ambiente.', 1, '2025-06-12 00:34:07'),
(3914, 1495, 'O que é promoção da saúde no trabalho?', 'Conjunto de ações para melhorar qualidade de vida e bem-estar dos trabalhadores.', 1, '2025-06-12 00:34:07'),
(3915, 1495, 'Por que investir em saúde no trabalho?', 'Reduz afastamentos, melhora clima organizacional e produtividade.', 1, '2025-06-12 00:34:07'),
(3916, 1495, 'Como sensibilizar trabalhadores para saúde?', 'Com campanhas, treinamentos e comunicação clara.', 1, '2025-06-12 00:34:07'),
(3917, 1495, 'TO pode liderar ações de promoção de saúde?', 'Sim, planejando intervenções e envolvendo equipe.', 1, '2025-06-12 00:34:07'),
(3918, 1495, 'O que são programas de qualidade de vida?', 'Ações focadas em alimentação, atividade física, lazer e saúde mental.', 1, '2025-06-12 00:34:07'),
(3919, 1495, 'Como avaliar resultados das ações?', 'Com indicadores de saúde, satisfação e desempenho.', 1, '2025-06-12 00:34:07'),
(3920, 1495, 'Saúde no trabalho inclui saúde mental?', 'Sim, prevenindo estresse, ansiedade e burnout.', 1, '2025-06-12 00:34:07'),
(3921, 1495, 'Como envolver gestão nas ações?', 'Mostrando benefícios e resultados para empresa.', 1, '2025-06-12 00:34:07'),
(3922, 1495, 'Por que monitorar absenteísmo?', 'Para identificar causas e planejar intervenções.', 1, '2025-06-12 00:34:07'),
(3923, 1495, 'Exemplo de ação de saúde?', 'Campanhas de vacinação, ginástica laboral, palestras e pausas ativas.', 1, '2025-06-12 00:34:07'),
(3924, 1496, 'Por que conhecer legislação em saúde ocupacional?', 'Para garantir direitos, segurança e evitar multas.', 1, '2025-06-12 00:34:07'),
(3925, 1496, 'O que é NR-17?', 'Norma que estabelece parâmetros de ergonomia no trabalho.', 1, '2025-06-12 00:34:07'),
(3926, 1496, 'Quem fiscaliza saúde ocupacional?', 'Ministério do Trabalho, sindicatos e CIPA.', 1, '2025-06-12 00:34:07'),
(3927, 1496, 'Quais direitos do trabalhador exposto a risco?', 'Equipamentos de proteção, exames periódicos e estabilidade em caso de doença.', 1, '2025-06-12 00:34:07'),
(3928, 1496, 'O que é CAT?', 'Comunicação de Acidente de Trabalho, obrigatória em casos de acidente.', 1, '2025-06-12 00:34:07'),
(3929, 1496, 'Empresas são obrigadas a investir em saúde ocupacional?', 'Sim, conforme legislação vigente.', 1, '2025-06-12 00:34:07'),
(3930, 1496, 'Quais penalidades por descumprimento?', 'Multas, interdição e ações judiciais.', 1, '2025-06-12 00:34:07'),
(3931, 1496, 'Por que registrar acidentes de trabalho?', 'Para garantir benefícios e prevenção de novos casos.', 1, '2025-06-12 00:34:07'),
(3932, 1496, 'Saúde ocupacional envolve apenas riscos físicos?', 'Não, inclui riscos químicos, biológicos e psicossociais.', 1, '2025-06-12 00:34:07'),
(3933, 1496, 'TO pode orientar sobre direitos do trabalhador?', 'Sim, informando sobre prevenção e legislação.', 1, '2025-06-12 00:34:07'),
(3934, 1497, 'O que é sistema público de saúde?', 'Rede financiada pelo Estado, como o SUS, garantindo acesso universal e gratuito.', 1, '2025-06-12 00:34:07'),
(3935, 1497, 'Como funciona o sistema privado?', 'Prestado por clínicas e hospitais particulares, pago diretamente ou por planos.', 1, '2025-06-12 00:34:07'),
(3936, 1497, 'Quais princípios do SUS?', 'Universalidade, integralidade e equidade.', 1, '2025-06-12 00:34:07'),
(3937, 1497, 'Diferença entre cobertura e acesso?', 'Cobertura é direito garantido, acesso é efetivação desse direito.', 1, '2025-06-12 00:34:07'),
(3938, 1497, 'Por que articular redes de atenção?', 'Para integrar serviços e melhorar resultados de saúde.', 1, '2025-06-12 00:34:07'),
(3939, 1497, 'Quais desafios do sistema público?', 'Recursos limitados, filas e burocracia.', 1, '2025-06-12 00:34:07'),
(3940, 1497, 'Como o privado complementa o público?', 'Oferecendo alternativas e desafogando o SUS.', 1, '2025-06-12 00:34:07'),
(3941, 1497, 'O que são consórcios intermunicipais?', 'Uniões de municípios para otimizar recursos em saúde.', 1, '2025-06-12 00:34:07'),
(3942, 1497, 'TO pode atuar em ambos os sistemas?', 'Sim, adaptando abordagens conforme demandas.', 1, '2025-06-12 00:34:07'),
(3943, 1497, 'Como avaliar qualidade dos sistemas?', 'Com indicadores, pesquisas e satisfação dos usuários.', 1, '2025-06-12 00:34:07'),
(3944, 1498, 'O que é plano de saúde?', 'Contrato que oferece cobertura médica e hospitalar por mensalidade.', 1, '2025-06-12 00:34:07'),
(3945, 1498, 'Como funciona reembolso em planos?', 'Usuário paga o serviço e recebe parte do valor de volta conforme contrato.', 1, '2025-06-12 00:34:07'),
(3946, 1498, 'Quais procedimentos planos devem cobrir?', 'Os que constam no rol da ANS e no contrato.', 1, '2025-06-12 00:34:07'),
(3947, 1498, 'Como solicitar reembolso?', 'Enviando nota fiscal, laudo e solicitação à operadora.', 1, '2025-06-12 00:34:07'),
(3948, 1498, 'TO pode ser reembolsada?', 'Sim, se prevista no plano ou mediante solicitação médica.', 1, '2025-06-12 00:34:07'),
(3949, 1498, 'Quais são carências nos planos?', 'Período sem direito a certos procedimentos após contratação.', 1, '2025-06-12 00:34:07'),
(3950, 1498, 'Planos cobrem reabilitação?', 'Sim, conforme rol da ANS e contrato.', 1, '2025-06-12 00:34:07'),
(3951, 1498, 'Como recorrer a negativas?', 'Com justificativas médicas e apoio de órgãos de defesa.', 1, '2025-06-12 00:34:07'),
(3952, 1498, 'O que é portabilidade de carências?', 'Mudança de plano sem novo período de carência.', 1, '2025-06-12 00:34:07'),
(3953, 1498, 'Como consultar cobertura?', 'Lendo o contrato e consultando a ANS.', 1, '2025-06-12 00:34:07'),
(3954, 1499, 'O que é acesso em saúde?', 'Possibilidade de obter serviços necessários quando preciso.', 1, '2025-06-12 00:34:07'),
(3955, 1499, 'Quais barreiras para acesso à OT?', 'Falta de informação, recursos financeiros e oferta limitada.', 1, '2025-06-12 00:34:07'),
(3956, 1499, 'TO é garantida pelo SUS?', 'Sim, como reabilitação e apoio à inclusão.', 1, '2025-06-12 00:34:07'),
(3957, 1499, 'Como ampliar acesso à OT?', 'Com divulgação, políticas públicas e convênios.', 1, '2025-06-12 00:34:07'),
(3958, 1499, 'Planos privados cobrem OT?', 'Geralmente sim, para diagnósticos incluídos na cobertura.', 1, '2025-06-12 00:34:07'),
(3959, 1499, 'Como indicar OT para pacientes?', 'Por encaminhamento médico ou busca direta.', 1, '2025-06-12 00:34:07'),
(3960, 1499, 'TO pode atuar em unidades básicas?', 'Sim, integrando equipes multidisciplinares.', 1, '2025-06-12 00:34:07'),
(3961, 1499, 'Acesso pode ser facilitado por tecnologia?', 'Sim, com telessaúde e plataformas digitais.', 1, '2025-06-12 00:34:07'),
(3962, 1499, 'Por que integrar OT à rede de atenção?', 'Para potencializar resultados e ampliar impacto.', 1, '2025-06-12 00:34:07'),
(3963, 1499, 'Quem fiscaliza oferta de OT?', 'Conselhos de classe, ministério da saúde e órgãos reguladores.', 1, '2025-06-12 00:34:07'),
(3964, 1500, 'O que são políticas de inclusão social?', 'Ações que visam garantir direitos e participação de grupos vulneráveis.', 1, '2025-06-12 00:34:07'),
(3965, 1500, 'TO pode participar da elaboração de políticas?', 'Sim, contribuindo com conhecimento técnico e vivência.', 1, '2025-06-12 00:34:07'),
(3966, 1500, 'Quais exemplos de políticas inclusivas?', 'Cotas, adaptações, programas de reabilitação e educação especial.', 1, '2025-06-12 00:34:07'),
(3967, 1500, 'Por que políticas públicas são importantes?', 'Para promover equidade e combater desigualdades.', 1, '2025-06-12 00:34:07'),
(3968, 1500, 'Quem pode propor políticas sociais?', 'Profissionais, entidades, movimentos sociais e legisladores.', 1, '2025-06-12 00:34:07'),
(3969, 1500, 'Como avaliar impacto das políticas?', 'Com indicadores sociais, acompanhamento e pesquisa.', 1, '2025-06-12 00:34:07'),
(3970, 1500, 'TO pode ser agente de inclusão?', 'Sim, articulando recursos e promovendo autonomia.', 1, '2025-06-12 00:34:07'),
(3971, 1500, 'Como divulgar políticas para a comunidade?', 'Com campanhas, reuniões e materiais acessíveis.', 1, '2025-06-12 00:34:07'),
(3972, 1500, 'Políticas de inclusão são obrigatórias?', 'Sim, garantidas por lei.', 1, '2025-06-12 00:34:07'),
(3973, 1500, 'Como registrar participação em políticas?', 'Com atas, relatórios e registros fotográficos.', 1, '2025-06-12 00:34:07'),
(3974, 1501, 'O que é financiamento de pesquisa?', 'Recursos obtidos para custear projetos científicos.', 1, '2025-06-12 00:34:07'),
(3975, 1501, 'Fontes de financiamento para pesquisa?', 'Agências governamentais, editais, empresas e ONGs.', 1, '2025-06-12 00:34:07'),
(3976, 1501, 'Por que submeter projetos a editais?', 'Para captar recursos e viabilizar estudos.', 1, '2025-06-12 00:34:07'),
(3977, 1501, 'Como elaborar orçamento de pesquisa?', 'Detalhando custos, materiais, viagens e equipe.', 1, '2025-06-12 00:34:07'),
(3978, 1501, 'TO pode coordenar projetos financiados?', 'Sim, atuando como pesquisador responsável.', 1, '2025-06-12 00:34:07'),
(3979, 1501, 'O que é prestação de contas?', 'Relatório detalhado sobre uso dos recursos.', 1, '2025-06-12 00:34:07'),
(3980, 1501, 'Como evitar problemas no financiamento?', 'Seguindo normas, cronogramas e registrando gastos.', 1, '2025-06-12 00:34:07'),
(3981, 1501, 'Quais documentos são exigidos para financiamento?', 'Projeto, cronograma, orçamento e currículo da equipe.', 1, '2025-06-12 00:34:07'),
(3982, 1501, 'Como avaliar resultados de projetos financiados?', 'Com indicadores, relatórios e publicação dos achados.', 1, '2025-06-12 00:34:07'),
(3983, 1501, 'Financiamento pode ser renovado?', 'Sim, com novos projetos ou resultados positivos.', 1, '2025-06-12 00:34:07'),
(3984, 1502, 'O que é um comitê de ética?', 'Grupo responsável por avaliar se pesquisas respeitam direitos e segurança dos participantes.', 1, '2025-06-12 00:34:07'),
(3985, 1502, 'Quando submeter projeto ao comitê?', 'Antes de iniciar qualquer pesquisa envolvendo pessoas.', 1, '2025-06-12 00:34:07'),
(3986, 1502, 'O que é consentimento livre e esclarecido?', 'Permissão dada pelo participante, após ser informado sobre a pesquisa.', 1, '2025-06-12 00:34:07'),
(3987, 1502, 'O que faz o CEP?', 'Analisa riscos, benefícios e adequação ética dos estudos.', 1, '2025-06-12 00:34:07'),
(3988, 1502, 'Comitê de ética pode reprovar projetos?', 'Sim, se houver riscos não justificados ou falhas éticas.', 1, '2025-06-12 00:34:07'),
(3989, 1502, 'Quem precisa assinar o consentimento?', 'O participante e, em caso de incapaz, seu responsável.', 1, '2025-06-12 00:34:07'),
(3990, 1502, 'Consentimento pode ser retirado?', 'Sim, o participante pode desistir a qualquer momento.', 1, '2025-06-12 00:34:07'),
(3991, 1502, 'Pesquisa sem consentimento é válida?', 'Não, viola princípios éticos e legais.', 1, '2025-06-12 00:34:07'),
(3992, 1502, 'Comitê de ética avalia apenas pesquisa clínica?', 'Não, avalia qualquer estudo com seres humanos.', 1, '2025-06-12 00:34:07'),
(3993, 1502, 'Quais documentos enviar ao CEP?', 'Projeto, formulário de consentimento e anexos pertinentes.', 1, '2025-06-12 00:34:07'),
(3994, 1503, 'Quais são direitos do participante?', 'Informação, autonomia, confidencialidade e segurança durante a pesquisa.', 1, '2025-06-12 00:34:07'),
(3995, 1503, 'Participante pode desistir?', 'Sim, em qualquer momento e sem prejuízo.', 1, '2025-06-12 00:34:07'),
(3996, 1503, 'O que é confidencialidade?', 'Proteção das informações pessoais do participante.', 1, '2025-06-12 00:34:07'),
(3997, 1503, 'Como garantir respeito ao participante?', 'Com informações claras e atendimento humanizado.', 1, '2025-06-12 00:34:07'),
(3998, 1503, 'Pesquisador pode obrigar participação?', 'Nunca, deve ser sempre voluntária.', 1, '2025-06-12 00:34:07'),
(3999, 1503, 'Participante pode pedir esclarecimentos?', 'Sim, o pesquisador deve estar disponível para dúvidas.', 1, '2025-06-12 00:34:07'),
(4000, 1503, 'Como registrar que o participante foi respeitado?', 'Por meio de consentimento e registros no projeto.', 1, '2025-06-12 00:34:07'),
(4001, 1503, 'O que é dano mínimo?', 'Risco que não ultrapassa desconfortos do cotidiano.', 1, '2025-06-12 00:34:07'),
(4002, 1503, 'Participante recebe compensação?', 'Pode haver reembolso, mas não pode ser incentivo para risco.', 1, '2025-06-12 00:34:07'),
(4003, 1503, 'Quais órgãos fiscalizam direitos dos participantes?', 'CEP, CONEP e autoridades de saúde.', 1, '2025-06-12 00:34:07'),
(4004, 1504, 'O que é pesquisa qualitativa?', 'Estudo que explora significados, experiências e opiniões dos participantes.', 1, '2025-06-12 00:34:07'),
(4005, 1504, 'Exemplo de método qualitativo?', 'Entrevistas, grupos focais, observação participante.', 1, '2025-06-12 00:34:07'),
(4006, 1504, 'Por que usar pesquisa qualitativa?', 'Para aprofundar compreensão de fenômenos complexos em saúde.', 1, '2025-06-12 00:34:07'),
(4007, 1504, 'Como coletar dados qualitativos?', 'Com entrevistas gravadas, anotações e registros de campo.', 1, '2025-06-12 00:34:07'),
(4008, 1504, 'Como analisar dados qualitativos?', 'Por análise de conteúdo, categorias e temas emergentes.', 1, '2025-06-12 00:34:07'),
(4009, 1504, 'Qual o papel do pesquisador?', 'Ser sensível, ético e aberto a interpretações.', 1, '2025-06-12 00:34:07'),
(4010, 1504, 'Como garantir rigor em pesquisa qualitativa?', 'Com transparência, triangulação de dados e validação por pares.', 1, '2025-06-12 00:34:07'),
(4011, 1504, 'Pesquisa qualitativa precisa de comitê de ética?', 'Sim, quando envolve pessoas.', 1, '2025-06-12 00:34:07'),
(4012, 1504, 'Como registrar resultados qualitativos?', 'Por relatos detalhados e trechos de falas.', 1, '2025-06-12 00:34:07'),
(4013, 1504, 'Limites da pesquisa qualitativa?', 'Subjetividade, menor generalização e demanda de tempo.', 1, '2025-06-12 00:34:07'),
(4014, 1505, 'O que é plágio?', 'Uso de ideias ou textos de outros sem dar o devido crédito.', 1, '2025-06-12 00:34:07'),
(4015, 1505, 'Como evitar plágio?', 'Citanto corretamente autores e fontes utilizadas.', 1, '2025-06-12 00:34:07'),
(4016, 1505, 'O que é autoplágio?', 'Reutilização de trabalhos próprios sem referência ou autorização.', 1, '2025-06-12 00:34:07'),
(4017, 1505, 'Por que publicar resultados?', 'Para compartilhar conhecimento e permitir avanços na área.', 1, '2025-06-12 00:34:07'),
(4018, 1505, 'O que são revistas indexadas?', 'Publicações reconhecidas por bases científicas.', 1, '2025-06-12 00:34:07'),
(4019, 1505, 'Como escolher revista para publicar?', 'Considerar escopo, fator de impacto e acesso aberto.', 1, '2025-06-12 00:34:07'),
(4020, 1505, 'Publicação pode ser recusada?', 'Sim, após revisão por pares.', 1, '2025-06-12 00:34:07'),
(4021, 1505, 'Consequências do plágio?', 'Descredenciamento, perda de título e danos à reputação.', 1, '2025-06-12 00:34:07'),
(4022, 1505, 'Como reconhecer plágio?', 'Por softwares antiplágio e análise de originalidade.', 1, '2025-06-12 00:34:07'),
(4023, 1505, 'Publicar resultados negativos é válido?', 'Sim, contribui para conhecimento científico.', 1, '2025-06-12 00:34:07'),
(4024, 1506, 'O que é data management?', 'Gestão adequada de coleta, armazenamento e uso de dados em pesquisa.', 1, '2025-06-12 00:34:07'),
(4025, 1506, 'Por que proteger dados de pesquisa?', 'Para garantir ética, sigilo e validade dos resultados.', 1, '2025-06-12 00:34:07'),
(4026, 1506, 'Como armazenar dados?', 'Com segurança, backup e restrição de acesso.', 1, '2025-06-12 00:34:07'),
(4027, 1506, 'Quem pode acessar dados?', 'Somente pesquisadores autorizados pelo projeto.', 1, '2025-06-12 00:34:07'),
(4028, 1506, 'Como documentar etapas de data management?', 'Com registros detalhados de cada fase da pesquisa.', 1, '2025-06-12 00:34:07'),
(4029, 1506, 'Quais normas regem data management?', 'LGPD, políticas institucionais e regulamentos internacionais.', 1, '2025-06-12 00:34:07'),
(4030, 1506, 'Pode-se compartilhar dados com outros pesquisadores?', 'Sim, se houver consentimento e autorização ética.', 1, '2025-06-12 00:34:07'),
(4031, 1506, 'O que é anonimização?', 'Remover informações que permitam identificar participantes.', 1, '2025-06-12 00:34:07'),
(4032, 1506, 'Como registrar destruição de dados?', 'Em atas, relatórios e documentação de encerramento.', 1, '2025-06-12 00:34:07'),
(4033, 1506, 'Por que revisar data management?', 'Para garantir boas práticas e evitar erros.', 1, '2025-06-12 00:34:07'),
(4034, 1507, 'O que é uma startup em saúde?', 'Empresa inovadora com foco em soluções tecnológicas para saúde.', 1, '2025-06-12 00:34:07'),
(4035, 1507, 'Qual diferencial das startups?', 'Agilidade, inovação e uso intensivo de tecnologia.', 1, '2025-06-12 00:34:07'),
(4036, 1507, 'Exemplo de produto de startup em saúde?', 'Apps de telemedicina, wearables e plataformas de gestão.', 1, '2025-06-12 00:34:07'),
(4037, 1507, 'Como nasce uma startup?', 'A partir de uma ideia inovadora e identificação de demanda.', 1, '2025-06-12 00:34:07'),
(4038, 1507, 'O que é MVP?', 'Produto Mínimo Viável, versão simplificada para testar ideia no mercado.', 1, '2025-06-12 00:34:07'),
(4039, 1507, 'Por que buscar investimento?', 'Para escalar soluções e ampliar impacto.', 1, '2025-06-12 00:34:07'),
(4040, 1507, 'Quais desafios das startups em saúde?', 'Regulação, validação científica e acesso ao mercado.', 1, '2025-06-12 00:34:07'),
(4041, 1507, 'Como proteger inovação?', 'Com registros de patente e propriedade intelectual.', 1, '2025-06-12 00:34:07'),
(4042, 1507, 'Startups podem atuar em OT?', 'Sim, criando soluções para avaliação, intervenção e gestão.', 1, '2025-06-12 00:34:07'),
(4043, 1507, 'Por que startups buscam incubadoras?', 'Para apoio técnico, financeiro e networking.', 1, '2025-06-12 00:34:07'),
(4044, 1508, 'Por que desenvolver apps para OT?', 'Para ampliar acesso, engajamento e resultados em terapia ocupacional.', 1, '2025-06-12 00:34:07'),
(4045, 1508, 'Que funcionalidades apps de OT podem ter?', 'Agenda, avaliação, exercícios guiados e acompanhamento.', 1, '2025-06-12 00:34:07'),
(4046, 1508, 'Apps substituem o terapeuta?', 'Não, são ferramentas de apoio ao trabalho do profissional.', 1, '2025-06-12 00:34:07'),
(4047, 1508, 'Como garantir acessibilidade em apps?', 'Com design inclusivo e opções adaptadas a diferentes perfis.', 1, '2025-06-12 00:34:07'),
(4048, 1508, 'Qual importância de testes de usabilidade?', 'Garantem que o app seja fácil de usar e útil.', 1, '2025-06-12 00:34:07'),
(4049, 1508, 'Como monetizar apps em saúde?', 'Com vendas, assinaturas ou licenciamento para clínicas.', 1, '2025-06-12 00:34:07'),
(4050, 1508, 'Apps de OT devem proteger dados?', 'Sim, com segurança e respeito à LGPD.', 1, '2025-06-12 00:34:07'),
(4051, 1508, 'Como divulgar um app?', 'Com marketing digital, parcerias e eventos da área.', 1, '2025-06-12 00:34:07'),
(4052, 1508, 'Profissional de OT pode criar app?', 'Sim, com apoio de programadores e designers.', 1, '2025-06-12 00:34:07'),
(4053, 1508, 'Feedback dos usuários é importante?', 'Sim, para melhorias e atualizações constantes.', 1, '2025-06-12 00:34:07'),
(4054, 1509, 'O que é design thinking?', 'Metodologia de inovação focada no usuário e solução de problemas.', 1, '2025-06-12 00:34:07'),
(4055, 1509, 'Como aplicar design thinking em OT?', 'Observando demandas do usuário e co-criando soluções.', 1, '2025-06-12 00:34:07'),
(4056, 1509, 'Quais etapas do design thinking?', 'Empatia, definição, ideação, prototipagem e teste.', 1, '2025-06-12 00:34:07'),
(4057, 1509, 'Empatia é importante em design thinking?', 'Sim, para entender necessidades reais do usuário.', 1, '2025-06-12 00:34:07'),
(4058, 1509, 'Por que prototipar soluções?', 'Para testar ideias rapidamente antes de investir.', 1, '2025-06-12 00:34:07'),
(4059, 1509, 'Design thinking serve para serviços?', 'Sim, pode ser aplicado em processos, produtos e atendimentos.', 1, '2025-06-12 00:34:07'),
(4060, 1509, 'O que é co-criação?', 'Construção conjunta entre usuários e profissionais.', 1, '2025-06-12 00:34:07'),
(4061, 1509, 'Feedback faz parte do processo?', 'Sim, para ajustar e evoluir a solução.', 1, '2025-06-12 00:34:07'),
(4062, 1509, 'Como registrar resultados do design thinking?', 'Com relatórios, fotos, vídeos e avaliações.', 1, '2025-06-12 00:34:07'),
(4063, 1509, 'Design thinking pode inovar na OT?', 'Sim, trazendo novas abordagens e ferramentas.', 1, '2025-06-12 00:34:07'),
(4064, 1510, 'O que é modelo de negócio?', 'Estrutura que define como a empresa cria, entrega e captura valor.', 1, '2025-06-12 00:34:07'),
(4065, 1510, 'Exemplo de modelo em saúde?', 'Clínica particular, SaaS, marketplace de profissionais.', 1, '2025-06-12 00:34:07'),
(4066, 1510, 'Por que planejar o modelo?', 'Para identificar clientes, canais, recursos e receitas.', 1, '2025-06-12 00:34:07'),
(4067, 1510, 'O que é fluxo de receitas?', 'Formas como a empresa obtém dinheiro, como vendas e assinaturas.', 1, '2025-06-12 00:34:07'),
(4068, 1510, 'Como captar investimento?', 'Com pitch, participação em editais e networking.', 1, '2025-06-12 00:34:07'),
(4069, 1510, 'O que são investidores anjo?', 'Pessoas que investem capital próprio em negócios inovadores.', 1, '2025-06-12 00:34:07'),
(4070, 1510, 'Qual importância do plano de negócios?', 'Direciona ações e previne riscos.', 1, '2025-06-12 00:34:07'),
(4071, 1510, 'Como avaliar viabilidade financeira?', 'Analisando custos, mercado e potencial de lucro.', 1, '2025-06-12 00:34:07'),
(4072, 1510, 'TO pode empreender?', 'Sim, criando clínicas, consultorias ou soluções digitais.', 1, '2025-06-12 00:34:07'),
(4073, 1510, 'Negócios em saúde precisam de regulação?', 'Sim, por normas da ANVISA, CREFITO e outros órgãos.', 1, '2025-06-12 00:34:07'),
(4074, 1511, 'Por que estudar casos de sucesso?', 'Para aprender estratégias que funcionaram e adaptar à realidade local.', 1, '2025-06-12 00:34:07'),
(4075, 1511, 'Exemplo de sucesso em OT?', 'Projetos inovadores, apps premiados, clínicas de referência.', 1, '2025-06-12 00:34:07'),
(4076, 1511, 'O que é benchmarking?', 'Análise de práticas e resultados de organizações líderes.', 1, '2025-06-12 00:34:07'),
(4077, 1511, 'Lições comuns em cases de sucesso?', 'Foco no usuário, resiliência, equipe qualificada e inovação.', 1, '2025-06-12 00:34:07'),
(4078, 1511, 'Como documentar lições aprendidas?', 'Com relatórios, artigos e apresentações.', 1, '2025-06-12 00:34:07'),
(4079, 1511, 'Erros podem gerar aprendizado?', 'Sim, ajudam a aprimorar práticas e evitar repetição.', 1, '2025-06-12 00:34:07'),
(4080, 1511, 'Por que buscar mentoria?', 'Para acelerar aprendizado e evitar erros comuns.', 1, '2025-06-12 00:34:07'),
(4081, 1511, 'Como compartilhar cases de sucesso?', 'Em congressos, redes sociais e publicações.', 1, '2025-06-12 00:34:07'),
(4082, 1511, 'Casos de sucesso garantem repetição?', 'Não, cada contexto exige adaptações.', 1, '2025-06-12 00:34:07'),
(4083, 1511, 'Qual papel do usuário no sucesso?', 'Fundamental, pois sua satisfação define resultados.', 1, '2025-06-12 00:34:07'),
(4084, 1512, 'O que é congresso em OT?', 'Evento que reúne profissionais para troca de experiências, palestras e atualizações.', 1, '2025-06-12 00:34:07'),
(4085, 1512, 'Exemplo de congresso nacional de OT?', 'Congresso Brasileiro de Terapia Ocupacional (CBTO).', 1, '2025-06-12 00:34:07'),
(4086, 1512, 'Por que participar de congressos?', 'Para se atualizar, fazer networking e conhecer novas práticas.', 1, '2025-06-12 00:34:07'),
(4087, 1512, 'Como apresentar trabalho em congresso?', 'Inscrevendo resumo, sendo aprovado e preparando apresentação.', 1, '2025-06-12 00:34:07'),
(4088, 1512, 'Congressos são apenas presenciais?', 'Não, muitos têm versão online ou híbrida.', 1, '2025-06-12 00:34:07'),
(4089, 1512, 'O que é certificado de participação?', 'Comprovante de presença ou apresentação no evento.', 1, '2025-06-12 00:34:07'),
(4090, 1512, 'Como escolher qual congresso participar?', 'Considerando tema, local, palestrantes e relevância.', 1, '2025-06-12 00:34:07'),
(4091, 1512, 'Congressos ajudam na carreira?', 'Sim, agregam valor ao currículo e ampliam a rede de contatos.', 1, '2025-06-12 00:34:07'),
(4092, 1512, 'Quais benefícios de apresentar trabalho?', 'Visibilidade, troca de feedback e reconhecimento.', 1, '2025-06-12 00:34:07'),
(4093, 1512, 'Participação em congresso conta como educação continuada?', 'Sim, na maioria dos conselhos profissionais.', 1, '2025-06-12 00:34:07'),
(4094, 1513, 'O que são sociedades científicas?', 'Associações que reúnem profissionais de uma área para promoção do conhecimento.', 1, '2025-06-12 00:34:07'),
(4095, 1513, 'Exemplo de sociedade em OT?', 'Associação Brasileira de Terapia Ocupacional (ABRATO).', 1, '2025-06-12 00:34:07'),
(4096, 1513, 'Quais vantagens de ser sócio?', 'Acesso a eventos, revistas, descontos e atualização.', 1, '2025-06-12 00:34:07'),
(4097, 1513, 'Sociedade científica pode propor normas?', 'Sim, comitês técnicos colaboram na regulamentação.', 1, '2025-06-12 00:34:07'),
(4098, 1513, 'Como se associar?', 'Fazendo inscrição e pagando anuidade.', 1, '2025-06-12 00:34:07'),
(4099, 1513, 'Por que participar de sociedades?', 'Para fortalecer a profissão e influenciar políticas.', 1, '2025-06-12 00:34:07'),
(4100, 1513, 'Quais produtos sociedades oferecem?', 'Cursos, congressos, revistas e certificados.', 1, '2025-06-12 00:34:07'),
(4101, 1513, 'Sociedades apoiam pesquisa?', 'Sim, com editais, prêmios e grupos de estudo.', 1, '2025-06-12 00:34:07'),
(4102, 1513, 'Como encontrar sociedade científica?', 'Pesquisando na internet ou em conselhos de classe.', 1, '2025-06-12 00:34:07'),
(4103, 1513, 'Participar de sociedade é obrigatório?', 'Não, mas é recomendado para engajamento profissional.', 1, '2025-06-12 00:34:07'),
(4104, 1514, 'O que são grupos de estudo?', 'Reuniões regulares para debate e atualização de temas específicos.', 1, '2025-06-12 00:34:07'),
(4105, 1514, 'Como organizar um grupo de estudo?', 'Definindo tema, cronograma e participantes.', 1, '2025-06-12 00:34:07'),
(4106, 1514, 'Quais benefícios dos fóruns?', 'Troca de experiências, dúvidas e construção coletiva do conhecimento.', 1, '2025-06-12 00:34:07'),
(4107, 1514, 'Participar de grupo é bom para quem?', 'Estudantes e profissionais em busca de atualização.', 1, '2025-06-12 00:34:07'),
(4108, 1514, 'Como registrar atividades de grupos?', 'Com atas, listas de presença e resumos das discussões.', 1, '2025-06-12 00:34:07'),
(4109, 1514, 'Grupos podem ser online?', 'Sim, usando plataformas digitais e redes sociais.', 1, '2025-06-12 00:34:07'),
(4110, 1514, 'Fóruns podem ser temáticos?', 'Sim, focando em áreas como autismo, reabilitação, gestão.', 1, '2025-06-12 00:34:07'),
(4111, 1514, 'Por que rotacionar liderança em grupos?', 'Para desenvolver habilidades de todos os membros.', 1, '2025-06-12 00:34:07'),
(4112, 1514, 'Como avaliar aprendizado nos grupos?', 'Com debates, resumos e autoavaliação.', 1, '2025-06-12 00:34:07'),
(4113, 1514, 'Grupos ajudam na pesquisa?', 'Sim, colaborando na revisão e elaboração de projetos.', 1, '2025-06-12 00:34:07'),
(4114, 1515, 'Por que publicar notícias em OT?', 'Para divulgar avanços, oportunidades e temas relevantes.', 1, '2025-06-12 00:34:07'),
(4115, 1515, 'Blogs são úteis para OT?', 'Sim, aproximam profissionais e disseminam conhecimento.', 1, '2025-06-12 00:34:07'),
(4116, 1515, 'Como criar conteúdo relevante?', 'Estudando temas atuais e utilizando linguagem acessível.', 1, '2025-06-12 00:34:07');
INSERT INTO `flashcards` (`id_flashcard`, `id_assunto`, `pergunta`, `resposta`, `ativo`, `data_criacao`) VALUES
(4117, 1515, 'O que evitar em publicações?', 'Fake news, informações sem fonte e plágio.', 1, '2025-06-12 00:34:07'),
(4118, 1515, 'Como divulgar blog?', 'Com redes sociais, parcerias e SEO.', 1, '2025-06-12 00:34:07'),
(4119, 1515, 'Notícias precisam de revisão?', 'Sim, para garantir qualidade e veracidade.', 1, '2025-06-12 00:34:07'),
(4120, 1515, 'Publicação pode ser colaborativa?', 'Sim, com textos de diferentes autores.', 1, '2025-06-12 00:34:07'),
(4121, 1515, 'Como citar fontes em blogs?', 'Referenciando corretamente no final do texto.', 1, '2025-06-12 00:34:07'),
(4122, 1515, 'Blogs podem receber comentários?', 'Sim, estimulando debate e troca de experiências.', 1, '2025-06-12 00:34:07'),
(4123, 1515, 'Notícias de OT têm impacto?', 'Sim, podem influenciar decisões e práticas profissionais.', 1, '2025-06-12 00:34:07'),
(4124, 1516, 'O que é networking?', 'Construção de uma rede de contatos profissionais.', 1, '2025-06-12 00:34:07'),
(4125, 1516, 'Exemplo de ferramenta de networking online?', 'LinkedIn, grupos de WhatsApp, fóruns especializados.', 1, '2025-06-12 00:34:07'),
(4126, 1516, 'Por que investir em networking?', 'Para oportunidades de trabalho, parcerias e atualização.', 1, '2025-06-12 00:34:07'),
(4127, 1516, 'Como se apresentar em redes?', 'Com perfil completo, foto profissional e descrição clara.', 1, '2025-06-12 00:34:07'),
(4128, 1516, 'Participar de grupos online ajuda?', 'Sim, amplia contatos e troca de informações.', 1, '2025-06-12 00:34:07'),
(4129, 1516, 'Como manter networking ativo?', 'Interagindo, compartilhando conteúdos e participando de eventos.', 1, '2025-06-12 00:34:07'),
(4130, 1516, 'Quais riscos do networking online?', 'Exposição a golpes, fake news e excesso de informações.', 1, '2025-06-12 00:34:07'),
(4131, 1516, 'Como usar networking para pesquisa?', 'Buscando parcerias e divulgação de estudos.', 1, '2025-06-12 00:34:07'),
(4132, 1516, 'O que evitar em redes profissionais?', 'Excesso de autopromoção e postagens irrelevantes.', 1, '2025-06-12 00:34:07'),
(4133, 1516, 'Networking influencia carreira?', 'Sim, pode abrir portas e acelerar crescimento profissional.', 1, '2025-06-12 00:34:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticias`
--

CREATE TABLE `noticias` (
  `id_noticia` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `slug_noticia` varchar(255) NOT NULL,
  `excerto` text DEFAULT NULL,
  `conteudo_completo_html` longtext DEFAULT NULL,
  `url_imagem_destaque` varchar(512) DEFAULT NULL,
  `categoria_noticia` varchar(100) DEFAULT NULL,
  `autor_noticia` varchar(150) DEFAULT NULL,
  `id_utilizador_autor` int(11) DEFAULT NULL,
  `data_publicacao` datetime NOT NULL,
  `data_criacao` timestamp NULL DEFAULT current_timestamp(),
  `data_ultima_modificacao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ativo` tinyint(1) DEFAULT 1,
  `visibilidade` enum('publico','restrito_assinantes','rascunho') DEFAULT 'publico',
  `tags` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `noticias`
--

INSERT INTO `noticias` (`id_noticia`, `titulo`, `slug_noticia`, `excerto`, `conteudo_completo_html`, `url_imagem_destaque`, `categoria_noticia`, `autor_noticia`, `id_utilizador_autor`, `data_publicacao`, `data_criacao`, `data_ultima_modificacao`, `ativo`, `visibilidade`, `tags`) VALUES
(1, 'Resumo Semanal | 28/05/2025', 'resumo-semanal-28052025', 'Atualizações e Destaques em Terapia Ocupacional – Semana de 28 de maio de 2025', '<section class=\"to-noticias p-4 rounded shadow bg-white\">\n  <h2 class=\"fw-bold text-primary mb-4\" style=\"font-size:2rem;\">📰 Atualizações Recentes – Terapia Ocupacional</h2>\n  \n  <article class=\"mb-4\">\n    <h3 class=\"h5 fw-bold text-dark mb-2\">1. Avanços Legislativos: Piso Salarial Nacional em Debate</h3>\n    <p>\n      O <strong>Projeto de Lei nº 988/2015</strong>, que estabelece o piso salarial nacional para fisioterapeutas e terapeutas ocupacionais, avançou na Comissão de Constituição e Justiça da Câmara dos Deputados. O relator, deputado Duarte Jr. (PSB-MA), apresentou parecer favorável, destacando a valorização da profissão e a importância do direito à vida. O projeto aguarda votação na CCJ.\n    </p>\n    <p class=\"mb-0\"><a href=\"https://www.coffito.gov.br/nsite/?cat=5\" target=\"_blank\" rel=\"noopener\" class=\"link-primary text-decoration-underline\">Saiba mais no COFFITO</a></p>\n  </article>\n  \n  <article class=\"mb-4\">\n    <h3 class=\"h5 fw-bold text-dark mb-2\">2. Eventos Acadêmicos Reforçam a Profissão</h3>\n    <ul class=\"mb-2\">\n      <li>\n        <strong>II Semana Acadêmica de Terapia Ocupacional da UNINGÁ:</strong> Realizada em maio, discutiu temas como atenção primária, reabilitação neuroinfantil e adaptações de baixo custo para inclusão. Contou com palestras, oficinas e rodas de conversa.\n        <br>\n        <a href=\"https://www.uninga.br/noticia/ii-semana-academica-de-terapia-ocupacional-discute-os-caminhos-e-avancos-da-profissao-na-saude-e-na-inclusao/44418/\" target=\"_blank\" class=\"link-secondary\">Confira o evento</a>\n      </li>\n      <li class=\"mt-2\">\n        <strong>V Semana de Terapia Ocupacional da UFES:</strong> Inscrições abertas para submissão de trabalhos. O evento acontecerá de 12 a 16 de agosto, promovendo troca de experiências entre profissionais e estudantes.\n        <br>\n        <a href=\"https://terapiaocupacional.ufes.br/\" target=\"_blank\" class=\"link-secondary\">Acesse a programação</a>\n      </li>\n    </ul>\n  </article>\n\n  <article class=\"mb-4\">\n    <h3 class=\"h5 fw-bold text-dark mb-2\">3. Inovações Tecnológicas na Prática Terapêutica</h3>\n    <ul class=\"mb-2\">\n      <li>\n        <strong>Telereabilitação com Realidade Virtual:</strong> Revisão recente destaca o uso de realidade virtual na telereabilitação pós-AVC, apontando para melhores resultados e maior engajamento dos pacientes.\n        <br>\n        <a href=\"https://arxiv.org/abs/2501.06899\" target=\"_blank\" class=\"link-secondary\">Leia a revisão completa</a>\n      </li>\n      <li class=\"mt-2\">\n        <strong>Aplicativo de Terapia de Reminiscência:</strong> O app \"Recuerdame\" foi desenvolvido para apoiar terapeutas em intervenções para idosos com demência, trazendo usabilidade e eficácia aprimoradas.\n        <br>\n        <a href=\"https://arxiv.org/abs/2410.13556\" target=\"_blank\" class=\"link-secondary\">Veja o artigo sobre o app</a>\n      </li>\n    </ul>\n  </article>\n\n  <div class=\"alert alert-info mt-4 mb-0\" style=\"font-size: 1rem;\">\n    Acompanhe as novidades, participe dos eventos e fique por dentro dos avanços em Terapia Ocupacional! 💙\n  </div>\n</section>', '', '', 'Equipe AudioTO', 1, '2025-05-29 05:36:00', '2025-05-29 05:36:48', '2025-06-05 22:16:47', 1, 'publico', ''),
(2, 'Resumo Semanal | 05/06/2025', 'resumo-semanal-05062025', 'Confira as principais atualizações nas áreas de Terapia Ocupacional, Fisioterapia, TEA e TDAH: eventos inclusivos, ações do Ministério Público, práticas terapêuticas recomendadas e inovações no cuidado com a saúde', '<section class=\"to-noticias p-4 rounded shadow bg-white\">\r\n  <h2 class=\"fw-bold text-primary mb-4\" style=\"font-size:2rem;\">📰 Atualizações Recentes – Terapia Ocupacional, Fisioterapia, TEA e TDAH</h2>\r\n  \r\n  <article class=\"mb-4\">\r\n    <h3 class=\"h5 fw-bold text-dark mb-2\">1. Espaço Clarisse Mota celebra dois anos de atuação</h3>\r\n    <p>\r\n      O Espaço Clarisse Mota comemorou dois anos de atividades, destacando a importância da terapia ocupacional no desenvolvimento de habilidades essenciais para indivíduos com TEA, promovendo maior autonomia e qualidade de vida.\r\n    </p>\r\n    <p class=\"mb-0\"><a href=\"https://www.maniadesaude.com.br/2025/05/30/espaco-clarisse-mota-celebra-dois-anos/\" target=\"_blank\" rel=\"noopener\" class=\"link-primary text-decoration-underline\">Leia mais</a></p>\r\n  </article>\r\n  \r\n  <article class=\"mb-4\">\r\n    <h3 class=\"h5 fw-bold text-dark mb-2\">2. Mães compartilham experiências no Ambulatório Encantar</h3>\r\n    <p>\r\n      No Ambulatório Encantar, em Curitiba, mães de crianças autistas participaram de oficinas terapêuticas, como culinária, fortalecendo vínculos e promovendo o desenvolvimento sensorial e social dos filhos.\r\n    </p>\r\n    <p class=\"mb-0\"><a href=\"https://www.curitiba.pr.gov.br/noticias/maes-de-criancas-autistas-atendidas-pelo-encantar-revelam-desafios-da-maternidade-e-o-apoio-que-recebem-da-prefeitura-de-curitiba/77287\" target=\"_blank\" rel=\"noopener\" class=\"link-primary text-decoration-underline\">Confira a matéria completa</a></p>\r\n  </article>\r\n  \r\n  <article class=\"mb-4\">\r\n    <h3 class=\"h5 fw-bold text-dark mb-2\">3. Práticas que auxiliam pessoas com TDAH</h3>\r\n    <p>\r\n      A APAE Curitiba destacou cinco práticas que podem melhorar o desempenho de pessoas com TDAH, incluindo a redução do consumo de açúcar, prática regular de exercícios físicos e estabelecimento de rotinas estruturadas.\r\n    </p>\r\n    <p class=\"mb-0\"><a href=\"https://apaecuritiba.org.br/conheca-5-praticas-que-melhoram-o-desempenho-da-pessoa-com-tdah/\" target=\"_blank\" rel=\"noopener\" class=\"link-primary text-decoration-underline\">Saiba mais</a></p>\r\n  </article>\r\n  \r\n  <article class=\"mb-4\">\r\n    <h3 class=\"h5 fw-bold text-dark mb-2\">4. Segunda Virada Autística promove inclusão em Mogi das Cruzes</h3>\r\n    <p>\r\n      O evento reuniu cerca de mil pessoas, oferecendo atividades culturais e palestras voltadas à conscientização sobre o autismo, fortalecendo a rede de apoio e promovendo a inclusão social.\r\n    </p>\r\n    <p class=\"mb-0\"><a href=\"https://portalnews.com.br/cidades/2025/04/segunda-virada-autistica-promove-conscientizacao-inclusao-e-rede-de-apoio\" target=\"_blank\" rel=\"noopener\" class=\"link-primary text-decoration-underline\">Leia mais sobre o evento</a></p>\r\n  </article>\r\n  \r\n  <article class=\"mb-4\">\r\n    <h3 class=\"h5 fw-bold text-dark mb-2\">5. MP do Ceará ajuíza ação por atendimento especializado em Itapipoca</h3>\r\n    <p>\r\n      O Ministério Público do Ceará moveu ação para que a Prefeitura de Itapipoca ofereça atendimento especializado na rede municipal de saúde para pessoas com TEA e TDAH, incluindo acompanhamento com diversos profissionais da saúde.\r\n    </p>\r\n    <p class=\"mb-0\"><a href=\"https://mpce.mp.br/2025/04/mp-do-ceara-ajuiza-acao-para-que-prefeitura-de-itapipoca-oferte-atendimento-de-saude-especializado-para-pessoas-com-tea-e-tdah/\" target=\"_blank\" rel=\"noopener\" class=\"link-primary text-decoration-underline\">Confira os detalhes</a></p>\r\n  </article>\r\n\r\n  <div class=\"alert alert-info mt-4 mb-0\" style=\"font-size: 1rem;\">\r\n    Fique atento às novidades e participe dos eventos para se manter atualizado nas áreas de Terapia Ocupacional, Fisioterapia, TEA e TDAH! 💙\r\n  </div>\r\n</section>', '', '', 'Equipe AudioTO', 1, '2025-06-05 22:11:00', '2025-06-05 22:13:13', '2025-06-05 22:13:13', 1, 'publico', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticia_votos`
--

CREATE TABLE `noticia_votos` (
  `id_voto` int(11) NOT NULL,
  `id_noticia` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `valor` enum('up','down') NOT NULL,
  `data_voto` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `noticia_votos`
--

INSERT INTO `noticia_votos` (`id_voto`, `id_noticia`, `id_utilizador`, `valor`, `data_voto`) VALUES
(3, 1, 26, 'up', '2025-06-05 21:34:20'),
(4, 2, 1, 'up', '2025-06-09 07:39:12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `oportunidades`
--

CREATE TABLE `oportunidades` (
  `id_oportunidade` int(11) NOT NULL,
  `tipo_oportunidade` enum('curso','webinar','artigo','vaga','evento','outro') NOT NULL,
  `titulo_oportunidade` varchar(255) NOT NULL,
  `descricao_oportunidade` text NOT NULL,
  `link_oportunidade` varchar(512) DEFAULT NULL,
  `data_publicacao` timestamp NULL DEFAULT current_timestamp(),
  `data_evento_inicio` datetime DEFAULT NULL,
  `data_evento_fim` datetime DEFAULT NULL,
  `local_evento` varchar(255) DEFAULT NULL,
  `fonte_oportunidade` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `total_curtidas` int(11) DEFAULT 0,
  `total_comentarios` int(11) DEFAULT 0,
  `ativo` tinyint(1) DEFAULT 1,
  `status` varchar(30) DEFAULT 'aberta',
  `destaque` tinyint(1) DEFAULT 0,
  `data_cadastro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `oportunidades`
--

INSERT INTO `oportunidades` (`id_oportunidade`, `tipo_oportunidade`, `titulo_oportunidade`, `descricao_oportunidade`, `link_oportunidade`, `data_publicacao`, `data_evento_inicio`, `data_evento_fim`, `local_evento`, `fonte_oportunidade`, `tags`, `total_curtidas`, `total_comentarios`, `ativo`, `status`, `destaque`, `data_cadastro`) VALUES
(14, 'webinar', 'Los cuatro pilares del bienestar ocupacional de los terapeutas ocupacionales', 'Webinar focado no autocuidado profissional e desenvolvimento do bem-estar desde a Terapia Ocupacional.', 'https://coptocam.org/webinar-los-cuatro-pilares-del-bienestar-ocupacional-de-los-terapeutas-ocupacionales/', '2025-04-16 00:00:00', '2025-04-23 18:00:00', '2025-04-23 19:30:00', 'Online', 'COPTOCAM', 'webinar,terapia ocupacional,autocuidado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:32:54'),
(15, 'vaga', 'Terapeuta Ocupacional - AACD', 'Atendimento infantil na unidade Ibirapuera. Salário entre R$ 3.500,00 e R$ 9.000,00.', 'https://br.linkedin.com/jobs/terapeuta-ocupacional-vagas', '2025-05-20 00:00:00', NULL, NULL, 'São Paulo, SP', 'LinkedIn', 'vaga,terapia ocupacional,AACD', 0, 0, 1, 'ativo', 0, '2025-05-21 05:32:54'),
(16, 'vaga', 'Terapeuta Ocupacional - Hospital Placi', 'Atendimento hospitalar em unidade especializada no Rio de Janeiro.', 'https://br.linkedin.com/jobs/terapeuta-ocupacional-hospitalar-vagas', '2025-05-20 00:00:00', NULL, NULL, 'Rio de Janeiro, RJ', 'LinkedIn', 'vaga,terapia ocupacional,hospital', 0, 0, 1, 'ativo', 0, '2025-05-21 05:32:54'),
(17, 'vaga', 'Terapeuta Ocupacional - UNIBES', 'Atendimento a pacientes em instituição filantrópica em São Paulo.', 'https://br.indeed.com/q-terapeuta-ocupacional-vagas.html', '2025-05-20 00:00:00', NULL, NULL, 'São Paulo, SP', 'Indeed', 'vaga,terapia ocupacional,UNIBES', 0, 0, 1, 'ativo', 0, '2025-05-21 05:32:54'),
(18, 'vaga', 'Terapeuta Ocupacional - Prefeitura de Umbuzeiro', 'Atuação em programas municipais de saúde. Salário até R$ 3.637,50.', 'https://www.pciconcursos.com.br/vagas/terapeuta-ocupacional', '2025-05-20 00:00:00', NULL, NULL, 'Umbuzeiro, PB', 'PCI Concursos', 'vaga,terapia ocupacional,concurso público', 0, 0, 1, 'ativo', 0, '2025-05-21 05:32:54'),
(19, 'curso', 'Terapia Ocupacional – Edune Cursos', 'Curso online gratuito com carga horária de 10 horas, abordando fundamentos e práticas da terapia ocupacional. Certificado opcional mediante taxa.', 'https://www.edunecursos.com.br/curso/terapia-ocupacional', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Edune Cursos', 'terapia ocupacional,curso,gratuito,certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:40:08'),
(20, 'curso', 'Terapia Ocupacional – Anglo Cursos', 'Curso gratuito com 80h sobre reabilitação de indivíduos com limitações físicas, sensoriais, cognitivas ou emocionais. Certificado gratuito em PDF.', 'https://anglocursos.com.br/cursos/de/educacao/terapia-ocupacional/gratis', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Anglo Cursos', 'terapia ocupacional,curso,gratuito,certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:40:08'),
(21, 'curso', 'Capacitação em ABA para TEA – Ministério da Saúde', 'Curso gratuito com carga horária de 40h destinado a profissionais de saúde, com certificado. Conteúdo voltado ao Transtorno do Espectro Autista (TEA).', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2022/abril/ministerio-da-saude-oferta-cursos-gratuitos-sobre-o-transtorno-do-espectro-autista', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Ministério da Saúde', 'TEA,autismo,curso,gratuito,certificado,ABA', 0, 0, 1, 'ativo', 0, '2025-05-21 05:40:08'),
(22, 'curso', 'TDAH na Prática – Instituto Neuro', 'Curso gratuito sobre estratégias práticas para o manejo do TDAH, com certificado.', 'https://www.institutoneuro.com.br/cursos/tdah-na-pratica-curso-gratuito/', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Instituto Neuro', 'TDAH,curso,gratuito,certificado,neurodesenvolvimento', 0, 0, 1, 'ativo', 0, '2025-05-21 05:40:08'),
(23, 'curso', 'Capacitação em TOD – Instituto Neuro', 'Curso gratuito sobre estratégias práticas para o manejo do Transtorno Opositivo Desafiador (TOD), com certificado.', 'https://www.institutoneuro.com.br/cursos/capacitacao-tod-transtorno-opositivo/', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Instituto Neuro', 'TOD,curso,gratuito,certificado,neurodesenvolvimento', 0, 0, 1, 'ativo', 0, '2025-05-21 05:40:08'),
(24, 'curso', 'Curso de Autismo – Anglo Cursos', 'Curso gratuito de 60h com princípios e práticas para educação de pessoas com TEA. Certificado disponível.', 'https://anglocursos.com.br/cursos/de/autismo/autismo/gratis', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Anglo Cursos', 'TEA,autismo,curso,gratuito,certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:40:08'),
(25, 'curso', 'Terapia Ocupacional – Edune Cursos', 'Curso online gratuito com carga horária de 10 horas, abordando fundamentos e práticas da terapia ocupacional. Certificado opcional mediante taxa.', 'https://www.edunecursos.com.br/curso/terapia-ocupacional', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Edune Cursos', 'terapia ocupacional,curso,gratuito,certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(26, 'curso', 'Terapia Ocupacional – Anglo Cursos', 'Curso gratuito com 80h sobre reabilitação de indivíduos com limitações físicas, sensoriais, cognitivas ou emocionais. Certificado gratuito em PDF.', 'https://anglocursos.com.br/cursos/de/educacao/terapia-ocupacional/gratis', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Anglo Cursos', 'terapia ocupacional,curso,gratuito,certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(27, 'curso', 'Terapia Ocupacional – Unova Cursos', 'Curso online gratuito com carga horária de 10 horas, focado na capacitação em terapia ocupacional. Certificado opcional mediante taxa.', 'https://www.unovacursos.com.br/curso/terapia-ocupacional', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Unova Cursos', 'terapia ocupacional,curso,gratuito,certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(28, 'curso', 'Terapia Ocupacional – EW Cursos', 'Curso gratuito abordando fundamentos da terapia ocupacional. Certificado opcional mediante taxa.', 'https://www.ewcursos.com/curso/terapia-ocupacional', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'EW Cursos', 'terapia ocupacional,curso,gratuito,certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(29, 'curso', 'Terapia Ocupacional – Abrafordes', 'Curso gratuito com carga horária de 70 horas, focado em ajudar pessoas a superar desafios físicos, emocionais, cognitivos ou sociais. Certificado disponível.', 'https://www.cursosabrafordes.com.br/curso/terapiaocupacional', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Abrafordes', 'terapia ocupacional,curso,gratuito,certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(30, 'curso', 'Terapia Ocupacional – Elevo Cursos', 'Curso gratuito com carga horária de 80 horas, abordando fundamentos e práticas da terapia ocupacional. Certificado disponível.', 'https://elevocursos.com.br/cursos/de/educacao/terapia-ocupacional/gratis', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Elevo Cursos', 'terapia ocupacional,curso,gratuito,certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(31, 'curso', 'Terapia Ocupacional – WR Educacional', 'Curso gratuito com carga horária de 80 horas, abordando fundamentos e práticas da terapia ocupacional. Certificado disponível.', 'https://www.wreducacional.com.br/lista-de-cursos/terapia-ocupacional', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'WR Educacional', 'terapia ocupacional,curso,gratuito,certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(32, 'curso', 'Terapia Ocupacional – UP Cursos Grátis', 'Curso gratuito de introdução à terapia ocupacional. Certificado disponível mediante taxa de emissão.', 'https://upcursosgratis.com.br/blog/curso-gratuito-de-introducao-a-terapia-ocupacional/', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'UP Cursos Grátis', 'terapia ocupacional,curso,gratuito,certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(33, 'curso', 'Capacitação em ABA para TEA – Ministério da Saúde', 'Curso gratuito com carga horária de 40h destinado a profissionais de saúde, com certificado. Conteúdo voltado ao Transtorno do Espectro Autista (TEA).', 'https://www.gov.br/saude/pt-br/assuntos/noticias/2022/abril/ministerio-da-saude-oferta-cursos-gratuitos-sobre-o-transtorno-do-espectro-autista', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Ministério da Saúde', 'TEA,autismo,curso,gratuito,certificado,ABA', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(34, 'curso', 'Curso de Autismo – Anglo Cursos', 'Curso gratuito de 60h com princípios e práticas para educação de pessoas com TEA. Certificado disponível.', 'https://anglocursos.com.br/cursos/de/autismo/autismo/gratis', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Anglo Cursos', 'TEA,autismo,curso,gratuito,certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(35, 'curso', 'TDAH na Prática – Instituto Neuro', 'Curso gratuito sobre estratégias práticas para o manejo do TDAH, com certificado.', 'https://www.institutoneuro.com.br/cursos/tdah-na-pratica-curso-gratuito/', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Instituto Neuro', 'TDAH,curso,gratuito,certificado,neurodesenvolvimento', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(36, 'curso', 'Capacitação em TOD – Instituto Neuro', 'Curso gratuito sobre estratégias práticas para o manejo do Transtorno Opositivo Desafiador (TOD), com certificado.', 'https://www.institutoneuro.com.br/cursos/capacitacao-tod-transtorno-opositivo/', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Instituto Neuro', 'TOD,curso,gratuito,certificado,neurodesenvolvimento', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(37, 'curso', 'Enfermagem na Neurologia – Edune Cursos', 'Curso online gratuito com carga horária de 40 horas, abordando cuidados e tratamentos neurológicos. Certificado opcional mediante taxa.', 'https://www.edunecursos.com.br/curso/enfermagem-na-neurologia', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Edune Cursos', 'neurologia, enfermagem, curso, gratuito, certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(38, 'curso', 'Neurociência do Desenvolvimento – PUCRS Online', 'Curso gratuito e 100% online, focando exclusivamente no conteúdo disponibilizado ao aluno.', 'https://online.pucrs.br/formacao-gratuita/neurociencia-do-desenvolvimento', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'PUCRS Online', 'neurociência, desenvolvimento, curso, gratuito, certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(39, 'curso', 'Psiquiatria Forense – Elevo Cursos', 'Curso online gratuito com certificado opcional, abordando a interface entre psiquiatria e direito penal.', 'https://elevocursos.com.br/cursos/de/direito/psiquiatria-forense/gratis', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Elevo Cursos', 'psiquiatria, forense, curso, gratuito, certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(40, 'curso', 'Saúde Mental e Atenção Psicossocial – Anglo Cursos', 'Curso online gratuito com certificado opcional, abordando práticas e estratégias de atenção psicossocial no contexto da saúde mental.', 'https://anglocursos.com.br/cursos/de/psicologia/saude-mental-e-atencao-psicossocial/gratis', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Anglo Cursos', 'saúde mental, psicossocial, curso, gratuito, certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(41, 'curso', 'Fisioterapia Básica – GYN Cursos', 'Curso online gratuito com certificado digital gratuito, abordando fundamentos da fisioterapia, incluindo ergonomia, neuroanatomia e fisioterapia respiratória.', 'https://gyncursos.com.br/course/curso-de-fisioterapia-basica/', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'GYN Cursos', 'fisioterapia, básico, curso, gratuito, certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(42, 'curso', 'Fisioterapia no Ambiente Ambulatorial – USCS', 'Curso online gratuito com carga horária de 40 horas, focado em pacientes com doenças cardiovasculares, metabólicas e pulmonares.', 'https://www.posuscs.com.br/conheca-3-cursos-online-gratuitos-de-fisioterapia-da-uscs/noticia/2901', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'USCS', 'fisioterapia, ambulatorial, curso, gratuito, certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:42:31'),
(43, 'curso', 'Análise do Comportamento – Elevo Cursos', 'Curso gratuito online com certificado, indicado para psicólogos, educadores, terapeutas e profissionais da saúde interessados em compreender os mecanismos do comportamento humano.', 'https://elevocursos.com.br/cursos/de/psicologia/analise-do-comportamento/gratis', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Elevo Cursos', 'análise do comportamento, psicologia, curso, gratuito, certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:44:59'),
(44, 'curso', 'Análise do Comportamento – Adequa Cursos', 'Curso online e gratuito com certificado, abordando conceitos como reforço, punição e extinção, aplicáveis em contextos terapêuticos, educacionais e sociais.', 'https://www.adequacursos.com.br/curso/psicologia/analise-do-comportamento', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Adequa Cursos', 'análise do comportamento, psicologia, curso, gratuito, certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:44:59'),
(45, 'curso', 'Autismo – Impulso06', 'Curso gratuito de 50 horas sobre técnicas de intervenção para Transtorno do Espectro Autista e Síndrome de Asperger, com certificado.', 'https://impulso06.com/cursos/autismo/', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Impulso06', 'autismo, TEA, curso, gratuito, certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:44:59'),
(46, 'curso', 'Avaliação Neuropsicológica do Adulto e Idoso – Portal IDEA', 'Curso gratuito online com certificado, abordando princípios básicos, processos cognitivos, testes neuropsicológicos e análise de dados clínicos.', 'https://portalidea.com.br/curso-gratuito-avaliacao-neuropsicologica-do-adulto-e-idoso', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Portal IDEA', 'avaliação neuropsicológica, neuropsicologia, curso, gratuito, certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:44:59'),
(47, 'curso', 'Fundamentos do Cuidado Paliativo – OPS', 'Curso virtual gratuito que fornece uma introdução básica à prática dos cuidados paliativos, abordando avaliação e manejo do sofrimento multidimensional.', 'https://campus.paho.org/es/curso/Cuidado-Paliativo', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'OPS', 'cuidados paliativos, saúde, curso, gratuito, certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:44:59'),
(48, 'curso', 'Educação em Saúde – Adequa Cursos', 'Curso gratuito online com certificado, abordando princípios da educação em saúde, estratégias de promoção da saúde e comunicação eficaz.', 'https://www.adequacursos.com.br/curso/saude-e-medicina/educacao-em-saude', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Adequa Cursos', 'educação em saúde, saúde pública, curso, gratuito, certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:44:59'),
(49, 'curso', 'Educação Especial – EducaWeb', 'Curso online gratuito com certificado, abordando os principais fundamentos da educação especial em quatro módulos.', 'https://cursoseducaweb.com.br/curso-de-educacao-especial', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'EducaWeb', 'educação especial, inclusão, curso, gratuito, certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:44:59'),
(50, 'curso', 'Fisioterapia em Pediatria – Cursa', 'Curso gratuito online com certificado, abordando fundamentos da fisioterapia pediátrica para iniciantes.', 'https://cursa.com.br/curso/fisioterapia-em-pediatria', '2025-05-21 00:00:00', NULL, NULL, 'Online', 'Cursa', 'fisioterapia pediátrica, fisioterapia, curso, gratuito, certificado', 0, 0, 1, 'ativo', 0, '2025-05-21 05:44:59'),
(51, '', 'Proibição do Ensino a Distância (EaD) na Enfermagem', 'O Ministério da Educação proibiu a oferta de cursos de Enfermagem na modalidade EaD. O Cofen celebrou a decisão, destacando a importância da formação prática presencial para garantir a qualidade dos profissionais de saúde.', 'https://www.cofen.gov.br/categoria/noticias/?utm_source=chatgpt.com', '2025-05-21 00:00:00', NULL, NULL, 'Nacional', 'Cofen', 'notícia, enfermagem, ensino a distância, cofen, presencial', 0, 0, 1, 'ativo', 0, '2025-05-21 05:48:05'),
(52, '', 'Semana da Enfermagem 2025', 'Durante a Semana da Enfermagem, o Cofen participou de sessões solenes e homenagens, ressaltando o papel essencial dos profissionais de enfermagem no cuidado à saúde.', 'https://www.cofen.gov.br/categoria/noticias/?utm_source=chatgpt.com', '2025-05-21 00:00:00', NULL, NULL, 'Nacional', 'Cofen', 'notícia, enfermagem, semana da enfermagem, homenagem', 0, 0, 1, 'ativo', 0, '2025-05-21 05:48:05'),
(53, '', 'CNS participa da 78ª Assembleia Mundial da Saúde', 'O CNS participou de debates sobre saúde global e mudanças climáticas, reforçando o compromisso com a participação social nas decisões de saúde pública.', 'https://www.gov.br/conselho-nacional-de-saude/pt-br/conselho-nacional-de-saude-participa-de-debates-sobre-saude-global-e-mudancas-climaticas-no-primeiro-dia-da-78a-assembleia-mundial-da-saude?utm_source=chatgpt.com', '2025-05-21 00:00:00', NULL, NULL, 'Nacional', 'CNS', 'notícia, saúde pública, CNS, assembleia mundial', 0, 0, 1, 'ativo', 0, '2025-05-21 05:48:05'),
(54, '', 'CNS destaca debate sobre Mortalidade Materna', 'Durante a 366ª Reunião Ordinária, o CNS destacou que nove em cada dez mortes maternas são evitáveis, enfatizando a necessidade de políticas públicas eficazes para reduzir esses índices.', 'https://www.gov.br/conselho-nacional-de-saude/pt-br/assuntos/noticias?utm_source=chatgpt.com', '2025-05-21 00:00:00', NULL, NULL, 'Nacional', 'CNS', 'notícia, mortalidade materna, políticas públicas, CNS', 0, 0, 1, 'ativo', 0, '2025-05-21 05:48:05'),
(55, '', 'Nota de Protesto contra o Novo Marco Regulatório da EaD (Farmácia)', 'O CFF manifestou indignação com o decreto que permite a continuidade de cursos de Farmácia na modalidade semipresencial, argumentando que a formação prática é essencial para a profissão.', 'https://site.cff.org.br/noticia/noticias-do-cff/20/05/2025/ead-nota-de-protesto-contra-o-novo-marco-regulatorio-da-educacao-a-distancia-em-saude?utm_source=chatgpt.com', '2025-05-21 00:00:00', NULL, NULL, 'Nacional', 'CFF', 'notícia, farmácia, EaD, ensino, CFF', 0, 0, 1, 'ativo', 0, '2025-05-21 05:48:05'),
(56, '', 'Suspensão da Prescrição de Medicamentos por Farmacêuticos', 'A Justiça Federal suspendeu a resolução do CFF que autorizava farmacêuticos a prescrever medicamentos, atendendo a um pedido do Conselho Federal de Medicina (CFM).', 'https://portal.cfm.org.br/noticias/vitoria-da-medicina-justica-suspende-prescricao-de-medicamentos-por-farmaceuticos/?utm_source=chatgpt.com', '2025-05-21 00:00:00', NULL, NULL, 'Nacional', 'CFF/CFM', 'notícia, farmácia, prescrição, justiça, CFF, CFM', 0, 0, 1, 'ativo', 0, '2025-05-21 05:48:05'),
(57, '', 'CFBM participa da XXVI Marcha a Brasília em Defesa dos Municípios', 'O CFBM participou do evento para discutir políticas públicas e fortalecer a atuação dos biomédicos nos municípios.', 'https://cfbm.gov.br/category/noticias/?utm_source=chatgpt.com', '2025-05-21 00:00:00', NULL, NULL, 'Nacional', 'CFBM', 'notícia, biomedicina, CFBM, municípios, políticas públicas', 0, 0, 1, 'ativo', 0, '2025-05-21 05:48:05'),
(58, '', 'CFBM lança formulário para estudo da realidade profissional', 'A Comissão da Valorização Biomédica do CFBM lançou um formulário para estudar a realidade profissional da categoria, visando melhorias nas condições de trabalho e formação.', 'https://crbm1.gov.br/category/noticias/?utm_source=chatgpt.com', '2025-05-21 00:00:00', NULL, NULL, 'Nacional', 'CFBM', 'notícia, biomedicina, valorização, CFBM, trabalho', 0, 0, 1, 'ativo', 0, '2025-05-21 05:48:05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `planos_assinatura`
--

CREATE TABLE `planos_assinatura` (
  `id_plano` int(11) NOT NULL,
  `nome_plano` varchar(100) NOT NULL,
  `descricao_plano` text DEFAULT NULL,
  `preco_mensal` decimal(10,2) DEFAULT NULL,
  `preco_anual` decimal(10,2) DEFAULT NULL,
  `funcionalidades` text DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `planos_assinatura`
--

INSERT INTO `planos_assinatura` (`id_plano`, `nome_plano`, `descricao_plano`, `preco_mensal`, `preco_anual`, `funcionalidades`, `ativo`) VALUES
(1, 'Explorador', 'Perfeito para começar a explorar.', 0.00, NULL, 'Acesso a 10 novos podcasts por mês;Download dos PDFs correspondentes;Acesso à seção de Oportunidades', 1),
(2, 'TO Pro', 'Tudo que você precisa para se destacar.', 34.90, NULL, 'Acesso ILIMITADO a todos os podcasts;Download de todos os PDFs;Acesso prioritário a novas Oportunidades;Conteúdo exclusivo para membros Pro', 1),
(3, 'TO Master', 'Melhor custo-benefício com desconto (equivale ao Pro).', NULL, 397.00, 'Todos os benefícios do Plano Pro;Pagamento único anual com desconto;Suporte prioritário', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `podcasts`
--

CREATE TABLE `podcasts` (
  `id_podcast` int(11) NOT NULL,
  `id_assunto` int(11) NOT NULL,
  `titulo_podcast` varchar(255) NOT NULL,
  `descricao_podcast` text DEFAULT NULL,
  `url_audio` varchar(512) NOT NULL,
  `duracao_total_segundos` int(11) DEFAULT 0,
  `link_material_apoio` varchar(512) DEFAULT NULL,
  `imagem_capa_url` varchar(512) DEFAULT NULL,
  `data_publicacao` datetime DEFAULT current_timestamp(),
  `visibilidade` enum('publico','restrito_assinantes') DEFAULT 'restrito_assinantes',
  `id_plano_minimo` int(11) DEFAULT NULL,
  `slug_podcast` varchar(255) NOT NULL,
  `total_curtidas` int(11) DEFAULT 0,
  `total_comentarios` int(11) DEFAULT 0,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `podcast_tags`
--

CREATE TABLE `podcast_tags` (
  `id_podcast_tag` int(11) NOT NULL,
  `id_podcast` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `posicao_reproducao_utilizador`
--

CREATE TABLE `posicao_reproducao_utilizador` (
  `id_posicao` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `id_podcast` int(11) NOT NULL,
  `posicao_segundos` float NOT NULL,
  `data_atualizacao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `preferencias_notificacao`
--

CREATE TABLE `preferencias_notificacao` (
  `id_preferencia` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `notificar_novos_podcasts` tinyint(1) DEFAULT 1,
  `notificar_novas_oportunidades` tinyint(1) DEFAULT 1,
  `notificar_noticias_plataforma` tinyint(1) DEFAULT 0,
  `data_ultima_modificacao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `quiz_perguntas`
--

CREATE TABLE `quiz_perguntas` (
  `id_pergunta` int(11) NOT NULL,
  `id_assunto` int(11) NOT NULL,
  `texto_pergunta` text NOT NULL,
  `explicacao` text DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `data_criacao` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `quiz_perguntas`
--

INSERT INTO `quiz_perguntas` (`id_pergunta`, `id_assunto`, `texto_pergunta`, `explicacao`, `ativo`, `data_criacao`) VALUES
(4, 1394, 'Na avaliação utilizando o COPM (Canadian Occupational Performance Measure), o que o terapeuta pede para o cliente pontuar em uma escala de 1 a 10?', 'O COPM é uma medida centrada no cliente que avalia a autopercepção sobre problemas de desempenho ocupacional. O cliente classifica a importância, o desempenho atual e a satisfação com esse desempenho.', 1, '2025-06-12 00:44:34'),
(5, 1412, 'Qual é um dos principais objetivos da aplicação de princípios ergonômicos no ambiente de trabalho?', 'A ergonomia busca otimizar as condições de trabalho para a saúde, segurança e eficiência, adaptando o ambiente, as ferramentas e as tarefas às capacidades e limitações do trabalhador.', 1, '2025-06-12 00:44:34'),
(6, 1431, 'Ao utilizar a brincadeira como recurso terapêutico no desenvolvimento infantil, o que o terapeuta ocupacional busca principalmente?', 'A brincadeira é a principal ocupação da criança e, terapeuticamente, é usada como uma ferramenta para desenvolver habilidades de forma natural, motivadora e significativa.', 1, '2025-06-12 00:44:34'),
(7, 1422, 'Na fase inicial da reabilitação pós-AVC, qual é uma das prioridades da Terapia Ocupacional?', 'O cuidado precoce inclui o posicionamento adequado para prevenir complicações, o manejo de edemas, a prevenção de deformidades e a estimulação motora e sensorial inicial para otimizar a neuroplasticidade.', 1, '2025-06-12 00:44:34'),
(8, 1367, 'Qual é o objetivo central da Terapia Ocupacional?', 'Promover autonomia, funcionalidade e participação nas atividades da vida diária.', 1, '2025-06-12 00:44:58'),
(9, 1368, 'O que caracteriza uma abordagem centrada no cliente?', 'Levar em conta as necessidades, valores e metas do cliente em todo o processo terapêutico.', 1, '2025-06-12 00:44:58'),
(10, 1369, 'Qual marco foi fundamental para o reconhecimento da TO?', 'A regulamentação da profissão e o surgimento das primeiras escolas de formação.', 1, '2025-06-12 00:44:58'),
(11, 1370, 'Onde a TO pode atuar?', 'A TO atua em saúde, educação, assistência social, reabilitação e outros contextos.', 1, '2025-06-12 00:44:58'),
(12, 1371, 'Qual tendência atual se destaca no mercado para TO?', 'O crescimento da atuação em contextos comunitários e saúde mental.', 1, '2025-06-12 00:44:58'),
(13, 1377, 'O que compõe o Sistema Nervoso Central (SNC)?', 'Encéfalo e medula espinhal.', 1, '2025-06-12 00:45:11'),
(14, 1378, 'Qual é a função das sinapses entre neurônios?', 'Permitir a comunicação entre neurônios por meio de sinais elétricos e químicos.', 1, '2025-06-12 00:45:11'),
(15, 1379, 'O que são vias sensoriais?', 'Caminhos percorridos pelos estímulos do ambiente até o SNC.', 1, '2025-06-12 00:45:11'),
(16, 1380, 'O que é plasticidade neural?', 'Capacidade do sistema nervoso de se reorganizar e formar novas conexões.', 1, '2025-06-12 00:45:11'),
(17, 1381, 'Como a neurociência auxilia a TO?', 'Ajuda a entender a base neural das funções e disfunções ocupacionais.', 1, '2025-06-12 00:45:11'),
(18, 1382, 'O que é o MOHO?', 'Um modelo que explica motivação, padrões de rotina e desempenho ocupacional.', 1, '2025-06-12 00:45:20'),
(19, 1383, 'O que diferencia o CMOP-E?', 'Dá ênfase à interação entre pessoa, ocupação e ambiente.', 1, '2025-06-12 00:45:20'),
(20, 1384, 'Qual o diferencial da abordagem biopsicossocial?', 'Considera fatores biológicos, psicológicos e sociais para entender saúde e doença.', 1, '2025-06-12 00:45:20'),
(21, 1385, 'O que propõe a Teoria da Ocupação Centrada no Desempenho?', 'O foco no desempenho efetivo das ocupações significativas para o cliente.', 1, '2025-06-12 00:45:20'),
(22, 1386, 'Por que integrar diferentes modelos na prática clínica?', 'Para ampliar a compreensão e a eficácia da intervenção terapêutica.', 1, '2025-06-12 00:45:20'),
(23, 1387, 'Por que o código de ética é fundamental para TO?', 'Orienta a conduta profissional com responsabilidade, respeito e compromisso social.', 1, '2025-06-12 00:45:48'),
(24, 1388, 'O que é o CREFITO?', 'Órgão responsável por fiscalizar e regulamentar a atuação do terapeuta ocupacional.', 1, '2025-06-12 00:45:48'),
(25, 1389, 'Qual direito o paciente tem durante o atendimento em TO?', 'Receber informações claras, consentir livremente e ter confidencialidade respeitada.', 1, '2025-06-12 00:45:48'),
(26, 1390, 'Por que o sigilo é fundamental nos registros clínicos?', 'Garante privacidade do paciente e segurança das informações.', 1, '2025-06-12 00:45:48'),
(27, 1391, 'O que é responsabilidade profissional em TO?', 'Assumir consequências pelos atos praticados no exercício da profissão.', 1, '2025-06-12 00:45:48'),
(1011, 1369, 'Quem é considerado um dos pioneiros da Terapia Ocupacional?', 'William Rush Dunton Jr. é amplamente reconhecido como um dos fundadores da Terapia Ocupacional, enfatizando o uso da ocupação para a recuperação.', 1, '2025-06-12 00:57:00'),
(1012, 1369, 'Qual foi a importância do movimento “Moral Treatment” para a Terapia Ocupacional?', 'Esse movimento trouxe a ideia de tratar pessoas com doenças mentais com dignidade e ocupação significativa, base para a TO.', 1, '2025-06-12 00:57:00'),
(1013, 1370, 'Qual população pode se beneficiar da Terapia Ocupacional?', 'Todas as faixas etárias e pessoas com diferentes condições, temporárias ou permanentes, podem se beneficiar da TO.', 1, '2025-06-12 00:57:00'),
(1014, 1370, 'Como a Terapia Ocupacional adapta o tratamento para diferentes populações?', 'Através da personalização das intervenções considerando cultura, idade, contexto e necessidades específicas.', 1, '2025-06-12 00:57:00'),
(1015, 1371, 'Qual setor tem apresentado maior demanda para terapeutas ocupacionais?', 'O setor público e saúde mental têm crescido muito na demanda por terapeutas ocupacionais.', 1, '2025-06-12 00:57:00'),
(1016, 1371, 'Quais são as perspectivas para a profissão de terapeuta ocupacional?', 'O crescimento da conscientização da importância da funcionalidade e reabilitação amplia as oportunidades profissionais.', 1, '2025-06-12 00:57:00'),
(1017, 1372, 'Qual o principal componente do sistema musculoesquelético?', 'O sistema é composto principalmente por ossos, músculos, tendões e ligamentos que permitem movimento e suporte.', 1, '2025-06-12 00:57:00'),
(1018, 1372, 'Explique a função dos tendões no sistema musculoesquelético.', 'Tendões conectam músculos aos ossos e transmitem força para produzir movimento.', 1, '2025-06-12 00:57:00'),
(1019, 1373, 'Qual tipo de articulação permite maior amplitude de movimento?', 'As articulações do tipo sinovial, como o ombro e quadril, permitem ampla mobilidade.', 1, '2025-06-12 00:57:00'),
(1020, 1373, 'Descreva o movimento de flexão em uma articulação.', 'Flexão é o movimento que diminui o ângulo entre dois ossos na articulação.', 1, '2025-06-12 00:57:00'),
(1021, 1374, 'Quantas vértebras compõem a coluna vertebral humana?', 'A coluna vertebral é composta por 33 vértebras, distribuídas em cervical, torácica, lombar, sacral e coccígea.', 1, '2025-06-12 00:57:00'),
(1022, 1374, 'Qual é a função principal das vértebras cervicais?', 'Suportar a cabeça e permitir sua ampla mobilidade.', 1, '2025-06-12 00:57:00'),
(1023, 1377, 'Qual a principal função do sistema nervoso central?', 'Controlar e coordenar as funções corporais e processar informações sensoriais.', 1, '2025-06-12 00:57:00'),
(1024, 1377, 'Quais são as principais estruturas do sistema nervoso central?', 'Cérebro e medula espinhal.', 1, '2025-06-12 00:57:00'),
(1025, 1378, 'O que é uma sinapse?', 'Ponto de comunicação entre dois neurônios onde ocorre a transmissão do impulso nervoso.', 1, '2025-06-12 00:57:00'),
(1026, 1378, 'Qual é a função do neurônio?', 'Transmitir impulsos elétricos e químicos para comunicação no sistema nervoso.', 1, '2025-06-12 00:57:00'),
(1027, 1380, 'O que é plasticidade neural?', 'A capacidade do sistema nervoso de modificar sua estrutura e função em resposta a experiências e lesões.', 1, '2025-06-12 00:57:00'),
(1028, 1380, 'Como a plasticidade neural influencia a reabilitação?', 'Permite que o cérebro reorganize funções e recupere habilidades após lesões.', 1, '2025-06-12 00:57:00'),
(1029, 1383, 'Qual é a principal função do sistema digestório?', 'O sistema digestório tem a função de quebrar os alimentos e absorver os nutrientes essenciais para o corpo.', 1, '2025-06-12 00:58:37'),
(1030, 1383, 'Explique o papel do estômago na digestão.', 'O estômago atua na digestão química dos alimentos, produzindo ácido e enzimas que quebram as proteínas.', 1, '2025-06-12 00:58:37'),
(1031, 1387, 'Qual conceito psicológico é fundamental para a abordagem terapêutica em TO?', 'A motivação é fundamental, pois influencia a participação e engajamento do paciente.', 1, '2025-06-12 00:58:37'),
(1032, 1387, 'Como a psicologia contribui para o sucesso da terapia ocupacional?', 'A psicologia ajuda a entender o comportamento e a adaptar intervenções para maior adesão.', 1, '2025-06-12 00:58:37'),
(1033, 1390, 'Qual é o papel da Terapia Ocupacional na saúde pública?', 'Contribuir para a promoção da saúde, prevenção de doenças e reabilitação em populações.', 1, '2025-06-12 00:58:37'),
(1034, 1390, 'Como a TO pode ajudar na prevenção de incapacidades?', 'Através da intervenção precoce e educação em saúde para evitar complicações.', 1, '2025-06-12 00:58:37'),
(1035, 1395, 'O que é neurodesenvolvimento?', 'O processo pelo qual o sistema nervoso cresce e se organiza durante a infância.', 1, '2025-06-12 00:58:37'),
(1036, 1395, 'Por que o neurodesenvolvimento é importante para a TO?', 'Porque permite identificar e intervir precocemente em atrasos e dificuldades.', 1, '2025-06-12 00:58:37'),
(1037, 1401, 'Qual característica principal do Transtorno do Espectro Autista (TEA)?', 'Dificuldades na comunicação social e comportamentos restritos e repetitivos.', 1, '2025-06-12 00:58:37'),
(1038, 1401, 'Como a terapia ocupacional pode ajudar crianças com TEA?', 'Através de intervenções para melhorar habilidades sociais, comunicação e independência.', 1, '2025-06-12 00:58:37'),
(1039, 1405, 'O que é acessibilidade?', 'Acessibilidade é a eliminação de barreiras para que pessoas com deficiências possam usar espaços e serviços.', 1, '2025-06-12 00:58:37'),
(1040, 1405, 'Por que a mobilidade é importante na reabilitação?', 'Porque permite maior independência e participação social do indivíduo.', 1, '2025-06-12 00:58:37'),
(1041, 1410, 'Como a TO pode ajudar pacientes com doenças crônicas?', 'Apoiando a adaptação e manutenção da funcionalidade nas atividades diárias.', 1, '2025-06-12 00:58:37'),
(1042, 1410, 'Qual é o desafio principal na reabilitação de doenças crônicas?', 'Manter a independência e qualidade de vida apesar das limitações.', 1, '2025-06-12 00:58:37'),
(1043, 1413, 'Qual a função das terapias complementares na TO?', 'Complementar tratamentos tradicionais para melhorar o bem-estar e qualidade de vida.', 1, '2025-06-12 00:58:37'),
(1044, 1413, 'Dê um exemplo de terapia complementar usada na TO.', 'Exemplos incluem aromaterapia, musicoterapia e acupuntura.', 1, '2025-06-12 00:58:37'),
(1045, 1416, 'O que é avaliação funcional na TO?', 'Processo de identificar habilidades, limitações e necessidades para planejar intervenção adequada.', 1, '2025-06-12 00:58:37'),
(1046, 1416, 'Por que a avaliação funcional é importante?', 'Permite planejar intervenções personalizadas e eficazes.', 1, '2025-06-12 00:58:37'),
(1047, 1420, 'Como a tecnologia pode apoiar a TO?', 'Por meio de dispositivos assistivos que promovem autonomia e funcionalidade.', 1, '2025-06-12 00:58:37'),
(1049, 1424, 'Qual é um dos principais objetivos da Terapia Ocupacional na saúde do idoso?', 'Promover a manutenção da autonomia e qualidade de vida frente às limitações próprias do envelhecimento.', 1, '2025-06-12 00:59:42'),
(1050, 1424, 'Como a TO pode prevenir quedas em idosos?', 'Através de intervenções que melhoram equilíbrio, força muscular e adaptações ambientais.', 1, '2025-06-12 00:59:42'),
(1051, 1428, 'Qual é o foco da TO na reabilitação de pacientes com transtornos mentais?', 'Promover habilidades para a vida diária e reintegração social.', 1, '2025-06-12 00:59:42'),
(1052, 1428, 'Como a TO contribui para a saúde mental?', 'Apoiando a autonomia e qualidade de vida por meio de atividades significativas.', 1, '2025-06-12 00:59:42'),
(1053, 1434, 'O que caracteriza o desenvolvimento motor?', 'A aquisição de habilidades para controlar movimentos do corpo.', 1, '2025-06-12 00:59:42'),
(1054, 1434, 'Por que o desenvolvimento motor é importante na TO?', 'Porque impacta diretamente na autonomia e realização das atividades diárias.', 1, '2025-06-12 00:59:42'),
(1055, 1437, 'Qual é o papel da TO na educação?', 'Promover o desenvolvimento e participação de crianças com necessidades especiais no ambiente escolar.', 1, '2025-06-12 00:59:42'),
(1056, 1437, 'Como a TO facilita a inclusão escolar?', 'Ajustando atividades e ambientes para que todos possam participar plenamente.', 1, '2025-06-12 00:59:42'),
(1057, 1440, 'Como a TO aborda a dor crônica?', 'Através de técnicas que promovem o manejo da dor e melhoria da funcionalidade.', 1, '2025-06-12 00:59:42'),
(1058, 1440, 'Por que é importante tratar a dor crônica na TO?', 'Porque a dor afeta a qualidade de vida e limita as atividades diárias.', 1, '2025-06-12 00:59:42'),
(1059, 1444, 'O que caracteriza uma deficiência física?', 'Limitações motoras que afetam a movimentação ou funções corporais.', 1, '2025-06-12 00:59:42'),
(1060, 1444, 'Como a TO atua com deficiências físicas?', 'Ajudando a desenvolver habilidades e adaptar o ambiente para maior independência.', 1, '2025-06-12 00:59:42'),
(1061, 1447, 'O que é tecnologia assistiva?', 'Conjunto de recursos que auxiliam pessoas com deficiência a realizar atividades.', 1, '2025-06-12 00:59:42'),
(1062, 1447, 'Dê um exemplo de tecnologia assistiva.', 'Cadeiras de rodas, próteses, softwares de leitura de tela.', 1, '2025-06-12 00:59:42'),
(1063, 1450, 'Qual o foco da saúde ocupacional?', 'Prevenir doenças e promover a saúde no ambiente de trabalho.', 1, '2025-06-12 00:59:42'),
(1064, 1450, 'Como a TO contribui para a saúde ocupacional?', 'Adaptando tarefas e ambientes para segurança e bem-estar.', 1, '2025-06-12 00:59:42'),
(1065, 1454, 'Qual o objetivo principal da reabilitação física?', 'Restaurar a funcionalidade e independência do paciente.', 1, '2025-06-12 00:59:42'),
(1066, 1454, 'Explique como a TO atua na reabilitação física.', 'Através de intervenções que recuperam habilidades para atividades diárias.', 1, '2025-06-12 00:59:42'),
(1067, 1457, 'O que é a avaliação em Terapia Ocupacional?', 'Processo de coleta de informações para planejar intervenções adequadas.', 1, '2025-06-12 00:59:42'),
(1068, 1457, 'Por que a avaliação é fundamental?', 'Permite um tratamento focado e eficaz, baseado nas reais necessidades.', 1, '2025-06-12 00:59:42'),
(1069, 1460, 'Qual o papel da Terapia Ocupacional na reabilitação cardíaca?', 'Auxiliar na recuperação da capacidade funcional e na adaptação das atividades diárias após eventos cardíacos.', 1, '2025-06-12 01:00:38'),
(1070, 1460, 'Como a TO ajuda pacientes após infarto?', 'Por meio de intervenções que promovem independência e segurança nas atividades cotidianas.', 1, '2025-06-12 01:00:38'),
(1071, 1463, 'Qual o foco da TO na reabilitação pulmonar?', 'Melhorar a capacidade funcional e a qualidade de vida em doenças respiratórias crônicas.', 1, '2025-06-12 01:00:38'),
(1072, 1463, 'Como a TO atua em pacientes com DPOC?', 'Ensinando técnicas para conservar energia e adaptar atividades.', 1, '2025-06-12 01:00:38'),
(1073, 1466, 'Qual o objetivo da TO na oncologia?', 'Melhorar qualidade de vida e funcionalidade durante e após o tratamento.', 1, '2025-06-12 01:00:38'),
(1074, 1466, 'Como a TO auxilia pacientes oncológicos?', 'Promovendo adaptações para manter independência e conforto.', 1, '2025-06-12 01:00:38'),
(1075, 1469, 'Qual a importância da TO na reabilitação neurológica?', 'Estimular funções motoras e cognitivas para reinserção social.', 1, '2025-06-12 01:00:38'),
(1076, 1469, 'Como a TO contribui na recuperação pós-AVC?', 'Promovendo o uso funcional do membro afetado e autonomia.', 1, '2025-06-12 01:00:38'),
(1077, 1472, 'Qual o foco da TO na reabilitação infantil?', 'Desenvolver habilidades motoras, cognitivas e sociais.', 1, '2025-06-12 01:00:38'),
(1078, 1472, 'Por que a intervenção precoce é importante na reabilitação infantil?', 'Maximiza o potencial de desenvolvimento e minimiza déficits futuros.', 1, '2025-06-12 01:00:38'),
(1079, 1475, 'Qual o objetivo da TO na reabilitação geriátrica?', 'Promover independência e qualidade de vida no envelhecimento.', 1, '2025-06-12 01:00:38'),
(1080, 1475, 'Como a TO auxilia idosos em reabilitação?', 'Adaptando atividades e ambientes para manter funcionalidade.', 1, '2025-06-12 01:00:38'),
(1081, 1478, 'Qual a importância da TO na saúde da mulher?', 'Trabalhar aspectos físicos, emocionais e sociais para promoção da saúde.', 1, '2025-06-12 01:00:38'),
(1082, 1478, 'Como a TO atua na saúde da mulher?', 'Promovendo autonomia e qualidade de vida em diferentes fases da vida.', 1, '2025-06-12 01:00:38'),
(1083, 1481, 'Qual o papel da TO na saúde do trabalhador?', 'Promover segurança, prevenção de lesões e bem-estar no trabalho.', 1, '2025-06-12 01:00:38'),
(1084, 1481, 'Como a TO contribui para a saúde do trabalhador?', 'Adaptando tarefas e ambientes para minimizar riscos.', 1, '2025-06-12 01:00:38'),
(1085, 1484, 'Quais são os principais transtornos do desenvolvimento atendidos pela TO?', 'Autismo, TDAH, paralisia cerebral e atrasos globais.', 1, '2025-06-12 01:00:38'),
(2001, 1469, 'Qual a principal meta da terapia ocupacional na reabilitação neurológica?', 'A principal meta é promover autonomia funcional, participação social e recuperação de habilidades perdidas.', 1, '2025-06-12 01:03:10'),
(2002, 1469, 'Qual recurso pode ser usado na reabilitação motora após AVC?', 'Recursos como treino de atividades da vida diária, adaptação de utensílios e estimulação motora são essenciais.', 1, '2025-06-12 01:03:10'),
(2003, 1469, 'O que é neuroplasticidade?', 'É a capacidade do cérebro de se reorganizar após lesão, essencial para a recuperação neurológica.', 1, '2025-06-12 01:03:10'),
(2004, 1469, 'Qual técnica pode ser usada para facilitar o uso do membro superior afetado?', 'Técnicas de restrição do membro saudável e treino intensivo do membro afetado aumentam o uso funcional.', 1, '2025-06-12 01:03:10'),
(2005, 1469, 'Por que a adaptação do ambiente é importante na reabilitação neurológica?', 'Adaptações ambientais facilitam a independência e segurança do paciente.', 1, '2025-06-12 01:03:10'),
(2006, 1469, 'Como a estimulação cognitiva pode ser realizada na TO neurológica?', 'Através de jogos, tarefas de memória e resolução de problemas, melhorando funções cognitivas.', 1, '2025-06-12 01:03:10'),
(2007, 1469, 'Qual é um objetivo funcional da reabilitação após lesão cerebral?', 'O objetivo é possibilitar retorno às atividades cotidianas com máxima independência.', 1, '2025-06-12 01:03:10'),
(2008, 1469, 'Como a abordagem interdisciplinar beneficia o paciente neurológico?', 'Favorece integração de diferentes áreas do cuidado, potencializando resultados.', 1, '2025-06-12 01:03:10'),
(2009, 1469, 'Qual estratégia pode ser usada para facilitar a comunicação em pacientes afásicos?', 'Uso de comunicação alternativa, como pranchas de figuras ou aplicativos.', 1, '2025-06-12 01:03:10'),
(2010, 1469, 'O que é treino de atividades da vida diária (AVD) na reabilitação neurológica?', 'É o treino funcional para realizar tarefas cotidianas como higiene, alimentação e vestir-se.', 1, '2025-06-12 01:03:10'),
(4001, 1512, 'Qual o maior congresso internacional de Terapia Ocupacional?', 'O Congresso Mundial de Terapia Ocupacional (WFOT Congress) reúne profissionais do mundo todo e pauta tendências globais.', 1, '2025-06-12 01:29:16'),
(4002, 1512, 'Com que frequência ocorre o WFOT Congress?', 'O WFOT Congress acontece a cada 4 anos, promovendo intercâmbio científico internacional.', 1, '2025-06-12 01:29:16'),
(4003, 1512, 'O Congresso Brasileiro de Terapia Ocupacional (CBTO) é organizado por qual entidade?', 'A Associação Brasileira de Terapia Ocupacional (ABRATO) é responsável pelo CBTO.', 1, '2025-06-12 01:29:16'),
(4004, 1512, 'Qual é um dos principais objetivos dos congressos em OT?', 'Congressos buscam disseminar conhecimento, promover networking e atualização científica.', 1, '2025-06-12 01:29:16'),
(4005, 1512, 'Quais são formas comuns de participação em congressos?', 'Participantes podem apresentar trabalhos, assistir palestras, participar de workshops e mesas-redondas.', 1, '2025-06-12 01:29:16'),
(4006, 1512, 'Qual a vantagem de apresentar trabalhos em congressos?', 'Apresentar trabalhos amplia visibilidade acadêmica e oportunidades de colaboração.', 1, '2025-06-12 01:29:16'),
(4007, 1512, 'Qual perfil de profissional mais se beneficia de congressos?', 'Tanto iniciantes quanto experientes se beneficiam do intercâmbio de ideias e tendências.', 1, '2025-06-12 01:29:16'),
(4008, 1512, 'O que geralmente é necessário para submeter um trabalho a um congresso?', 'Normalmente é exigido resumo científico com fundamentação teórica e metodologia clara.', 1, '2025-06-12 01:29:16'),
(4009, 1512, 'Qual plataforma frequentemente divulga grandes eventos internacionais de OT?', 'A própria WFOT (World Federation of Occupational Therapists) divulga eventos no site oficial.', 1, '2025-06-12 01:29:16'),
(4010, 1512, 'Qual benefício institucional participar de congressos pode trazer?', 'Favorece reconhecimento institucional, atualiza práticas e fortalece currículos acadêmicos.', 1, '2025-06-12 01:29:16'),
(4011, 1513, 'Qual o principal papel de uma sociedade científica em Terapia Ocupacional?', 'Sociedades científicas promovem pesquisa, atualização profissional e defesa dos interesses da categoria.', 1, '2025-06-12 01:30:11'),
(4012, 1513, 'A World Federation of Occupational Therapists (WFOT) é exemplo de:', 'A WFOT é a principal sociedade científica global de Terapia Ocupacional.', 1, '2025-06-12 01:30:11'),
(4013, 1513, 'Qual a importância de ser membro de uma sociedade científica?', 'Associados têm acesso a conteúdos exclusivos, descontos em eventos e atualização profissional.', 1, '2025-06-12 01:30:11'),
(4014, 1513, 'No Brasil, qual entidade representa nacionalmente a Terapia Ocupacional?', 'A Associação Brasileira de Terapia Ocupacional (ABRATO) representa os profissionais nacionalmente.', 1, '2025-06-12 01:30:11'),
(4015, 1513, 'O que caracteriza uma sociedade científica?', 'Trata-se de organização sem fins lucrativos focada em pesquisa, ensino e aprimoramento técnico.', 1, '2025-06-12 01:30:11'),
(4016, 1513, 'Como sociedades científicas contribuem para o avanço da área?', 'Apoiam pesquisas, publicam periódicos e promovem intercâmbio científico.', 1, '2025-06-12 01:30:11'),
(4017, 1513, 'Quais benefícios são comuns aos associados de sociedades científicas?', 'Benefícios incluem acesso a cursos, revistas, eventos e oportunidades de colaboração.', 1, '2025-06-12 01:30:11'),
(4018, 1513, 'Qual é uma sociedade científica latino-americana relevante para OT?', 'A Asociación Latinoamericana de Terapia Ocupacional (ALATO) integra profissionais do continente.', 1, '2025-06-12 01:30:11'),
(4019, 1513, 'Qual ação fortalece a atuação de sociedades científicas?', 'Promoção de eventos, participação em políticas públicas e divulgação de pesquisas fortalecem as sociedades.', 1, '2025-06-12 01:30:11'),
(4020, 1513, 'Como as sociedades científicas impactam a formação de novos profissionais?', 'Oferecem estágios, mentorias, cursos e oportunidades de networking para estudantes.', 1, '2025-06-12 01:30:11'),
(4021, 1514, 'Qual o principal objetivo dos grupos de estudo em OT?', 'Grupos de estudo visam aprofundar conhecimentos, trocar experiências e estimular o raciocínio crítico.', 1, '2025-06-12 01:31:10'),
(4022, 1514, 'Quais ferramentas digitais são comuns em fóruns de discussão acadêmica?', 'Plataformas como Moodle, Google Groups e fóruns online específicos facilitam o debate e o aprendizado coletivo.', 1, '2025-06-12 01:31:10'),
(4023, 1514, 'Qual a principal vantagem dos fóruns online para terapeutas ocupacionais?', 'Fóruns online permitem compartilhamento de experiências, soluções práticas e construção coletiva do saber.', 1, '2025-06-12 01:31:10'),
(4024, 1514, 'Como os grupos de estudo contribuem para o desenvolvimento profissional?', 'Eles possibilitam atualização constante e contato com novas evidências científicas.', 1, '2025-06-12 01:31:10'),
(4025, 1514, 'O que caracteriza um fórum científico de qualidade?', 'Discussão baseada em evidências, respeito e troca construtiva de ideias caracterizam bons fóruns.', 1, '2025-06-12 01:31:10'),
(4026, 1514, 'Qual é uma atitude fundamental em grupos de estudo?', 'A escuta ativa permite compreensão e respeito às diferentes opiniões, enriquecendo o aprendizado.', 1, '2025-06-12 01:31:10'),
(4027, 1514, 'Como a participação em grupos de estudo pode impactar o networking?', 'Participar de grupos amplia contatos profissionais, favorecendo parcerias e oportunidades.', 1, '2025-06-12 01:31:10'),
(4028, 1514, 'Como garantir a qualidade da discussão em fóruns acadêmicos?', 'A moderação adequada e regras claras contribuem para um ambiente de respeito e troca produtiva.', 1, '2025-06-12 01:31:10'),
(4029, 1514, 'Qual é um exemplo de plataforma onde ocorrem fóruns científicos?', 'Plataformas como ResearchGate e fóruns acadêmicos universitários são exemplos.', 1, '2025-06-12 01:31:10'),
(4030, 1514, 'Como grupos de estudo podem contribuir para publicações científicas?', 'Discussões coletivas estimulam ideias, colaboram em pesquisas e favorecem coautorias.', 1, '2025-06-12 01:31:10'),
(4031, 1515, 'Qual é o objetivo principal de publicar notícias em blogs de Terapia Ocupacional?', 'O objetivo é disseminar conhecimento, promover discussões e divulgar novidades e experiências na área.', 1, '2025-06-12 01:32:19'),
(4032, 1515, 'Quais elementos são essenciais em um post de blog científico?', 'Clareza, fundamentação teórica, referências e linguagem acessível são fundamentais para credibilidade.', 1, '2025-06-12 01:32:19'),
(4033, 1515, 'Como garantir a credibilidade de uma notícia publicada online?', 'A credibilidade vem do uso de fontes confiáveis, checagem de dados e revisão por pares.', 1, '2025-06-12 01:32:19'),
(4034, 1515, 'Por que usar linguagem acessível em blogs de saúde?', 'Linguagem acessível amplia o alcance e possibilita que mais pessoas compreendam o conteúdo.', 1, '2025-06-12 01:32:19'),
(4035, 1515, 'Qual a importância de atualizar regularmente um blog?', 'A atualização regular mantém o público informado sobre novidades e reforça a relevância do canal.', 1, '2025-06-12 01:32:19'),
(4036, 1515, 'Que cuidados éticos são necessários ao publicar notícias e posts em blogs?', 'É fundamental respeitar privacidade, evitar plágio e citar fontes corretamente.', 1, '2025-06-12 01:32:19'),
(4037, 1515, 'Como as imagens devem ser utilizadas em posts de saúde?', 'Imagens devem ser de fontes autorizadas, ilustrar o tema e não ferir a privacidade.', 1, '2025-06-12 01:32:19'),
(4038, 1515, 'O que significa SEO em blogs?', 'SEO (Search Engine Optimization) são técnicas para melhorar o ranqueamento dos posts nos mecanismos de busca.', 1, '2025-06-12 01:32:19'),
(4039, 1515, 'Como lidar com comentários em blogs de saúde?', 'Comentários devem ser moderados para garantir respeito e coibir informações incorretas.', 1, '2025-06-12 01:32:19'),
(4040, 1515, 'Por que citar referências em posts científicos?', 'Referências demonstram credibilidade, permitem conferência e agregam valor ao conteúdo.', 1, '2025-06-12 01:32:19'),
(4041, 1516, 'Qual recurso do LinkedIn é mais indicado para conectar-se estrategicamente com líderes internacionais de OT?', 'O LinkedIn permite busca avançada por cargos, filtrar por localização e atuação, além do uso de mensagens personalizadas em grupos e eventos globais.', 1, '2025-06-12 01:33:48'),
(4042, 1516, 'Em plataformas como ResearchGate, qual métrica é fundamental para estabelecer credibilidade científica?', 'O RG Score do ResearchGate reflete reputação baseada em publicações, citações e engajamento em discussões.', 1, '2025-06-12 01:33:48'),
(4043, 1516, 'Qual técnica de networking online é mais eficaz para internacionalização acadêmica?', 'Participação ativa em webinários globais, publicação em fóruns multilíngues e colaboração em projetos internacionais são estratégias avançadas.', 1, '2025-06-12 01:33:48'),
(4044, 1516, 'Sobre plataformas de networking científico, qual oferece maior integração com periódicos e editoras?', 'O ORCID oferece integração automática com editoras, periódicos e bancos de dados internacionais de pesquisa.', 1, '2025-06-12 01:33:48'),
(4045, 1516, 'Como os algoritmos das redes profissionais afetam a visibilidade de publicações?', 'Os algoritmos priorizam relevância, engajamento rápido, compartilhamentos e uso de palavras-chave estratégicas para ampliar o alcance.', 1, '2025-06-12 01:33:48'),
(4046, 1516, 'Em relação à privacidade, qual é a boa prática ao participar de grupos online de OT?', 'Evitar compartilhar dados pessoais sensíveis, verificar a política de privacidade e limitar acesso a informações restritas são essenciais.', 1, '2025-06-12 01:33:48'),
(4047, 1516, 'No contexto de networking digital, o que é um “cluster” de pesquisa?', 'Clusters são grupos organizados de pesquisadores interligados por temas de estudo, muitas vezes interinstitucionais e internacionais.', 1, '2025-06-12 01:33:48'),
(4048, 1516, 'Qual ferramenta permite analisar o impacto do networking online em métricas acadêmicas?', 'O Altmetric analisa menções online, redes sociais, blogs, periódicos e citações para avaliar impacto acadêmico além das métricas tradicionais.', 1, '2025-06-12 01:33:48'),
(4049, 1516, 'Qual estratégia pode ajudar a evitar “echo chambers” no networking online?', 'Buscar fontes diversas, participar de grupos internacionais e dialogar com perspectivas diferentes quebra bolhas informacionais.', 1, '2025-06-12 01:33:48'),
(4050, 1516, 'No contexto de eventos virtuais, qual técnica amplia networking efetivo?', 'Fazer perguntas relevantes em lives, interagir em salas paralelas e manter contato pós-evento são estratégias para networking ativo.', 1, '2025-06-12 01:33:48'),
(4051, 1507, 'No contexto de startups em saúde, o que diferencia o modelo de negócio B2B do B2C?', 'B2B vende soluções para outras empresas ou instituições, enquanto B2C foca diretamente no consumidor final.', 1, '2025-06-12 01:35:08'),
(4052, 1507, 'Qual é uma das principais barreiras regulatórias para startups de tecnologia em saúde no Brasil?', 'A ANVISA regula produtos e serviços que impactam diretamente a saúde e pode exigir processos de certificação e registros demorados.', 1, '2025-06-12 01:35:08'),
(4053, 1507, 'O que caracteriza o termo “healthtech”?', 'Healthtech refere-se a startups que inovam em saúde usando tecnologia avançada, como IA, dispositivos médicos ou plataformas digitais.', 1, '2025-06-12 01:35:08'),
(4054, 1507, 'No desenvolvimento de uma healthtech, qual metodologia é utilizada para testar hipóteses rapidamente?', 'A metodologia Lean Startup propõe ciclos rápidos de teste de hipóteses (build-measure-learn) com o mínimo produto viável (MVP).', 1, '2025-06-12 01:35:08'),
(4055, 1507, 'Como startups podem acessar recursos para escalar rapidamente?', 'Programas de aceleração, fundos de venture capital e editais de inovação são estratégias para captar recursos.', 1, '2025-06-12 01:35:08'),
(4056, 1507, 'Em healthtechs, o termo “interoperabilidade” refere-se a:', 'Interoperabilidade é a capacidade dos sistemas e dispositivos trocarem dados de forma eficiente e segura.', 1, '2025-06-12 01:35:08'),
(4057, 1507, 'Qual documento é fundamental para proteger propriedade intelectual em startups de saúde?', 'A patente garante proteção legal para invenções, dispositivos ou processos inovadores.', 1, '2025-06-12 01:35:08'),
(4058, 1507, 'Em modelos de negócio SaaS em saúde, qual desafio regulatório é recorrente?', 'A segurança de dados e adequação à LGPD (Lei Geral de Proteção de Dados) é um dos principais desafios.', 1, '2025-06-12 01:35:08'),
(4059, 1507, 'Qual é o conceito de “pivotar” em uma startup?', 'Pivotar é mudar o rumo do negócio com base em aprendizados e testes do mercado, ajustando produto, público ou modelo.', 1, '2025-06-12 01:35:08'),
(4060, 1507, 'Em healthtechs, por que “compliance” é um requisito crítico?', 'Compliance garante conformidade legal, ética e regulatória, reduzindo riscos de multas e interdições.', 1, '2025-06-12 01:35:08'),
(4061, 1380, 'O que é considerado o principal mecanismo molecular da plasticidade sináptica em adultos?', 'A potenciação de longa duração (LTP) é um dos principais mecanismos para o fortalecimento de sinapses em adultos.', 1, '2025-06-12 01:37:33'),
(4062, 1380, 'Qual estrutura cerebral é mais associada à plasticidade neural após lesão?', 'O córtex cerebral, especialmente áreas associativas, é fundamental para reorganização pós-lesão.', 1, '2025-06-12 01:37:33'),
(4063, 1380, 'Durante a plasticidade neural, o que ocorre com os receptores pós-sinápticos em LTP?', 'Na LTP há aumento do número de receptores pós-sinápticos, como AMPA, tornando a célula mais sensível ao neurotransmissor.', 1, '2025-06-12 01:37:33'),
(4064, 1380, 'Que fator ambiental é comprovadamente capaz de modular plasticidade neural em adultos?', 'Exercício físico regular estimula neurogênese, plasticidade e liberação de fatores tróficos como BDNF.', 1, '2025-06-12 01:37:33'),
(4065, 1380, 'No contexto de plasticidade, o que significa “poda sináptica”?', 'Poda sináptica é a eliminação seletiva de conexões sinápticas pouco utilizadas, refinando circuitos neurais.', 1, '2025-06-12 01:37:33'),
(4066, 1380, 'A proteína BDNF tem papel importante em:', 'O BDNF (Brain-Derived Neurotrophic Factor) é essencial para sobrevivência, crescimento e plasticidade de neurônios.', 1, '2025-06-12 01:37:33'),
(4067, 1380, 'Qual é a relação entre plasticidade neural e reabilitação após AVC?', 'A reabilitação intensiva aproveita a janela de plasticidade para reorganizar áreas cerebrais e recuperar funções.', 1, '2025-06-12 01:37:33'),
(4068, 1380, 'A plasticidade neural é maior em qual período da vida?', 'O cérebro é mais plástico na infância, mas permanece adaptativo ao longo da vida com menor intensidade.', 1, '2025-06-12 01:37:33'),
(4069, 1380, 'O que é neurogênese adulta e onde ocorre mais intensamente?', 'Neurogênese é a formação de novos neurônios em adultos, sendo mais intensa no hipocampo.', 1, '2025-06-12 01:37:33'),
(4070, 1380, 'Experimentos de privação sensorial demonstraram que:', 'Privação sensorial reduz plasticidade e pode causar perda de função cortical nas áreas privadas de estímulo.', 1, '2025-06-12 01:37:33'),
(4071, 1398, 'A escala MFM é mais indicada para avaliação de qual condição?', 'A MFM (Medida da Função Motora) é usada para distúrbios neuromusculares, como Distrofia Muscular de Duchenne.', 1, '2025-06-12 01:43:05'),
(4072, 1398, 'Na MFM, o domínio D2 avalia principalmente:', 'O domínio D2 é focado em função motora fina e manipulação de objetos.', 1, '2025-06-12 01:43:05'),
(4073, 1398, 'Qual é um critério de exclusão para aplicação da MFM?', 'Quadros cognitivos graves podem invalidar os resultados, pois exigem compreensão de comandos.', 1, '2025-06-12 01:43:05'),
(4074, 1398, 'Na avaliação da MFM, um escore baixo em D2 indica:', 'Escore baixo em D2 sugere comprometimento importante de habilidades motoras finas e destreza manual.', 1, '2025-06-12 01:43:05'),
(4075, 1398, 'O que diferencia a aplicação da MFM em adultos e crianças?', 'A MFM possui versões adaptadas (MFM-20 para crianças pequenas, MFM-32 para maiores e adultos) com tarefas específicas para cada faixa etária.', 1, '2025-06-12 01:43:05'),
(4076, 1398, 'Na MFM, a reprodutibilidade dos escores é garantida por:', 'Treinamento padronizado dos avaliadores e uso de protocolos rigorosos são essenciais para confiabilidade.', 1, '2025-06-12 01:43:05'),
(4077, 1398, 'Como a fadiga muscular influencia a aplicação da MFM?', 'A fadiga pode piorar o desempenho e gerar falsos negativos; por isso recomenda-se avaliar em repouso.', 1, '2025-06-12 01:43:05'),
(4078, 1398, 'Por que a padronização do ambiente é importante na MFM?', 'Ambiente padronizado reduz interferências externas e garante condições comparáveis entre avaliações.', 1, '2025-06-12 01:43:05'),
(4079, 1398, 'Qual item da MFM avalia a coordenação olho-mão?', 'Tarefas que envolvem pegar, manipular e deslocar objetos mensuram a coordenação olho-mão.', 1, '2025-06-12 01:43:05'),
(4080, 1398, 'Qual fator pode indicar melhora clínica ao longo do acompanhamento com MFM?', 'Elevação progressiva dos escores indica ganho de função motora fina e resposta positiva à intervenção.', 1, '2025-06-12 01:43:05'),
(4081, 1453, 'O que é “rapport” no contexto da Terapia Ocupacional?', 'Rapport é a criação de vínculo, confiança e sintonia entre terapeuta e paciente, facilitando intervenções.', 1, '2025-06-12 01:44:23'),
(4082, 1453, 'Qual componente NÃO faz parte da aliança terapêutica?', 'A aliança inclui colaboração, objetivos partilhados e vínculo. A imposição unilateral é prejudicial.', 1, '2025-06-12 01:44:23'),
(4083, 1453, 'Como a comunicação não verbal influencia o rapport?', 'Expressões faciais, postura e contato visual reforçam empatia e confiança na relação.', 1, '2025-06-12 01:44:23'),
(4084, 1453, 'O que pode prejudicar a construção do rapport?', 'Falta de escuta ativa, julgamentos prévios e pressa no atendimento enfraquecem o vínculo terapêutico.', 1, '2025-06-12 01:44:23'),
(4085, 1453, 'Por que a definição conjunta de metas é importante para a aliança terapêutica?', 'Envolve o paciente nas decisões, promovendo engajamento e senso de autonomia.', 1, '2025-06-12 01:44:23'),
(4086, 1453, 'Como a empatia do terapeuta pode ser percebida pelo paciente?', 'Empatia é percebida por meio de escuta ativa, validação dos sentimentos e respostas acolhedoras.', 1, '2025-06-12 01:44:23'),
(4087, 1453, 'O que é essencial para manter uma aliança terapêutica duradoura?', 'Confiança mútua, comunicação clara e respeito à individualidade do paciente são essenciais.', 1, '2025-06-12 01:44:23'),
(4088, 1453, 'Como o uso de perguntas abertas influencia o processo terapêutico?', 'Perguntas abertas incentivam o paciente a expressar-se livremente e aprofundam o entendimento do terapeuta.', 1, '2025-06-12 01:44:23'),
(4089, 1453, 'No contexto de aliança terapêutica, o que pode sinalizar ruptura do vínculo?', 'Faltas recorrentes, resistência ao diálogo e queixas não verbalizadas são sinais de enfraquecimento do vínculo.', 1, '2025-06-12 01:44:23'),
(4090, 1453, 'A construção de rapport exige, prioritariamente:', 'Atenção genuína, disponibilidade e adaptação ao ritmo do paciente são fundamentais para construir rapport.', 1, '2025-06-12 01:44:23'),
(4091, 1433, 'Qual abordagem é considerada mais efetiva para manter autonomia em idosos com demência?', 'A Terapia Ocupacional utiliza adaptação ambiental e rotinas estruturadas para favorecer autonomia e reduzir riscos.', 1, '2025-06-12 01:52:44'),
(4092, 1433, 'A estimulação cognitiva na demência é mais eficaz quando:', 'Atividades significativas, adaptadas à realidade do idoso, potencializam a plasticidade e engajamento.', 1, '2025-06-12 01:52:44'),
(4093, 1433, 'Por que a avaliação funcional é fundamental em OT para demências?', 'Ela permite identificar preservação de capacidades, guiar intervenções e evitar excessos de restrição.', 1, '2025-06-12 01:52:44'),
(4094, 1433, 'Na demência, a validação emocional auxilia porque:', 'Técnicas de validação reduzem ansiedade e colaboram para o bem-estar, respeitando sentimentos presentes.', 1, '2025-06-12 01:52:44'),
(4095, 1433, 'Sobre prevenção de quedas em demências, qual é a ação prioritária da OT?', 'A OT avalia e adapta o ambiente, sinalizando riscos, removendo obstáculos e promovendo mobilidade segura.', 1, '2025-06-12 01:52:44'),
(4096, 1433, 'A abordagem centrada na pessoa em OT para demências foca principalmente em:', 'Respeitar preferências, biografia e história de vida do idoso, promovendo dignidade e autonomia.', 1, '2025-06-12 01:52:44'),
(4097, 1433, 'O que diferencia a reabilitação cognitiva da estimulação cognitiva na demência?', 'Reabilitação foca em recuperar funções específicas; estimulação visa manter capacidades e retardar declínio.', 1, '2025-06-12 01:52:44'),
(4098, 1433, 'Qual a função das rotinas no manejo da demência?', 'Rotinas estruturadas reduzem confusão, ansiedade e facilitam o engajamento em atividades cotidianas.', 1, '2025-06-12 01:52:44'),
(4099, 1433, 'Por que é importante trabalhar atividades significativas com pacientes com demência?', 'Atividades significativas estimulam memórias, promovem autoestima e melhoram o humor.', 1, '2025-06-12 01:52:44'),
(4100, 1433, 'A família deve ser orientada a:', 'A participação da família, informada sobre evolução e estratégias, potencializa resultados e adesão ao cuidado.', 1, '2025-06-12 01:52:44'),
(4101, 1449, 'O que é considerado dado sensível segundo a LGPD em saúde?', 'Dado sensível inclui informações sobre saúde, biometria, genética, orientação sexual, entre outros.', 1, '2025-06-12 02:05:04'),
(4102, 1449, 'Qual é o princípio básico para compartilhamento legal de dados em teleatendimento?', 'Só pode haver compartilhamento mediante consentimento explícito do paciente, exceto em exceções legais.', 1, '2025-06-12 02:05:04'),
(4103, 1449, 'Sobre armazenamento de dados clínicos online, qual prática é mais segura?', 'Criptografia forte e acesso restrito garantem proteção dos dados contra acessos não autorizados.', 1, '2025-06-12 02:05:04'),
(4104, 1449, 'Qual das alternativas caracteriza uma violação de privacidade em e-health?', 'Divulgar dados de pacientes sem autorização é uma violação grave da privacidade, sujeita a sanções legais.', 1, '2025-06-12 02:05:04'),
(4105, 1449, 'Em teleatendimento, a gravação de sessões é permitida se:', 'A gravação exige consentimento explícito e informado do paciente para ser considerada legal.', 1, '2025-06-12 02:05:04'),
(4106, 1449, 'A quem cabe a responsabilidade pelo sigilo dos dados em plataformas de telereabilitação?', 'O profissional e a empresa prestadora do serviço são responsáveis solidários pelo sigilo dos dados.', 1, '2025-06-12 02:05:04'),
(4107, 1449, 'Como minimizar riscos de vazamento de dados em e-health?', 'Uso de firewalls, atualização constante de sistemas e treinamentos periódicos são medidas efetivas.', 1, '2025-06-12 02:05:04'),
(4108, 1449, 'Na LGPD, o “Controlador” de dados em telereabilitação é:', 'O Controlador é quem decide sobre o tratamento dos dados pessoais, geralmente a clínica ou profissional.', 1, '2025-06-12 02:05:04'),
(4109, 1449, 'Qual a consequência legal de violação reiterada de dados de pacientes?', 'A LGPD prevê sanções administrativas, multas e até proibição de atividades em caso de violações graves.', 1, '2025-06-12 02:05:04'),
(4110, 1449, 'O termo “anonimização” em saúde digital refere-se a:', 'Anonimização é o processo que impossibilita a identificação do titular dos dados, protegendo a privacidade.', 1, '2025-06-12 02:05:04');

-- --------------------------------------------------------

--
-- Estrutura para tabela `quiz_respostas`
--

CREATE TABLE `quiz_respostas` (
  `id_resposta` int(11) NOT NULL,
  `id_pergunta` int(11) NOT NULL,
  `texto_resposta` varchar(512) NOT NULL,
  `correta` tinyint(1) NOT NULL DEFAULT 0,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `quiz_respostas`
--

INSERT INTO `quiz_respostas` (`id_resposta`, `id_pergunta`, `texto_resposta`, `correta`, `ativo`) VALUES
(13, 4, 'Apenas a dificuldade encontrada', 0, 1),
(14, 4, 'Apenas a sua satisfação com o desempenho', 0, 1),
(15, 4, 'O seu nível de dor e fadiga', 0, 1),
(16, 4, 'A importância da atividade, seu desempenho e sua satisfação', 1, 1),
(17, 5, 'Aumentar a velocidade da produção a qualquer custo', 0, 1),
(18, 5, 'Adaptar o trabalho ao trabalhador, buscando prevenir lesões e aumentar o conforto', 1, 1),
(19, 5, 'Reduzir o número de pausas para descanso', 0, 1),
(20, 5, 'Utilizar sempre o mesmo mobiliário para todos os funcionários', 0, 1),
(21, 6, 'Apenas entreter a criança durante a sessão', 0, 1),
(22, 6, 'Ensinar regras e competividade', 0, 1),
(23, 6, 'Promover o desenvolvimento de habilidades motoras, sociais e cognitivas de forma lúdica', 1, 1),
(24, 6, 'Observar a criança sem qualquer tipo de interação', 0, 1),
(25, 7, 'Prevenir deformidades e estimular o retorno motor precoce', 1, 1),
(26, 7, 'Treinar a corrida e saltos', 0, 1),
(27, 7, 'Focar exclusivamente em atividades de lazer complexas', 0, 1),
(28, 7, 'Ignorar o posicionamento do paciente no leito', 0, 1),
(29, 8, 'Promover autonomia e participação nas atividades da vida diária', 1, 1),
(30, 8, 'Prescrever medicamentos', 0, 1),
(31, 8, 'Realizar apenas exercícios físicos', 0, 1),
(32, 8, 'Diagnosticar doenças', 0, 1),
(33, 9, 'Respeitar necessidades, valores e preferências do cliente', 1, 1),
(34, 9, 'Focar só nos protocolos', 0, 1),
(35, 9, 'Aplicar o mesmo plano para todos', 0, 1),
(36, 9, 'Atender apenas demandas da família', 0, 1),
(37, 10, 'Regulamentação da profissão e surgimento das escolas de TO', 1, 1),
(38, 10, 'A criação do SUS', 0, 1),
(39, 10, 'O uso de órteses', 0, 1),
(40, 10, 'O reconhecimento da fisioterapia', 0, 1),
(41, 11, 'Saúde, educação, assistência social e reabilitação', 1, 1),
(42, 11, 'Apenas hospitais', 0, 1),
(43, 11, 'Somente clínicas privadas', 0, 1),
(44, 11, 'Exclusivamente com idosos', 0, 1),
(45, 12, 'Aumento da atuação em contextos comunitários e saúde mental', 1, 1),
(46, 12, 'Restrição ao ambiente hospitalar', 0, 1),
(47, 12, 'Diminuição das oportunidades em clínicas', 0, 1),
(48, 12, 'Atuação apenas acadêmica', 0, 1),
(49, 13, 'Encéfalo e medula espinhal', 1, 1),
(50, 13, 'Nervos periféricos', 0, 1),
(51, 13, 'Glândulas endócrinas', 0, 1),
(52, 13, 'Músculos estriados', 0, 1),
(53, 14, 'Permitir comunicação entre neurônios', 1, 1),
(54, 14, 'Gerar energia', 0, 1),
(55, 14, 'Produzir hormônios', 0, 1),
(56, 14, 'Formar músculos', 0, 1),
(57, 15, 'Caminhos dos estímulos sensoriais ao SNC', 1, 1),
(58, 15, 'Canais de secreção hormonal', 0, 1),
(59, 15, 'Vasos sanguíneos cerebrais', 0, 1),
(60, 15, 'Linhas de defesa imunológica', 0, 1),
(61, 16, 'Capacidade do SNC de formar novas conexões', 1, 1),
(62, 16, 'Produção de insulina', 0, 1),
(63, 16, 'Crescimento ósseo', 0, 1),
(64, 16, 'Formação de hormônios sexuais', 0, 1),
(65, 17, 'Entender as bases neurais das funções ocupacionais', 1, 1),
(66, 17, 'Realizar apenas exercícios físicos', 0, 1),
(67, 17, 'Regular pressão arterial', 0, 1),
(68, 17, 'Produzir leite materno', 0, 1),
(69, 18, 'Modelo que explica motivação e desempenho ocupacional', 1, 1),
(70, 18, 'Manual de órteses', 0, 1),
(71, 18, 'Exame de sangue', 0, 1),
(72, 18, 'Programa de exercícios físicos', 0, 1),
(73, 19, 'Ênfase na interação pessoa, ocupação e ambiente', 1, 1),
(74, 19, 'Prioriza só fatores biológicos', 0, 1),
(75, 19, 'Foca só no desempenho motor', 0, 1),
(76, 19, 'Trabalha só aspectos ambientais', 0, 1),
(77, 20, 'Considera fatores biológicos, psicológicos e sociais', 1, 1),
(78, 20, 'Enfatiza só biologia', 0, 1),
(79, 20, 'Exclui contexto social', 0, 1),
(80, 20, 'Ignora fatores psicológicos', 0, 1),
(81, 21, 'Foco no desempenho das ocupações significativas', 1, 1),
(82, 21, 'Ênfase só em diagnósticos', 0, 1),
(83, 21, 'Exclusivo para idosos', 0, 1),
(84, 21, 'Apenas avaliação ambiental', 0, 1),
(85, 22, 'Para ampliar compreensão e eficácia da intervenção', 1, 1),
(86, 22, 'Para seguir modismo acadêmico', 0, 1),
(87, 22, 'Para reduzir tempo de atendimento', 0, 1),
(88, 22, 'Para evitar o uso de evidências científicas', 0, 1),
(89, 23, 'Orienta conduta profissional com responsabilidade e respeito', 1, 1),
(90, 23, 'Permite flexibilizar regras para amigos', 0, 1),
(91, 23, 'Serve só para consulta esporádica', 0, 1),
(92, 23, 'É obrigatório apenas para hospitais', 0, 1),
(93, 24, 'Órgão fiscalizador e regulamentador da TO', 1, 1),
(94, 24, 'Sindicato dos médicos', 0, 1),
(95, 24, 'Associação de pacientes', 0, 1),
(96, 24, 'Instituição de ensino', 0, 1),
(97, 25, 'Consentir livremente e ter confidencialidade respeitada', 1, 1),
(98, 25, 'Ser obrigado a aceitar tratamento', 0, 1),
(99, 25, 'Abrir mão da privacidade', 0, 1),
(100, 25, 'Ter tratamento obrigatório', 0, 1),
(101, 26, 'Para garantir privacidade e segurança das informações', 1, 1),
(102, 26, 'Para dificultar auditoria', 0, 1),
(103, 26, 'Por exigência de colegas', 0, 1),
(104, 26, 'Porque não é importante', 0, 1),
(105, 27, 'Assumir consequências pelos atos praticados', 1, 1),
(106, 27, 'Deixar decisões para o supervisor', 0, 1),
(107, 27, 'Priorizar sempre os interesses da instituição', 0, 1),
(108, 27, 'Ignorar normas e regulamentos', 0, 1),
(2021, 1011, 'Sigmund Freud', 0, 1),
(2022, 1011, 'William Rush Dunton Jr.', 1, 1),
(2023, 1011, 'Jean Piaget', 0, 1),
(2024, 1011, 'Mary Reilly', 0, 1),
(2025, 1013, 'Somente crianças com deficiências.', 0, 1),
(2026, 1013, 'Apenas idosos com limitações.', 0, 1),
(2027, 1013, 'Pessoas de todas as idades com dificuldades ocupacionais.', 1, 1),
(2028, 1013, 'Somente pacientes hospitalizados.', 0, 1),
(2029, 1015, 'A indústria automobilística.', 0, 1),
(2030, 1015, 'Saúde pública e mental.', 1, 1),
(2031, 1015, 'Agricultura.', 0, 1),
(2032, 1015, 'Setor bancário.', 0, 1),
(2033, 1017, 'Sistema circulatório.', 0, 1),
(2034, 1017, 'Ossos, músculos, tendões e ligamentos.', 1, 1),
(2035, 1017, 'Sistema nervoso.', 0, 1),
(2036, 1017, 'Sistema digestivo.', 0, 1),
(2037, 1019, 'Articulações fibrosas.', 0, 1),
(2038, 1019, 'Articulações cartilaginosas.', 0, 1),
(2039, 1019, 'Articulações sinoviais.', 1, 1),
(2040, 1019, 'Articulações fixas.', 0, 1),
(2041, 1021, '24 vértebras.', 0, 1),
(2042, 1021, '33 vértebras.', 1, 1),
(2043, 1021, '40 vértebras.', 0, 1),
(2044, 1021, '30 vértebras.', 0, 1),
(2045, 1023, 'Produzir hormônios digestivos.', 0, 1),
(2046, 1023, 'Controlar funções corporais e processar informações.', 1, 1),
(2047, 1023, 'Regular a circulação sanguínea.', 0, 1),
(2048, 1023, 'Regular a temperatura corporal.', 0, 1),
(2049, 1025, 'Um tipo de célula glial.', 0, 1),
(2050, 1025, 'Ponto de comunicação entre neurônios.', 1, 1),
(2051, 1025, 'Uma proteína muscular.', 0, 1),
(2052, 1025, 'Um hormônio cerebral.', 0, 1),
(2053, 1027, 'Capacidade de regenerar tecidos musculares.', 0, 1),
(2054, 1027, 'Capacidade do sistema nervoso de modificar estrutura e função.', 1, 1),
(2055, 1027, 'Perda de células nervosas irreversível.', 0, 1),
(2056, 1027, 'Inflamação crônica do cérebro.', 0, 1),
(2057, 1029, 'Filtrar o sangue.', 0, 1),
(2058, 1029, 'Quebrar e absorver nutrientes dos alimentos.', 1, 1),
(2059, 1029, 'Controlar o equilíbrio hormonal.', 0, 1),
(2060, 1029, 'Produzir células sanguíneas.', 0, 1),
(2061, 1031, 'Memória de curto prazo.', 0, 1),
(2062, 1031, 'Motivação e engajamento.', 1, 1),
(2063, 1031, 'Capacidade auditiva.', 0, 1),
(2064, 1031, 'Coordenação motora fina.', 0, 1),
(2065, 1033, 'Atuar somente em consultórios particulares.', 0, 1),
(2066, 1033, 'Promover saúde e reabilitar comunidades.', 1, 1),
(2067, 1033, 'Administrar hospitais.', 0, 1),
(2068, 1033, 'Fornecer medicação.', 0, 1),
(2069, 1035, 'Crescimento muscular.', 0, 1),
(2070, 1035, 'Desenvolvimento do sistema nervoso infantil.', 1, 1),
(2071, 1035, 'Formação óssea.', 0, 1),
(2072, 1035, 'Desenvolvimento pulmonar.', 0, 1),
(2073, 1037, 'Dificuldades motoras apenas.', 0, 1),
(2074, 1037, 'Problemas respiratórios.', 0, 1),
(2075, 1037, 'Dificuldades na comunicação social e comportamentos repetitivos.', 1, 1),
(2076, 1037, 'Problemas auditivos.', 0, 1),
(2077, 1039, 'Proibir acesso a pessoas com deficiências.', 0, 1),
(2078, 1039, 'Garantir uso e acesso para todos.', 1, 1),
(2079, 1039, 'Criar barreiras físicas.', 0, 1),
(2080, 1039, 'Restringir uso de transporte público.', 0, 1),
(2081, 1041, 'Fornecendo apenas medicação.', 0, 1),
(2082, 1041, 'Ajudando na adaptação funcional.', 1, 1),
(2083, 1041, 'Ignorando limitações.', 0, 1),
(2084, 1041, 'Realizando cirurgias.', 0, 1),
(2085, 1043, 'Substituir a terapia ocupacional.', 0, 1),
(2086, 1043, 'Apoiar e complementar a reabilitação.', 1, 1),
(2087, 1043, 'Ignorar o paciente.', 0, 1),
(2088, 1043, 'Somente usar medicamentos.', 0, 1),
(2089, 1045, 'Avaliar somente a força muscular.', 0, 1),
(2090, 1045, 'Identificar habilidades e necessidades.', 1, 1),
(2091, 1045, 'Ignorar limitações.', 0, 1),
(2092, 1045, 'Prescrever medicamentos.', 0, 1),
(2093, 1047, 'Substituindo o terapeuta.', 0, 1),
(2094, 1047, 'Apoiando com dispositivos assistivos.', 1, 1),
(2095, 1047, 'Ignorando necessidades do paciente.', 0, 1),
(2096, 1047, 'Limitando a independência.', 0, 1),
(2097, 1049, 'Focar somente em tratamentos médicos.', 0, 1),
(2098, 1049, 'Manter autonomia e qualidade de vida.', 1, 1),
(2099, 1049, 'Isolar o idoso do convívio social.', 0, 1),
(2100, 1049, 'Ignorar limitações funcionais.', 0, 1),
(2101, 1050, 'Ignorando as limitações físicas.', 0, 1),
(2102, 1050, 'Melhorando equilíbrio e força muscular.', 1, 1),
(2103, 1050, 'Aumentando o sedentarismo.', 0, 1),
(2104, 1050, 'Incentivando uso de medicamentos apenas.', 0, 1),
(2105, 1051, 'Tratamento farmacológico.', 0, 1),
(2106, 1051, 'Desenvolvimento de habilidades funcionais.', 1, 1),
(2107, 1051, 'Isolamento social.', 0, 1),
(2108, 1051, 'Terapia física.', 0, 1),
(2109, 1052, 'Oferecendo isolamento.', 0, 1),
(2110, 1052, 'Promovendo autonomia e qualidade de vida.', 1, 1),
(2111, 1052, 'Somente prescrevendo medicamentos.', 0, 1),
(2112, 1052, 'Ignorando as necessidades do paciente.', 0, 1),
(2113, 1053, 'Aumento da capacidade respiratória.', 0, 1),
(2114, 1053, 'Controle e coordenação dos movimentos.', 1, 1),
(2115, 1053, 'Crescimento ósseo.', 0, 1),
(2116, 1053, 'Desenvolvimento da visão.', 0, 1),
(2117, 1054, 'É irrelevante para autonomia.', 0, 1),
(2118, 1054, 'Impacta autonomia e atividades diárias.', 1, 1),
(2119, 1054, 'Só influencia a cognição.', 0, 1),
(2120, 1054, 'Não tem importância na TO.', 0, 1),
(2121, 1055, 'Substituir professores.', 0, 1),
(2122, 1055, 'Apoiar inclusão e desenvolvimento.', 1, 1),
(2123, 1055, 'Aplicar provas escolares.', 0, 1),
(2124, 1055, 'Gerenciar a escola.', 0, 1),
(2125, 1056, 'Ignorando necessidades especiais.', 0, 1),
(2126, 1056, 'Ajustando atividades e ambientes.', 1, 1),
(2127, 1056, 'Restringindo participação.', 0, 1),
(2128, 1056, 'Aplicando punições.', 0, 1),
(2129, 1057, 'Prescrevendo analgésicos.', 0, 1),
(2130, 1057, 'Promovendo manejo e funcionalidade.', 1, 1),
(2131, 1057, 'Ignorando a dor.', 0, 1),
(2132, 1057, 'Evitando todas as atividades.', 0, 1),
(2133, 1058, 'A dor não tem impacto na vida diária.', 0, 1),
(2134, 1058, 'Dor limita qualidade de vida e atividades.', 1, 1),
(2135, 1058, 'Dor deve ser ignorada.', 0, 1),
(2136, 1058, 'Dor é só um sintoma secundário.', 0, 1),
(2137, 1059, 'Deficiências visuais.', 0, 1),
(2138, 1059, 'Limitações motoras.', 1, 1),
(2139, 1059, 'Deficiências auditivas.', 0, 1),
(2140, 1059, 'Deficiências cognitivas.', 0, 1),
(2141, 1060, 'Ignorando limitações.', 0, 1),
(2142, 1060, 'Desenvolvendo habilidades e adaptando ambientes.', 1, 1),
(2143, 1060, 'Limitando atividades.', 0, 1),
(2144, 1060, 'Incentivando dependência.', 0, 1),
(2145, 1061, 'Tecnologia para jogos.', 0, 1),
(2146, 1061, 'Dispositivos que auxiliam pessoas com deficiência.', 1, 1),
(2147, 1061, 'Aparelhos eletrônicos comuns.', 0, 1),
(2148, 1061, 'Equipamentos esportivos.', 0, 1),
(2149, 1062, 'Televisores.', 0, 1),
(2150, 1062, 'Cadeiras de rodas e próteses.', 1, 1),
(2151, 1062, 'Smartphones comuns.', 0, 1),
(2152, 1062, 'Carros esportivos.', 0, 1),
(2153, 1063, 'Tratar somente doenças já instaladas.', 0, 1),
(2154, 1063, 'Prevenir doenças e promover saúde.', 1, 1),
(2155, 1063, 'Ignorar condições do trabalhador.', 0, 1),
(2156, 1063, 'Focar só em exames médicos.', 0, 1),
(2157, 1064, 'Ignorando riscos.', 0, 1),
(2158, 1064, 'Adaptando tarefas e ambientes.', 1, 1),
(2159, 1064, 'Restringindo atividades.', 0, 1),
(2160, 1064, 'Incentivando acidentes.', 0, 1),
(2161, 1065, 'Promover a dependência do paciente.', 0, 1),
(2162, 1065, 'Restaurar funcionalidade e independência.', 1, 1),
(2163, 1065, 'Realizar apenas fisioterapia.', 0, 1),
(2164, 1065, 'Aplicar tratamentos farmacológicos.', 0, 1),
(2165, 1066, 'Ignorando limitações.', 0, 1),
(2166, 1066, 'Recuperando habilidades para atividades diárias.', 1, 1),
(2167, 1066, 'Focando só em exercícios.', 0, 1),
(2168, 1066, 'Restringindo movimentos.', 0, 1),
(2169, 1067, 'Aplicar tratamentos.', 0, 1),
(2170, 1067, 'Coletar informações para planejamento.', 1, 1),
(2171, 1067, 'Ignorar as necessidades do paciente.', 0, 1),
(2172, 1067, 'Realizar apenas testes laboratoriais.', 0, 1),
(2173, 1068, 'Avaliações não influenciam o tratamento.', 0, 1),
(2174, 1068, 'Permite tratamentos eficazes e focados.', 1, 1),
(2175, 1068, 'Avaliações são apenas formais.', 0, 1),
(2176, 1068, 'Ignora necessidades do paciente.', 0, 1),
(2177, 1069, 'Prescrever medicamentos.', 0, 1),
(2178, 1069, 'Auxiliar recuperação funcional e adaptação.', 1, 1),
(2179, 1069, 'Realizar cirurgias.', 0, 1),
(2180, 1069, 'Monitorar sinais vitais somente.', 0, 1),
(2181, 1071, 'Prescrever broncodilatadores.', 0, 1),
(2182, 1071, 'Melhorar capacidade funcional e qualidade de vida.', 1, 1),
(2183, 1071, 'Ignorar limitações respiratórias.', 0, 1),
(2184, 1071, 'Realizar fisioterapia apenas.', 0, 1),
(2185, 1073, 'Tratar somente efeitos colaterais médicos.', 0, 1),
(2186, 1073, 'Melhorar qualidade de vida e funcionalidade.', 1, 1),
(2187, 1073, 'Ignorar limitações do paciente.', 0, 1),
(2188, 1073, 'Concentrar-se apenas em sessões de fisioterapia.', 0, 1),
(2189, 1075, 'Aplicar somente medicamentos.', 0, 1),
(2190, 1075, 'Estimular funções motoras e cognitivas.', 1, 1),
(2191, 1075, 'Ignorar déficits cognitivos.', 0, 1),
(2192, 1075, 'Realizar somente fisioterapia.', 0, 1),
(2193, 1077, 'Somente desenvolvimento motor.', 0, 1),
(2194, 1077, 'Desenvolver motor, cognitivo e social.', 1, 1),
(2195, 1077, 'Focar em atividades acadêmicas apenas.', 0, 1),
(2196, 1077, 'Ignorar aspectos sociais.', 0, 1),
(2197, 1079, 'Estimular dependência.', 0, 1),
(2198, 1079, 'Promover independência e qualidade de vida.', 1, 1),
(2199, 1079, 'Concentrar-se em doenças crônicas somente.', 0, 1),
(2200, 1079, 'Ignorar aspectos psicossociais.', 0, 1),
(2201, 1081, 'Focar somente em problemas físicos.', 0, 1),
(2202, 1081, 'Trabalhar aspectos físicos, emocionais e sociais.', 1, 1),
(2203, 1081, 'Ignorar questões emocionais.', 0, 1),
(2204, 1081, 'Prescrever medicamentos.', 0, 1),
(2205, 1083, 'Ignorar riscos laborais.', 0, 1),
(2206, 1083, 'Promover segurança e prevenção de lesões.', 1, 1),
(2207, 1083, 'Concentrar-se só em exames médicos.', 0, 1),
(2208, 1083, 'Focar em afastamento do trabalhador.', 0, 1),
(2209, 1085, 'Diabetes e hipertensão.', 0, 1),
(2210, 1085, 'Autismo, TDAH e paralisia cerebral.', 1, 1),
(2211, 1085, 'Depressão apenas.', 0, 1),
(2212, 1085, 'Câncer.', 0, 1),
(3001, 2001, 'Restaurar habilidades e promover autonomia.', 1, 1),
(3002, 2001, 'Aumentar apenas força muscular.', 0, 1),
(3003, 2001, 'Focar só em exercícios repetitivos.', 0, 1),
(3004, 2001, 'Promover isolamento social.', 0, 1),
(3005, 2002, 'Adaptação de utensílios.', 1, 1),
(3006, 2002, 'Fisioterapia invasiva obrigatória.', 0, 1),
(3007, 2002, 'Uso exclusivo de medicação.', 0, 1),
(3008, 2002, 'Restrição total das atividades.', 0, 1),
(3009, 2003, 'Capacidade do cérebro de se reorganizar.', 1, 1),
(3010, 2003, 'Processo de degeneração muscular.', 0, 1),
(3011, 2003, 'Aumento do número de neurônios.', 0, 1),
(3012, 2003, 'Redução da atividade cerebral.', 0, 1),
(3013, 2004, 'Terapia de restrição induzida pelo movimento.', 1, 1),
(3014, 2004, 'Imobilização prolongada.', 0, 1),
(3015, 2004, 'Apenas uso do membro saudável.', 0, 1),
(3016, 2004, 'Estimulação passiva apenas.', 0, 1),
(3017, 2005, 'Para aumentar autonomia e segurança.', 1, 1),
(3018, 2005, 'Para dificultar o acesso.', 0, 1),
(3019, 2005, 'Para impedir movimentação.', 0, 1),
(3020, 2005, 'Para reduzir estímulos sensoriais.', 0, 1),
(3021, 2006, 'Usando jogos e tarefas cognitivas.', 1, 1),
(3022, 2006, 'Apenas repouso prolongado.', 0, 1),
(3023, 2006, 'Evitar desafios mentais.', 0, 1),
(3024, 2006, 'Só aplicar exercícios físicos.', 0, 1),
(3025, 2007, 'Retorno às atividades diárias.', 1, 1),
(3026, 2007, 'Exclusão social.', 0, 1),
(3027, 2007, 'Dependência total.', 0, 1),
(3028, 2007, 'Imobilização contínua.', 0, 1),
(3029, 2008, 'Melhora resultados com integração de saberes.', 1, 1),
(3030, 2008, 'Causa conflitos profissionais.', 0, 1),
(3031, 2008, 'Reduz qualidade do cuidado.', 0, 1),
(3032, 2008, 'Torna o processo mais lento.', 0, 1),
(3033, 2009, 'Comunicação alternativa (pranchas, apps).', 1, 1),
(3034, 2009, 'Exclusivamente fala oral.', 0, 1),
(3035, 2009, 'Restringir comunicação.', 0, 1),
(3036, 2009, 'Evitar interação social.', 0, 1),
(3037, 2010, 'Treino para realizar tarefas cotidianas.', 1, 1),
(3038, 2010, 'Apenas fortalecimento muscular.', 0, 1),
(3039, 2010, 'Restringir a participação do paciente.', 0, 1),
(3040, 2010, 'Avaliação psicológica exclusiva.', 0, 1),
(5001, 4001, 'Congresso Brasileiro de Terapia Ocupacional', 0, 1),
(5002, 4001, 'World Federation of Occupational Therapy Congress (WFOT Congress)', 1, 1),
(5003, 4001, 'Congresso Europeu de Fisioterapia', 0, 1),
(5004, 4001, 'Congresso Latino-Americano de Enfermagem', 0, 1),
(5005, 4002, 'A cada 2 anos', 0, 1),
(5006, 4002, 'A cada 4 anos', 1, 1),
(5007, 4002, 'Anualmente', 0, 1),
(5008, 4002, 'A cada 10 anos', 0, 1),
(5009, 4003, 'World Federation of Occupational Therapy', 0, 1),
(5010, 4003, 'Associação Brasileira de Terapia Ocupacional (ABRATO)', 1, 1),
(5011, 4003, 'Associação de Fisioterapia', 0, 1),
(5012, 4003, 'CREFITO', 0, 1),
(5013, 4004, 'Exclusivamente lazer', 0, 1),
(5014, 4004, 'Atualização científica e networking', 1, 1),
(5015, 4004, 'Apresentar apenas trabalhos antigos', 0, 1),
(5016, 4004, 'Fazer apenas atividades recreativas', 0, 1),
(5017, 4005, 'Apenas assistir palestras', 0, 1),
(5018, 4005, 'Apresentação de trabalhos, palestras e workshops', 1, 1),
(5019, 4005, 'Somente atividades online', 0, 1),
(5020, 4005, 'Foco apenas em atividades recreativas', 0, 1),
(5021, 4006, 'Diminui networking', 0, 1),
(5022, 4006, 'Aumenta visibilidade e colaborações', 1, 1),
(5023, 4006, 'Reduz aprendizado', 0, 1),
(5024, 4006, 'Não traz benefícios', 0, 1),
(5025, 4007, 'Apenas estudantes', 0, 1),
(5026, 4007, 'Tanto iniciantes quanto experientes', 1, 1),
(5027, 4007, 'Somente palestrantes', 0, 1),
(5028, 4007, 'Apenas profissionais de outras áreas', 0, 1),
(5029, 4008, 'Somente ficha de inscrição', 0, 1),
(5030, 4008, 'Resumo científico fundamentado', 1, 1),
(5031, 4008, 'Declaração de comparecimento', 0, 1),
(5032, 4008, 'Não é necessário documento', 0, 1),
(5033, 4009, 'Redes sociais genéricas', 0, 1),
(5034, 4009, 'Site oficial da WFOT', 1, 1),
(5035, 4009, 'Sites de instituições de fisioterapia', 0, 1),
(5036, 4009, 'Blogs pessoais', 0, 1),
(5037, 4010, 'Dificulta promoção profissional', 0, 1),
(5038, 4010, 'Fortalece currículos e reconhecimento', 1, 1),
(5039, 4010, 'Traz poucos resultados', 0, 1),
(5040, 4010, 'Afasta profissionais de boas práticas', 0, 1),
(5041, 4011, 'Fiscalizar atos do CREFITO.', 0, 1),
(5042, 4011, 'Promover pesquisa e atualização da categoria.', 1, 1),
(5043, 4011, 'Gerenciar planos de saúde.', 0, 1),
(5044, 4011, 'Organizar eventos de lazer apenas.', 0, 1),
(5045, 4012, 'Conselho fiscalizador.', 0, 1),
(5046, 4012, 'Sociedade científica internacional.', 1, 1),
(5047, 4012, 'Sindicato laboral.', 0, 1),
(5048, 4012, 'Empresa privada.', 0, 1),
(5049, 4013, 'Apenas receber e-mails promocionais.', 0, 1),
(5050, 4013, 'Acesso a conteúdos exclusivos e atualização.', 1, 1),
(5051, 4013, 'Obrigação sindical.', 0, 1),
(5052, 4013, 'Participar de reuniões sindicais.', 0, 1),
(5053, 4014, 'CREFITO.', 0, 1),
(5054, 4014, 'ABRATO.', 1, 1),
(5055, 4014, 'CFM.', 0, 1),
(5056, 4014, 'ABENF.', 0, 1),
(5057, 4015, 'Foco em lucro e vendas.', 0, 1),
(5058, 4015, 'Aprimoramento técnico e científico.', 1, 1),
(5059, 4015, 'Prover serviços de saúde.', 0, 1),
(5060, 4015, 'Atuar como plano de saúde.', 0, 1),
(5061, 4016, 'Limitando publicações de estudos.', 0, 1),
(5062, 4016, 'Apoiando pesquisa e publicações.', 1, 1),
(5063, 4016, 'Impedindo a troca de saberes.', 0, 1),
(5064, 4016, 'Desestimulando eventos científicos.', 0, 1),
(5065, 4017, 'Exclusão de eventos científicos.', 0, 1),
(5066, 4017, 'Acesso a cursos, revistas e eventos.', 1, 1),
(5067, 4017, 'Participação apenas em festas.', 0, 1),
(5068, 4017, 'Obrigações trabalhistas extras.', 0, 1),
(5069, 4018, 'WFOT.', 0, 1),
(5070, 4018, 'ALATO.', 1, 1),
(5071, 4018, 'CFTO.', 0, 1),
(5072, 4018, 'Federação Mundial de Enfermagem.', 0, 1),
(5073, 4019, 'Inibição da divulgação científica.', 0, 1),
(5074, 4019, 'Promoção de eventos e políticas públicas.', 1, 1),
(5075, 4019, 'Afastamento de profissionais.', 0, 1),
(5076, 4019, 'Priorizar interesses individuais.', 0, 1),
(5077, 4020, 'Não impactam a formação.', 0, 1),
(5078, 4020, 'Oferecem estágios, mentorias e cursos.', 1, 1),
(5079, 4020, 'Incentivam a saída do país.', 0, 1),
(5080, 4020, 'Dificultam networking.', 0, 1),
(5081, 4021, 'Organizar festas de confraternização.', 0, 1),
(5082, 4021, 'Trocar experiências e aprofundar conhecimentos.', 1, 1),
(5083, 4021, 'Concorrer entre si sem cooperação.', 0, 1),
(5084, 4021, 'Promover apenas atividades recreativas.', 0, 1),
(5085, 4022, 'Apenas grupos no WhatsApp.', 0, 1),
(5086, 4022, 'Moodle, Google Groups, fóruns acadêmicos.', 1, 1),
(5087, 4022, 'Instagram exclusivamente.', 0, 1),
(5088, 4022, 'Cartazes impressos em murais.', 0, 1),
(5089, 4023, 'Dificultar a comunicação.', 0, 1),
(5090, 4023, 'Compartilhar experiências e soluções.', 1, 1),
(5091, 4023, 'Evitar o contato com a área.', 0, 1),
(5092, 4023, 'Restringir acesso ao conhecimento.', 0, 1),
(5093, 4024, 'Reduzem a motivação.', 0, 1),
(5094, 4024, 'Promovem atualização e novas evidências.', 1, 1),
(5095, 4024, 'Geram isolamento.', 0, 1),
(5096, 4024, 'Aumentam desinformação.', 0, 1),
(5097, 4025, 'Discussão baseada em evidências e respeito.', 1, 1),
(5098, 4025, 'Agressividade entre membros.', 0, 1),
(5099, 4025, 'Promoção de fake news.', 0, 1),
(5100, 4025, 'Restrição de opiniões.', 0, 1),
(5101, 4026, 'Escuta ativa e respeito às opiniões.', 1, 1),
(5102, 4026, 'Ignorar contribuições dos colegas.', 0, 1),
(5103, 4026, 'Impor ideias sem diálogo.', 0, 1),
(5104, 4026, 'Foco apenas na discordância.', 0, 1),
(5105, 4027, 'Dificulta o contato profissional.', 0, 1),
(5106, 4027, 'Favorece contatos e parcerias.', 1, 1),
(5107, 4027, 'Inibe oportunidades.', 0, 1),
(5108, 4027, 'Aumenta o isolamento.', 0, 1),
(5109, 4028, 'A ausência total de regras.', 0, 1),
(5110, 4028, 'Moderação e regras claras.', 1, 1),
(5111, 4028, 'Permitir ofensas pessoais.', 0, 1),
(5112, 4028, 'Bloquear todos os participantes.', 0, 1),
(5113, 4029, 'Facebook apenas.', 0, 1),
(5114, 4029, 'ResearchGate e fóruns universitários.', 1, 1),
(5115, 4029, 'Portais de comércio eletrônico.', 0, 1),
(5116, 4029, 'Apenas jornais impressos.', 0, 1),
(5117, 4030, 'Dificultam publicações.', 0, 1),
(5118, 4030, 'Estimula ideias, pesquisas e coautorias.', 1, 1),
(5119, 4030, 'Impedem produção científica.', 0, 1),
(5120, 4030, 'Focam só em conversas informais.', 0, 1),
(5121, 4031, 'Gerar fake news.', 0, 1),
(5122, 4031, 'Disseminar conhecimento e novidades.', 1, 1),
(5123, 4031, 'Promover apenas publicidade pessoal.', 0, 1),
(5124, 4031, 'Limitar o acesso à informação.', 0, 1),
(5125, 4032, 'Linguagem confusa e ausência de fontes.', 0, 1),
(5126, 4032, 'Clareza, fundamentação e referências.', 1, 1),
(5127, 4032, 'Textos longos sem revisão.', 0, 1),
(5128, 4032, 'Conteúdo sem atualização.', 0, 1),
(5129, 4033, 'Citar fontes confiáveis e revisar dados.', 1, 1),
(5130, 4033, 'Publicar sem conferir informações.', 0, 1),
(5131, 4033, 'Inventar estatísticas.', 0, 1),
(5132, 4033, 'Usar opiniões pessoais sem referências.', 0, 1),
(5133, 4034, 'Facilita o entendimento por todos os públicos.', 1, 1),
(5134, 4034, 'Restringe o acesso de leigos.', 0, 1),
(5135, 4034, 'Complica a informação.', 0, 1),
(5136, 4034, 'Impede a compreensão.', 0, 1),
(5137, 4035, 'Mantém o canal relevante e informativo.', 1, 1),
(5138, 4035, 'Desestimula o público.', 0, 1),
(5139, 4035, 'Reduz o interesse dos leitores.', 0, 1),
(5140, 4035, 'Desatualiza os conteúdos.', 0, 1),
(5141, 4036, 'Respeitar privacidade e citar fontes.', 1, 1),
(5142, 4036, 'Ignorar direitos autorais.', 0, 1),
(5143, 4036, 'Divulgar informações confidenciais.', 0, 1),
(5144, 4036, 'Fazer cópia integral de outros blogs.', 0, 1),
(5145, 4037, 'Usar imagens sem autorização.', 0, 1),
(5146, 4037, 'Utilizar imagens autorizadas e ilustrativas.', 1, 1),
(5147, 4037, 'Divulgar fotos de pacientes sem consentimento.', 0, 1),
(5148, 4037, 'Incluir imagens não relacionadas.', 0, 1),
(5149, 4038, 'Técnicas para melhorar ranking de busca.', 1, 1),
(5150, 4038, 'Sigla para redes sociais.', 0, 1),
(5151, 4038, 'Ferramenta de edição de imagens.', 0, 1),
(5152, 4038, 'Nada relacionado a blogs.', 0, 1),
(5153, 4039, 'Permitir ofensas e fake news.', 0, 1),
(5154, 4039, 'Moderá-los para garantir respeito.', 1, 1),
(5155, 4039, 'Ignorar completamente.', 0, 1),
(5156, 4039, 'Responder com agressividade.', 0, 1),
(5157, 4040, 'Para mostrar credibilidade e embasamento.', 1, 1),
(5158, 4040, 'Para encher espaço.', 0, 1),
(5159, 4040, 'Para confundir o leitor.', 0, 1),
(5160, 4040, 'Para ocultar fontes reais.', 0, 1),
(5161, 4041, 'Curtidas em postagens públicas.', 0, 1),
(5162, 4041, 'Busca avançada de perfis e mensagens diretas personalizadas.', 1, 1),
(5163, 4041, 'Compartilhamento de memes.', 0, 1),
(5164, 4041, 'Enviar convites aleatórios.', 0, 1),
(5165, 4042, 'Número de seguidores.', 0, 1),
(5166, 4042, 'RG Score, citações e engajamento em discussões.', 1, 1),
(5167, 4042, 'Quantidade de fotos no perfil.', 0, 1),
(5168, 4042, 'Atividades em grupos fechados.', 0, 1),
(5169, 4043, 'Comentar em postagens locais apenas.', 0, 1),
(5170, 4043, 'Participação ativa em webinários e fóruns multilíngues.', 1, 1),
(5171, 4043, 'Aguardar convites de terceiros.', 0, 1),
(5172, 4043, 'Solicitar recomendações automáticas.', 0, 1),
(5173, 4044, 'LinkedIn.', 0, 1),
(5174, 4044, 'ORCID.', 1, 1),
(5175, 4044, 'Instagram.', 0, 1),
(5176, 4044, 'Telegram.', 0, 1),
(5177, 4045, 'Distribuem tudo igualmente a todos.', 0, 1),
(5178, 4045, 'Priorizam posts com engajamento e palavras-chave.', 1, 1),
(5179, 4045, 'Só mostram conteúdo para o autor.', 0, 1),
(5180, 4045, 'Depende apenas do horário da postagem.', 0, 1),
(5181, 4046, 'Compartilhar prontuários livremente.', 0, 1),
(5182, 4046, 'Restringir dados pessoais e analisar políticas de privacidade.', 1, 1),
(5183, 4046, 'Adicionar todos ao grupo sem consentimento.', 0, 1),
(5184, 4046, 'Postar CPF e endereço.', 0, 1),
(5185, 4047, 'Lista de e-mails para marketing.', 0, 1),
(5186, 4047, 'Grupo temático organizado de pesquisadores.', 1, 1),
(5187, 4047, 'Conjunto de senhas compartilhadas.', 0, 1),
(5188, 4047, 'Banco de imagens.', 0, 1),
(5189, 4048, 'Google Docs.', 0, 1),
(5190, 4048, 'Altmetric.', 1, 1),
(5191, 4048, 'Instagram Analytics.', 0, 1),
(5192, 4048, 'Whatsapp Web.', 0, 1),
(5193, 4049, 'Participar só de grupos locais.', 0, 1),
(5194, 4049, 'Buscar diversidade de fontes e perspectivas.', 1, 1),
(5195, 4049, 'Bloquear todos que discordam.', 0, 1),
(5196, 4049, 'Evitar eventos multilíngues.', 0, 1),
(5197, 4050, 'Apenas assistir sem interagir.', 0, 1),
(5198, 4050, 'Participar ativamente e manter contato pós-evento.', 1, 1),
(5199, 4050, 'Evitar networking com desconhecidos.', 0, 1),
(5200, 4050, 'Pedir emprego no chat geral.', 0, 1),
(5201, 4051, 'B2B vende para empresas, B2C para consumidores finais.', 1, 1),
(5202, 4051, 'Ambos vendem só para o governo.', 0, 1),
(5203, 4051, 'B2B só serve para grandes hospitais.', 0, 1),
(5204, 4051, 'B2C só existe em planos de saúde.', 0, 1),
(5205, 4052, 'Processos regulatórios da ANVISA.', 1, 1),
(5206, 4052, 'Aprovação exclusiva do CREFITO.', 0, 1),
(5207, 4052, 'Falta de servidores públicos.', 0, 1),
(5208, 4052, 'Exigência de capital estrangeiro.', 0, 1),
(5209, 4053, 'Startups que aplicam tecnologia à saúde.', 1, 1),
(5210, 4053, 'Empresas tradicionais de equipamentos.', 0, 1),
(5211, 4053, 'Planos de saúde convencionais.', 0, 1),
(5212, 4053, 'ONGs de saúde pública.', 0, 1),
(5213, 4054, 'Lean Startup com MVP.', 1, 1),
(5214, 4054, 'Planejamento tradicional sem testes.', 0, 1),
(5215, 4054, 'Teste clínico randomizado obrigatório.', 0, 1),
(5216, 4054, 'Crescimento só após certificação total.', 0, 1),
(5217, 4055, 'Participando de programas de aceleração e fundos de VC.', 1, 1),
(5218, 4055, 'Focando apenas em recursos próprios.', 0, 1),
(5219, 4055, 'Aguardando convites governamentais.', 0, 1),
(5220, 4055, 'Vendendo somente para familiares.', 0, 1),
(5221, 4056, 'Troca eficiente e segura de dados entre sistemas.', 1, 1),
(5222, 4056, 'Troca de recursos humanos.', 0, 1),
(5223, 4056, 'Intercâmbio de equipamentos.', 0, 1),
(5224, 4056, 'Gestão apenas de estoque.', 0, 1),
(5225, 4057, 'Registro de patente.', 1, 1),
(5226, 4057, 'Contrato de aluguel.', 0, 1),
(5227, 4057, 'Alvará de funcionamento.', 0, 1),
(5228, 4057, 'Certificado de conclusão do curso.', 0, 1),
(5229, 4058, 'Adequação à LGPD e segurança de dados.', 1, 1),
(5230, 4058, 'Distribuição de brindes físicos.', 0, 1),
(5231, 4058, 'Vendas diretas sem contrato.', 0, 1),
(5232, 4058, 'Envio de panfletos por correio.', 0, 1),
(5233, 4059, 'Mudar a direção do negócio após testes.', 1, 1),
(5234, 4059, 'Aumentar o investimento sem planejamento.', 0, 1),
(5235, 4059, 'Contratar equipe sem critério.', 0, 1),
(5236, 4059, 'Reduzir funcionalidades ao máximo.', 0, 1),
(5237, 4060, 'Reduz riscos legais e assegura conformidade.', 1, 1),
(5238, 4060, 'Serve apenas para marketing.', 0, 1),
(5239, 4060, 'Facilita cortes de custos ilegais.', 0, 1),
(5240, 4060, 'Isenta de regras fiscais.', 0, 1),
(5241, 4061, 'Potenciação de longa duração (LTP)', 1, 1),
(5242, 4061, 'Neurogênese', 0, 1),
(5243, 4061, 'Potencial de ação reverso', 0, 1),
(5244, 4061, 'Migração neuronal', 0, 1),
(5245, 4062, 'Córtex cerebral', 1, 1),
(5246, 4062, 'Hipotálamo', 0, 1),
(5247, 4062, 'Hipófise', 0, 1),
(5248, 4062, 'Nervo vago', 0, 1),
(5249, 4063, 'Aumento de receptores AMPA na membrana', 1, 1),
(5250, 4063, 'Redução de canais de cálcio', 0, 1),
(5251, 4063, 'Inativação dos canais de sódio', 0, 1),
(5252, 4063, 'Diminuição do glutamato', 0, 1),
(5253, 4064, 'Exercício físico regular', 1, 1),
(5254, 4064, 'Fome prolongada', 0, 1),
(5255, 4064, 'Baixa exposição sensorial', 0, 1),
(5256, 4064, 'Privação de sono crônica', 0, 1),
(5257, 4065, 'Eliminação seletiva de sinapses pouco usadas', 1, 1),
(5258, 4065, 'Multiplicação indiscriminada de axônios', 0, 1),
(5259, 4065, 'Formação espontânea de glias', 0, 1),
(5260, 4065, 'Ativação de microglia para apoptose global', 0, 1),
(5261, 4066, 'Sobrevivência e plasticidade de neurônios', 1, 1),
(5262, 4066, 'Degradação de dopamina', 0, 1),
(5263, 4066, 'Formação de mielina exclusiva', 0, 1),
(5264, 4066, 'Inibição de conexões sinápticas', 0, 1),
(5265, 4067, 'Permite reorganização cortical e recuperação funcional', 1, 1),
(5266, 4067, 'Impossibilita recuperação', 0, 1),
(5267, 4067, 'Depende apenas de medicamentos', 0, 1),
(5268, 4067, 'Induz degeneração neuronal', 0, 1),
(5269, 4068, 'Infância', 1, 1),
(5270, 4068, 'Idade adulta', 0, 1),
(5271, 4068, 'Velhice', 0, 1),
(5272, 4068, 'A partir dos 80 anos', 0, 1),
(5273, 4069, 'Formação de neurônios no hipocampo', 1, 1),
(5274, 4069, 'Multiplicação de oligodendrócitos no cerebelo', 0, 1),
(5275, 4069, 'Produção de axônios no córtex pré-frontal', 0, 1),
(5276, 4069, 'Proliferação de glias na retina', 0, 1),
(5277, 4070, 'Reduz plasticidade e pode causar atrofia funcional', 1, 1),
(5278, 4070, 'Aumenta a neurogênese ilimitada', 0, 1),
(5279, 4070, 'Não tem efeito sobre o cérebro', 0, 1),
(5280, 4070, 'Induz apenas relaxamento', 0, 1),
(5281, 4071, 'Distrofias musculares e doenças neuromusculares', 1, 1),
(5282, 4071, 'Artrite reumatoide', 0, 1),
(5283, 4071, 'Osteoporose', 0, 1),
(5284, 4071, 'Síndrome de Down', 0, 1),
(5285, 4072, 'Função motora fina e manipulação', 1, 1),
(5286, 4072, 'Marcha e equilíbrio', 0, 1),
(5287, 4072, 'Respiração', 0, 1),
(5288, 4072, 'Comunicação verbal', 0, 1),
(5289, 4073, 'Déficit cognitivo grave', 1, 1),
(5290, 4073, 'Alteração de fala leve', 0, 1),
(5291, 4073, 'Dificuldade visual corrigida', 0, 1),
(5292, 4073, 'Hipertensão controlada', 0, 1),
(5293, 4074, 'Dificuldade severa em manipular objetos', 1, 1),
(5294, 4074, 'Comprometimento de linguagem', 0, 1),
(5295, 4074, 'Déficit respiratório isolado', 0, 1),
(5296, 4074, 'Alteração apenas em marcha', 0, 1),
(5297, 4075, 'Existem versões e tarefas adaptadas para cada idade', 1, 1),
(5298, 4075, 'A escala é igual para todos', 0, 1),
(5299, 4075, 'Só adultos podem ser avaliados', 0, 1),
(5300, 4075, 'Só avalia de 0 a 2 anos', 0, 1),
(5301, 4076, 'Treinamento padronizado dos avaliadores', 1, 1),
(5302, 4076, 'Autoavaliação do paciente', 0, 1),
(5303, 4076, 'Atribuição de escores aleatórios', 0, 1),
(5304, 4076, 'Avaliação por familiares', 0, 1),
(5305, 4077, 'Reduz desempenho e pode gerar falsos negativos', 1, 1),
(5306, 4077, 'Aumenta desempenho global', 0, 1),
(5307, 4077, 'Não interfere nos resultados', 0, 1),
(5308, 4077, 'Facilita execução das tarefas', 0, 1),
(5309, 4078, 'Garante resultados comparáveis e confiáveis', 1, 1),
(5310, 4078, 'Estimula distrações voluntárias', 0, 1),
(5311, 4078, 'Aumenta variabilidade dos escores', 0, 1),
(5312, 4078, 'É irrelevante para o teste', 0, 1),
(5313, 4079, 'Pegar e manipular pequenos objetos', 1, 1),
(5314, 4079, 'Avaliação da marcha', 0, 1),
(5315, 4079, 'Testes de força respiratória', 0, 1),
(5316, 4079, 'Comunicação não verbal', 0, 1),
(5317, 4080, 'Aumento progressivo dos escores', 1, 1),
(5318, 4080, 'Redução de aderência ao tratamento', 0, 1),
(5319, 4080, 'Estabilização dos sintomas sem mudança', 0, 1),
(5320, 4080, 'Diminuição do interesse na avaliação', 0, 1),
(5321, 4081, 'Estabelecimento de vínculo e confiança mútua', 1, 1),
(5322, 4081, 'Repetição automática de tarefas', 0, 1),
(5323, 4081, 'Aplicação de técnicas sem interação', 0, 1),
(5324, 4081, 'Exclusão de comunicação não verbal', 0, 1),
(5325, 4082, 'Imposição unilateral de objetivos', 1, 1),
(5326, 4082, 'Colaboração nas decisões', 0, 1),
(5327, 4082, 'Empatia e escuta ativa', 0, 1),
(5328, 4082, 'Definição conjunta de metas', 0, 1),
(5329, 4083, 'Reforça empatia e confiança', 1, 1),
(5330, 4083, 'É irrelevante para a relação', 0, 1),
(5331, 4083, 'Deve ser ignorada', 0, 1),
(5332, 4083, 'Só atrapalha o vínculo', 0, 1),
(5333, 4084, 'Julgamentos prévios e falta de escuta', 1, 1),
(5334, 4084, 'Demonstrar empatia', 0, 1),
(5335, 4084, 'Respeito às diferenças', 0, 1),
(5336, 4084, 'Tempo adequado para ouvir', 0, 1),
(5337, 4085, 'Aumenta engajamento e autonomia', 1, 1),
(5338, 4085, 'Reduz a confiança do paciente', 0, 1),
(5339, 4085, 'Impedimento à adesão', 0, 1),
(5340, 4085, 'Desestimula participação', 0, 1),
(5341, 4086, 'Escuta ativa e validação de sentimentos', 1, 1),
(5342, 4086, 'Ignorar relatos pessoais', 0, 1),
(5343, 4086, 'Respostas automáticas e frias', 0, 1),
(5344, 4086, 'Evitar contato visual', 0, 1),
(5345, 4087, 'Confiança, comunicação clara e respeito', 1, 1),
(5346, 4087, 'Formalidade excessiva', 0, 1),
(5347, 4087, 'Controle unilateral', 0, 1),
(5348, 4087, 'Distanciamento emocional', 0, 1),
(5349, 4088, 'Favorece expressão livre e profundidade', 1, 1),
(5350, 4088, 'Restringe respostas do paciente', 0, 1),
(5351, 4088, 'Aumenta ansiedade', 0, 1),
(5352, 4088, 'Complica o vínculo terapêutico', 0, 1),
(5353, 4089, 'Faltas e resistência ao diálogo', 1, 1),
(5354, 4089, 'Interesse crescente pela terapia', 0, 1),
(5355, 4089, 'Aproximação afetiva saudável', 0, 1),
(5356, 4089, 'Alinhamento de expectativas', 0, 1),
(5357, 4090, 'Atenção genuína e adaptação ao paciente', 1, 1),
(5358, 4090, 'Roteiro rígido de perguntas', 0, 1),
(5359, 4090, 'Foco apenas em protocolos padronizados', 0, 1),
(5360, 4090, 'Monólogo do terapeuta', 0, 1),
(5361, 4091, 'Adaptação ambiental e rotinas estruturadas', 1, 1),
(5362, 4091, 'Restringir todas as atividades', 0, 1),
(5363, 4091, 'Isolamento do idoso', 0, 1),
(5364, 4091, 'Apenas intervenção medicamentosa', 0, 1),
(5365, 4092, 'Personalizada à história e rotina do idoso', 1, 1),
(5366, 4092, 'Baseada só em tarefas genéricas', 0, 1),
(5367, 4092, 'Focada em memorização repetitiva', 0, 1),
(5368, 4092, 'Sem relação com a vida do paciente', 0, 1),
(5369, 4093, 'Guia intervenções e evita restrições excessivas', 1, 1),
(5370, 4093, 'É apenas uma formalidade', 0, 1),
(5371, 4093, 'Substitui avaliação médica', 0, 1),
(5372, 4093, 'Serve só para fins legais', 0, 1),
(5373, 4094, 'Reduz ansiedade e respeita sentimentos presentes', 1, 1),
(5374, 4094, 'Reforça delírios e alucinações', 0, 1),
(5375, 4094, 'Impede expressão emocional', 0, 1),
(5376, 4094, 'Aumenta agitação', 0, 1),
(5377, 4095, 'Avaliar e adaptar o ambiente físico', 1, 1),
(5378, 4095, 'Proibir todas as caminhadas', 0, 1),
(5379, 4095, 'Usar apenas contenções físicas', 0, 1),
(5380, 4095, 'Orientar repouso absoluto', 0, 1),
(5381, 4096, 'Preferências e história de vida', 1, 1),
(5382, 4096, 'Apenas sintomas comportamentais', 0, 1),
(5383, 4096, 'Protocolos rígidos para todos', 0, 1),
(5384, 4096, 'Exclusivamente orientação à família', 0, 1),
(5385, 4097, 'Reabilita funções específicas x mantém capacidades', 1, 1),
(5386, 4097, 'Ambas são idênticas', 0, 1),
(5387, 4097, 'Estimulação só usa música', 0, 1),
(5388, 4097, 'Reabilitação é sempre farmacológica', 0, 1),
(5389, 4098, 'Reduzem confusão e facilitam engajamento', 1, 1),
(5390, 4098, 'Aumentam dependência', 0, 1),
(5391, 4098, 'Desestimulam a autonomia', 0, 1),
(5392, 4098, 'Causam tédio ao paciente', 0, 1),
(5393, 4099, 'Estimula memória e autoestima', 1, 1),
(5394, 4099, 'Só servem para passar o tempo', 0, 1),
(5395, 4099, 'Impedem o convívio social', 0, 1),
(5396, 4099, 'São irrelevantes para idosos', 0, 1),
(5397, 4100, 'Participar, ser informada e capacitada', 1, 1),
(5398, 4100, 'Evitar envolvimento no cuidado', 0, 1),
(5399, 4100, 'Tomar decisões sem o paciente', 0, 1),
(5400, 4100, 'Ignorar orientações dos profissionais', 0, 1),
(5401, 4101, 'Informações sobre saúde, biometria e genética', 1, 1),
(5402, 4101, 'Endereço residencial apenas', 0, 1),
(5403, 4101, 'Notas de consulta', 0, 1),
(5404, 4101, 'Nome do paciente', 0, 1),
(5405, 4102, 'Consentimento explícito do paciente', 1, 1),
(5406, 4102, 'Consentimento verbal sem registro', 0, 1),
(5407, 4102, 'Ordem do profissional', 0, 1),
(5408, 4102, 'Uso para marketing direto', 0, 1),
(5409, 4103, 'Criptografia e acesso restrito', 1, 1),
(5410, 4103, 'Backups abertos na nuvem', 0, 1),
(5411, 4103, 'Envio por e-mail sem senha', 0, 1),
(5412, 4103, 'Armazenamento em computadores pessoais', 0, 1),
(5413, 4104, 'Divulgação sem autorização', 1, 1),
(5414, 4104, 'Acesso restrito por senha', 0, 1),
(5415, 4104, 'Backup criptografado', 0, 1),
(5416, 4104, 'Consentimento registrado', 0, 1),
(5417, 4105, 'Com consentimento explícito e registrado', 1, 1),
(5418, 4105, 'Sem qualquer comunicação prévia', 0, 1),
(5419, 4105, 'Apenas decisão do terapeuta', 0, 1),
(5420, 4105, 'Sempre que o sistema gravar automaticamente', 0, 1),
(5421, 4106, 'Profissional e empresa prestadora', 1, 1),
(5422, 4106, 'Somente ao paciente', 0, 1),
(5423, 4106, 'Ao desenvolvedor do software', 0, 1),
(5424, 4106, 'Ninguém é responsável', 0, 1),
(5425, 4107, 'Firewall, atualização e treinamento', 1, 1),
(5426, 4107, 'Utilizar softwares sem suporte', 0, 1),
(5427, 4107, 'Permitir acessos irrestritos', 0, 1),
(5428, 4107, 'Salvar senhas em bloco de notas', 0, 1),
(5429, 4108, 'A clínica ou profissional responsável', 1, 1),
(5430, 4108, 'O paciente', 0, 1),
(5431, 4108, 'A Anvisa', 0, 1),
(5432, 4108, 'O provedor de internet', 0, 1),
(5433, 4109, 'Multas e proibição de atividades', 1, 1),
(5434, 4109, 'Promoção automática do responsável', 0, 1),
(5435, 4109, 'Nada acontece', 0, 1),
(5436, 4109, 'Prêmio por inovação', 0, 1),
(5437, 4110, 'Tornar impossível identificar o titular dos dados', 1, 1),
(5438, 4110, 'Divulgar resultados nominais', 0, 1),
(5439, 4110, 'Criptografar apenas durante o envio', 0, 1),
(5440, 4110, 'Excluir todas as informações do sistema', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tags`
--

CREATE TABLE `tags` (
  `id_tag` int(11) NOT NULL,
  `nome_tag` varchar(100) NOT NULL,
  `slug_tag` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `utilizadores`
--

CREATE TABLE `utilizadores` (
  `id_utilizador` int(11) NOT NULL,
  `nome_completo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `palavra_passe` varchar(255) NOT NULL,
  `profissao` varchar(100) DEFAULT NULL,
  `crefito` varchar(50) DEFAULT NULL,
  `avatar_url` varchar(512) DEFAULT NULL,
  `funcao` enum('utilizador','administrador') NOT NULL DEFAULT 'utilizador',
  `id_plano_assinatura_ativo` int(11) DEFAULT NULL,
  `status_sistema` enum('ativo','inativo') NOT NULL DEFAULT 'ativo',
  `data_registo` timestamp NULL DEFAULT current_timestamp(),
  `data_ultima_modificacao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `token_reset_passe` varchar(255) DEFAULT NULL,
  `data_expiracao_token_reset` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `utilizadores`
--

INSERT INTO `utilizadores` (`id_utilizador`, `nome_completo`, `email`, `palavra_passe`, `profissao`, `crefito`, `avatar_url`, `funcao`, `id_plano_assinatura_ativo`, `status_sistema`, `data_registo`, `data_ultima_modificacao`, `token_reset_passe`, `data_expiracao_token_reset`) VALUES
(1, 'AudioTO', 'admin@audioto.com.br', '$2y$10$poLZjbQET0GmtVy1wmkZfeoDKW/ZV879LBkOFHJZGE1SG/UFPhSbu', '', '', NULL, 'administrador', 1, 'ativo', '2025-05-16 01:55:10', '2025-06-05 22:16:53', NULL, NULL),
(26, 'Erick Tedros', 'ericktedros@gmail.com', '$2y$10$.SemO/mcfofJM6ly3oCpn.SBN1y7rswABB10tZia0NnS9Jw8tfUrK', NULL, NULL, NULL, 'utilizador', 2, 'ativo', '2025-05-25 04:36:45', '2025-05-31 02:14:57', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `utilizador_pontos`
--

CREATE TABLE `utilizador_pontos` (
  `id_pontos` int(11) NOT NULL,
  `id_utilizador` int(11) NOT NULL,
  `pontos_totais` int(11) NOT NULL DEFAULT 0,
  `data_ultima_atividade` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `utilizador_pontos`
--

INSERT INTO `utilizador_pontos` (`id_pontos`, `id_utilizador`, `pontos_totais`, `data_ultima_atividade`) VALUES
(1, 1, 202, '2025-06-12 01:13:18');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `assinaturas_utilizador`
--
ALTER TABLE `assinaturas_utilizador`
  ADD PRIMARY KEY (`id_assinatura`),
  ADD KEY `id_utilizador` (`id_utilizador`),
  ADD KEY `id_plano` (`id_plano`);

--
-- Índices de tabela `assuntos_podcast`
--
ALTER TABLE `assuntos_podcast`
  ADD PRIMARY KEY (`id_assunto`),
  ADD UNIQUE KEY `slug_assunto` (`slug_assunto`),
  ADD UNIQUE KEY `uq_slug_assunto` (`slug_assunto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Índices de tabela `audioto_emails`
--
ALTER TABLE `audioto_emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `avaliacoes_podcast`
--
ALTER TABLE `avaliacoes_podcast`
  ADD PRIMARY KEY (`id_avaliacao`),
  ADD UNIQUE KEY `idx_podcast_utilizador_avaliacao` (`id_podcast`,`id_utilizador`),
  ADD KEY `id_utilizador` (`id_utilizador`);

--
-- Índices de tabela `categorias_podcast`
--
ALTER TABLE `categorias_podcast`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nome_categoria` (`nome_categoria`),
  ADD UNIQUE KEY `slug_categoria` (`slug_categoria`);

--
-- Índices de tabela `comentarios_conteudo`
--
ALTER TABLE `comentarios_conteudo`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_utilizador` (`id_utilizador`),
  ADD KEY `id_comentario_pai` (`id_comentario_pai`);

--
-- Índices de tabela `comunidade_comentarios`
--
ALTER TABLE `comunidade_comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_post` (`id_post`),
  ADD KEY `id_utilizador` (`id_utilizador`);

--
-- Índices de tabela `comunidade_curtidas`
--
ALTER TABLE `comunidade_curtidas`
  ADD PRIMARY KEY (`id_like`),
  ADD UNIQUE KEY `uniq_post_user` (`id_post`,`id_utilizador`),
  ADD KEY `id_utilizador` (`id_utilizador`);

--
-- Índices de tabela `comunidade_posts`
--
ALTER TABLE `comunidade_posts`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `id_utilizador` (`id_utilizador`);

--
-- Índices de tabela `configuracoes_smtp`
--
ALTER TABLE `configuracoes_smtp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `descricao_unique` (`descricao`);

--
-- Índices de tabela `curtidas_conteudo`
--
ALTER TABLE `curtidas_conteudo`
  ADD PRIMARY KEY (`id_curtida`),
  ADD UNIQUE KEY `uq_utilizador_curtida_conteudo` (`id_utilizador`,`tipo_conteudo`,`id_conteudo`);

--
-- Índices de tabela `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id_favorito`),
  ADD UNIQUE KEY `uq_utilizador_conteudo_favorito` (`id_utilizador`,`tipo_conteudo`,`id_conteudo`);

--
-- Índices de tabela `favoritos_oportunidade`
--
ALTER TABLE `favoritos_oportunidade`
  ADD PRIMARY KEY (`id_favorito`),
  ADD UNIQUE KEY `id_utilizador` (`id_utilizador`,`id_oportunidade`);

--
-- Índices de tabela `fila_reproducao_utilizador`
--
ALTER TABLE `fila_reproducao_utilizador`
  ADD PRIMARY KEY (`id_fila`),
  ADD UNIQUE KEY `idx_utilizador_podcast_fila` (`id_utilizador`,`id_podcast`),
  ADD KEY `id_podcast` (`id_podcast`);

--
-- Índices de tabela `flashcards`
--
ALTER TABLE `flashcards`
  ADD PRIMARY KEY (`id_flashcard`),
  ADD KEY `idx_id_assunto` (`id_assunto`);

--
-- Índices de tabela `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id_noticia`),
  ADD UNIQUE KEY `slug_noticia_unique` (`slug_noticia`),
  ADD KEY `idx_data_publicacao` (`data_publicacao`),
  ADD KEY `idx_categoria_noticia` (`categoria_noticia`),
  ADD KEY `fk_noticias_utilizador` (`id_utilizador_autor`);

--
-- Índices de tabela `noticia_votos`
--
ALTER TABLE `noticia_votos`
  ADD PRIMARY KEY (`id_voto`),
  ADD UNIQUE KEY `uniq_noticia_user` (`id_noticia`,`id_utilizador`),
  ADD KEY `id_utilizador` (`id_utilizador`);

--
-- Índices de tabela `oportunidades`
--
ALTER TABLE `oportunidades`
  ADD PRIMARY KEY (`id_oportunidade`);

--
-- Índices de tabela `planos_assinatura`
--
ALTER TABLE `planos_assinatura`
  ADD PRIMARY KEY (`id_plano`);

--
-- Índices de tabela `podcasts`
--
ALTER TABLE `podcasts`
  ADD PRIMARY KEY (`id_podcast`),
  ADD UNIQUE KEY `slug_podcast` (`slug_podcast`),
  ADD KEY `id_assunto` (`id_assunto`),
  ADD KEY `id_plano_minimo` (`id_plano_minimo`);

--
-- Índices de tabela `podcast_tags`
--
ALTER TABLE `podcast_tags`
  ADD PRIMARY KEY (`id_podcast_tag`),
  ADD UNIQUE KEY `idx_podcast_tag_unique` (`id_podcast`,`id_tag`),
  ADD KEY `id_tag` (`id_tag`);

--
-- Índices de tabela `posicao_reproducao_utilizador`
--
ALTER TABLE `posicao_reproducao_utilizador`
  ADD PRIMARY KEY (`id_posicao`),
  ADD UNIQUE KEY `id_utilizador` (`id_utilizador`,`id_podcast`),
  ADD KEY `id_podcast` (`id_podcast`);

--
-- Índices de tabela `preferencias_notificacao`
--
ALTER TABLE `preferencias_notificacao`
  ADD PRIMARY KEY (`id_preferencia`),
  ADD UNIQUE KEY `id_utilizador` (`id_utilizador`);

--
-- Índices de tabela `quiz_perguntas`
--
ALTER TABLE `quiz_perguntas`
  ADD PRIMARY KEY (`id_pergunta`),
  ADD KEY `idx_id_assunto` (`id_assunto`);

--
-- Índices de tabela `quiz_respostas`
--
ALTER TABLE `quiz_respostas`
  ADD PRIMARY KEY (`id_resposta`),
  ADD KEY `idx_id_pergunta` (`id_pergunta`);

--
-- Índices de tabela `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id_tag`),
  ADD UNIQUE KEY `nome_tag` (`nome_tag`),
  ADD UNIQUE KEY `slug_tag` (`slug_tag`);

--
-- Índices de tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD PRIMARY KEY (`id_utilizador`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_utilizador_plano_ativo` (`id_plano_assinatura_ativo`);

--
-- Índices de tabela `utilizador_pontos`
--
ALTER TABLE `utilizador_pontos`
  ADD PRIMARY KEY (`id_pontos`),
  ADD UNIQUE KEY `idx_id_utilizador` (`id_utilizador`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `assinaturas_utilizador`
--
ALTER TABLE `assinaturas_utilizador`
  MODIFY `id_assinatura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `assuntos_podcast`
--
ALTER TABLE `assuntos_podcast`
  MODIFY `id_assunto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1517;

--
-- AUTO_INCREMENT de tabela `audioto_emails`
--
ALTER TABLE `audioto_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de tabela `avaliacoes_podcast`
--
ALTER TABLE `avaliacoes_podcast`
  MODIFY `id_avaliacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de tabela `categorias_podcast`
--
ALTER TABLE `categorias_podcast`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT de tabela `comentarios_conteudo`
--
ALTER TABLE `comentarios_conteudo`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `comunidade_comentarios`
--
ALTER TABLE `comunidade_comentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `comunidade_curtidas`
--
ALTER TABLE `comunidade_curtidas`
  MODIFY `id_like` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `comunidade_posts`
--
ALTER TABLE `comunidade_posts`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `configuracoes_smtp`
--
ALTER TABLE `configuracoes_smtp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `curtidas_conteudo`
--
ALTER TABLE `curtidas_conteudo`
  MODIFY `id_curtida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de tabela `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id_favorito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `favoritos_oportunidade`
--
ALTER TABLE `favoritos_oportunidade`
  MODIFY `id_favorito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fila_reproducao_utilizador`
--
ALTER TABLE `fila_reproducao_utilizador`
  MODIFY `id_fila` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `flashcards`
--
ALTER TABLE `flashcards`
  MODIFY `id_flashcard` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4134;

--
-- AUTO_INCREMENT de tabela `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id_noticia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `noticia_votos`
--
ALTER TABLE `noticia_votos`
  MODIFY `id_voto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `oportunidades`
--
ALTER TABLE `oportunidades`
  MODIFY `id_oportunidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de tabela `planos_assinatura`
--
ALTER TABLE `planos_assinatura`
  MODIFY `id_plano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `podcasts`
--
ALTER TABLE `podcasts`
  MODIFY `id_podcast` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `podcast_tags`
--
ALTER TABLE `podcast_tags`
  MODIFY `id_podcast_tag` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `posicao_reproducao_utilizador`
--
ALTER TABLE `posicao_reproducao_utilizador`
  MODIFY `id_posicao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=413;

--
-- AUTO_INCREMENT de tabela `preferencias_notificacao`
--
ALTER TABLE `preferencias_notificacao`
  MODIFY `id_preferencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `quiz_perguntas`
--
ALTER TABLE `quiz_perguntas`
  MODIFY `id_pergunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4111;

--
-- AUTO_INCREMENT de tabela `quiz_respostas`
--
ALTER TABLE `quiz_respostas`
  MODIFY `id_resposta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5441;

--
-- AUTO_INCREMENT de tabela `tags`
--
ALTER TABLE `tags`
  MODIFY `id_tag` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  MODIFY `id_utilizador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `utilizador_pontos`
--
ALTER TABLE `utilizador_pontos`
  MODIFY `id_pontos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `assinaturas_utilizador`
--
ALTER TABLE `assinaturas_utilizador`
  ADD CONSTRAINT `assinaturas_utilizador_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE,
  ADD CONSTRAINT `assinaturas_utilizador_ibfk_2` FOREIGN KEY (`id_plano`) REFERENCES `planos_assinatura` (`id_plano`);

--
-- Restrições para tabelas `assuntos_podcast`
--
ALTER TABLE `assuntos_podcast`
  ADD CONSTRAINT `assuntos_podcast_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_podcast` (`id_categoria`) ON DELETE CASCADE;

--
-- Restrições para tabelas `avaliacoes_podcast`
--
ALTER TABLE `avaliacoes_podcast`
  ADD CONSTRAINT `avaliacoes_podcast_ibfk_1` FOREIGN KEY (`id_podcast`) REFERENCES `podcasts` (`id_podcast`) ON DELETE CASCADE,
  ADD CONSTRAINT `avaliacoes_podcast_ibfk_2` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE;

--
-- Restrições para tabelas `comentarios_conteudo`
--
ALTER TABLE `comentarios_conteudo`
  ADD CONSTRAINT `comentarios_conteudo_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE,
  ADD CONSTRAINT `comentarios_conteudo_ibfk_2` FOREIGN KEY (`id_comentario_pai`) REFERENCES `comentarios_conteudo` (`id_comentario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `comunidade_comentarios`
--
ALTER TABLE `comunidade_comentarios`
  ADD CONSTRAINT `comunidade_comentarios_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `comunidade_posts` (`id_post`) ON DELETE CASCADE,
  ADD CONSTRAINT `comunidade_comentarios_ibfk_2` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE;

--
-- Restrições para tabelas `comunidade_curtidas`
--
ALTER TABLE `comunidade_curtidas`
  ADD CONSTRAINT `comunidade_curtidas_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `comunidade_posts` (`id_post`) ON DELETE CASCADE,
  ADD CONSTRAINT `comunidade_curtidas_ibfk_2` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE;

--
-- Restrições para tabelas `comunidade_posts`
--
ALTER TABLE `comunidade_posts`
  ADD CONSTRAINT `comunidade_posts_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE;

--
-- Restrições para tabelas `curtidas_conteudo`
--
ALTER TABLE `curtidas_conteudo`
  ADD CONSTRAINT `curtidas_conteudo_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE;

--
-- Restrições para tabelas `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE;

--
-- Restrições para tabelas `fila_reproducao_utilizador`
--
ALTER TABLE `fila_reproducao_utilizador`
  ADD CONSTRAINT `fila_reproducao_utilizador_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE,
  ADD CONSTRAINT `fila_reproducao_utilizador_ibfk_2` FOREIGN KEY (`id_podcast`) REFERENCES `podcasts` (`id_podcast`) ON DELETE CASCADE;

--
-- Restrições para tabelas `flashcards`
--
ALTER TABLE `flashcards`
  ADD CONSTRAINT `fk_flashcards_assunto` FOREIGN KEY (`id_assunto`) REFERENCES `assuntos_podcast` (`id_assunto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `fk_noticias_utilizador` FOREIGN KEY (`id_utilizador_autor`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para tabelas `noticia_votos`
--
ALTER TABLE `noticia_votos`
  ADD CONSTRAINT `noticia_votos_ibfk_1` FOREIGN KEY (`id_noticia`) REFERENCES `noticias` (`id_noticia`) ON DELETE CASCADE,
  ADD CONSTRAINT `noticia_votos_ibfk_2` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE;

--
-- Restrições para tabelas `podcasts`
--
ALTER TABLE `podcasts`
  ADD CONSTRAINT `podcasts_ibfk_1` FOREIGN KEY (`id_assunto`) REFERENCES `assuntos_podcast` (`id_assunto`) ON DELETE CASCADE,
  ADD CONSTRAINT `podcasts_ibfk_2` FOREIGN KEY (`id_plano_minimo`) REFERENCES `planos_assinatura` (`id_plano`) ON DELETE SET NULL;

--
-- Restrições para tabelas `podcast_tags`
--
ALTER TABLE `podcast_tags`
  ADD CONSTRAINT `podcast_tags_ibfk_1` FOREIGN KEY (`id_podcast`) REFERENCES `podcasts` (`id_podcast`) ON DELETE CASCADE,
  ADD CONSTRAINT `podcast_tags_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id_tag`) ON DELETE CASCADE;

--
-- Restrições para tabelas `posicao_reproducao_utilizador`
--
ALTER TABLE `posicao_reproducao_utilizador`
  ADD CONSTRAINT `posicao_reproducao_utilizador_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE,
  ADD CONSTRAINT `posicao_reproducao_utilizador_ibfk_2` FOREIGN KEY (`id_podcast`) REFERENCES `podcasts` (`id_podcast`) ON DELETE CASCADE;

--
-- Restrições para tabelas `preferencias_notificacao`
--
ALTER TABLE `preferencias_notificacao`
  ADD CONSTRAINT `preferencias_notificacao_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE;

--
-- Restrições para tabelas `quiz_perguntas`
--
ALTER TABLE `quiz_perguntas`
  ADD CONSTRAINT `fk_perguntas_assunto` FOREIGN KEY (`id_assunto`) REFERENCES `assuntos_podcast` (`id_assunto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `quiz_respostas`
--
ALTER TABLE `quiz_respostas`
  ADD CONSTRAINT `fk_respostas_pergunta` FOREIGN KEY (`id_pergunta`) REFERENCES `quiz_perguntas` (`id_pergunta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD CONSTRAINT `fk_utilizador_plano_ativo` FOREIGN KEY (`id_plano_assinatura_ativo`) REFERENCES `planos_assinatura` (`id_plano`) ON DELETE SET NULL;

--
-- Restrições para tabelas `utilizador_pontos`
--
ALTER TABLE `utilizador_pontos`
  ADD CONSTRAINT `fk_pontos_utilizador` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
