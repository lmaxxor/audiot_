<?php
require_once __DIR__ . '/../sessao/session_handler.php';
require_once __DIR__ . '/../db/db_connect.php';
requireLogin();
require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/includes/asaas-card.php';

header('Content-Type: application/json');

$pid = $_GET['paymentId'] ?? null;
if (!$pid) {
    echo json_encode(['success' => false, 'message' => 'ID não fornecido.']);
    exit;
}

try {
    $asaas = AsaasCard::getInstance();
    $status = $asaas->checkPayment((string)$pid);
    echo json_encode(['success' => true, 'status' => $status['status'] ?? null, 'details' => $status]);
} catch (Exception $e) {
    error_log('Erro verificar_cartao_asaas: ' . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Erro: ' . $e->getMessage()]);
}
