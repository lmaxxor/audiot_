<?php
// db/config.php

// Configurações do Banco de Dados
define('DB_HOST', getenv('DB_HOST') ?: 'localhost');
define('DB_NAME', getenv('DB_NAME') ?: 'u582136142_AudioTO');
define('DB_USER', getenv('DB_USER') ?: 'u582136142_AudioTO');
define('DB_PASS', getenv('DB_PASS') ?: 'Aceleron0@'); // Mantenha esta informação segura!
define('DB_CHARSET', 'utf8mb4');

// Configurações da Aplicação (Exemplos)
define('SITE_URL', 'https://localhost/'); // Mude para o URL do seu site em produção
define('UPLOADS_PATH', $_SERVER['DOCUMENT_ROOT'] . '/uploads/'); // Caminho absoluto para a pasta de uploads
define('UPLOADS_URL', SITE_URL . '/uploads/'); // URL base para aceder aos uploads

// Configurações de Sessão (opcional, pode estar num ficheiro de inicialização global)
// define('SESSION_SAVE_PATH', $_SERVER['DOCUMENT_ROOT'] . '/audio_to/sessao'); // Exemplo de caminho para sessões

// Outras configurações que possa precisar
// define('ADMIN_EMAIL', 'admin@example.com');

// Configurações SMTP para envio de emails
define('SMTP_HOST', getenv('smtp.hostinger.com'));
define('SMTP_USER', getenv('admin@audioto.com.br'));
define('SMTP_PASS', getenv('Aceleron0@'));
define('SMTP_PORT', getenv('465') ?: 465);
define('SMTP_SECURE', getenv('tls') ?: 'tls');
define('SMTP_FROM', getenv('SMTP_FROM') ?: SMTP_USER);
define('SMTP_FROM_NAME', getenv('SMTP_FROM_NAME') ?: 'AudioTO');

?>
