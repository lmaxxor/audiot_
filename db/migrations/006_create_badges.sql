CREATE TABLE IF NOT EXISTS badges (
    id_badge INT AUTO_INCREMENT PRIMARY KEY,
    slug VARCHAR(100) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) DEFAULT NULL,
    icone VARCHAR(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS utilizador_badges (
    id_utilizador INT NOT NULL,
    id_badge INT NOT NULL,
    data_conquistado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_utilizador, id_badge),
    FOREIGN KEY (id_utilizador) REFERENCES utilizadores(id_utilizador) ON DELETE CASCADE,
    FOREIGN KEY (id_badge) REFERENCES badges(id_badge) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO badges (slug, nome, descricao, icone) VALUES
    ('maratonista','Maratonista','Ouviu 10 podcasts.','fas fa-running'),
    ('sabe-tudo','Sabe-Tudo','Acertou 50 perguntas no Quiz.','fas fa-brain'),
    ('colaborador','Colaborador','Fez sua primeira postagem na Comunidade.','fas fa-handshake'),
    ('explorador','Explorador','Visitou todas as seções principais.','fas fa-compass');
