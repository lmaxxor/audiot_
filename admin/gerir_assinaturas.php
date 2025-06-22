<?php
require_once __DIR__ . '/../sessao/session_handler.php';
requireAdmin('../login.php');
require_once __DIR__ . '/../db/db_connect.php';

$pageTitle = 'Gerir Assinaturas';
$mensagem = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['add_assinatura'])) {
        $id_utilizador = filter_input(INPUT_POST, 'id_utilizador', FILTER_VALIDATE_INT);
        $id_plano = filter_input(INPUT_POST, 'id_plano', FILTER_VALIDATE_INT);
        if ($id_utilizador && $id_plano) {
            $stmt = $pdo->prepare('INSERT INTO assinaturas_utilizador (id_utilizador, id_plano, data_inicio, estado_assinatura) VALUES (?, ?, NOW(), "ativa")');
            $stmt->execute([$id_utilizador, $id_plano]);
            $mensagem = 'Assinatura adicionada.';
        } else {
            $mensagem = 'Dados inválidos para nova assinatura.';
        }
    } elseif (isset($_POST['cancelar'])) {
        $id = (int)$_POST['cancelar'];
        $stmt = $pdo->prepare('UPDATE assinaturas_utilizador SET estado_assinatura="cancelada", data_fim=NOW() WHERE id_assinatura=?');
        $stmt->execute([$id]);
        $mensagem = 'Assinatura cancelada.';
    } elseif (isset($_POST['ativar'])) {
        $id = (int)$_POST['ativar'];
        $stmt = $pdo->prepare('UPDATE assinaturas_utilizador SET estado_assinatura="ativa", data_fim=NULL WHERE id_assinatura=?');
        $stmt->execute([$id]);
        $mensagem = 'Assinatura ativada.';
    } elseif (isset($_POST['del_assinatura'])) {
        $id = (int)$_POST['del_assinatura'];
        $stmt = $pdo->prepare('DELETE FROM assinaturas_utilizador WHERE id_assinatura=?');
        $stmt->execute([$id]);
        $mensagem = 'Assinatura removida.';
    }
}

$assinaturas = [];
$utilizadores = [];
$planos = [];
try {
    $assinaturas = $pdo->query('SELECT a.id_assinatura, u.nome_completo, u.email, p.nome_plano, a.data_inicio, a.data_fim, a.data_proxima_cobranca, a.estado_assinatura, a.gateway FROM assinaturas_utilizador a JOIN utilizadores u ON a.id_utilizador=u.id_utilizador JOIN planos_assinatura p ON a.id_plano=p.id_plano ORDER BY a.id_assinatura DESC')->fetchAll();
    $utilizadores = $pdo->query('SELECT id_utilizador, nome_completo FROM utilizadores ORDER BY nome_completo')->fetchAll();
    $planos = $pdo->query('SELECT id_plano, nome_plano FROM planos_assinatura ORDER BY nome_plano')->fetchAll();
} catch (PDOException $e) {
    $mensagem = 'Erro ao carregar dados: ' . $e->getMessage();
}

$userName_for_header = $_SESSION['user_nome_completo'] ?? 'Admin';
$avatarUrl_for_header = $_SESSION['user_avatar_url'] ?? '';
if (!$avatarUrl_for_header) {
    $initials_for_header = '';
    $parts = explode(' ', trim($userName_for_header));
    $initials_for_header .= strtoupper(substr($parts[0] ?? 'A',0,1));
    if (count($parts)>1) $initials_for_header .= strtoupper(substr(end($parts),0,1));
    if (strlen($initials_for_header)>2) $initials_for_header='AD';
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
                <h1 class="h3 mb-4">Gerir Assinaturas</h1>
                <?php if ($mensagem): ?>
                    <div class="alert alert-info"><?php echo htmlspecialchars($mensagem); ?></div>
                <?php endif; ?>
                <form method="post" class="mb-4">
                    <input type="hidden" name="add_assinatura" value="1">
                    <div class="row g-2 align-items-end">
                        <div class="col-md-4">
                            <label class="form-label">Utilizador</label>
                            <select name="id_utilizador" class="form-select" required>
                                <option value="">Selecione</option>
                                <?php foreach ($utilizadores as $u): ?>
                                    <option value="<?php echo $u['id_utilizador']; ?>"><?php echo htmlspecialchars($u['nome_completo']); ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Plano</label>
                            <select name="id_plano" class="form-select" required>
                                <option value="">Selecione</option>
                                <?php foreach ($planos as $p): ?>
                                    <option value="<?php echo $p['id_plano']; ?>"><?php echo htmlspecialchars($p['nome_plano']); ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col-md-4 text-end">
                            <button class="btn btn-primary" type="submit">Adicionar</button>
                        </div>
                    </div>
                </form>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Utilizador</th>
                                <th>Plano</th>
                                <th>Gateway</th>
                                <th>Estado</th>
                                <th>Início</th>
                                <th>Próxima Cobrança</th>
                                <th>Fim</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($assinaturas as $a): ?>
                            <tr>
                                <td><?php echo $a['id_assinatura']; ?></td>
                                <td><?php echo htmlspecialchars($a['nome_completo']); ?><br><small><?php echo htmlspecialchars($a['email']); ?></small></td>
                                <td><?php echo htmlspecialchars($a['nome_plano']); ?></td>
                                <td><?php echo htmlspecialchars($a['gateway'] ?? '-'); ?></td>
                                <td><?php echo htmlspecialchars($a['estado_assinatura']); ?></td>
                                <td><?php echo $a['data_inicio']; ?></td>
                                <td><?php echo $a['data_proxima_cobranca'] ?? '-'; ?></td>
                                <td><?php echo $a['data_fim'] ?? '-'; ?></td>
                                <td>
                                    <?php if ($a['estado_assinatura'] === 'ativa'): ?>
                                        <form method="post" class="d-inline">
                                            <button name="cancelar" value="<?php echo $a['id_assinatura']; ?>" class="btn btn-sm btn-warning">Cancelar</button>
                                        </form>
                                    <?php else: ?>
                                        <form method="post" class="d-inline">
                                            <button name="ativar" value="<?php echo $a['id_assinatura']; ?>" class="btn btn-sm btn-success">Ativar</button>
                                        </form>
                                    <?php endif; ?>
                                    <form method="post" class="d-inline">
                                        <button name="del_assinatura" value="<?php echo $a['id_assinatura']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Remover assinatura?')">Apagar</button>
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
