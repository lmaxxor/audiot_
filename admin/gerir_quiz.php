<?php
require_once __DIR__ . '/../sessao/session_handler.php';
requireAdmin('../login.php');
require_once __DIR__ . '/../db/db_connect.php';

$pageTitle = 'Gerir Quiz';
$mensagem = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['add_pergunta'])) {
        $texto = trim($_POST['texto_pergunta'] ?? '');
        $id_assunto = filter_input(INPUT_POST, 'id_assunto', FILTER_VALIDATE_INT);
        $explicacao = trim($_POST['explicacao'] ?? '');
        if ($texto && $id_assunto) {
            $stmt = $pdo->prepare('INSERT INTO quiz_perguntas (id_assunto, texto_pergunta, explicacao) VALUES (?, ?, ?)');
            $stmt->execute([$id_assunto, $texto, $explicacao]);
            $mensagem = 'Pergunta adicionada.';
        } else {
            $mensagem = 'Dados inválidos.';
        }
    } elseif (isset($_POST['del_pergunta'])) {
        $id = (int)$_POST['del_pergunta'];
        $stmt = $pdo->prepare('DELETE FROM quiz_perguntas WHERE id_pergunta = ?');
        $stmt->execute([$id]);
        $stmt = $pdo->prepare('DELETE FROM quiz_respostas WHERE id_pergunta = ?');
        $stmt->execute([$id]);
        $mensagem = 'Pergunta removida.';
    } elseif (isset($_POST['add_resposta'])) {
        $texto = trim($_POST['texto_resposta'] ?? '');
        $id_pergunta = (int)$_POST['id_pergunta'];
        $correta = isset($_POST['correta']) ? 1 : 0;
        if ($texto && $id_pergunta) {
            if ($correta) {
                $stmt = $pdo->prepare('UPDATE quiz_respostas SET correta = 0 WHERE id_pergunta = ?');
                $stmt->execute([$id_pergunta]);
            }
            $stmt = $pdo->prepare('INSERT INTO quiz_respostas (id_pergunta, texto_resposta, correta) VALUES (?, ?, ?)');
            $stmt->execute([$id_pergunta, $texto, $correta]);
            $mensagem = 'Resposta adicionada.';
        }
    } elseif (isset($_POST['del_resposta'])) {
        $id = (int)$_POST['del_resposta'];
        $stmt = $pdo->prepare('DELETE FROM quiz_respostas WHERE id_resposta = ?');
        $stmt->execute([$id]);
        $mensagem = 'Resposta removida.';
    }
}

$perguntas = [];
$assuntos = [];
try {
    $perguntas = $pdo->query('SELECT qp.id_pergunta, qp.texto_pergunta, qp.explicacao, a.nome_assunto FROM quiz_perguntas qp JOIN assuntos_podcast a ON qp.id_assunto = a.id_assunto ORDER BY qp.id_pergunta DESC')->fetchAll();
    $assuntos = $pdo->query('SELECT id_assunto, nome_assunto FROM assuntos_podcast ORDER BY nome_assunto')->fetchAll();
} catch (PDOException $e) {
    $mensagem = 'Erro ao carregar dados: ' . $e->getMessage();
}

$answers = [];
foreach ($perguntas as $p) {
    $stmt = $pdo->prepare('SELECT id_resposta, texto_resposta, correta FROM quiz_respostas WHERE id_pergunta = ? ORDER BY id_resposta');
    $stmt->execute([$p['id_pergunta']]);
    $answers[$p['id_pergunta']] = $stmt->fetchAll();
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
                <h1 class="h3 mb-4">Gerir Quiz</h1>
                <?php if ($mensagem): ?>
                    <div class="alert alert-info"><?php echo htmlspecialchars($mensagem); ?></div>
                <?php endif; ?>
                <form method="post" class="mb-4">
                    <input type="hidden" name="add_pergunta" value="1">
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
                        <div class="col-md-5">
                            <label class="form-label">Pergunta</label>
                            <input type="text" name="texto_pergunta" class="form-control" required>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Explicação</label>
                            <input type="text" name="explicacao" class="form-control">
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
                                <th>Respostas</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($perguntas as $p): ?>
                            <tr>
                                <td><?php echo $p['id_pergunta']; ?></td>
                                <td><?php echo htmlspecialchars($p['nome_assunto']); ?></td>
                                <td><?php echo htmlspecialchars($p['texto_pergunta']); ?></td>
                                <td>
                                    <?php if (!empty($answers[$p['id_pergunta']])): ?>
                                        <ul class="list-unstyled mb-0">
                                            <?php foreach ($answers[$p['id_pergunta']] as $r): ?>
                                                <li>
                                                    <?php echo htmlspecialchars($r['texto_resposta']); ?>
                                                    <?php if ($r['correta']): ?><strong>(correta)</strong><?php endif; ?>
                                                    <form method="post" class="d-inline">
                                                        <button name="del_resposta" value="<?php echo $r['id_resposta']; ?>" class="btn btn-sm btn-link text-danger">x</button>
                                                    </form>
                                                </li>
                                            <?php endforeach; ?>
                                        </ul>
                                    <?php else: ?>
                                        Nenhuma resposta
                                    <?php endif; ?>
                                    <form method="post" class="mt-1">
                                        <input type="hidden" name="add_resposta" value="1">
                                        <input type="hidden" name="id_pergunta" value="<?php echo $p['id_pergunta']; ?>">
                                        <div class="input-group input-group-sm">
                                            <input type="text" name="texto_resposta" class="form-control" placeholder="Nova resposta" required>
                                            <span class="input-group-text">
                                                <input type="checkbox" name="correta" value="1"> correta
                                            </span>
                                            <button class="btn btn-outline-secondary" type="submit">Adicionar</button>
                                        </div>
                                    </form>
                                </td>
                                <td>
                                    <form method="post" class="d-inline">
                                        <button name="del_pergunta" value="<?php echo $p['id_pergunta']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Remover pergunta?')">Apagar</button>
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
