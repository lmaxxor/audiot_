<?php
require_once __DIR__ . '/../sessao/session_handler.php';
require_once __DIR__ . '/../db/db_connect.php';
requireLogin();
require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/includes/asaas-card.php';

header('Content-Type: application/json');

$id_utilizador = $_SESSION['user_id'] ?? null;
if (!$id_utilizador) {
    echo json_encode(['success' => false, 'message' => 'Sessão inválida.']);
    exit;
}

$amount_str = $_POST['amount'] ?? null;
$cpf = $_POST['cpf'] ?? null;
$nome = $_POST['nome'] ?? null;
$cardNumber = $_POST['number'] ?? null;
$expiryMonth = $_POST['expiryMonth'] ?? null;
$expiryYear = $_POST['expiryYear'] ?? null;
$cvv = $_POST['cvv'] ?? null;
$id_plano = $_POST['planId'] ?? null;

if (!$amount_str || !$cpf || !$nome || !$cardNumber || !$expiryMonth || !$expiryYear || !$cvv || !$id_plano) {
    echo json_encode(['success' => false, 'message' => 'Dados do cartão incompletos.']);
    exit;
}

$amount = (float)$amount_str;
$cpf = preg_replace('/[^0-9]/', '', $cpf);
$cardData = [
    'holderName' => $nome,
    'number' => preg_replace('/\D/', '', $cardNumber),
    'expiryMonth' => $expiryMonth,
    'expiryYear' => $expiryYear,
    'ccv' => $cvv,
];

$pdo->beginTransaction();
try {
    $stmt = $pdo->prepare("INSERT INTO assinaturas_utilizador (id_utilizador, id_plano, data_inicio, estado_assinatura) VALUES (?, ?, NOW(), 'pendente_pagamento')");
    $stmt->execute([$id_utilizador, $id_plano]);
    $id_assinatura_criada = $pdo->lastInsertId();
    if (!$id_assinatura_criada) {
        throw new Exception('Falha ao registrar assinatura.');
    }

    $asaas = AsaasCard::getInstance();
    $response = $asaas->createCreditCardCharge((string)$amount, (string)$cpf, (string)$nome, $cardData);
    $paymentId = $response['id'] ?? null;
    if (!$paymentId) {
        throw new Exception('Resposta da API Asaas inválida.');
    }
    $stmt = $pdo->prepare("UPDATE assinaturas_utilizador SET id_transacao_gateway = ? WHERE id_assinatura = ?");
    $stmt->execute([$paymentId, $id_assinatura_criada]);
    $pdo->commit();

    echo json_encode(['success' => true, 'paymentId' => $paymentId, 'status' => $response['status'] ?? 'PENDING']);
} catch (Exception $e) {
    $pdo->rollBack();
    error_log('Erro gerar_cartao_asaas: ' . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Erro ao processar cartão: ' . $e->getMessage()]);
}
