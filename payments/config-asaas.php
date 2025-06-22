<?php
// payments/config-asaas.php
$apiKey = getenv('ASAAS_API_KEY') ?: '';
$webhookUrl = getenv('ASAAS_WEBHOOK_URL') ?: '';
$sandbox = filter_var(getenv('ASAAS_SANDBOX'), FILTER_VALIDATE_BOOLEAN);
$baseUrl = getenv('ASAAS_API_URL');
if (!$baseUrl) {
    $baseUrl = $sandbox ? 'https://sandbox.asaas.com/api/v3/' : 'https://api.asaas.com/v3/';
}
return [
    'api_key' => $apiKey,
    'webhook_url' => $webhookUrl,
    'base_url' => rtrim($baseUrl, '/') . '/',
];
