<?php
// Define o cabeçalho da resposta como JSON
header('Content-Type: application/json');

// Inclui os ficheiros necessários para a sessão e conexão com o banco de dados
require_once __DIR__ . '/sessao/session_handler.php';
require_once __DIR__ . '/db/db_connect.php';

// Função para enviar uma resposta JSON padronizada e terminar o script
function send_json_response($success, $message = '', $statusCode = 200) {
    http_response_code($statusCode);
    echo json_encode(['success' => $success, 'message' => $message]);
    exit;
}

// Verifica se o método da requisição é POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    send_json_response(false, 'Método não permitido.', 405);
}

// Obtém o ID do utilizador logado a partir da sessão para segurança
$sessionUserId = $_SESSION['user_id'] ?? null;
if (!$sessionUserId) {
    send_json_response(false, 'Utilizador não autenticado.', 401);
}

// Obtém o corpo da requisição (que deve ser JSON)
$data = json_decode(file_get_contents('php://input'), true);

// Valida os dados recebidos
if (!isset($data['points']) || !is_numeric($data['points']) || $data['points'] <= 0) {
    send_json_response(false, 'Dados de pontuação inválidos ou ausentes.', 400);
}

$pointsToAdd = (int)$data['points'];

try {
    // Inicia uma transação para garantir a integridade dos dados
    $pdo->beginTransaction();

    // Utiliza a declaração "INSERT ... ON DUPLICATE KEY UPDATE".
    // Se o `id_utilizador` já existir na tabela (devido à chave UNIQUE), ele atualiza a pontuação.
    // Caso contrário, ele insere uma nova linha.
    $sql = "
        INSERT INTO utilizador_pontos (id_utilizador, pontos_totais) 
        VALUES (:id_utilizador, :pontos)
        ON DUPLICATE KEY UPDATE pontos_totais = pontos_totais + VALUES(pontos_totais)
    ";

    $stmt = $pdo->prepare($sql);
    
    // Executa a declaração com os dados seguros
    $stmt->execute([
        ':id_utilizador' => $sessionUserId,
        ':pontos'        => $pointsToAdd
    ]);

    // Confirma a transação se tudo correu bem
    $pdo->commit();

    // Envia uma resposta de sucesso
    send_json_response(true, 'Pontuação atualizada com sucesso.');

} catch (PDOException $e) {
    // Em caso de erro, desfaz a transação
    if ($pdo->inTransaction()) {
        $pdo->rollBack();
    }
    
    // Regista o erro para depuração (não exibir em produção)
    error_log('API Error: Falha ao atualizar pontuação - ' . $e->getMessage());
    
    // Envia uma resposta de erro genérica para o cliente
    send_json_response(false, 'Ocorreu um erro no servidor ao tentar atualizar a pontuação.', 500);
}
