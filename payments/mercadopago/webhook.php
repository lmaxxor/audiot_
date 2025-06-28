<?php
// Simples webhook que apenas registra a notificação
file_put_contents(__DIR__ . '/webhook.log', date('c') . " - " . file_get_contents('php://input') . "\n", FILE_APPEND);
http_response_code(200);
