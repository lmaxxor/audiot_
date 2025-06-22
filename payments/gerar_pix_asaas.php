<?php
require_once __DIR__ . '/../sessao/session_handler.php';
require_once __DIR__ . '/../db/db_connect.php';
requireLogin();
require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/includes/asaas-pix.php';

header('Content-Type: application/json');

$id_utilizador = $_SESSION['user_id'] ?? null;
if (!$id_utilizador) {
    echo json_encode(['success' => false, 'message' => 'Sessão de usuário inválida.']);
    exit;
}

$amount_str = $_POST['amount'] ?? null;
$cpf_pagador = $_POST['cpf'] ?? null;
$nome_pagador = $_POST['nome'] ?? $_SESSION['user_nome_completo'] ?? 'Comprador AudioTO';
$id_plano = $_POST['planId'] ?? null;

if (!$amount_str || !$cpf_pagador || !$nome_pagador || !$id_plano || !is_numeric($amount_str) || (float)$amount_str <= 0) {
    echo json_encode(['success' => false, 'message' => 'Dados inválidos para gerar Pix.']);
    exit;
}

$amount = (float)$amount_str;
$cpf_pagador = preg_replace('/[^0-9]/', '', $cpf_pagador);

$pdo->beginTransaction();
try {
    $stmt = $pdo->prepare("INSERT INTO assinaturas_utilizador (id_utilizador, id_plano, data_inicio, estado_assinatura) VALUES (?, ?, NOW(), 'pendente_pagamento')");
    $stmt->execute([$id_utilizador, $id_plano]);
    $id_assinatura_criada = $pdo->lastInsertId();
    if (!$id_assinatura_criada) {
        throw new Exception('Falha ao registrar assinatura.');
    }

    $additionalInfoPayload = [
        'Produto' => 'Plano AudioTO (ID Plano: ' . $id_plano . ')',
        'Cliente' => $nome_pagador,
        'CPF_Cliente' => $cpf_pagador,
        'ID_Assinatura_Interna' => (string)$id_assinatura_criada
    ];

    $asaas = AsaasPix::getInstance();
    $pixResponse = $asaas->createImmediateCharge((string)$amount, (string)$cpf_pagador, (string)$nome_pagador, $additionalInfoPayload);

    $paymentId = $pixResponse['id'] ?? null;
    if (!$paymentId) {
        throw new Exception('Resposta da API Asaas inválida.');
    }

    $stmt = $pdo->prepare("UPDATE assinaturas_utilizador SET id_transacao_gateway = ? WHERE id_assinatura = ?");
    $stmt->execute([$paymentId, $id_assinatura_criada]);

    $qrCodeImage = $asaas->getPixQrCode($pixResponse);
    $pixCopiaECola = $pixResponse['payload'] ?? null;
    if (!$qrCodeImage || !$pixCopiaECola) {
        throw new Exception('Não foi possível obter QR Code do Asaas.');
    }

    $pdo->commit();

    echo json_encode([
        'success' => true,
        'txid' => $paymentId,
        'qrCodeImageUrl' => $qrCodeImage,
        'pixCopiaECola' => $pixCopiaECola,
        'status' => $pixResponse['status'] ?? 'PENDING',
        'id_assinatura' => $id_assinatura_criada
    ]);
} catch (Exception $e) {
    $pdo->rollBack();
    error_log('Erro em gerar_pix_asaas.php: ' . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Erro ao gerar Pix: ' . $e->getMessage()]);
}
