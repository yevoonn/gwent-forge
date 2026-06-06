-- ==========================================
-- DROP ALL TABLES
-- ==========================================
DROP TABLE IF EXISTS card_ability_relationship CASCADE;

DROP TABLE IF EXISTS card_translation CASCADE;

DROP TABLE IF EXISTS card CASCADE;

DROP TABLE IF EXISTS card_ability_translation CASCADE;

DROP TABLE IF EXISTS card_ability CASCADE;

DROP TABLE IF EXISTS card_range_translation CASCADE;

DROP TABLE IF EXISTS card_range CASCADE;

DROP TABLE IF EXISTS card_type_translation CASCADE;

DROP TABLE IF EXISTS card_type CASCADE;

DROP TABLE IF EXISTS deck_translation CASCADE;

DROP TABLE IF EXISTS deck CASCADE;

DROP TABLE IF EXISTS deck_ability_translation CASCADE;

DROP TABLE IF EXISTS deck_ability CASCADE;

DROP TABLE IF EXISTS game_translation CASCADE;

DROP TABLE IF EXISTS game CASCADE;

DROP TABLE IF EXISTS language CASCADE;

-- ==========================================
-- LANGUAGE
-- ==========================================
CREATE TABLE
  language (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(5) NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL
  );

-- ==========================================
-- GAME
-- ==========================================
CREATE TABLE
  game (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(255) NOT NULL UNIQUE
  );

CREATE TABLE
  game_translation (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    language_id INTEGER NOT NULL,
    game_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    CONSTRAINT fk_game_translation_language FOREIGN KEY (language_id) REFERENCES language (id) ON DELETE CASCADE,
    CONSTRAINT fk_game_translation_game FOREIGN KEY (game_id) REFERENCES game (id) ON DELETE CASCADE,
    CONSTRAINT uq_game_translation UNIQUE (game_id, language_id)
  );

-- ==========================================
-- DECK ABILITY
-- ==========================================
CREATE TABLE
  deck_ability (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(255) NOT NULL UNIQUE
  );

CREATE TABLE
  deck_ability_translation (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    language_id INTEGER NOT NULL,
    deck_ability_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    CONSTRAINT fk_deck_ability_translation_language FOREIGN KEY (language_id) REFERENCES language (id) ON DELETE CASCADE,
    CONSTRAINT fk_deck_ability_translation_ability FOREIGN KEY (deck_ability_id) REFERENCES deck_ability (id) ON DELETE CASCADE,
    CONSTRAINT uq_deck_ability_translation UNIQUE (deck_ability_id, language_id)
  );

-- ==========================================
-- DECK
-- ==========================================
CREATE TABLE
  deck (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(255) NOT NULL UNIQUE,
    game_id INTEGER NOT NULL,
    ability_id INTEGER,
    CONSTRAINT fk_deck_game FOREIGN KEY (game_id) REFERENCES game (id) ON DELETE CASCADE,
    CONSTRAINT fk_deck_ability FOREIGN KEY (ability_id) REFERENCES deck_ability (id) ON DELETE CASCADE
  );

CREATE TABLE
  deck_translation (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    language_id INTEGER NOT NULL,
    deck_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    CONSTRAINT fk_deck_translation_language FOREIGN KEY (language_id) REFERENCES language (id) ON DELETE CASCADE,
    CONSTRAINT fk_deck_translation_deck FOREIGN KEY (deck_id) REFERENCES deck (id) ON DELETE CASCADE,
    CONSTRAINT uq_deck_translation UNIQUE (deck_id, language_id)
  );

-- ==========================================
-- CARD TYPE
-- ==========================================
CREATE TABLE
  card_type (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(255) NOT NULL UNIQUE
  );

CREATE TABLE
  card_type_translation (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    language_id INTEGER NOT NULL,
    card_type_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    CONSTRAINT fk_card_type_translation_language FOREIGN KEY (language_id) REFERENCES language (id) ON DELETE CASCADE,
    CONSTRAINT fk_card_type_translation_type FOREIGN KEY (card_type_id) REFERENCES card_type (id) ON DELETE CASCADE,
    CONSTRAINT uq_card_type_translation UNIQUE (card_type_id, language_id)
  );

-- ==========================================
-- CARD RANGE
-- ==========================================
CREATE TABLE
  card_range (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(255) NOT NULL UNIQUE
  );

