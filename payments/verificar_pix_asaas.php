<?php
require_once __DIR__ . '/../sessao/session_handler.php';
require_once __DIR__ . '/../db/db_connect.php';
requireLogin();
require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/includes/asaas-pix.php';

header('Content-Type: application/json');

$txid = $_GET['txid'] ?? null;
$id_utilizador = $_SESSION['user_id'] ?? null;

if (!$txid) {
    echo json_encode(['success' => false, 'message' => 'ID não fornecido.']);
    exit;
}
if (!$id_utilizador) {
    echo json_encode(['success' => false, 'message' => 'Sessão inválida.']);
    exit;
}

try {
    $asaas = AsaasPix::getInstance();
    $statusResponse = $asaas->checkPayment((string)$txid);
    if ($statusResponse && isset($statusResponse['status'])) {
        $isPaid = strtoupper($statusResponse['status']) === 'RECEIVED';
        if ($isPaid) {
            $pdo->beginTransaction();
            try {
                $stmtAssinatura = $pdo->prepare("SELECT a.*, p.preco_mensal, p.preco_anual FROM assinaturas_utilizador a JOIN planos_assinatura p ON a.id_plano = p.id_plano WHERE a.id_transacao_gateway = ? AND a.id_utilizador = ? AND a.estado_assinatura = 'pendente_pagamento'");
                $stmtAssinatura->execute([$txid, $id_utilizador]);
                $assinatura = $stmtAssinatura->fetch(PDO::FETCH_ASSOC);
                if ($assinatura) {
                    $id_plano_pago = $assinatura['id_plano'];
                    $data_inicio = new DateTime();
                    if (!empty($assinatura['preco_anual']) && (float)$assinatura['preco_anual'] > 0) {
                        $intervalo = 'P1Y';
                    } else {
                        $intervalo = 'P1M';
                    }
                    $data_proxima_cobranca = clone $data_inicio;
                    $data_proxima_cobranca->add(new DateInterval($intervalo));
                    $data_fim = clone $data_proxima_cobranca;
                    $stmtUpdateAssinatura = $pdo->prepare("UPDATE assinaturas_utilizador SET estado_assinatura = 'ativa', data_inicio = ?, data_fim = ?, data_proxima_cobranca = ? WHERE id_assinatura = ?");
                    $stmtUpdateAssinatura->execute([
                        $data_inicio->format('Y-m-d H:i:s'),
                        $data_fim->format('Y-m-d H:i:s'),
                        $data_proxima_cobranca->format('Y-m-d H:i:s'),
                        $assinatura['id_assinatura']
                    ]);
                    $stmtUpdateUtilizador = $pdo->prepare("UPDATE utilizadores SET id_plano_assinatura_ativo = ? WHERE id_utilizador = ?");
                    $stmtUpdateUtilizador->execute([$id_plano_pago, $id_utilizador]);
                    $_SESSION['user_plano_id'] = $id_plano_pago;
                    $pdo->commit();
                } else {
                    $pdo->rollBack();
                }
            } catch (Exception $dbEx) {
                $pdo->rollBack();
                error_log('Erro DB verificar_pix_asaas: ' . $dbEx->getMessage());
            }
        }
        echo json_encode([
            'success' => true,
            'status' => $statusResponse['status'],
            'isPaid' => $isPaid,
            'details' => $statusResponse,
        ]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Falha ao consultar pagamento.']);
    }
} catch (Exception $e) {
    error_log('Erro verificar_pix_asaas: ' . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Erro ao verificar Pix: ' . $e->getMessage()]);
}
