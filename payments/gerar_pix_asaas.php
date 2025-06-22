<?php
require_once __DIR__ . '/../sessao/session_handler.php';
require_once __DIR__ . '/../db/db_connect.php';

requireLogin();

header('Content-Type: application/json');

// Este script é um placeholder simplificado para gerar cobranças PIX via Asaas
$id_utilizador = $_SESSION['user_id'] ?? null;
$id_plano = $_POST['planId'] ?? null;

if (!$id_utilizador || !$id_plano) {
    echo json_encode(['success' => false, 'message' => 'Dados incompletos.']);
    exit;
}

$pdo->beginTransaction();
try {
    $stmt = $pdo->prepare("INSERT INTO assinaturas_utilizador (id_utilizador, id_plano, data_inicio, estado_assinatura, gateway) VALUES (?, ?, NOW(), 'pendente_pagamento', 'asaas')");
    $stmt->execute([$id_utilizador, $id_plano]);
    $id_assinatura = $pdo->lastInsertId();

    if (!$id_assinatura) {
        throw new Exception('Falha ao criar assinatura.');
    }

    // Aqui seria feita a chamada real à API Asaas para gerar a cobrança.
    // Para fins de exemplo, usamos um txid fictício.
    $txid = uniqid('asaas_');

    $stmt = $pdo->prepare("UPDATE assinaturas_utilizador SET id_transacao_gateway = ?, gateway = 'asaas' WHERE id_assinatura = ?");
    $stmt->execute([$txid, $id_assinatura]);

    $pdo->commit();

    echo json_encode(['success' => true, 'txid' => $txid, 'id_assinatura' => $id_assinatura]);
} catch (Exception $e) {
    $pdo->rollBack();
    error_log('Erro gerar_pix_asaas: ' . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Erro ao gerar cobrança Asaas.']);
}
