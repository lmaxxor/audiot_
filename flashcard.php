<?php
// Includes de produção para sessão e base de dados
require_once __DIR__ . '/sessao/session_handler.php';
requireLogin('login.php'); // Garante que o utilizador está logado
require_once __DIR__ . '/db/db_connect.php'; // Conexão real com o banco de dados

// Variáveis da página
$pageTitle = "Flash Cards - AudioTO";
$activePage = 'flashcards'; // Para destacar na sidebar

// Dados do utilizador a partir da sessão
$userName = $_SESSION['user_nome_completo'] ?? 'Utilizador';
$userEmail = $_SESSION['user_email'] ?? 'utilizador@email.com';
$userAvatarUrlSession = $_SESSION['user_avatar_url'] ?? null;

// Função para gerar o URL do avatar
function get_user_avatar_placeholder($user_name, $avatar_url_from_session, $size = 40) {
    if ($avatar_url_from_session && filter_var($avatar_url_from_session, FILTER_VALIDATE_URL)) {
        return htmlspecialchars($avatar_url_from_session, ENT_QUOTES);
    }
    $name_encoded = urlencode($user_name);
    return "https://ui-avatars.com/api/?name={$name_encoded}&background=2563eb&color=fff&size={$size}&rounded=true&bold=true";
}
$avatarUrl = get_user_avatar_placeholder($userName, $userAvatarUrlSession, 40);


