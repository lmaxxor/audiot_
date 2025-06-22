<?php
require_once __DIR__ . '/asaas-pix.php';
class AsaasCard extends AsaasPix {
    private static ?AsaasCard $instance = null;

    public static function getInstance(): AsaasCard {
        if (self::$instance === null) {
            self::$instance = new AsaasCard();
        }
        return self::$instance;
    }

    public function createCreditCardCharge(string $amount, string $cpf, string $name, array $cardData, array $additionalInfo = []): array {
        $customerId = $this->findOrCreateCustomer($cpf, $name);
        $body = [
            'customer' => $customerId,
            'billingType' => 'CREDIT_CARD',
            'value' => (float)$amount,
            'description' => $additionalInfo['description'] ?? 'Pagamento com cartão',
            'dueDate' => date('Y-m-d'),
            'callbackUrl' => $this->webhookUrl,
            'creditCard' => [
                'holderName' => $cardData['holderName'],
                'number' => $cardData['number'],
                'expiryMonth' => $cardData['expiryMonth'],
                'expiryYear' => $cardData['expiryYear'],
                'ccv' => $cardData['ccv'],
            ],
            'creditCardHolderInfo' => [
                'name' => $name,
                'cpfCnpj' => $cpf,
            ],
        ];
        return $this->request('POST', 'payments', $body);
    }
}
