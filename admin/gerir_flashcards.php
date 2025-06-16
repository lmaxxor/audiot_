<?php
require_once __DIR__ . '/../sessao/session_handler.php';
requireAdmin('../login.php');
require_once __DIR__ . '/../db/db_connect.php';

$pageTitle = 'Gerir Flashcards';
$mensagem = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['add_flashcard'])) {
        $pergunta = trim($_POST['pergunta'] ?? '');
        $resposta = trim($_POST['resposta'] ?? '');
        $id_assunto = filter_input(INPUT_POST, 'id_assunto', FILTER_VALIDATE_INT);
        if ($pergunta && $resposta && $id_assunto) {
            $stmt = $pdo->prepare('INSERT INTO flashcards (id_assunto, pergunta, resposta) VALUES (?, ?, ?)');
            $stmt->execute([$id_assunto, $pergunta, $resposta]);
            $mensagem = 'Flashcard adicionado.';
        } else {
            $mensagem = 'Dados inválidos.';
        }
    } elseif (isset($_POST['del_flashcard'])) {
        $id = (int)$_POST['del_flashcard'];
        $stmt = $pdo->prepare('DELETE FROM flashcards WHERE id_flashcard = ?');
        $stmt->execute([$id]);
        $mensagem = 'Flashcard removido.';
    }
}

$flashcards = [];
$assuntos = [];
try {
    $flashcards = $pdo->query('SELECT f.id_flashcard, f.pergunta, f.resposta, a.nome_assunto FROM flashcards f JOIN assuntos_podcast a ON f.id_assunto = a.id_assunto ORDER BY f.id_flashcard DESC')->fetchAll();
    $assuntos = $pdo->query('SELECT id_assunto, nome_assunto FROM assuntos_podcast ORDER BY nome_assunto')->fetchAll();
} catch (PDOException $e) {
    $mensagem = 'Erro ao carregar dados: ' . $e->getMessage();
}

$userName_for_header = $_SESSION['user_nome_completo'] ?? 'Admin';
$avatarUrl_for_header = $_SESSION['user_avatar_url'] ?? '';
if (!$avatarUrl_for_header) {
    $initials_for_header = '';
    $parts = explode(' ', trim($userName_for_header));
    $initials_for_header .= strtoupper(substr($parts[0] ?? 'A', 0, 1));
    if (count($parts) > 1) $initials_for_header .= strtoupper(substr(end($parts), 0, 1));
    if (strlen($initials_for_header) > 2) $initials_for_header = 'AD';
    $avatarUrl_for_header = 'https://ui-avatars.com/api/?name=' . urlencode($initials_for_header) . '&background=0D6EFD&color=fff&size=40&rounded=true&bold=true';
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($pageTitle); ?> - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="main-wrapper d-flex">
    <?php if (file_exists(__DIR__.'/sidebar.php')) require __DIR__.'/sidebar.php'; ?>
    <div class="content-wrapper flex-grow-1" id="contentWrapper">
        <?php if (file_exists(__DIR__.'/header.php')) require __DIR__.'/header.php'; ?>
        <main class="admin-main-content p-4">
            <div class="container-fluid">
                <h1 class="h3 mb-4">Gerir Flashcards</h1>
                <?php if ($mensagem): ?>
                    <div class="alert alert-info"><?php echo htmlspecialchars($mensagem); ?></div>
                <?php endif; ?>
                <form method="post" class="mb-4">
                    <input type="hidden" name="add_flashcard" value="1">
                    <div class="row g-2 align-items-end">
                        <div class="col-md-3">
                            <label class="form-label">Assunto</label>
                            <select name="id_assunto" class="form-select" required>
                                <option value="">Selecione</option>
                                <?php foreach ($assuntos as $a): ?>
                                    <option value="<?php echo $a['id_assunto']; ?>"><?php echo htmlspecialchars($a['nome_assunto']); ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Pergunta</label>
                            <input type="text" name="pergunta" class="form-control" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Resposta</label>
                            <input type="text" name="resposta" class="form-control" required>
                        </div>
                        <div class="col-md-1 text-end">
                            <button class="btn btn-primary" type="submit">Adicionar</button>
                        </div>
                    </div>
                </form>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Assunto</th>
                                <th>Pergunta</th>
                                <th>Resposta</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($flashcards as $f): ?>
                            <tr>
                                <td><?php echo $f['id_flashcard']; ?></td>
                                <td><?php echo htmlspecialchars($f['nome_assunto']); ?></td>
                                <td><?php echo htmlspecialchars($f['pergunta']); ?></td>
                                <td><?php echo htmlspecialchars($f['resposta']); ?></td>
                                <td>
                                    <form method="post" class="d-inline">
                                        <button name="del_flashcard" value="<?php echo $f['id_flashcard']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Remover flashcard?')">Apagar</button>
                                    </form>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>
