<?php
// --- ESTRUTURA LÓGICA PRINCIPAL ---

// 1. Inicia a sessão e redireciona para o login se não estiver autenticado
require_once __DIR__ . '/sessao/session_handler.php';
requireLogin('login.php');

// 2. Conecta-se à base de dados. A variável $pdo estará disponível para o resto do script.
require_once __DIR__ . '/db/db_connect.php';

// 3. ROTEADOR DE AÇÕES (AJAX): Lida com a requisição de voto
if (isset($_POST['action']) && $_POST['action'] === 'vote') {
    header('Content-Type: application/json; charset=utf-8');
    // A lógica de voto permanece a mesma, pois já está funcional.
    $idNoticia = (int)($_POST['id_noticia'] ?? 0); $acao = $_POST['acao'] ?? ''; $userId = $_SESSION['user_id'] ?? 0;
    if (!$idNoticia || !in_array($acao, ['up', 'down']) || !$userId) { echo json_encode(['success' => false, 'message' => 'Dados inválidos.']); exit; }
    try {
        $pdo->beginTransaction();
        $stmt = $pdo->prepare('SELECT valor FROM noticia_votos WHERE id_noticia = :id AND id_utilizador = :uid'); $stmt->execute([':id' => $idNoticia, ':uid' => $userId]);
        $votoExistente = $stmt->fetchColumn();
        if ($votoExistente) {
            if ($votoExistente === $acao) { $pdo->prepare('DELETE FROM noticia_votos WHERE id_noticia = :id AND id_utilizador = :uid')->execute([':id' => $idNoticia, ':uid' => $userId]); } 
            else { $pdo->prepare('UPDATE noticia_votos SET valor = :val WHERE id_noticia = :id AND id_utilizador = :uid')->execute([':val' => $acao, ':id' => $idNoticia, ':uid' => $userId]); }
        } else { $pdo->prepare('INSERT INTO noticia_votos (id_noticia, id_utilizador, valor) VALUES (:id, :uid, :val)')->execute([':id' => $idNoticia, ':uid' => $userId, ':val' => $acao]); }
        $pdo->commit();
        $countStmt = $pdo->prepare("SELECT (SELECT COUNT(*) FROM noticia_votos WHERE id_noticia = :id AND valor = 'up') AS upvotes, (SELECT COUNT(*) FROM noticia_votos WHERE id_noticia = :id AND valor = 'down') AS downvotes");
        $countStmt->execute([':id' => $idNoticia]); $counts = $countStmt->fetch(PDO::FETCH_ASSOC);
        $voteStmt = $pdo->prepare('SELECT valor FROM noticia_votos WHERE id_noticia = :id AND id_utilizador = :uid'); $voteStmt->execute([':id' => $idNoticia, ':uid' => $userId]);
        $votoAtual = $voteStmt->fetchColumn();
        echo json_encode(['success' => true, 'upvotes' => (int)$counts['upvotes'], 'downvotes' => (int)$counts['downvotes'], 'user_vote' => $votoAtual ?: null]);
    } catch (PDOException $e) { if ($pdo->inTransaction()) { $pdo->rollBack(); } error_log('Erro ao votar: ' . $e->getMessage()); echo json_encode(['success' => false, 'message' => 'Erro interno do servidor.']); }
    exit;
}

// 4. LÓGICA PARA RENDERIZAÇÃO NORMAL DA PÁGINA
$pageTitle = "Notícias Semanais - AudioTO"; $activePage = 'noticias'; $userName = $_SESSION['user_nome_completo'] ?? 'Utilizador'; $userEmail = $_SESSION['user_email'] ?? 'utilizador@email.com'; $userAvatarUrlSession = $_SESSION['user_avatar_url'] ?? null; $userId = $_SESSION['user_id'] ?? 0;

// Verifica se uma notícia específica deve ser aberta via link direto
$openModalForId = isset($_GET['id_noticia']) ? (int)$_GET['id_noticia'] : null;

