-- Add gateway column to assinaturas_utilizador
ALTER TABLE assinaturas_utilizador
    ADD COLUMN IF NOT EXISTS gateway VARCHAR(50) DEFAULT NULL AFTER id_transacao_gateway;
