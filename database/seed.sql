-- ==========================================
-- LANGUAGE
-- ==========================================
INSERT INTO
  language (code, name)
VALUES
  ('pl', 'Polish'),
  ('en', 'English'),
  ('it', 'Italian');

-- ==========================================
-- GAME
-- ==========================================
INSERT INTO
  game (code)
VALUES
  ('GWENT');

INSERT INTO
  game_translation (language_id, game_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      game
    WHERE
      code = 'GWENT'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gwent: The Legendary Card Game'
    WHEN l.code = 'pl' THEN 'Gwint: Legendarna gra karciana'
    WHEN l.code = 'it' THEN 'Gwent: Il Leggendario Gioco di Carte'
    ELSE '@@GWENT@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

-- ==========================================
-- DECK ABILITY
-- ==========================================
INSERT INTO
  deck_ability (code)
VALUES
  ('MONSTERS');

INSERT INTO
  deck_ability_translation (language_id, deck_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'MONSTERS'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Monsters'
    ELSE '@@MONSTERS@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  deck_ability (code)
VALUES
  ('NILFGAARD');

INSERT INTO
  deck_ability_translation (language_id, deck_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'NILFGAARD'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Nilfgaard'
    ELSE '@@NILFGAARD@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  deck_ability (code)
VALUES
  ('NORTHERN_REALMS');

INSERT INTO
  deck_ability_translation (language_id, deck_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'NORTHERN_REALMS'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Northern Realms'
    ELSE '@@NORTHERN_REALMS@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  deck_ability (code)
VALUES
  ('SCOIATAEL');

INSERT INTO
  deck_ability_translation (language_id, deck_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'SCOIATAEL'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scoia''tael'
    ELSE '@@SCOIATAEL@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  deck_ability (code)
VALUES
  ('SKELLIGE');

INSERT INTO
  deck_ability_translation (language_id, deck_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'SKELLIGE'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige'
    ELSE '@@SKELLIGE@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

-- ==========================================
-- DECK
-- ==========================================
INSERT INTO
  deck (code, game_id, ability_id)
VALUES
  (
    'MONSTERS',
    (
      SELECT
        id
      FROM
        game
      WHERE
        code = 'GWENT'
    ),
    (
      SELECT
        id
      FROM
        deck_ability
      WHERE
        code = 'MONSTERS'
    )
  );

INSERT INTO
  deck_translation (language_id, deck_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'MONSTERS'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Monsters'
    ELSE '@@MONSTERS@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  deck (code, game_id, ability_id)
VALUES
  (
    'NILFGAARD',
    (
      SELECT
        id
      FROM
        game
      WHERE
        code = 'GWENT'
    ),
    (
      SELECT
        id
      FROM
        deck_ability
      WHERE
        code = 'NILFGAARD'
    )
  );

INSERT INTO
  deck_translation (language_id, deck_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'NILFGAARD'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Nilfgaard'
    ELSE '@@NILFGAARD@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  deck (code, game_id, ability_id)
VALUES
  (
    'NORTHERN_REALMS',
    (
      SELECT
        id
      FROM
        game
      WHERE
        code = 'GWENT'
    ),
    (
      SELECT
        id
      FROM
        deck_ability
      WHERE
        code = 'NORTHERN_REALMS'
    )
  );

INSERT INTO
  deck_translation (language_id, deck_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'NORTHERN_REALMS'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Northern Realms'
    ELSE '@@NORTHERN_REALMS@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  deck (code, game_id, ability_id)
VALUES
  (
    'SCOIATAEL',
    (
      SELECT
        id
      FROM
        game
      WHERE
        code = 'GWENT'
    ),
    (
      SELECT
        id
      FROM
        deck_ability
      WHERE
        code = 'SCOIATAEL'
    )
  );

INSERT INTO
  deck_translation (language_id, deck_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'SCOIATAEL'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scoia''tael'
    ELSE '@@SCOIATAEL@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  deck (code, game_id, ability_id)
VALUES
  (
    'SKELLIGE',
    (
      SELECT
        id
      FROM
        game
      WHERE
        code = 'GWENT'
    ),
    (
      SELECT
        id
      FROM
        deck_ability
      WHERE
        code = 'SKELLIGE'
    )
  );

INSERT INTO
  deck_translation (language_id, deck_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'SKELLIGE'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige'
    ELSE '@@SKELLIGE@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

-- ==========================================
-- CARD TYPE
-- ==========================================
INSERT INTO
  card_type (code)
VALUES
  ('HERO');

INSERT INTO
  card_type_translation (language_id, card_type_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'HERO'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Hero'
    ELSE '@@HERO@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_type (code)
VALUES
  ('LEADER');

INSERT INTO
  card_type_translation (language_id, card_type_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'LEADER'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Leader'
    ELSE '@@LEADER@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_type (code)
VALUES
  ('SPECIAL');

INSERT INTO
  card_type_translation (language_id, card_type_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'SPECIAL'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Special'
    ELSE '@@SPECIAL@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_type (code)
VALUES
  ('UNIT');

INSERT INTO
  card_type_translation (language_id, card_type_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'UNIT'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Unit'
    ELSE '@@UNIT@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

-- ==========================================
-- CARD RANGE
-- ==========================================
INSERT INTO
  card_range (code)
VALUES
  ('AGILE');

INSERT INTO
  card_range_translation (language_id, card_range_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'AGILE'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Agile'
    ELSE '@@AGILE@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_range (code)
VALUES
  ('CLOSE');

INSERT INTO
  card_range_translation (language_id, card_range_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'CLOSE'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Close'
    ELSE '@@CLOSE@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_range (code)
VALUES
  ('RANGED');

INSERT INTO
  card_range_translation (language_id, card_range_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'RANGED'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Ranged'
    ELSE '@@RANGED@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_range (code)
VALUES
  ('SIEGE');

INSERT INTO
  card_range_translation (language_id, card_range_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'SIEGE'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Siege'
    ELSE '@@SIEGE@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

-- ==========================================
-- CARD ABILITY
-- ==========================================
INSERT INTO
  card_ability (code)
VALUES
  ('AVENGER');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'AVENGER'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Avenger'
    ELSE '@@AVENGER@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('BERSERKER');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'BERSERKER'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Berserker'
    ELSE '@@BERSERKER@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('BOND');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'BOND'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Bond'
    ELSE '@@BOND@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('CLEAR');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'CLEAR'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear'
    ELSE '@@CLEAR@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('DECOY');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'DECOY'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    ELSE '@@DECOY@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('FOG');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'FOG'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Fog'
    ELSE '@@FOG@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('FROST');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'FROST'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Frost'
    ELSE '@@FROST@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('HORN');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'HORN'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Horn'
    ELSE '@@HORN@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('MARDROEME');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MARDROEME'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Mardroeme'
    ELSE '@@MARDROEME@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('MEDIC');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MEDIC'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Medic'
    ELSE '@@MEDIC@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('MORALE');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MORALE'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Morale'
    ELSE '@@MORALE@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('MUSTER');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MUSTER'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Muster'
    ELSE '@@MUSTER@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('RAIN');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'RAIN'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Rain'
    ELSE '@@RAIN@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('SCORCH');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SCORCH'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    ELSE '@@SCORCH@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('SCORCH_ROW');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SCORCH_ROW'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch_row'
    ELSE '@@SCORCH_ROW@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('SPY');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SPY'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Spy'
    ELSE '@@SPY@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('STORM');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'STORM'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Storm'
    ELSE '@@STORM@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability (code)
VALUES
  ('SUMMON');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SUMMON'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Summon'
    ELSE '@@SUMMON@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');