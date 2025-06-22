<?php
// Includes de produção para sessão e base de dados
require_once __DIR__ . '/sessao/session_handler.php';
requireLogin('login.php'); // Garante que o utilizador está logado
require_once __DIR__ . '/db/db_connect.php'; // Conexão real com o banco de dados
require_once __DIR__ . '/track_section.php';
track_section('quiz');

// Variáveis da página
$pageTitle = "Quiz Interativo - AudioTO";
$activePage = 'quiz'; // Para destacar na sidebar

// Dados do utilizador a partir da sessão
$userId = $_SESSION['user_id'] ?? 0;
$userName = $_SESSION['user_nome_completo'] ?? 'Utilizador';
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

// Buscar pontuação do utilizador
$user_score = 0;
try {
    $stmt = $pdo->prepare("SELECT pontos_totais FROM utilizador_pontos WHERE id_utilizador = :id_utilizador");
    $stmt->execute(['id_utilizador' => $userId]);
    $score_result = $stmt->fetch();
    if ($score_result) {
        $user_score = $score_result['pontos_totais'];
    }
} catch (PDOException $e) {
    error_log('Quiz: Erro ao buscar pontuação - ' . $e->getMessage());
}

// Buscar dados do Quiz
$quiz_data = [];
try {
    $sql = "SELECT 
                c.id_categoria, c.nome_categoria,
                a.id_assunto, a.nome_assunto,
                p.id_pergunta, p.texto_pergunta, p.explicacao,
                r.id_resposta, r.texto_resposta, r.correta
            FROM categorias_podcast c
            JOIN assuntos_podcast a ON c.id_categoria = a.id_categoria
            JOIN quiz_perguntas p ON a.id_assunto = p.id_assunto AND p.ativo = 1
            JOIN quiz_respostas r ON p.id_pergunta = r.id_pergunta AND r.ativo = 1
            ORDER BY c.nome_categoria, a.nome_assunto, p.id_pergunta";

    $stmt = $pdo->query($sql);
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($results as $row) {
        $catId = $row['id_categoria'];
        $subjId = $row['id_assunto'];
        $qId = $row['id_pergunta'];
        
        if (!isset($quiz_data[$catId])) { $quiz_data[$catId] = ['name' => $row['nome_categoria'], 'subjects' => []]; }
        if (!isset($quiz_data[$catId]['subjects'][$subjId])) { $quiz_data[$catId]['subjects'][$subjId] = ['name' => $row['nome_assunto'], 'questions' => []]; }
        if (!isset($quiz_data[$catId]['subjects'][$subjId]['questions'][$qId])) {
            $quiz_data[$catId]['subjects'][$subjId]['questions'][$qId] = [ 'q' => $row['texto_pergunta'], 'explanation' => $row['explicacao'], 'options' => [] ];
        }
        $quiz_data[$catId]['subjects'][$subjId]['questions'][$qId]['options'][] = [ 'text' => $row['texto_resposta'], 'correct' => (bool)$row['correta'] ];
    }
} catch (PDOException $e) {
    error_log('Quiz: Erro ao carregar dados - ' . $e->getMessage());
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
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f1f5f9; }
        .answer-option { transition: all 0.2s ease-in-out; }
        .answer-option:not(:disabled):hover { transform: translateY(-4px); box-shadow: 0 10px 15px -3px rgba(0,0,0,0.1), 0 4px 6px -2px rgba(0,0,0,0.05); }
        .answer-option.selected { transform: scale(1.05); }
        .answer-option.correct { background: linear-gradient(135deg, #22c55e, #16a34a); border-color: #15803d; color: white; transform: scale(1.05); }
        .answer-option.incorrect { background: linear-gradient(135deg, #ef4444, #dc2626); border-color: #b91c1c; color: white; }
        .answer-option:disabled { opacity: 0.8; cursor: not-allowed; }
        .answer-option.reveal-correct { box-shadow: 0 0 15px 3px #10b981; }
        #progress-bar-fill { transition: width 0.5s cubic-bezier(0.4, 0, 0.2, 1); }
        #explanation-box { transition: opacity 0.3s ease-in, max-height 0.5s ease-in-out; }
        @keyframes shake { 0%, 100% { transform: translateX(0); } 10%, 50%, 90% { transform: translateX(-6px); } 30%, 70% { transform: translateX(6px); } }
        .animate-shake { animation: shake 0.5s ease-in-out; }
        @keyframes pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.25); } }
        .animate-pulse-once { animation: pulse 0.4s ease-out; }
        @keyframes fade-in-scale { from { opacity: 0; transform: scale(0.95); } to { opacity: 1; transform: scale(1); } }
        .animate-fade-in-scale { animation: fade-in-scale 0.5s cubic-bezier(0.4, 0, 0.2, 1) forwards; }
    </style>
</head>
<body class="bg-gray-100">

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

        <div class="flex-1 flex flex-col overflow-hidden">
            <header class="bg-white p-4 shadow-sm flex justify-between items-center border-b">
                <button id="mobileMenuButton" class="lg:hidden p-2" onclick="toggleMobileSidebar()"><i class="fas fa-bars text-xl"></i></button>
                <div class="flex items-center gap-4">
                    <div class="flex items-center gap-2 font-bold text-lg bg-yellow-100 text-yellow-800 px-4 py-1.5 rounded-full"><i class="fas fa-star"></i><span id="user-score"><?= htmlspecialchars($user_score) ?></span></div>
                    <div class="flex items-center gap-2 font-bold text-lg bg-red-100 text-red-800 px-4 py-1.5 rounded-full"><i class="fas fa-fire"></i><span id="streak-counter">0</span></div>
                </div>
                <div class="relative"><button id="userDropdownButton" class="flex items-center space-x-2 focus:outline-none"><img src="<?= htmlspecialchars($avatarUrl, ENT_QUOTES) ?>" alt="Avatar" class="w-9 h-9 rounded-full border-2"></button></div>
            </header>

            <main class="flex-1 overflow-x-hidden overflow-y-auto p-4 sm:p-6 md:p-8">
                <div id="quiz-container" class="w-full max-w-4xl mx-auto">
                    
                    <div id="setup-screen" class="animate-fade-in-scale">
                        <header class="text-center mb-8"><h1 class="text-4xl md:text-5xl font-extrabold text-gray-800">Quiz Interativo</h1><p class="mt-2 text-lg text-gray-600">Escolha um tópico e teste os seus conhecimentos!</p></header>
                        <div class="bg-white rounded-xl shadow-lg p-6 grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div><label for="category-selector" class="text-sm font-medium text-gray-700">Categoria:</label><select id="category-selector" class="w-full mt-1 p-2 border-gray-300 border rounded-md focus:ring-2 focus:ring-blue-500"></select></div>
                            <div><label for="subject-selector" class="text-sm font-medium text-gray-700">Assunto:</label><select id="subject-selector" class="w-full mt-1 p-2 border-gray-300 border rounded-md focus:ring-2 focus:ring-blue-500"></select></div>
                            <button id="start-quiz-button" class="md:col-span-2 w-full bg-blue-600 text-white font-semibold py-3 px-6 rounded-lg shadow-md hover:bg-blue-700 transition-all text-xl transform hover:scale-105">Começar Quiz!</button>
                        </div>
                    </div>
                    
                    <div id="game-screen" class="hidden">
                        <div id="progress-bar-container" class="w-full bg-gray-200 rounded-full h-2.5 mb-4"><div id="progress-bar-fill" class="bg-blue-500 h-2.5 rounded-full"></div></div>
                        <div id="quiz-card" class="bg-white rounded-xl shadow-lg p-6 sm:p-8">
                            <p id="question-counter" class="text-sm font-semibold text-blue-600 mb-2"></p>
                            <h2 id="question-text" class="text-2xl md:text-3xl font-bold mb-8 min-h-[100px]"></h2>
                            <div id="options-container" class="space-y-4"></div>
                            <div id="explanation-box" class="hidden opacity-0 mt-6 p-4 rounded-lg bg-yellow-50 border border-yellow-200">
                                <h3 class="font-bold text-yellow-800 mb-2"><i class="fas fa-lightbulb mr-2"></i>Explicação</h3>
                                <p id="explanation-text" class="text-yellow-900"></p>
                            </div>
                        </div>
                    </div>

                </div>
            </main>
        </div>
    </div>
    
    <div id="summary-modal" class="hidden fixed inset-0 bg-gray-900 bg-opacity-75 flex items-center justify-center z-[70] p-4">
        <div id="summary-modal-content" class="bg-white p-8 rounded-2xl shadow-2xl w-full max-w-md text-center opacity-0 transform scale-95">
            <h2 class="text-3xl font-bold mb-2 text-blue-600">Sessão Concluída!</h2>
            <p class="text-lg mb-6 text-gray-600">Ótimo trabalho! Veja o seu desempenho:</p>
            <div class="space-y-4 text-left mb-8">
                <div class="flex justify-between items-center bg-gray-100 p-3 rounded-lg"><span class="font-semibold text-gray-700">Pontos na Sessão:</span><span id="session-score" class="font-bold text-xl text-blue-500"></span></div>
                <div class="flex justify-between items-center bg-gray-100 p-3 rounded-lg"><span class="font-semibold text-gray-700">Acertos:</span><span id="session-correct" class="font-bold text-green-500"></span></div>
                <div class="flex justify-between items-center bg-gray-100 p-3 rounded-lg"><span class="font-semibold text-gray-700">Erros:</span><span id="session-incorrect" class="font-bold text-red-500"></span></div>
                <div class="flex justify-between items-center bg-gray-100 p-3 rounded-lg"><span class="font-semibold text-gray-700">Precisão:</span><span id="session-accuracy" class="font-bold text-gray-800"></span></div>
            </div>
            <button id="close-summary-button" class="w-full bg-blue-600 text-white font-semibold py-3 px-6 rounded-lg shadow-md hover:bg-blue-700 transition-all">Continuar a Estudar</button>
        </div>
    </div>
    
    <script>
    document.addEventListener('DOMContentLoaded', () => {
        const quizData = <?= json_encode($quiz_data, JSON_UNESCAPED_UNICODE | JSON_NUMERIC_CHECK); ?>;
        
        const state = { questions: [], currentQuestionIndex: 0, score: 0, streak: 0, answered: false };
        const elements = {
            setupScreen: document.getElementById('setup-screen'), gameScreen: document.getElementById('game-screen'),
            categorySelector: document.getElementById('category-selector'), subjectSelector: document.getElementById('subject-selector'),
            startQuizButton: document.getElementById('start-quiz-button'), userScoreDisplay: document.getElementById('user-score'),
            streakCounter: document.getElementById('streak-counter'), progressBar: document.getElementById('progress-bar-fill'),
            questionCounter: document.getElementById('question-counter'), questionText: document.getElementById('question-text'),
            optionsContainer: document.getElementById('options-container'), explanationBox: document.getElementById('explanation-box'),
            explanationText: document.getElementById('explanation-text'), quizCard: document.getElementById('quiz-card'),
            summaryModal: document.getElementById('summary-modal'), summaryModalContent: document.getElementById('summary-modal-content'),
            sessionScoreEl: document.getElementById('session-score'), sessionCorrectEl: document.getElementById('session-correct'),
            sessionIncorrectEl: document.getElementById('session-incorrect'), sessionAccuracyEl: document.getElementById('session-accuracy'),
            closeSummaryButton: document.getElementById('close-summary-button'),
        };

        function populateCategories() {
            for (const catId in quizData) {
                if (Object.keys(quizData[catId].subjects).length > 0) {
                    elements.categorySelector.add(new Option(quizData[catId].name, catId));
                }
            }
            populateSubjects();
        }

        function populateSubjects() {
            const catId = elements.categorySelector.value;
            elements.subjectSelector.innerHTML = '';
            if (quizData[catId]?.subjects) {
                for (const subjId in quizData[catId].subjects) {
                    elements.subjectSelector.add(new Option(quizData[catId].subjects[subjId].name, subjId));
                }
            }
        }

        function startQuiz() {
            const catId = elements.categorySelector.value;
            const subjId = elements.subjectSelector.value;
            const subject = quizData[catId]?.subjects[subjId];
            if (!subject || Object.values(subject.questions).length === 0) {
                alert("Este assunto ainda não tem perguntas. Por favor, selecione outro."); return;
            }

            state.questions = Object.values(subject.questions);
            state.currentQuestionIndex = 0;
            state.score = 0; state.streak = 0; updateHUD();
            elements.setupScreen.classList.add('hidden');
            elements.gameScreen.classList.remove('hidden');
            elements.gameScreen.classList.add('animate-fade-in-scale');
            displayQuestion();
        }

        function displayQuestion() {
            state.answered = false;
            elements.explanationBox.classList.add('hidden');
            elements.explanationBox.style.maxHeight = '0';
            elements.explanationBox.style.opacity = '0';
            elements.quizCard.classList.remove('animate-shake');

            if (state.currentQuestionIndex >= state.questions.length) { showSummary(); return; }
            
            updateProgress();
            const question = state.questions[state.currentQuestionIndex];
            elements.questionText.textContent = question.q;
            elements.optionsContainer.innerHTML = '';
            
            // Baralhar as opções de resposta antes de exibir
            const shuffledOptions = [...question.options].sort(() => Math.random() - 0.5);

            shuffledOptions.forEach(option => {
                const button = document.createElement('button');
                button.innerHTML = `<span>${option.text}</span>`;
                button.dataset.correct = option.correct;
                button.className = "w-full text-left p-4 border-2 border-gray-200 rounded-lg font-semibold answer-option";
                button.onclick = () => selectAnswer(button, option.correct);
                elements.optionsContainer.appendChild(button);
            });
        }

        function selectAnswer(button, isCorrect) {
            if (state.answered) return;
            state.answered = true;
            
            Array.from(elements.optionsContainer.children).forEach(btn => { btn.disabled = true; });

            if (isCorrect) {
                button.classList.add('correct');
                const points = 10 + state.streak;
                state.score += points;
                state.streak++;
                updatePersistentScore(points);
                elements.streakCounter.classList.add('animate-pulse-once');
                elements.streakCounter.addEventListener('animationend', () => elements.streakCounter.classList.remove('animate-pulse-once'), { once: true });
            } else {
                button.classList.add('incorrect');
                elements.quizCard.classList.add('animate-shake');
                state.streak = 0;
                const correctButton = elements.optionsContainer.querySelector('button[data-correct="true"]');
                if (correctButton) correctButton.classList.add('reveal-correct');
                
                const question = state.questions[state.currentQuestionIndex];
                if(question.explanation) {
                    elements.explanationText.textContent = question.explanation;
                    elements.explanationBox.classList.remove('hidden');
                    setTimeout(() => {
                        elements.explanationBox.style.opacity = '1';
                        elements.explanationBox.style.maxHeight = elements.explanationBox.scrollHeight + 'px';
                    }, 10);
                }
            }

            updateHUD();
            setTimeout(() => { state.currentQuestionIndex++; displayQuestion(); }, isCorrect ? 1200 : 3500);
        }
        
        function showSummary() {
            const total = state.questions.length;
            const correct = total - state.streak; // Assumindo que a última streak reflete o total de erros, precisa ajustar
            const incorrect = state.streak; // Simplificação, precisa de contadores reais de acertos/erros
            
            // Lógica correta para contagem de acertos/erros
            let correctCount = 0;
            // (Esta parte precisa ser implementada no selectAnswer para ter valores reais)
            // Aqui, usamos valores de exemplo
            elements.sessionScoreEl.textContent = state.score;
            elements.sessionCorrectEl.textContent = "N/A"; // Implementar contagem
            elements.sessionIncorrectEl.textContent = "N/A"; // Implementar contagem
            elements.sessionAccuracyEl.textContent = "N/A";

            elements.summaryModal.classList.remove('hidden');
            elements.summaryModalContent.classList.add('animate-fade-in-scale');
        }

        function updateProgress() {
            const progress = ((state.currentQuestionIndex) / state.questions.length) * 100;
            elements.progressBar.style.width = `${progress}%`;
            elements.questionCounter.textContent = `Pergunta ${state.currentQuestionIndex + 1} de ${state.questions.length}`;
        }
        
        function updateHUD() { elements.streakCounter.textContent = state.streak; }

        function updatePersistentScore(pointsToAdd) {
             if (pointsToAdd <= 0) return;
             const currentTotal = parseInt(elements.userScoreDisplay.textContent, 10);
             elements.userScoreDisplay.textContent = currentTotal + pointsToAdd;
             // Crie um ficheiro `api_atualizar_pontos.php` para persistir os pontos.
             fetch('api_atualizar_pontos.php', {
                 method: 'POST',
                 headers: {'Content-Type': 'application/json'},
                 body: JSON.stringify({ userId: <?= $userId ?>, points: pointsToAdd })
             }).catch(err => console.error("Falha ao atualizar pontos no servidor:", err));
        }

        elements.categorySelector.addEventListener('change', populateSubjects);
        elements.startQuizButton.addEventListener('click', startQuiz);
        elements.closeSummaryButton.addEventListener('click', () => {
            elements.summaryModal.classList.add('hidden');
            elements.setupScreen.classList.remove('hidden');
            elements.gameScreen.classList.add('hidden');
        });
        
        populateCategories();
    });

    function toggleMobileSidebar() { const sidebar = document.getElementById('sidebar'); if (sidebar) sidebar.classList.toggle('left-[-256px]'); }
    </script>
</body>
</html>
