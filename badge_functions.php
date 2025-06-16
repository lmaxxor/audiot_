<?php
require_once __DIR__ . '/db/db_connect.php';

function get_user_badges(PDO $pdo, int $userId): array {
    $stmt = $pdo->prepare("SELECT b.slug, b.nome, b.descricao, b.icone FROM utilizador_badges ub JOIN badges b ON ub.id_badge = b.id_badge WHERE ub.id_utilizador = ?");
    $stmt->execute([$userId]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function award_badge_if_not_exists(PDO $pdo, int $userId, string $slug): void {
    $stmt = $pdo->prepare("SELECT id_badge FROM badges WHERE slug = ?");
    $stmt->execute([$slug]);
    $badge = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$badge) { return; }
    $badgeId = $badge['id_badge'];
    $check = $pdo->prepare("SELECT 1 FROM utilizador_badges WHERE id_utilizador = ? AND id_badge = ?");
    $check->execute([$userId, $badgeId]);
    if (!$check->fetch()) {
        $ins = $pdo->prepare("INSERT INTO utilizador_badges (id_utilizador, id_badge) VALUES (?, ?)");
        $ins->execute([$userId, $badgeId]);
    }
}
?>