function get_user_avatar_placeholder(string $name, ?string $url, int $size=40): string { if ($url && filter_var($url, FILTER_VALIDATE_URL)) { return htmlspecialchars($url, ENT_QUOTES); } $enc = urlencode($name); return "https://ui-avatars.com/api/?name={$enc}&background=2563eb&color=fff&size={$size}&rounded=true&bold=true"; }
$avatarUrl = get_user_avatar_placeholder($userName, $userAvatarUrlSession);
function format_news_display_date(string $date_str): string { try { $date = new DateTime($date_str); $formatter = new IntlDateFormatter('pt_BR', IntlDateFormatter::FULL, IntlDateFormatter::NONE, 'America/Sao_Paulo', IntlDateFormatter::GREGORIAN); return $formatter->format($date); } catch (Exception $e) { return date("d/m/Y", strtotime($date_str)); } }
$weekly_news_from_db = []; $erro_noticias = null;
if ($pdo) { try { $sql = "SELECT n.*, (SELECT COUNT(*) FROM noticia_votos v WHERE v.id_noticia = n.id_noticia AND v.valor = 'up') AS upvotes, (SELECT COUNT(*) FROM noticia_votos v WHERE v.id_noticia = n.id_noticia AND v.valor = 'down') AS downvotes, (SELECT valor FROM noticia_votos v WHERE v.id_noticia = n.id_noticia AND v.id_utilizador = :uid LIMIT 1) AS user_vote FROM noticias n WHERE n.ativo = TRUE AND n.visibilidade = 'publico' ORDER BY n.data_publicacao DESC LIMIT 12"; $stmt = $pdo->prepare($sql); $stmt->bindValue(':uid', $userId, PDO::PARAM_INT); $stmt->execute(); $weekly_news_from_db = $stmt->fetchAll(); } catch (PDOException $e) { error_log("Erro consulta: " . $e->getMessage()); $erro_noticias = "Não foi possível carregar notícias."; } }
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title><?= htmlspecialchars($pageTitle, ENT_QUOTES) ?></title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script> tailwind.config = { theme: { extend: { colors: { 'primary-blue': '#2563eb', 'primary-blue-light': '#dbeafe', 'primary-blue-dark': '#1e40af', 'light-bg': '#f7fafc', 'card-bg': '#ffffff', 'dark-text': '#1f2937', 'medium-text': '#4b5563', 'light-text': '#6b7280', 'success': '#10b981', 'success-light': '#d1fae5', 'success-dark': '#047857', 'info': '#3b82f6', 'danger': '#ef4444', 'warning': '#f59e0b', }, fontFamily: { 'sans': ['Inter', 'ui-sans-serif', 'system-ui', 'sans-serif'], }, animation: { 'modal-pop': 'modalPop 0.3s ease-out forwards', }, keyframes: { modalPop: { '0%': { opacity: '0', transform: 'scale(0.95) translateY(10px)' }, '100%': { opacity: '1', transform: 'scale(1) translateY(0)' }, } } } } } </script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style> body { font-family: 'Inter', sans-serif; } .line-clamp-2 { display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; } .line-clamp-3 { display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden; } ::-webkit-scrollbar { width: 8px; height: 8px; } ::-webkit-scrollbar-track { background: #f1f1f1; border-radius: 10px; } ::-webkit-scrollbar-thumb { background: theme('colors.gray.300', '#c1c1c1'); border-radius: 10px; } ::-webkit-scrollbar-thumb:hover { background: theme('colors.gray.400', '#a1a1a1'); } html, body { height: 100%; } body { display: flex; flex-direction: column; background-color: theme('colors.light-bg'); } .main-container { flex-grow: 1; } .sidebar { transition: left 0.3s ease-in-out; } .sidebar.open { left: 0; } .sidebar-icon { width: 20px; height: 20px; } .active-nav-link { background-color: theme('colors.primary-blue-light'); color: theme('colors.primary-blue'); border-right: 3px solid theme('colors.primary-blue'); } .active-nav-link i, .active-nav-link svg { color: theme('colors.primary-blue') !important; } .news-modal-content h1, .news-modal-content h2, .news-modal-content h3, .news-modal-content h4 { color: theme('colors.dark-text'); margin-bottom: 0.5rem; margin-top: 1rem; } .news-modal-content h1 { font-size: 1.5rem; font-weight: 700; } .news-modal-content h2 { font-size: 1.25rem; font-weight: 600; } .news-modal-content h3 { font-size: 1.125rem; font-weight: 600; } .news-modal-content p { margin-bottom: 0.75rem; color: theme('colors.medium-text'); line-height: 1.625; } .news-modal-content ul, .news-modal-content ol { list-style-position: inside; margin-left: 0.5rem; margin-bottom: 0.75rem; color: theme('colors.medium-text'); } .news-modal-content ul { list-style-type: disc; } .news-modal-content ol { list-style-type: decimal; } .news-modal-content a { color: theme('colors.primary-blue'); text-decoration: underline; } .news-modal-content a:hover { color: theme('colors.primary-blue-dark'); } .news-modal-content blockquote { border-left: 4px solid theme('colors.primary-blue-light'); padding-left: 1rem; margin: 1rem 0; font-style: italic; color: theme('colors.medium-text'); } .news-modal-content img { max-width: 100%; height: auto; border-radius: 0.5rem; margin-top:0.5rem; margin-bottom:1rem; } </style>
</head>
<body class="text-dark-text">

    <div class="flex h-screen main-container">
        <!-- Sidebar e Header -->
               <aside id="sidebar" class="sidebar fixed lg:static inset-y-0 left-[-256px] lg:left-0 z-50 w-64 bg-card-bg p-5 space-y-5 border-r border-gray-200 overflow-y-auto">
            <div class="text-2xl font-bold text-primary-blue mb-6">AudioTO</div>
            <nav class="space-y-1.5" id="mainNav">
                <a href="inicio.php" class="flex items-center space-x-3 px-3 py-2.5 text-gray-700 rounded-lg hover:bg-primary-blue-light hover:text-primary-blue active-nav-link">
                    <i class="fas fa-home sidebar-icon"></i>
                    <span class="text-sm font-medium">Início</span>
                </a>
                <a href="podcasts.php" class="flex items-center space-x-3 px-3 py-2.5 text-gray-700 rounded-lg hover:bg-primary-blue-light hover:text-primary-blue">
                    <i class="fas fa-podcast sidebar-icon"></i>
                    <span class="text-sm font-medium">Podcasts</span>
                </a>
                <a href="quiz.php" class="flex items-center space-x-3 px-3 py-2.5 rounded-lg text-gray-700 hover:bg-gray-100 <?= ($activePage === 'quiz') ? 'bg-blue-100 text-blue-600 font-semibold' : '' ?>"><i class="fas fa-question-circle"></i> <span class="text-sm font-medium">Quiz</span></a>
                <a href="flashcards.php" class="flex items-center space-x-3 px-3 py-2.5 rounded-lg hover:bg-gray-100 <?= ($activePage === 'flashcards') ? 'active-nav-link' : '' ?>">
                    <i class="fas fa-layer-group sidebar-icon"></i> <span class="text-sm font-medium">Flash Cards</span>
                </a>
                <a href="oportunidades.php" class="flex items-center space-x-3 px-3 py-2.5 text-gray-700 rounded-lg hover:bg-primary-blue-light hover:text-primary-blue">
                    <i class="fas fa-lightbulb sidebar-icon"></i>
                    <span class="text-sm font-medium">Oportunidades</span>
                </a>
                <a href="favoritos.php" class="flex items-center space-x-3 px-3 py-2.5 text-gray-700 rounded-lg hover:bg-primary-blue-light hover:text-primary-blue">
                    <i class="fas fa-heart sidebar-icon"></i>
                    <span class="text-sm font-medium">Meus Favoritos</span>
                </a>
                <a href="historico.php" class="flex items-center space-x-3 px-3 py-2.5 text-gray-700 rounded-lg hover:bg-primary-blue-light hover:text-primary-blue">
                    <i class="fas fa-history sidebar-icon"></i>
                    <span class="text-sm font-medium">Histórico</span>
                </a>
                <a href="planos.php" class="flex items-center space-x-3 px-3 py-2.5 text-gray-700 rounded-lg hover:bg-primary-blue-light hover:text-primary-blue">
                    <i class="fas fa-crown sidebar-icon"></i>
                    <span class="text-sm font-medium">Planos</span>
                </a>
                <a href="comunidade.php" class="flex items-center space-x-3 px-3 py-2.5 text-gray-700 rounded-lg hover:bg-primary-blue-light hover:text-primary-blue">
                    <i class="fas fa-users sidebar-icon"></i>
                    <span class="text-sm font-medium">Comunidade</span>
                </a>
            
            <a href="noticias.php" class="flex items-center space-x-3 px-3 py-2.5 text-gray-700 rounded-lg hover:bg-primary-blue-light hover:text-primary-blue <?= ($activePage === 'noticias') ? 'active-nav-link' : '' ?>"><i class="fas fa-newspaper sidebar-icon"></i><span class="text-sm font-medium">Notícias</span></a></nav>
            <div class="pt-5 border-t border-gray-200 space-y-1.5">
                <a href="perfil.php" class="flex items-center space-x-3 px-3 py-2.5 text-gray-700 rounded-lg hover:bg-primary-blue-light hover:text-primary-blue">
                    <i class="fas fa-user-circle sidebar-icon"></i>
                    <span class="text-sm font-medium">Meu Perfil</span>
                </a>
                <a href="configuracoes.php" class="flex items-center space-x-3 px-3 py-2.5 text-gray-700 rounded-lg hover:bg-primary-blue-light hover:text-primary-blue">
                    <i class="fas fa-cog sidebar-icon"></i>
                    <span class="text-sm font-medium">Configurações</span>
                </a>
                <a href="logout.php" class="flex items-center space-x-3 px-3 py-2.5 text-gray-700 rounded-lg hover:bg-primary-blue-light hover:text-primary-blue">
                    <i class="fas fa-sign-out-alt sidebar-icon"></i>
                    <span class="text-sm font-medium">Sair</span>
                </a>
            </div>
        </aside>
        <div id="sidebar-overlay" class="fixed inset-0 bg-black opacity-50 z-40 hidden lg:hidden"></div>
        <div class="flex-1 flex flex-col overflow-hidden"><header class="bg-card-bg p-4 shadow-sm flex justify-between items-center border-b border-gray-200"><div class="flex items-center"><button id="mobileMenuButton" class="lg:hidden text-gray-600 hover:text-primary-blue mr-3 p-2" aria-label="Abrir menu lateral"><i class="fas fa-bars text-xl"></i></button><div class="relative w-full max-w-xs hidden sm:block"><input type="text" placeholder="Buscar notícias..." class="w-full py-2 px-4 pr-10 bg-gray-100 rounded-full focus:outline-none focus:ring-2 focus:ring-primary-blue text-sm border border-transparent focus:border-primary-blue-light" /><i class="fas fa-search absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i></div></div><div class="flex items-center space-x-4"><button class="text-gray-500 hover:text-primary-blue relative p-2" aria-label="Notificações"><i class="fas fa-bell text-lg"></i><span class="absolute top-1 right-1 block h-2 w-2 rounded-full bg-primary-blue ring-1 ring-white"></span></button><div class="relative"><button id="userDropdownButton" class="flex items-center space-x-2 focus:outline-none" aria-label="Menu do utilizador"><img src="<?= $avatarUrl ?>" alt="Avatar de <?= htmlspecialchars($userName, ENT_QUOTES) ?>" class="w-9 h-9 rounded-full border-2 border-primary-blue-light" /><div class="hidden md:block"><p class="text-xs font-medium text-dark-text"><?= htmlspecialchars($userName, ENT_QUOTES) ?></p><p class="text-xs text-light-text"><?= htmlspecialchars($userEmail, ENT_QUOTES) ?></p></div><i class="fas fa-chevron-down text-xs text-gray-500 hidden md:block"></i></button><div id="userDropdownMenu" class="hidden absolute right-0 mt-2 w-48 bg-white rounded-md shadow-xl z-20 py-1 border border-gray-200"><a href="perfil.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-primary-blue-light hover:text-primary-blue">Meu Perfil</a><a href="configuracoes.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-primary-blue-light hover:text-primary-blue">Configurações</a><hr class="my-1 border-gray-200" /><a href="logout.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-primary-blue-light hover:text-primary-blue">Sair</a></div></div></div></header>

            <main class="flex-1 overflow-x-hidden overflow-y-auto bg-light-bg p-6 md:p-8 space-y-8">
                <!-- Conteúdo Principal -->
                <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center mb-6"><div><h1 class="text-3xl font-bold text-dark-text">Notícias Semanais AudioTO</h1><p class="text-medium-text mt-1">Mantenha-se atualizado com as últimas novidades e insights.</p></div></div><div class="mb-6 flex space-x-2"><button class="px-4 py-2 text-sm font-medium bg-primary-blue text-white rounded-lg shadow-sm hover:bg-primary-blue-dark transition-colors">Todas</button><button class="px-4 py-2 text-sm font-medium bg-card-bg text-medium-text border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors">Última Semana</button><button class="px-4 py-2 text-sm font-medium bg-card-bg text-medium-text border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors">Último Mês</button></div>
                <?php if ($erro_noticias): ?><div class="bg-red-100 border-l-4 border-danger text-danger p-4 rounded-md shadow mb-6" role="alert"><p class="font-bold">Erro:</p><p><?= htmlspecialchars($erro_noticias, ENT_QUOTES) ?></p></div><?php endif; ?>
                
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 xl:gap-8">
                    <?php if (empty($weekly_news_from_db) && !$erro_noticias): ?><div class="md:col-span-2 lg:col-span-3 text-center text-medium-text py-12 bg-card-bg rounded-lg shadow"><i class="far fa-newspaper text-4xl text-gray-300 mb-3"></i><p class="text-xl font-semibold text-dark-text">Nenhuma notícia publicada ainda.</p><p class="text-sm">Volte em breve!</p></div>
                    <?php else: ?>
                        <?php foreach ($weekly_news_from_db as $news_item): 
                              // Gera o link de compartilhamento absoluto
                              $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? "https" : "http";
                              $host = $_SERVER['HTTP_HOST'];
                              $path = strtok($_SERVER["REQUEST_URI"], '?');
                              $shareLink = "{$protocol}://{$host}{$path}?id_noticia={$news_item['id_noticia']}";
                        ?>
                            <article class="bg-card-bg rounded-xl shadow-lg overflow-hidden flex flex-col hover:shadow-xl transition-shadow duration-300 group" data-news-id="<?= (int)($news_item['id_noticia'] ?? 0) ?>" data-title="<?= htmlspecialchars($news_item['titulo'] ?? 'Título indisponível', ENT_QUOTES) ?>" data-date="<?= htmlspecialchars(isset($news_item['data_publicacao']) ? format_news_display_date($news_item['data_publicacao']) : 'Data indisponível', ENT_QUOTES) ?>" data-author="<?= htmlspecialchars($news_item['autor_noticia'] ?? 'Equipe AudioTO', ENT_QUOTES) ?>" data-category="<?= htmlspecialchars($news_item['categoria_noticia'] ?? 'Geral', ENT_QUOTES) ?>" data-image="<?= htmlspecialchars($news_item['url_imagem_destaque'] ?? '', ENT_QUOTES) ?>" data-share-link="<?= $shareLink ?>">
                                <div class="hidden news-full-content"><?= $news_item['conteudo_completo_html'] ?? '<p>Conteúdo não disponível.</p>' ?></div>
                                <div class="relative h-48 w-full">
                                    <?php if (!empty($news_item['url_imagem_destaque'])): ?>
                                        <img src="<?= htmlspecialchars($news_item['url_imagem_destaque']) ?>" alt="Imagem para <?= htmlspecialchars($news_item['titulo'] ?? 'Notícia', ENT_QUOTES) ?>" class="w-full h-full object-cover"/>
                                    <?php else: ?>
                                        <div class="w-full h-full flex flex-col items-center justify-center bg-green-100 text-green-800 p-4 text-center">
                                            <i class="fas fa-newspaper fa-2x mb-3"></i>
                                            <h3 class="font-bold text-lg leading-tight line-clamp-2"><?= htmlspecialchars($news_item['titulo']) ?></h3>
                                        </div>
                                    <?php endif; ?>
                                </div>
                                <div class="p-5 sm:p-6 flex flex-col flex-grow">
                                    <p class="text-xs text-light-text mb-2"><i class="far fa-calendar-alt mr-1"></i><?= isset($news_item['data_publicacao']) ? htmlspecialchars(format_news_display_date($news_item['data_publicacao']), ENT_QUOTES) : '--' ?><span class="mx-1.5">•</span><i class="fas fa-user-edit mr-1"></i><?= htmlspecialchars($news_item['autor_noticia'] ?? 'Equipe AudioTO', ENT_QUOTES) ?></p>
                                    <p class="text-sm text-medium-text line-clamp-3 mb-4 flex-grow"><?= htmlspecialchars($news_item['excerto'] ?? 'Leia mais para ver o conteúdo completo.', ENT_QUOTES) ?></p>
                                    <div class="flex items-center justify-between mt-auto pt-4 border-t border-gray-100">
                                        <div class="flex items-center gap-3 text-sm text-gray-600">
                                            <button class="vote-button p-1 rounded-full hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-primary-blue" data-id="<?= (int)($news_item['id_noticia'] ?? 0) ?>" data-action="up" aria-label="Votar para cima"><i class="fas fa-arrow-up <?php echo ($news_item['user_vote'] ?? '') === 'up' ? 'text-primary-blue' : 'text-gray-400'; ?> hover:text-primary-blue transition-colors"></i><span class="up-count ml-0.5 font-medium"><?= (int)($news_item['upvotes'] ?? 0) ?></span></button>
                                            <button class="vote-button p-1 rounded-full hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-primary-blue" data-id="<?= (int)($news_item['id_noticia'] ?? 0) ?>" data-action="down" aria-label="Votar para baixo"><i class="fas fa-arrow-down <?php echo ($news_item['user_vote'] ?? '') === 'down' ? 'text-primary-blue' : 'text-gray-400'; ?> hover:text-primary-blue transition-colors"></i><span class="down-count ml-0.5 font-medium"><?= (int)($news_item['downvotes'] ?? 0) ?></span></button>
                                            <button class="share-button p-1 rounded-full hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-primary-blue" aria-label="Compartilhar"><i class="fas fa-share-alt text-gray-400 hover:text-primary-blue transition-colors"></i></button>
                                        </div>
                                        <button class="open-news-modal-button text-sm bg-primary-blue-light text-primary-blue-dark font-semibold py-2 px-4 rounded-md hover:bg-primary-blue hover:text-white transition-all duration-200 self-start focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-blue">Ler Mais <i class="fas fa-arrow-right ml-1 text-xs"></i></button>
                                    </div>
                                </div>
                            </article>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </div>
                <nav class="mt-10 flex justify-center" aria-label="Paginação de Notícias"><ul class="inline-flex items-center -space-x-px"><li><a href="#" class="py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-l-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700">Anterior</a></li><li><a href="#" aria-current="page" class="z-10 py-2 px-3 leading-tight text-primary-blue bg-primary-blue-light border border-primary-blue hover:bg-blue-100 hover:text-blue-700">1</a></li><li><a href="#" class="py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">2</a></li><li><a href="#" class="py-2 px-3 leading-tight text-gray-500 bg-white rounded-r-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700">Próxima</a></li></ul></nav>
            </main>
        </div>
    </div>
    
    <div id="newsModal" class="fixed inset-0 bg-gray-800 bg-opacity-75 flex items-center justify-center z-[70] hidden p-4 animate-modal-pop" role="dialog" aria-modal="true" aria-labelledby="newsModalTitle"><div class="bg-card-bg rounded-xl shadow-2xl w-full max-w-2xl max-h-[90vh] flex flex-col"><header class="flex justify-between items-center p-5 sm:p-6 border-b border-gray-200"><h2 id="newsModalTitle" class="text-xl sm:text-2xl font-semibold text-dark-text"></h2><button id="closeNewsModalButton" class="text-gray-400 hover:text-danger transition-colors" aria-label="Fechar modal"><i class="fas fa-times text-2xl"></i></button></header><div class="p-5 sm:p-6 overflow-y-auto news-modal-content flex-grow"><div class="mb-3 text-sm text-light-text"><span id="newsModalDate"></span><span class="mx-1">•</span>Por: <span id="newsModalAuthor" class="font-medium"></span></div><img id="newsModalImage" src="" alt="" class="w-full h-auto max-h-80 object-cover rounded-lg mb-4 hidden" /><div id="newsModalFullContent" class="prose prose-sm sm:prose-base max-w-none"></div></div><footer class="p-5 sm:p-6 border-t border-gray-200 text-right"><button id="closeNewsModalButtonFooter" class="px-6 py-2 text-sm font-medium text-white bg-primary-blue hover:bg-primary-blue-dark rounded-md transition-colors focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-blue">Fechar</button></footer></div></div>

    <script>
    document.addEventListener('DOMContentLoaded', function () {
        // Funções da UI (sidebar, dropdown)
        const toggleMobileSidebar = () => { const sidebar = document.getElementById('sidebar'); const overlay = document.getElementById('sidebar-overlay'); if (sidebar && overlay) { sidebar.classList.toggle('left-[-256px]'); sidebar.classList.toggle('left-0'); overlay.classList.toggle('hidden'); } };
        document.getElementById('mobileMenuButton')?.addEventListener('click', toggleMobileSidebar); document.getElementById('sidebar-overlay')?.addEventListener('click', toggleMobileSidebar);
        const userDropdownButton = document.getElementById('userDropdownButton'); const userDropdownMenu = document.getElementById('userDropdownMenu');
        if (userDropdownButton && userDropdownMenu) { userDropdownButton.addEventListener('click', (e) => { e.stopPropagation(); userDropdownMenu.classList.toggle('hidden'); }); document.addEventListener('click', (e) => { if (!userDropdownButton.contains(e.target) && !userDropdownMenu.contains(e.target)) { userDropdownMenu.classList.add('hidden'); } }); }

        // Modal
        const newsModal = document.getElementById('newsModal');
        const openModal = (card) => { if (!card || !newsModal) return; const modalTitle = newsModal.querySelector('#newsModalTitle'), modalDate = newsModal.querySelector('#newsModalDate'), modalAuthor = newsModal.querySelector('#newsModalAuthor'), modalImage = newsModal.querySelector('#newsModalImage'), modalContent = newsModal.querySelector('#newsModalFullContent'); modalTitle.textContent = card.dataset.title || ''; modalDate.textContent = card.dataset.date || ''; modalAuthor.textContent = card.dataset.author || ''; const imageUrl = card.dataset.image; if (imageUrl && imageUrl.trim()) { modalImage.src = imageUrl; modalImage.alt = "Imagem para " + (card.dataset.title || 'notícia'); modalImage.classList.remove('hidden'); modalImage.onerror = () => modalImage.classList.add('hidden'); } else { modalImage.classList.add('hidden'); } const fullContentDiv = card.querySelector('.news-full-content'); modalContent.innerHTML = fullContentDiv ? fullContentDiv.innerHTML : ''; newsModal.classList.remove('hidden'); document.body.style.overflow = 'hidden'; };
        const closeModal = () => { if(newsModal) { newsModal.classList.add('hidden'); document.body.style.overflow = ''; }};
        document.querySelectorAll('.open-news-modal-button').forEach(button => button.addEventListener('click', (e) => { e.preventDefault(); openModal(button.closest('article')); }));
        newsModal?.querySelector('#closeNewsModalButton')?.addEventListener('click', closeModal); newsModal?.querySelector('#closeNewsModalButtonFooter')?.addEventListener('click', closeModal);
        newsModal?.addEventListener('click', (e) => { if (e.target === newsModal) closeModal(); }); document.addEventListener('keydown', (e) => { if (e.key === 'Escape' && !newsModal.classList.contains('hidden')) closeModal(); });

        // Votos
        document.querySelectorAll('.vote-button').forEach(btn => {
            btn.addEventListener('click', function (e) {
                e.preventDefault(); const card = this.closest('article'); if (!card) return;
                const id = this.dataset.id, voteType = this.dataset.action, params = new URLSearchParams({ action: 'vote', id_noticia: id, acao: voteType });
                fetch(window.location.href, { method: 'POST', headers: { 'Content-Type': 'application/x-www-form-urlencoded' }, body: params })
                .then(response => response.json().then(data => ({ ok: response.ok, data })))
                .then(({ ok, data }) => {
                    if (!ok) throw new Error(data.message || 'Erro desconhecido do servidor.');
                    card.querySelector('.up-count').textContent = data.upvotes; card.querySelector('.down-count').textContent = data.downvotes;
                    const upIcon = card.querySelector('.vote-button[data-action="up"] i'), downIcon = card.querySelector('.vote-button[data-action="down"] i');
                    if (upIcon) { upIcon.className = 'fas fa-arrow-up ' + (data.user_vote === 'up' ? 'text-primary-blue' : 'text-gray-400') + ' hover:text-primary-blue transition-colors'; }
                    if (downIcon) { downIcon.className = 'fas fa-arrow-down ' + (data.user_vote === 'down' ? 'text-primary-blue' : 'text-gray-400') + ' hover:text-primary-blue transition-colors'; }
                })
                .catch(error => { console.error('Falha na requisição de voto:', error); alert('Não foi possível registar o seu voto: ' + error.message); });
            });
        });
        
        // Compartilhamento
        document.querySelectorAll('.share-button').forEach(btn => {
            btn.addEventListener('click', function (e) {
                e.preventDefault(); const card = this.closest('article'); if (!card) return;
                const linkToCopy = card.dataset.shareLink;
                navigator.clipboard.writeText(linkToCopy).then(() => {
                    const icon = this.querySelector('i'); const originalIcon = 'fa-share-alt';
                    icon.classList.remove(originalIcon); icon.classList.add('fa-check', 'text-success');
                    setTimeout(() => { icon.classList.remove('fa-check', 'text-success'); icon.classList.add(originalIcon); }, 2000);
                }).catch(err => { console.error('Erro ao copiar link: ', err); alert('Não foi possível copiar o link.'); });
            });
        });

        // Abrir modal via link direto
        const idToOpen = <?= $openModalForId ?? 'null' ?>;
        if (idToOpen) {
            const cardToOpen = document.querySelector(`article[data-news-id="${idToOpen}"]`);
            if (cardToOpen) {
                openModal(cardToOpen);
            }
        }
    });
    </script>
</body>
</html>