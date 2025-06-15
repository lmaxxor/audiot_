<?php
// registrar.php
// Este bloco de código PHP deve ser mantido no topo do arquivo.
// require_once __DIR__ . '/sessao/session_handler.php'; // Descomente em seu ambiente de produção
session_start(); // Usando para simulação
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Frases para o hero, versão de conversão
$hero_phrases = [
    "Comece sua jornada de aprendizado na Terapia Ocupacional, agora em áudio.",
    "Junte-se a milhares de estudantes e profissionais. O conhecimento espera por você.",
    "Crie sua conta e tenha acesso a um universo de conteúdo em Terapia Ocupacional.",
    "A evolução da sua carreira começa aqui. Conteúdo em áudio feito para T.O."
];
$selected_hero_phrase = $hero_phrases[array_rand($hero_phrases)];

// Simulação de mensagens de sessão para fins de design
if (!isset($_SESSION['register_errors'])) {
    // Para visualização do design, você pode descomentar o bloco abaixo
    // $_SESSION['register_errors'] = ['As senhas não coincidem.', 'O email já está em uso.'];
    // $_SESSION['register_nome_attempt'] = 'Usuário Teste';
    // $_SESSION['register_email_attempt'] = 'email@teste.com';
}


// Mensagens de sessão
$register_errors = $_SESSION['register_errors'] ?? [];
$register_nome_attempt = $_SESSION['register_nome_attempt'] ?? '';
$register_email_attempt = $_SESSION['register_email_attempt'] ?? '';
unset($_SESSION['register_errors'], $_SESSION['register_nome_attempt'], $_SESSION['register_email_attempt']);
?>
<!DOCTYPE html>
<html lang="pt-BR" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Conta - AudioTO</title>
    
    <!-- Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    
    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #F9FAFB; /* Fundo claro */
            color: #1F2937; /* Texto escuro */
            overflow-x: hidden;
        }
        .text-gradient {
            background: linear-gradient(90deg, #2563EB, #3B82F6, #60A5FA);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        .light-card {
            background-color: #FFFFFF;
            border-radius: 1rem;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .light-card:hover {
            transform: translateY(-5px);
        }

        /* Fundo claro para o Hero */
        .hero-light-bg {
            position: absolute;
            inset: 0;
            overflow: hidden;
            background: linear-gradient(135deg, #EFF6FF 0%, #DBEAFE 100%);
        }
        .hero-light-bg .circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(59, 130, 246, 0.1);
            animation: float 25s infinite alternate ease-in-out;
        }
        .circle-1 { width: 200px; height: 200px; top: 10%; left: 15%; animation-duration: 20s; }
        .circle-2 { width: 150px; height: 150px; top: 60%; left: 5%; animation-duration: 30s; }
        .circle-3 { width: 100px; height: 100px; top: 30%; left: 80%; animation-duration: 25s; }
        .circle-4 { width: 300px; height: 300px; top: 70%; left: 60%; animation-duration: 35s; }

        @keyframes float {
            from { transform: translateY(0px) rotate(0deg); }
            to { transform: translateY(-20px) rotate(15deg); }
        }

        /* Animações */
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .animate-fade-in-up {
            animation: fadeInUp 0.6s ease-out forwards;
        }
    </style>
</head>
<body class="min-h-screen">

    <div class="flex flex-col md:flex-row min-h-screen">
        <!-- Coluna da Esquerda com Fundo Animado -->
        <div class="hidden md:flex md:w-1/2 lg:w-3/5 items-center justify-center p-12 relative">
            <div class="hero-light-bg">
                <div class="circle circle-1"></div>
                <div class="circle circle-2"></div>
                <div class="circle circle-3"></div>
                <div class="circle circle-4"></div>
            </div>
            <div class="relative z-10 text-center animate-fade-in-up">
                <h1 class="text-6xl lg:text-7xl font-black mb-6 text-gradient">AudioTO</h1>
                <p class="text-xl lg:text-2xl font-light max-w-lg mx-auto text-gray-700">
                    <?php echo htmlspecialchars($selected_hero_phrase); ?>
                </p>
            </div>
        </div>

        <!-- Coluna da Direita com Formulário -->
        <div class="w-full md:w-1/2 lg:w-2/5 flex items-center justify-center p-6 sm:p-8 lg:p-12 bg-gray-50">
            <div class="w-full max-w-md">
                
                <!-- Logo para mobile -->
                <div class="text-center mb-8 md:hidden">
                    <h1 class="text-5xl font-bold text-gradient">AudioTO</h1>
                </div>

                <div class="light-card p-8 md:p-10 w-full">
                    <div class="animate-fade-in-up">
                        <h2 class="text-2xl sm:text-3xl font-bold text-gray-900 text-center mb-2">Crie sua Conta</h2>
                        <p class="text-center text-gray-600 mb-8">Comece a sua jornada de aprendizado.</p>
                    </div>
                    
                    <!-- Container para mensagens de erro/sucesso -->
                    <div id="messageContainer" class="mb-4">
                        <?php if (!empty($register_errors)): ?>
                            <div class="bg-red-100 text-red-700 border border-red-200 p-3 rounded-md text-sm">
                                <ul class="list-disc list-inside">
                                    <?php foreach ($register_errors as $error): ?>
                                        <li><?php echo htmlspecialchars($error); ?></li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                        <?php endif; ?>
                    </div>

                    <form id="registerForm" action="registrar_handler.php" method="POST" class="space-y-4">
                        <div class="animate-fade-in-up" style="animation-delay: 0.1s;">
                            <label for="nome" class="block mb-1.5 text-sm font-medium text-gray-700">Nome Completo</label>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3"><svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z"></path></svg></span>
                                <input type="text" id="nome" name="nome" class="w-full bg-gray-100 border border-gray-300 text-gray-900 rounded-md pl-10 pr-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition" placeholder="Seu nome completo" value="<?php echo htmlspecialchars($register_nome_attempt); ?>" required autocomplete="name" autofocus>
                            </div>
                        </div>

                        <div class="animate-fade-in-up" style="animation-delay: 0.2s;">
                            <label for="email" class="block mb-1.5 text-sm font-medium text-gray-700">Endereço de Email</label>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3"><svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207"></path></svg></span>
                                <input type="email" id="email" name="email" class="w-full bg-gray-100 border border-gray-300 text-gray-900 rounded-md pl-10 pr-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition" placeholder="seu.email@exemplo.com" value="<?php echo htmlspecialchars($register_email_attempt); ?>" required autocomplete="email">
                            </div>
                        </div>
                        
                        <div class="animate-fade-in-up" style="animation-delay: 0.3s;">
                            <label for="password" class="block mb-1.5 text-sm font-medium text-gray-700">Senha</label>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3"><svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path></svg></span>
                                <input type="password" id="password" name="password" class="w-full bg-gray-100 border border-gray-300 text-gray-900 rounded-md pl-10 pr-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition" placeholder="Crie uma senha forte" required autocomplete="new-password">
                            </div>
                        </div>

                        <div class="animate-fade-in-up" style="animation-delay: 0.4s;">
                            <label for="password_confirm" class="block mb-1.5 text-sm font-medium text-gray-700">Confirmar Senha</label>
                            <div class="relative">
                                <span class="absolute inset-y-0 left-0 flex items-center pl-3"><svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg></span>
                                <input type="password" id="password_confirm" name="password_confirm" class="w-full bg-gray-100 border border-gray-300 text-gray-900 rounded-md pl-10 pr-4 py-2.5 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition" placeholder="Repita a senha" required autocomplete="new-password">
                            </div>
                        </div>
                        
                        <div class="pt-2 animate-fade-in-up" style="animation-delay: 0.5s;">
                            <button type="submit" class="w-full bg-blue-600 text-white font-semibold py-3 rounded-md hover:bg-blue-700 transition-all transform hover:scale-105 shadow-lg shadow-blue-600/20">
                                Criar Minha Conta
                            </button>
                        </div>
                    </form>

                    <div class="mt-8 text-center animate-fade-in-up" style="animation-delay: 0.6s;">
                        <p class="text-sm text-gray-600">
                            Já tem uma conta?
                            <a href="login.php" class="font-semibold text-blue-600 hover:text-blue-700 transition-colors">Faça login</a>
                        </p>
                    </div>
                </div>
                <p class="text-center text-xs text-gray-500 mt-10">
                    &copy; <?php echo date("Y"); ?> AudioTO. Todos os direitos reservados.
                </p>
            </div>
        </div>
    </div>
</body>
</html>
