<?php
require_once __DIR__ . '/../sessao/session_handler.php';
require_once __DIR__ . '/../db/db_connect.php';

requireLogin();

header('Content-Type: application/json');

$txid = $_GET['txid'] ?? null;
$id_utilizador = $_SESSION['user_id'] ?? null;

if (!$txid || !$id_utilizador) {
    echo json_encode(['success' => false, 'message' => 'Parâmetros ausentes.']);
    exit;
}

try {
    // Consulta simplificada; na prática, você verificaria o pagamento na API Asaas
    $stmt = $pdo->prepare("SELECT a.*, p.preco_mensal, p.preco_anual FROM assinaturas_utilizador a JOIN planos_assinatura p ON a.id_plano = p.id_plano WHERE a.id_transacao_gateway = ? AND a.gateway = 'asaas' AND a.id_utilizador = ? AND a.estado_assinatura = 'pendente_pagamento'");
    $stmt->execute([$txid, $id_utilizador]);
    $assinatura = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($assinatura) {
        // Aqui seria feita a confirmação real via API Asaas
        $pdo->beginTransaction();
        $interval = empty($assinatura['preco_anual']) || (float)$assinatura['preco_anual'] <= 0 ? 'P1M' : 'P1Y';
        $data_inicio = new DateTime();
        $data_proxima = (clone $data_inicio)->add(new DateInterval($interval));
        $data_fim = clone $data_proxima;

        $stmtUp = $pdo->prepare("UPDATE assinaturas_utilizador SET estado_assinatura = 'ativa', data_inicio = ?, data_fim = ?, data_proxima_cobranca = ? WHERE id_assinatura = ?");
        $stmtUp->execute([
            $data_inicio->format('Y-m-d H:i:s'),
            $data_fim->format('Y-m-d H:i:s'),
            $data_proxima->format('Y-m-d H:i:s'),
            $assinatura['id_assinatura']
        ]);

        $stmtUser = $pdo->prepare("UPDATE utilizadores SET id_plano_assinatura_ativo = ? WHERE id_utilizador = ?");
        $stmtUser->execute([$assinatura['id_plano'], $id_utilizador]);

        $pdo->commit();
        echo json_encode(['success' => true, 'isPaid' => true]);
    } else {
        echo json_encode(['success' => true, 'isPaid' => false]);
    }
} catch (Exception $e) {
    $pdo->rollBack();
    error_log('Erro verificar_pix_asaas: ' . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Erro ao verificar Pix Asaas.']);
}