CREATE TABLE
  card_range_translation (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    language_id INTEGER NOT NULL,
    card_range_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    CONSTRAINT fk_card_range_translation_language FOREIGN KEY (language_id) REFERENCES language (id) ON DELETE CASCADE,
    CONSTRAINT fk_card_range_translation_range FOREIGN KEY (card_range_id) REFERENCES card_range (id) ON DELETE CASCADE,
    CONSTRAINT uq_card_range_translation UNIQUE (card_range_id, language_id)
  );

-- ==========================================
-- CARD ABILITY
-- ==========================================
CREATE TABLE
  card_ability (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code VARCHAR(255) NOT NULL UNIQUE
  );

CREATE TABLE
  card_ability_translation (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    language_id INTEGER NOT NULL,
    card_ability_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    CONSTRAINT fk_card_ability_translation_language FOREIGN KEY (language_id) REFERENCES language (id) ON DELETE CASCADE,
    CONSTRAINT fk_card_ability_translation_ability FOREIGN KEY (card_ability_id) REFERENCES card_ability (id) ON DELETE CASCADE,
    CONSTRAINT uq_card_ability_translation UNIQUE (card_ability_id, language_id)
  );

-- ==========================================
-- CARD
-- ==========================================
CREATE TABLE
  card (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    deck_id INTEGER NOT NULL,
    code VARCHAR(255) NOT NULL UNIQUE,
    power INTEGER,
    is_deck_card BOOLEAN NOT NULL DEFAULT TRUE,
    type_id INTEGER NOT NULL,
    range_id INTEGER,
    image_url VARCHAR(500),
    CONSTRAINT fk_card_deck FOREIGN KEY (deck_id) REFERENCES deck (id) ON DELETE CASCADE,
    CONSTRAINT fk_card_type FOREIGN KEY (type_id) REFERENCES card_type (id) ON DELETE CASCADE,
    CONSTRAINT fk_card_range FOREIGN KEY (range_id) REFERENCES card_range (id) ON DELETE SET NULL
  );

CREATE TABLE
  card_translation (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    language_id INTEGER NOT NULL,
    card_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    CONSTRAINT fk_card_translation_language FOREIGN KEY (language_id) REFERENCES language (id) ON DELETE CASCADE,
    CONSTRAINT fk_card_translation_card FOREIGN KEY (card_id) REFERENCES card (id) ON DELETE CASCADE,
    CONSTRAINT uq_card_translation UNIQUE (card_id, language_id)
  );

-- ==========================================
-- CARD ABILITY RELATIONSHIP
-- ==========================================
CREATE TABLE
  card_ability_relationship (
    card_id INTEGER NOT NULL,
    card_ability_id INTEGER NOT NULL,
    CONSTRAINT pk_card_ability_relationship PRIMARY KEY (card_id, card_ability_id),
    CONSTRAINT fk_car_card FOREIGN KEY (card_id) REFERENCES card (id) ON DELETE CASCADE,
    CONSTRAINT fk_car_ability FOREIGN KEY (card_ability_id) REFERENCES card_ability (id) ON DELETE CASCADE
  );

CREATE INDEX idx_game_translation_language_id ON game_translation (language_id);

CREATE INDEX idx_game_translation_game_id ON game_translation (game_id);

CREATE INDEX idx_deck_game_id ON deck (game_id);

CREATE INDEX idx_deck_ability_id ON deck (ability_id);

CREATE INDEX idx_deck_translation_language_id ON deck_translation (language_id);

CREATE INDEX idx_deck_translation_deck_id ON deck_translation (deck_id);

CREATE INDEX idx_deck_ability_translation_language_id ON deck_ability_translation (language_id);

CREATE INDEX idx_deck_ability_translation_ability_id ON deck_ability_translation (deck_ability_id);

CREATE INDEX idx_card_type_translation_language_id ON card_type_translation (language_id);

CREATE INDEX idx_card_type_translation_type_id ON card_type_translation (card_type_id);

CREATE INDEX idx_card_range_translation_language_id ON card_range_translation (language_id);

CREATE INDEX idx_card_range_translation_range_id ON card_range_translation (card_range_id);

CREATE INDEX idx_card_ability_translation_language_id ON card_ability_translation (language_id);

CREATE INDEX idx_card_ability_translation_ability_id ON card_ability_translation (card_ability_id);

CREATE INDEX idx_card_deck_id ON card (deck_id);

CREATE INDEX idx_card_type_id ON card (type_id);

CREATE INDEX idx_card_range_id ON card (range_id);

CREATE INDEX idx_card_translation_language_id ON card_translation (language_id);

CREATE INDEX idx_card_translation_card_id ON card_translation (card_id);

CREATE INDEX idx_card_ability_relationship_card_ability_id ON card_ability_relationship (card_ability_id);