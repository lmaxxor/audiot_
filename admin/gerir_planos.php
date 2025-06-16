<?php
require_once __DIR__ . '/../sessao/session_handler.php';
requireAdmin('../login.php');
require_once __DIR__ . '/../db/db_connect.php';

$pageTitle = 'Gerir Planos';
$mensagem = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['add_plano'])) {
        $nome = trim($_POST['nome_plano'] ?? '');
        $preco_mensal = (float)($_POST['preco_mensal'] ?? 0);
        $preco_anual = (float)($_POST['preco_anual'] ?? 0);
        $ativo = isset($_POST['ativo']) ? 1 : 0;
        if ($nome) {
            $stmt = $pdo->prepare('INSERT INTO planos_assinatura (nome_plano, preco_mensal, preco_anual, ativo) VALUES (?, ?, ?, ?)');
            $stmt->execute([$nome, $preco_mensal, $preco_anual, $ativo]);
            $mensagem = 'Plano adicionado.';
        } else {
            $mensagem = 'Nome obrigatório.';
        }
    } elseif (isset($_POST['del_plano'])) {
        $id = (int)$_POST['del_plano'];
        $stmt = $pdo->prepare('DELETE FROM planos_assinatura WHERE id_plano = ?');
        $stmt->execute([$id]);
        $mensagem = 'Plano removido.';
    }
}

$planos = [];
try {
    $planos = $pdo->query('SELECT id_plano, nome_plano, preco_mensal, preco_anual, ativo FROM planos_assinatura ORDER BY id_plano DESC')->fetchAll();
} catch (PDOException $e) {
    $mensagem = 'Erro ao carregar planos: ' . $e->getMessage();
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
                <h1 class="h3 mb-4">Gerir Planos</h1>
                <?php if ($mensagem): ?>
                    <div class="alert alert-info"><?php echo htmlspecialchars($mensagem); ?></div>
                <?php endif; ?>
                <form method="post" class="mb-4">
                    <input type="hidden" name="add_plano" value="1">
                    <div class="row g-2 align-items-end">
                        <div class="col-md-3">
                            <label class="form-label">Nome</label>
                            <input type="text" name="nome_plano" class="form-control" required>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Preço Mensal</label>
                            <input type="number" step="0.01" name="preco_mensal" class="form-control" required>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Preço Anual</label>
                            <input type="number" step="0.01" name="preco_anual" class="form-control" required>
                        </div>
                        <div class="col-md-2 form-check mt-4">
                            <input type="checkbox" class="form-check-input" name="ativo" id="ativo">
                            <label class="form-check-label" for="ativo">Ativo</label>
                        </div>
                        <div class="col-md-3 text-end">
                            <button class="btn btn-primary" type="submit">Adicionar</button>
                        </div>
                    </div>
                </form>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nome</th>
                                <th>Mensal</th>
                                <th>Anual</th>
                                <th>Ativo</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($planos as $p): ?>
                            <tr>
                                <td><?php echo $p['id_plano']; ?></td>
                                <td><?php echo htmlspecialchars($p['nome_plano']); ?></td>
                                <td>R$ <?php echo number_format($p['preco_mensal'],2,',','.'); ?></td>
                                <td>R$ <?php echo number_format($p['preco_anual'],2,',','.'); ?></td>
                                <td><?php echo $p['ativo'] ? 'Sim' : 'Não'; ?></td>
                                <td>
                                    <form method="post" class="d-inline">
                                        <button name="del_plano" value="<?php echo $p['id_plano']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Remover plano?')">Apagar</button>
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
