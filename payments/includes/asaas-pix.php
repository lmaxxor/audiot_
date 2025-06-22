<?php
class AsaasPix {
    private static ?AsaasPix $instance = null;
    private string $apiKey;
    private string $baseUrl;
    private string $webhookUrl;

    private function __construct() {
        $config = require __DIR__ . '/../config-asaas.php';
        $this->apiKey = $config['api_key'];
        $this->baseUrl = $config['base_url'];
        $this->webhookUrl = $config['webhook_url'];
    }

    public static function getInstance(): AsaasPix {
        if (self::$instance === null) {
            self::$instance = new AsaasPix();
        }
        return self::$instance;
    }

    private function request(string $method, string $endpoint, array $data = null): array {
        $ch = curl_init($this->baseUrl . ltrim($endpoint, '/'));
        $headers = [
            'Content-Type: application/json',
            'access_token: ' . $this->apiKey,
        ];
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        if ($data !== null) {
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        }
        $response = curl_exec($ch);
        if ($response === false) {
            $err = curl_error($ch);
            curl_close($ch);
            throw new Exception('cURL error: ' . $err);
        }
        $status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        $decoded = json_decode($response, true);
        if ($status >= 200 && $status < 300 && is_array($decoded)) {
            return $decoded;
        }
        $msg = is_array($decoded) ? json_encode($decoded) : $response;
        throw new Exception('API error: ' . $msg);
    }

    private function findOrCreateCustomer(string $cpf, string $name): string {
        $resp = $this->request('GET', 'customers?cpfCnpj=' . urlencode($cpf));
        if (!empty($resp['data'][0]['id'])) {
            return $resp['data'][0]['id'];
        }
        $new = $this->request('POST', 'customers', [
            'cpfCnpj' => $cpf,
            'name' => $name,
        ]);
        return $new['id'];
    }

    public function createImmediateCharge(string $amount, string $cpf, string $name, array $additionalInfo = []): array {
        $customerId = $this->findOrCreateCustomer($cpf, $name);
        $body = [
            'customer' => $customerId,
            'billingType' => 'PIX',
            'value' => (float)$amount,
            'description' => $additionalInfo['description'] ?? ($additionalInfo['Produto'] ?? 'Pagamento Pix'),
            'dueDate' => date('Y-m-d'),
            'callbackUrl' => $this->webhookUrl,
        ];
        return $this->request('POST', 'payments', $body);
    }

    public function getPixQrCode(array $payment): string|false {
        $id = $payment['id'] ?? null;
        if (!$id) return false;
        $resp = $this->request('GET', 'payments/' . $id . '/pixQrCode');
        return $resp['encodedImage'] ?? false;
    }

    public function checkPayment(string $paymentId): array {
        return $this->request('GET', 'payments/' . $paymentId);
    }
}