// Buscar TODA a estrutura de categorias, assuntos e flashcards reais do banco
$flashcard_data = [];
try {
    $sql = "SELECT 
                c.id_categoria, 
                c.nome_categoria, 
                a.id_assunto, 
                a.nome_assunto,
                f.pergunta,
                f.resposta
            FROM categorias_podcast c
            JOIN assuntos_podcast a ON c.id_categoria = a.id_categoria
            LEFT JOIN flashcards f ON a.id_assunto = f.id_assunto AND f.ativo = 1
            ORDER BY c.nome_categoria, a.nome_assunto";
            
    $stmt = $pdo->query($sql);
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($results as $row) {
        $categoryId = $row['id_categoria'];
        $subjectId = $row['id_assunto'];

        // Inicializa a categoria se ainda não existir
        if (!isset($flashcard_data[$categoryId])) {
            $flashcard_data[$categoryId] = [
                'name' => $row['nome_categoria'],
                'subjects' => []
            ];
        }

        // Inicializa o assunto se ainda não existir
        if (!isset($flashcard_data[$categoryId]['subjects'][$subjectId])) {
            $flashcard_data[$categoryId]['subjects'][$subjectId] = [
                'name' => $row['nome_assunto'],
                'cards' => []
            ];
        }

        // Adiciona o card se a pergunta existir (vem do LEFT JOIN)
        if (!empty($row['pergunta'])) {
            $flashcard_data[$categoryId]['subjects'][$subjectId]['cards'][] = [
                'q' => $row['pergunta'],
                'a' => $row['resposta']
            ];
        }
    }
} catch (PDOException $e) {
    error_log('Erro ao carregar dados para flashcards: ' . $e->getMessage());
    // Deixar $flashcard_data vazio para tratamento no frontend, que mostrará uma mensagem de erro.
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($pageTitle) ?></title>
    
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --bg-main: #f4f7fc; --bg-content: #f1f5f9; --bg-sidebar: #ffffff; --bg-header: #ffffff;
            --text-primary: #1e293b; --text-secondary: #475569; --text-muted: #64748b;
            --border-color: #e2e8f0; --card-front-bg: #ffffff; --card-front-text: #1e293b;
            --card-back-bg: linear-gradient(135deg, #3b82f6, #60a5fa); --card-back-text: #ffffff;
            --accent-color: #2563eb; --accent-text: #ffffff; --shadow-color: rgba(0, 0, 0, 0.1);
        }
        body.theme-dark {
            --bg-main: #0f172a; --bg-content: #1e293b; --bg-sidebar: #1e293b; --bg-header: #1e293b;
            --text-primary: #f8fafc; --text-secondary: #cbd5e1; --text-muted: #94a3b8;
            --border-color: #334155; --card-front-bg: #334155; --card-front-text: #f8fafc;
            --card-back-bg: linear-gradient(135deg, #4f46e5, #7c3aed); --card-back-text: #ffffff;
            --accent-color: #6366f1; --shadow-color: rgba(0, 0, 0, 0.25);
        }
        body.theme-sepia {
            --bg-main: #fbf6f0; --bg-content: #f3e9dc; --bg-sidebar: #fdfaf6; --bg-header: #fdfaf6;
            --text-primary: #43382c; --text-secondary: #5e5142; --text-muted: #7d6f61;
            --border-color: #e4d8c9; --card-front-bg: #fdfaf6; --card-front-text: #43382c;
            --card-back-bg: linear-gradient(135deg, #b45309, #d97706); --card-back-text: #ffffff;
            --accent-color: #b45309; --shadow-color: rgba(94, 81, 66, 0.15);
        }
        body { font-family: 'Inter', sans-serif; background-color: var(--bg-main); color: var(--text-primary); transition: background-color 0.3s, color 0.3s; }
        .sidebar, .header, #control-panel, .action-button { background-color: var(--bg-sidebar); border-color: var(--border-color); transition: background-color 0.3s, border-color 0.3s, color 0.3s; color: var(--text-secondary); }
        .header h1, #category-selector, #subject-selector, .action-button, .progress-button { color: var(--text-primary); }
        #category-selector, #subject-selector { background-color: var(--bg-content); }
        #main-content { background-color: var(--bg-content); }
        .sidebar-icon, #userDropdownButton p { color: var(--text-secondary); }
        .sidebar a:not(.active-nav-link) { color: var(--text-secondary); }
        .main-container { flex-grow: 1; }
        .sidebar { transition: left 0.3s ease-in-out; } .sidebar.open { left: 0; } .sidebar-icon { width: 20px; height: 20px; }
        .active-nav-link { background-color: var(--accent-color) !important; color: var(--accent-text) !important; border-right: none !important; }
        .active-nav-link i, .active-nav-link span { color: var(--accent-text) !important; }
        .card-scene { perspective: 1200px; }
        .card-inner { position: relative; width: 100%; height: 100%; transition: transform 0.8s cubic-bezier(0.25, 1, 0.5, 1); transform-style: preserve-3d; }
        .card-scene.is-flipped .card-inner { transform: rotateY(180deg); }
        .card-face { position: absolute; width: 100%; height: 100%; -webkit-backface-visibility: hidden; backface-visibility: hidden; display: flex; align-items: center; justify-content: center; padding: 2.5rem; text-align: center; border-radius: 1.5rem; box-shadow: 0 25px 50px -12px var(--shadow-color); font-size: 1.25rem; line-height: 1.6; transition: background-color 0.3s, color 0.3s, background 0.3s; }
        .card-front { background-color: var(--card-front-bg); color: var(--card-front-text); font-weight: 600; }
        .card-back { background: var(--card-back-bg); color: var(--card-back-text); transform: rotateY(180deg); }
        .theme-button.active { box-shadow: 0 0 0 3px var(--accent-color); transform: scale(1.1); }
        #flip-button { background: var(--accent-color); }
        select:disabled { opacity: 0.5; cursor: not-allowed; }
    </style>
</head>
<body class="theme-light">

    <div class="flex h-screen">
       
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
        <div id="sidebar-overlay" class="fixed inset-0 bg-black opacity-50 z-40 hidden lg:hidden" onclick="toggleMobileSidebar()"></div>

        <div class="flex-1 flex flex-col overflow-hidden">
            <header class="header p-4 shadow-sm flex justify-between items-center border-b">
                <button id="mobileMenuButton" class="lg:hidden p-2" onclick="toggleMobileSidebar()"><i class="fas fa-bars text-xl"></i></button>
                <div class="relative"><button id="userDropdownButton" class="flex items-center space-x-2 focus:outline-none"><img src="<?= htmlspecialchars($avatarUrl, ENT_QUOTES) ?>" alt="Avatar de <?= htmlspecialchars($userName)?>" class="w-9 h-9 rounded-full border-2 border-blue-100"></button></div>
            </header>

            <main id="main-content" class="flex-1 overflow-x-hidden overflow-y-auto p-6 md:p-8">
                <div class="w-full max-w-3xl mx-auto">
                    
                    <header class="text-center mb-6">
                        <h1 class="text-4xl md:text-5xl font-extrabold">Flash Cards de Estudo</h1>
                        <p class="mt-2 text-lg text-secondary">Selecione uma categoria e um assunto para começar.</p>
                    </header>

                    <div id="control-panel" class="rounded-xl shadow p-4 mb-8 grid grid-cols-1 sm:grid-cols-3 items-center gap-4 border">
                        <div class="w-full">
                            <label for="category-selector" class="text-sm font-medium text-muted">Categoria:</label>
                            <select id="category-selector" class="w-full mt-1 p-2 rounded-md border focus:ring-2 focus:ring-blue-500"></select>
                        </div>
                        <div class="w-full">
                            <label for="subject-selector" class="text-sm font-medium text-muted">Assunto:</label>
                            <select id="subject-selector" class="w-full mt-1 p-2 rounded-md border focus:ring-2 focus:ring-blue-500"></select>
                        </div>
                        <div class="flex items-center justify-center space-x-2 p-1 bg-gray-200/50 rounded-full" style="background-color: var(--bg-content);">
                            <button class="theme-button p-2 w-10 h-10 rounded-full transition-all" data-theme="light" title="Tema Claro"><i class="fas fa-sun text-yellow-500"></i></button>
                            <button class="theme-button p-2 w-10 h-10 rounded-full transition-all" data-theme="dark" title="Tema Escuro"><i class="fas fa-moon text-indigo-400"></i></button>
                            <button class="theme-button p-2 w-10 h-10 rounded-full transition-all" data-theme="sepia" title="Tema Sépia"><i class="fas fa-book-open text-amber-700"></i></button>
                        </div>
                    </div>

                    <div id="card-container" class="card-scene w-full h-80 md:h-96 mb-6 cursor-pointer">
                        <div class="card-inner">
                            <div id="card-front" class="card-face card-front"></div>
                            <div id="card-back" class="card-face card-back"></div>
                        </div>
                    </div>
                    
                    <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-4">
                        <button id="prev-button" class="action-button flex items-center justify-center gap-2 px-4 py-3 rounded-xl shadow-sm hover:shadow-md transition-all disabled:opacity-50"><i class="fas fa-arrow-left"></i> Anterior</button>
                        <button id="flip-button" class="col-span-2 flex items-center justify-center gap-2 text-white font-semibold py-3 px-6 rounded-xl shadow-lg transition-all duration-300 transform hover:scale-105"><i class="fas fa-sync-alt mr-2"></i>Virar Card</button>
                        <button id="next-button" class="action-button flex items-center justify-center gap-2 px-4 py-3 rounded-xl shadow-sm hover:shadow-md transition-all disabled:opacity-50">Próximo <i class="fas fa-arrow-right"></i></button>
                    </div>

                    <div class="flex flex-col sm:flex-row items-center justify-between text-sm text-muted">
                        <div class="flex flex-wrap justify-center sm:justify-start gap-4">
                            <button id="shuffle-button" class="progress-button hover:text-blue-500 transition-colors" title="Baralhar Assunto Atual"><i class="fas fa-random mr-1"></i> Baralhar Assunto</button>
                            <button id="random-all-button" class="progress-button hover:text-green-500 transition-colors" title="Puxar de todos os assuntos"><i class="fas fa-globe-americas mr-1"></i> Aleatório Geral</button>
                            <button id="reset-button" class="progress-button hover:text-red-500 transition-colors" title="Reiniciar Assunto"><i class="fas fa-redo mr-1"></i> Reiniciar</button>
                        </div>
                        <div id="progress-indicator" class="font-semibold mt-4 sm:mt-0"></div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const flashcardData = <?= json_encode($flashcard_data, JSON_UNESCAPED_UNICODE | JSON_NUMERIC_CHECK); ?>;
            
            let currentCards = [];
            let currentCardIndex = 0;
            let isFlipped = false;
            let isRandomAllMode = false;

            const cardContainer = document.getElementById('card-container');
            const cardFront = document.getElementById('card-front');
            const cardBack = document.getElementById('card-back');
            const flipButton = document.getElementById('flip-button');
            const nextButton = document.getElementById('next-button');
            const prevButton = document.getElementById('prev-button');
            const progressIndicator = document.getElementById('progress-indicator');
            const categorySelector = document.getElementById('category-selector');
            const subjectSelector = document.getElementById('subject-selector');
            const shuffleButton = document.getElementById('shuffle-button');
            const resetButton = document.getElementById('reset-button');
            const randomAllButton = document.getElementById('random-all-button');
            const themeButtons = document.querySelectorAll('.theme-button');

            function populateCategories() {
                categorySelector.innerHTML = '';
                for (const categoryId in flashcardData) {
                    if (Object.keys(flashcardData[categoryId].subjects).length > 0) {
                        const category = flashcardData[categoryId];
                        const option = new Option(category.name, categoryId);
                        categorySelector.add(option);
                    }
                }
                populateSubjects();
            }

            function populateSubjects() {
                const selectedCategoryId = categorySelector.value;
                subjectSelector.innerHTML = '';
                if (flashcardData[selectedCategoryId] && flashcardData[selectedCategoryId].subjects) {
                    const subjects = flashcardData[selectedCategoryId].subjects;
                    for (const subjectId in subjects) {
                        const subject = subjects[subjectId];
                        const option = new Option(subject.name, subjectId);
                        subjectSelector.add(option);
                    }
                }
                loadCards();
            }

            function loadCards() {
                enableSelectors();
                const selectedCategoryId = categorySelector.value;
                const selectedSubjectId = subjectSelector.value;
                if (flashcardData[selectedCategoryId] && flashcardData[selectedCategoryId].subjects[selectedSubjectId]) {
                    currentCards = [...flashcardData[selectedCategoryId].subjects[selectedSubjectId].cards];
                    currentCardIndex = 0;
                    showCard();
                } else {
                    currentCards = [];
                    showCard();
                }
            }
            
            function loadAllCardsRandomly() {
                isRandomAllMode = true;
                categorySelector.disabled = true;
                subjectSelector.disabled = true;

                let allCards = [];
                for (const categoryId in flashcardData) {
                    for (const subjectId in flashcardData[categoryId].subjects) {
                        allCards.push(...flashcardData[categoryId].subjects[subjectId].cards);
                    }
                }

                if (allCards.length < 2) {
                    currentCards = allCards;
                } else {
                     for (let i = allCards.length - 1; i > 0; i--) {
                        const j = Math.floor(Math.random() * (i + 1));
                        [allCards[i], allCards[j]] = [allCards[j], allCards[i]];
                    }
                    currentCards = allCards;
                }
               
                currentCardIndex = 0;
                showCard();
            }

            function shuffleDeck() {
                if(currentCards.length < 2) return;
                for (let i = currentCards.length - 1; i > 0; i--) {
                    const j = Math.floor(Math.random() * (i + 1));
                    [currentCards[i], currentCards[j]] = [currentCards[j], currentCards[i]];
                }
                currentCardIndex = 0;
                showCard();
            }

            function showCard() {
                if (cardContainer.classList.contains('is-flipped')) {
                    flipCard(); 
                }
                
                cardContainer.style.transition = 'opacity 0.2s ease-out';
                cardContainer.style.opacity = '0';
                
                setTimeout(() => {
                    if (currentCards.length === 0) {
                        cardFront.textContent = isRandomAllMode ? 'Nenhum card no banco de dados.' : 'Nenhum card para este assunto.';
                        cardBack.textContent = 'Adicione conteúdo ou selecione outro assunto.';
                    } else {
                        const card = currentCards[currentCardIndex];
                        cardFront.textContent = card.q;
                        cardBack.textContent = card.a;
                    }
                    cardContainer.style.opacity = '1';
                    updateProgress();
                    updateNavButtons();
                }, 200);
            }
            
            function flipCard() { cardContainer.classList.toggle('is-flipped'); isFlipped = !isFlipped; }
            function updateProgress() { progressIndicator.textContent = currentCards.length > 0 ? `${currentCardIndex + 1} / ${currentCards.length}` : '0 / 0'; }
            function updateNavButtons() {
                const hasCards = currentCards.length > 0;
                prevButton.disabled = !hasCards || currentCardIndex === 0;
                nextButton.disabled = !hasCards || currentCardIndex === currentCards.length - 1;
                flipButton.disabled = !hasCards;
                shuffleButton.disabled = !hasCards;
            }
             function enableSelectors() {
                isRandomAllMode = false;
                categorySelector.disabled = false;
                subjectSelector.disabled = false;
            }
            function changeTheme(theme) {
                document.body.className = `theme-${theme}`;
                localStorage.setItem('flashcardTheme', theme);
                themeButtons.forEach(b => b.classList.toggle('active', b.dataset.theme === theme));
            }

            flipButton.addEventListener('click', flipCard);
            cardContainer.addEventListener('click', flipCard);
            nextButton.addEventListener('click', () => { if (currentCardIndex < currentCards.length - 1) { currentCardIndex++; showCard(); } });
            prevButton.addEventListener('click', () => { if (currentCardIndex > 0) { currentCardIndex--; showCard(); } });
            categorySelector.addEventListener('change', () => { enableSelectors(); populateSubjects(); });
            subjectSelector.addEventListener('change', () => { enableSelectors(); loadCards(); });
            shuffleButton.addEventListener('click', shuffleDeck);
            resetButton.addEventListener('click', () => { enableSelectors(); loadCards(); });
            randomAllButton.addEventListener('click', loadAllCardsRandomly);
            themeButtons.forEach(button => button.addEventListener('click', () => changeTheme(button.dataset.theme)));
            document.addEventListener('keydown', e => {
                if (e.target.tagName === 'SELECT') return;
                if (e.key === 'ArrowRight') nextButton.click();
                else if (e.key === 'ArrowLeft') prevButton.click();
                else if (e.key === ' ') { e.preventDefault(); flipButton.click(); }
            });

            const savedTheme = localStorage.getItem('flashcardTheme') || 'light';
            changeTheme(savedTheme);
            populateCategories();
        });

        function toggleMobileSidebar() {
            const sidebar = document.getElementById('sidebar');
            const sidebarOverlay = document.getElementById('sidebar-overlay');
            if (sidebar && sidebarOverlay) {
                sidebar.classList.toggle('left-[-256px]');
                sidebar.classList.toggle('left-0');
                sidebarOverlay.classList.toggle('hidden');
            }
        }
    </script>
</body>
</html>
