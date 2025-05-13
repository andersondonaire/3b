
-- Criação das tabelas

DROP TABLE IF EXISTS resultado, corrida, piloto, equipe, circuito, campeonato;

CREATE TABLE campeonato (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    ano INTEGER
);

CREATE TABLE equipe (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    pais VARCHAR(50)
);

CREATE TABLE piloto (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    pais VARCHAR(50),
    equipe_id INTEGER REFERENCES equipe(id)
);

CREATE TABLE circuito (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    pais VARCHAR(50)
);

CREATE TABLE corrida (
    id SERIAL PRIMARY KEY,
    data DATE,
    circuito_id INTEGER REFERENCES circuito(id),
    campeonato_id INTEGER REFERENCES campeonato(id)
);

CREATE TABLE resultado (
    id SERIAL PRIMARY KEY,
    corrida_id INTEGER REFERENCES corrida(id),
    piloto_id INTEGER REFERENCES piloto(id),
    posicao INTEGER,
    pontos INTEGER
);

-- Inserções

-- Campeonato
INSERT INTO campeonato (nome, ano) VALUES ('Fórmula 1 - Temporada 2024', 2024);

-- Equipes
INSERT INTO equipe (nome, pais) VALUES 
('Red Bull Racing', 'Áustria'),
('Mercedes', 'Alemanha'),
('Ferrari', 'Itália'),
('McLaren', 'Reino Unido'),
('Aston Martin', 'Reino Unido');

-- Pilotos (2 por equipe)
INSERT INTO piloto (nome, pais, equipe_id) VALUES
('Max Verstappen', 'Países Baixos', 1),
('Sergio Pérez', 'México', 1),
('Lewis Hamilton', 'Reino Unido', 2),
('George Russell', 'Reino Unido', 2),
('Charles Leclerc', 'Mônaco', 3),
('Carlos Sainz', 'Espanha', 3),
('Lando Norris', 'Reino Unido', 4),
('Oscar Piastri', 'Austrália', 4),
('Fernando Alonso', 'Espanha', 5),
('Lance Stroll', 'Canadá', 5);

-- Circuitos
INSERT INTO circuito (nome, pais) VALUES
('Bahrain International Circuit', 'Bahrein'),
('Jeddah Street Circuit', 'Arábia Saudita'),
('Melbourne Grand Prix Circuit', 'Austrália'),
('Autodromo Enzo e Dino Ferrari', 'Itália'),
('Circuit de Monaco', 'Mônaco');

-- Corridas
INSERT INTO corrida (data, circuito_id, campeonato_id) VALUES
('2024-03-02', 1, 1),
('2024-03-09', 2, 1),
('2024-03-24', 3, 1),
('2024-04-21', 4, 1),
('2024-05-26', 5, 1);

-- Resultados para as 5 corridas

-- Corrida 1
INSERT INTO resultado (corrida_id, piloto_id, posicao, pontos) VALUES
(1, 1, 1, 25), (1, 3, 2, 18), (1, 5, 3, 15), (1, 7, 4, 12), (1, 9, 5, 10),
(1, 2, 6, 8), (1, 4, 7, 6), (1, 6, 8, 4), (1, 8, 9, 2), (1, 10, 10, 1);

-- Corrida 2
INSERT INTO resultado (corrida_id, piloto_id, posicao, pontos) VALUES
(2, 3, 1, 25), (2, 1, 2, 18), (2, 7, 3, 15), (2, 5, 4, 12), (2, 4, 5, 10),
(2, 6, 6, 8), (2, 9, 7, 6), (2, 2, 8, 4), (2, 8, 9, 2), (2, 10, 10, 1);

-- Corrida 3
INSERT INTO resultado (corrida_id, piloto_id, posicao, pontos) VALUES
(3, 5, 1, 25), (3, 1, 2, 18), (3, 3, 3, 15), (3, 7, 4, 12), (3, 9, 5, 10),
(3, 2, 6, 8), (3, 6, 7, 6), (3, 4, 8, 4), (3, 10, 9, 2), (3, 8, 10, 1);

-- Corrida 4
INSERT INTO resultado (corrida_id, piloto_id, posicao, pontos) VALUES
(4, 1, 1, 25), (4, 2, 2, 18), (4, 3, 3, 15), (4, 4, 4, 12), (4, 5, 5, 10),
(4, 6, 6, 8), (4, 7, 7, 6), (4, 8, 8, 4), (4, 9, 9, 2), (4, 10, 10, 1);

-- Corrida 5
INSERT INTO resultado (corrida_id, piloto_id, posicao, pontos) VALUES
(5, 3, 1, 25), (5, 1, 2, 18), (5, 2, 3, 15), (5, 5, 4, 12), (5, 6, 5, 10),
(5, 4, 6, 8), (5, 9, 7, 6), (5, 7, 8, 4), (5, 8, 9, 2), (5, 10, 10, 1);
