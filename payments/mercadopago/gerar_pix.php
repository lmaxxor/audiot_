<?php
require_once __DIR__ . '/../../sessao/session_handler.php';
require_once __DIR__ . '/../../db/db_connect.php';
requireLogin();

header('Content-Type: application/json');

$idUsuario = $_SESSION['user_id'] ?? null;
if (!$idUsuario) {
    echo json_encode(['success' => false, 'message' => 'Sessão inválida']);
    exit;
}

$amount = isset($_POST['amount']) ? (float)$_POST['amount'] : null;
$cpf = $_POST['cpf'] ?? null;
$nome = $_POST['nome'] ?? ($_SESSION['user_nome_completo'] ?? 'Cliente');
$planId = $_POST['planId'] ?? null;

if (!$amount || !$cpf || !$planId) {
    echo json_encode(['success' => false, 'message' => 'Dados incompletos']);
    exit;
}

$cpf = preg_replace('/\D/', '', $cpf);

$pdo->beginTransaction();
try {
    $stmt = $pdo->prepare("INSERT INTO assinaturas_utilizador (id_utilizador, id_plano, data_inicio, estado_assinatura) VALUES (?, ?, NOW(), 'pendente_pagamento')");
    $stmt->execute([$idUsuario, $planId]);
    $assinaturaId = $pdo->lastInsertId();
    if (!$assinaturaId) throw new Exception('Falha ao registrar assinatura');

    $accessToken = getenv('MERCADOPAGO_ACCESS_TOKEN');
    if (!$accessToken) throw new Exception('Access token não configurado');

    $payload = [
        'transaction_amount' => $amount,
        'payment_method_id' => 'pix',
        'description' => "Plano AudioTO $planId",
        'notification_url' => SITE_URL . 'payments/mercadopago/webhook.php',
        'payer' => [
            'email' => $_SESSION['user_email'] ?? 'user@example.com',
            'first_name' => $nome,
            'identification' => [
                'type' => 'CPF',
                'number' => $cpf
            ]
        ]
    ];

    $ch = curl_init('https://api.mercadopago.com/v1/payments');
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => true,
        CURLOPT_HTTPHEADER => [
            'accept: application/json',
            'content-type: application/json',
            'Authorization: Bearer ' . $accessToken,
            'X-Idempotency-Key: ' . bin2hex(random_bytes(16))
        ],
        CURLOPT_POSTFIELDS => json_encode($payload)
    ]);
    $resp = curl_exec($ch);
    if ($resp === false) throw new Exception('Erro comunicação MercadoPago');
    $result = json_decode($resp, true);
    curl_close($ch);

    if (!isset($result['id'])) throw new Exception('Resposta inválida do MercadoPago');
    $paymentId = $result['id'];

    $stmt = $pdo->prepare('UPDATE assinaturas_utilizador SET id_transacao_gateway = ? WHERE id_assinatura = ?');
    $stmt->execute([$paymentId, $assinaturaId]);

    $pdo->commit();

    $qrData = $result['point_of_interaction']['transaction_data'] ?? [];
    echo json_encode([
        'success' => true,
        'paymentId' => $paymentId,
        'qrCodeImageUrl' => isset($qrData['qr_code_base64']) ? 'data:image/jpeg;base64,' . $qrData['qr_code_base64'] : null,
        'pixCopiaECola' => $qrData['qr_code'] ?? null,
        'status' => $result['status'] ?? null
    ]);
} catch (Exception $e) {
    $pdo->rollBack();
    error_log('gerar_pix_mp: ' . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Falha ao gerar pagamento']);
}
