<?php
require_once __DIR__ . '/../../sessao/session_handler.php';
require_once __DIR__ . '/../../db/db_connect.php';
requireLogin();

header('Content-Type: application/json');

$paymentId = $_GET['paymentId'] ?? null;
$idUsuario = $_SESSION['user_id'] ?? null;
if (!$paymentId || !$idUsuario) {
    echo json_encode(['success' => false, 'message' => 'Parâmetros ausentes']);
    exit;
}

try {
    $accessToken = getenv('MERCADOPAGO_ACCESS_TOKEN');
    if (!$accessToken) throw new Exception('Access token não configurado');

    $ch = curl_init('https://api.mercadopago.com/v1/payments/' . urlencode($paymentId));
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_HTTPHEADER => [
            'accept: application/json',
            'content-type: application/json',
            'Authorization: Bearer ' . $accessToken
        ]
    ]);
    $resp = curl_exec($ch);
    if ($resp === false) throw new Exception('Erro comunicação MercadoPago');
    $data = json_decode($resp, true);
    curl_close($ch);

    $status = $data['status'] ?? null;
    $isPaid = ($status === 'approved');

    if ($isPaid) {
        $pdo->beginTransaction();
        try {
            $stmtAss = $pdo->prepare("SELECT a.*, p.preco_mensal, p.preco_anual FROM assinaturas_utilizador a JOIN planos_assinatura p ON a.id_plano = p.id_plano WHERE a.id_transacao_gateway = ? AND a.id_utilizador = ? AND a.estado_assinatura = 'pendente_pagamento'");
            $stmtAss->execute([$paymentId, $idUsuario]);
            $assinatura = $stmtAss->fetch(PDO::FETCH_ASSOC);
            if ($assinatura) {
                $id_plano_pago = $assinatura['id_plano'];
                $data_inicio = new DateTime();
                if (!empty($assinatura['preco_anual']) && (float)$assinatura['preco_anual'] > 0) {
                    $intervalo = 'P1Y';
                } else {
                    $intervalo = 'P1M';
                }
                $data_prox = clone $data_inicio;
                $data_prox->add(new DateInterval($intervalo));
                $data_fim = clone $data_prox;

                $stmtUp = $pdo->prepare("UPDATE assinaturas_utilizador SET estado_assinatura = 'ativa', data_inicio = ?, data_fim = ?, data_proxima_cobranca = ? WHERE id_assinatura = ?");
                $stmtUp->execute([
                    $data_inicio->format('Y-m-d H:i:s'),
                    $data_fim->format('Y-m-d H:i:s'),
                    $data_prox->format('Y-m-d H:i:s'),
                    $assinatura['id_assinatura']
                ]);

                $stmtUser = $pdo->prepare('UPDATE utilizadores SET id_plano_assinatura_ativo = ? WHERE id_utilizador = ?');
                $stmtUser->execute([$id_plano_pago, $idUsuario]);
                $_SESSION['user_plano_id'] = $id_plano_pago;
                $pdo->commit();
            } else {
                $pdo->rollBack();
            }
        } catch (Exception $dbEx) {
            $pdo->rollBack();
            error_log('verificar_pix_mp db: ' . $dbEx->getMessage());
        }
    }

    echo json_encode([
        'success' => true,
        'isPaid' => $isPaid,
        'status' => $status,
        'details' => $data
    ]);
} catch (Exception $e) {
    error_log('verificar_pix_mp: ' . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Erro ao consultar pagamento']);
}
