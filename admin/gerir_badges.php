<?php
require_once __DIR__ . '/../sessao/session_handler.php';
requireAdmin('../login.php');
require_once __DIR__ . '/../db/db_connect.php';

$pageTitle = 'Gerir Badges';
$userName_for_header = $_SESSION['user_nome_completo'] ?? 'Admin';
$userEmail_for_header = $_SESSION['user_email'] ?? 'admin@audioto.com';
$avatarUrl_for_header = $_SESSION['user_avatar_url'] ?? '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $slug = trim($_POST['slug'] ?? '');
    $nome = trim($_POST['nome'] ?? '');
    $descricao = trim($_POST['descricao'] ?? '');
    $icone = trim($_POST['icone'] ?? '');
    if ($slug && $nome) {
        $stmt = $pdo->prepare('INSERT INTO badges (slug,nome,descricao,icone) VALUES (?,?,?,?) ON DUPLICATE KEY UPDATE nome=VALUES(nome), descricao=VALUES(descricao), icone=VALUES(icone)');
        $stmt->execute([$slug,$nome,$descricao,$icone]);
    }
    header('Location: gerir_badges.php');
    exit;
}

$badges = $pdo->query('SELECT * FROM badges')->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<title><?= htmlspecialchars($pageTitle) ?></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
<?php include 'header.php'; ?>
<div class="d-flex">
<?php include 'sidebar.php'; ?>
<main class="p-4 flex-fill">
<h1 class="h4 mb-4">Gerir Badges</h1>
<table class="table table-striped">
<thead><tr><th>Ícone</th><th>Nome</th><th>Descrição</th><th>Slug</th></tr></thead>
<tbody>
<?php foreach($badges as $b): ?>
<tr>
<td><i class="<?= htmlspecialchars($b['icone']) ?>"></i></td>
<td><?= htmlspecialchars($b['nome']) ?></td>
<td><?= htmlspecialchars($b['descricao']) ?></td>
<td><?= htmlspecialchars($b['slug']) ?></td>
</tr>
<?php endforeach; ?>
</tbody>
</table>
<h2 class="h5 mt-4">Adicionar/Editar Badge</h2>
<form method="post" class="row g-2">
<div class="col-md-2"><input name="slug" class="form-control" placeholder="Slug" required></div>
<div class="col-md-3"><input name="nome" class="form-control" placeholder="Nome" required></div>
<div class="col-md-4"><input name="descricao" class="form-control" placeholder="Descrição"></div>
<div class="col-md-3"><input name="icone" class="form-control" placeholder="Classe do ícone"></div>
<div class="col-12"><button class="btn btn-primary">Salvar</button></div>
</form>
</main>
</div>
</body>
</html>
