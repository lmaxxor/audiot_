<?php
require_once __DIR__ . '/../db/db_connect.php';
require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/includes/asaas-pix.php';
require_once __DIR__ . '/includes/asaas-card.php';

$logFile = __DIR__ . '/webhook_asaas.log';
function log_msg($msg) {
    global $logFile;
    file_put_contents($logFile, '['.date('Y-m-d H:i:s')."] " . $msg . "\n", FILE_APPEND);
}

$payload = file_get_contents('php://input');
log_msg('Payload: ' . $payload);
$data = json_decode($payload, true);
if (!$data) {
    http_response_code(400);
    echo json_encode(['error' => 'JSON invalido']);
    exit;
}
$paymentId = $data['payment']['id'] ?? ($data['paymentId'] ?? ($data['id'] ?? null));
if (!$paymentId) {
    http_response_code(400);
    echo json_encode(['error' => 'ID do pagamento nao encontrado']);
    exit;
}
try {
    $asaas = AsaasPix::getInstance();
    $status = $asaas->checkPayment((string)$paymentId);
    log_msg('Status API: ' . json_encode($status));
    if ($status && isset($status['status']) && strtoupper($status['status']) === 'RECEIVED') {
        $pdo->beginTransaction();
        $stmt = $pdo->prepare("SELECT a.*, p.preco_mensal, p.preco_anual FROM assinaturas_utilizador a JOIN planos_assinatura p ON a.id_plano = p.id_plano WHERE a.id_transacao_gateway = ? AND a.estado_assinatura = 'pendente_pagamento'");
        $stmt->execute([$paymentId]);
        $assinatura = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($assinatura) {
            $id_plano = $assinatura['id_plano'];
            $id_user = $assinatura['id_utilizador'];
            $data_inicio = new DateTime();
            $intervalo = (!empty($assinatura['preco_anual']) && (float)$assinatura['preco_anual'] > 0) ? 'P1Y' : 'P1M';
            $data_prox = clone $data_inicio;
            $data_prox->add(new DateInterval($intervalo));
            $data_fim = clone $data_prox;
            $up = $pdo->prepare("UPDATE assinaturas_utilizador SET estado_assinatura='ativa', data_inicio=?, data_fim=?, data_proxima_cobranca=? WHERE id_assinatura=?");
            $up->execute([
                $data_inicio->format('Y-m-d H:i:s'),
                $data_fim->format('Y-m-d H:i:s'),
                $data_prox->format('Y-m-d H:i:s'),
                $assinatura['id_assinatura']
            ]);
            $up2 = $pdo->prepare("UPDATE utilizadores SET id_plano_assinatura_ativo=? WHERE id_utilizador=?");
            $up2->execute([$id_plano, $id_user]);
            $pdo->commit();
            log_msg('Assinatura ' . $assinatura['id_assinatura'] . ' ativada');
        } else {
            $pdo->rollBack();
            log_msg('Assinatura pendente nao encontrada para ' . $paymentId);
        }
    }
    http_response_code(200);
    echo json_encode(['success' => true]);
} catch (Exception $e) {
    log_msg('Erro: ' . $e->getMessage());
    http_response_code(500);
    echo json_encode(['error' => 'Erro interno']);
}

