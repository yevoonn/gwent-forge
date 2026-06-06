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

-- ==========================================
-- CARD
-- ==========================================
INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON001',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/MON001.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON001'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Eredin Bréacc Glas, The Treacherous'
    WHEN l.code = 'it' THEN 'Eredin Bréacc Glas, Il Traditore'
    ELSE '@@Eredin Bréacc Glas, The Treacherous@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON002',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/MON002.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON002'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Eredin, Bringer of Death'
    WHEN l.code = 'it' THEN 'Eredin, Il Flagello'
    ELSE '@@Eredin, Bringer of Death@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON003',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/MON003.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON003'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Eredin, Commander of the Red Riders'
    WHEN l.code = 'it' THEN 'Eredin, Comandante dei Cavalieri Rossi'
    ELSE '@@Eredin, Commander of the Red Riders@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON004',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/MON004.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON004'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Eredin, Destroyer of Worlds'
    WHEN l.code = 'it' THEN 'Eredin, Distruttore di Mondi'
    ELSE '@@Eredin, Destroyer of Worlds@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON005',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/MON005.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON005'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Eredin, King of the Wild Hunt'
    WHEN l.code = 'it' THEN 'Eredin, Re della Caccia Selvaggia'
    ELSE '@@Eredin, King of the Wild Hunt@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON006',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON006.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON006'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Avallac''h'
    WHEN l.code = 'it' THEN 'Avallac''h'
    ELSE '@@Avallac''h@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON007',
    15,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON007.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON007'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Cirilla Fiona Elen Riannon'
    WHEN l.code = 'it' THEN 'Cirilla'
    ELSE '@@Cirilla Fiona Elen Riannon@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON008',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON008.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON008'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Draug'
    WHEN l.code = 'it' THEN 'Draug'
    ELSE '@@Draug@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON009',
    15,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON009.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON009'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Geralt of Rivia'
    WHEN l.code = 'it' THEN 'Geralt di Rivia'
    ELSE '@@Geralt of Rivia@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON010',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON010.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON010'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Imlerith'
    WHEN l.code = 'it' THEN 'Imlerith'
    ELSE '@@Imlerith@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON011',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/MON011.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON011'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Kayran'
    WHEN l.code = 'it' THEN 'Kayran'
    ELSE '@@Kayran@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON012',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/MON012.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON012'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Leshen'
    WHEN l.code = 'it' THEN 'Leshen'
    ELSE '@@Leshen@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON013',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON013.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON013'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Triss Merigold'
    WHEN l.code = 'it' THEN 'Triss Merigold'
    ELSE '@@Triss Merigold@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON014',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/MON014.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON014'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Yennefer of Vengerberg'
    WHEN l.code = 'it' THEN 'Yennefer di Vengerberg'
    ELSE '@@Yennefer of Vengerberg@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON015',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON015.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON015'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Arachas'
    WHEN l.code = 'it' THEN 'Arachas'
    ELSE '@@Arachas@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON016',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON016.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON016'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Arachas'
    WHEN l.code = 'it' THEN 'Arachas'
    ELSE '@@Arachas@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON017',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON017.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON017'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Arachas'
    WHEN l.code = 'it' THEN 'Arachas'
    ELSE '@@Arachas@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON018',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/MON018.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON018'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Arachas Behemoth'
    WHEN l.code = 'it' THEN 'Arachas Gigante'
    ELSE '@@Arachas Behemoth@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON019',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON019.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON019'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Botchling'
    WHEN l.code = 'it' THEN 'Botchling'
    ELSE '@@Botchling@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON020_1_2',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON020.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON020_1_2'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Bovine Defence Force'
    WHEN l.code = 'it' THEN 'Forza di Difesa Bovina'
    ELSE '@@Bovine Defence Force@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON020_2_2',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON020.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON020_2_2'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Bovine Defence Force'
    WHEN l.code = 'it' THEN 'Forza di Difesa Bovina'
    ELSE '@@Bovine Defence Force@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON021',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/MON021.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON021'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Celaeno Harpy'
    WHEN l.code = 'it' THEN 'Arpia Celaeno'
    ELSE '@@Celaeno Harpy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON022',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/MON022.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON022'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Cockatrice'
    WHEN l.code = 'it' THEN 'Cockatrice'
    ELSE '@@Cockatrice@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON023',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/MON023.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON023'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Cow'
    WHEN l.code = 'it' THEN 'Mucca'
    ELSE '@@Cow@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON024',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON024.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON024'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Crone: Brewess'
    WHEN l.code = 'it' THEN 'Megera: Brewess'
    ELSE '@@Crone: Brewess@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON025',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON025.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON025'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Crone: Weavess'
    WHEN l.code = 'it' THEN 'Megera: Weavess'
    ELSE '@@Crone: Weavess@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON026',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON026.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON026'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Crone: Whispess'
    WHEN l.code = 'it' THEN 'Megera: Whispess'
    ELSE '@@Crone: Whispess@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON027',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON027.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON027'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Dandelion'
    WHEN l.code = 'it' THEN 'Dandelion'
    ELSE '@@Dandelion@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON028',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/MON028.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON028'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Earth Elemental'
    WHEN l.code = 'it' THEN 'Elementale della Terra'
    ELSE '@@Earth Elemental@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON029',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON029.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON029'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Emiel Regis Rohellec Terzieff'
    WHEN l.code = 'it' THEN 'Emiel Regis'
    ELSE '@@Emiel Regis Rohellec Terzieff@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON030',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/MON030.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON030'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Endrega'
    WHEN l.code = 'it' THEN 'Endriaga'
    ELSE '@@Endrega@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON031',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON031.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON031'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Fiend'
    WHEN l.code = 'it' THEN 'Demonio'
    ELSE '@@Fiend@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON032',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/MON032.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON032'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Fire Elemental'
    WHEN l.code = 'it' THEN 'Elementale del Fuoco'
    ELSE '@@Fire Elemental@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON033',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON033.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON033'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Foglet'
    WHEN l.code = 'it' THEN 'Foglet'
    ELSE '@@Foglet@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON034',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON034.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON034'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Forktail'
    WHEN l.code = 'it' THEN 'Codabiforca'
    ELSE '@@Forktail@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON035',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON035.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON035'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Frightener'
    WHEN l.code = 'it' THEN 'Terrorizzatore'
    ELSE '@@Frightener@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON036',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/MON036.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON036'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gargoyle'
    WHEN l.code = 'it' THEN 'Gargoyle'
    ELSE '@@Gargoyle@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON037',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/MON037.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON037'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm'
    ELSE '@@Gaunter O''Dimm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON038_1_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/MON038.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON038_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm - Darkness'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm - Oscurità'
    ELSE '@@Gaunter O''Dimm - Darkness@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON038_2_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/MON038.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON038_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm - Darkness'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm - Oscurità'
    ELSE '@@Gaunter O''Dimm - Darkness@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON038_3_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/MON038.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON038_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm - Darkness'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm - Oscurità'
    ELSE '@@Gaunter O''Dimm - Darkness@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON039',
    1,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON039.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON039'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Ghoul'
    WHEN l.code = 'it' THEN 'Ghoul'
    ELSE '@@Ghoul@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON040',
    1,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON040.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON040'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Ghoul'
    WHEN l.code = 'it' THEN 'Ghoul'
    ELSE '@@Ghoul@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON041',
    1,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON041.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON041'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Ghoul'
    WHEN l.code = 'it' THEN 'Ghoul'
    ELSE '@@Ghoul@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON042',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/MON042.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON042'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Grave Hag'
    WHEN l.code = 'it' THEN 'Strega dei Sepolcri'
    ELSE '@@Grave Hag@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON043',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON043.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON043'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Griffin'
    WHEN l.code = 'it' THEN 'Grifone'
    ELSE '@@Griffin@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON044',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/MON044.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON044'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Harpy'
    WHEN l.code = 'it' THEN 'Arpia'
    ELSE '@@Harpy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON045',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/MON045.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON045'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Ice Giant'
    WHEN l.code = 'it' THEN 'Gigante dei Ghiacci'
    ELSE '@@Ice Giant@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON046',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON046.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON046'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Nekker'
    WHEN l.code = 'it' THEN 'Nekker'
    ELSE '@@Nekker@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON047',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON047.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON047'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Nekker'
    WHEN l.code = 'it' THEN 'Nekker'
    ELSE '@@Nekker@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON048',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON048.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON048'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Nekker'
    WHEN l.code = 'it' THEN 'Nekker'
    ELSE '@@Nekker@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON049',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/MON049.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON049'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Olgierd von Everec'
    WHEN l.code = 'it' THEN 'Olgierd von Everec'
    ELSE '@@Olgierd von Everec@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON050',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON050.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON050'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Plague Maiden'
    WHEN l.code = 'it' THEN 'Fanciulla della Malattia'
    ELSE '@@Plague Maiden@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON051',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON051.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON051'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Roach'
    WHEN l.code = 'it' THEN 'Rutilia'
    ELSE '@@Roach@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON052',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/MON052.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON052'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Toad'
    WHEN l.code = 'it' THEN 'Rospo'
    ELSE '@@Toad@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON053',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON053.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON053'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vampire: Bruxa'
    WHEN l.code = 'it' THEN 'Vampiro: Bruxa'
    ELSE '@@Vampire: Bruxa@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON054',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON054.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON054'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vampire: Ekimmara'
    WHEN l.code = 'it' THEN 'Vampiro: Ekimmuh'
    ELSE '@@Vampire: Ekimmara@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON055',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON055.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON055'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vampire: Fleder'
    WHEN l.code = 'it' THEN 'Vampiro: Fleder'
    ELSE '@@Vampire: Fleder@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON056',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON056.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON056'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vampire: Garkain'
    WHEN l.code = 'it' THEN 'Vampire: Garkain'
    ELSE '@@Vampire: Garkain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON057',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON057.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON057'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vampire: Katakan'
    WHEN l.code = 'it' THEN 'Vampiro: Katakan'
    ELSE '@@Vampire: Katakan@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON058',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON058.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON058'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vesemir'
    WHEN l.code = 'it' THEN 'Vesemir'
    ELSE '@@Vesemir@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON059',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON059.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON059'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Villentretenmerth'
    WHEN l.code = 'it' THEN 'Villentretenmerth'
    ELSE '@@Villentretenmerth@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON060',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON060.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON060'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Werewolf'
    WHEN l.code = 'it' THEN 'Lupo Mannaro'
    ELSE '@@Werewolf@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON061',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/MON061.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON061'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Wyvern'
    WHEN l.code = 'it' THEN 'Viverna'
    ELSE '@@Wyvern@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON062',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/MON062.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON062'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Zoltan Chivay'
    WHEN l.code = 'it' THEN 'Zoltan Chivay'
    ELSE '@@Zoltan Chivay@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON063_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON063.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON063_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Biting Frost'
    WHEN l.code = 'it' THEN 'Morsa del Gelo'
    ELSE '@@Biting Frost@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON063_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON063.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON063_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Biting Frost'
    WHEN l.code = 'it' THEN 'Morsa del Gelo'
    ELSE '@@Biting Frost@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON063_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON063.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON063_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Biting Frost'
    WHEN l.code = 'it' THEN 'Morsa del Gelo'
    ELSE '@@Biting Frost@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON064_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON064.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON064_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear Weather'
    WHEN l.code = 'it' THEN 'Clima Sereno'
    ELSE '@@Clear Weather@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON064_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON064.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON064_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear Weather'
    WHEN l.code = 'it' THEN 'Clima Sereno'
    ELSE '@@Clear Weather@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON064_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON064.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON064_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear Weather'
    WHEN l.code = 'it' THEN 'Clima Sereno'
    ELSE '@@Clear Weather@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON065_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON065.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON065_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Commander''s Horn'
    WHEN l.code = 'it' THEN 'Corno del Comandante'
    ELSE '@@Commander''s Horn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON065_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON065.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON065_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Commander''s Horn'
    WHEN l.code = 'it' THEN 'Corno del Comandante'
    ELSE '@@Commander''s Horn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON065_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON065.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON065_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Commander''s Horn'
    WHEN l.code = 'it' THEN 'Corno del Comandante'
    ELSE '@@Commander''s Horn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON066_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON066.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON066_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    WHEN l.code = 'it' THEN 'Esca'
    ELSE '@@Decoy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON066_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON066.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON066_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    WHEN l.code = 'it' THEN 'Esca'
    ELSE '@@Decoy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON066_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON066.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON066_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    WHEN l.code = 'it' THEN 'Esca'
    ELSE '@@Decoy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON067_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON067.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON067_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impenetrable Fog'
    WHEN l.code = 'it' THEN 'Nebbia Impenetrabile'
    ELSE '@@Impenetrable Fog@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON067_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON067.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON067_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impenetrable Fog'
    WHEN l.code = 'it' THEN 'Nebbia Impenetrabile'
    ELSE '@@Impenetrable Fog@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON067_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON067.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON067_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impenetrable Fog'
    WHEN l.code = 'it' THEN 'Nebbia Impenetrabile'
    ELSE '@@Impenetrable Fog@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON068_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON068.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON068_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    WHEN l.code = 'it' THEN 'Ustione'
    ELSE '@@Scorch@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON068_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON068.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON068_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    WHEN l.code = 'it' THEN 'Ustione'
    ELSE '@@Scorch@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON068_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON068.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON068_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    WHEN l.code = 'it' THEN 'Ustione'
    ELSE '@@Scorch@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON069_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON069.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON069_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige Storm'
    WHEN l.code = 'it' THEN 'Tempesta di Skellige'
    ELSE '@@Skellige Storm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON069_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON069.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON069_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige Storm'
    WHEN l.code = 'it' THEN 'Tempesta di Skellige'
    ELSE '@@Skellige Storm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON069_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON069.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON069_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige Storm'
    WHEN l.code = 'it' THEN 'Tempesta di Skellige'
    ELSE '@@Skellige Storm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON070_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON070.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON070_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Torrential Rain'
    WHEN l.code = 'it' THEN 'Pioggia Torrenziale'
    ELSE '@@Torrential Rain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON070_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON070.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON070_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Torrential Rain'
    WHEN l.code = 'it' THEN 'Pioggia Torrenziale'
    ELSE '@@Torrential Rain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'MONSTERS'
    ),
    'MON070_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/MON070.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON070_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Torrential Rain'
    WHEN l.code = 'it' THEN 'Pioggia Torrenziale'
    ELSE '@@Torrential Rain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL001',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/NIL001.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL001'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Emhyr var Emreis, His Imperial Majesty'
    WHEN l.code = 'it' THEN 'Emhyr var Emreis, Sua Altezza Imperiale'
    ELSE '@@Emhyr var Emreis, His Imperial Majesty@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL002',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/NIL002.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL002'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Emhyr var Emreis, Invader of the North'
    WHEN l.code = 'it' THEN 'Emhyr var Emreis, Invasore del Nord'
    ELSE '@@Emhyr var Emreis, Invader of the North@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL003',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/NIL003.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL003'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Emhyr var Emreis, The Emperor of Nilfgaard'
    WHEN l.code = 'it' THEN 'Emhyr var Emreis, Imperatore di Nilfgaard'
    ELSE '@@Emhyr var Emreis, The Emperor of Nilfgaard@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL004',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/NIL004.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL004'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Emhyr var Emreis, The Relentless'
    WHEN l.code = 'it' THEN 'Emhyr var Emreis, L''Implacabile'
    ELSE '@@Emhyr var Emreis, The Relentless@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL005',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/NIL005.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL005'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Emhyr var Emreis, The White Flame'
    WHEN l.code = 'it' THEN 'Emhyr var Emreis, La Fiamma Bianca'
    ELSE '@@Emhyr var Emreis, The White Flame@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL006',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL006.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL006'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Avallac''h'
    WHEN l.code = 'it' THEN 'Avallac''h'
    ELSE '@@Avallac''h@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL007',
    15,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL007.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL007'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Cirilla Fiona Elen Riannon'
    WHEN l.code = 'it' THEN 'Cirilla'
    ELSE '@@Cirilla Fiona Elen Riannon@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL008',
    15,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL008.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL008'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Geralt of Rivia'
    WHEN l.code = 'it' THEN 'Geralt di Rivia'
    ELSE '@@Geralt of Rivia@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL009',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL009.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL009'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Letho of Gulet'
    WHEN l.code = 'it' THEN 'Letho di Gulet'
    ELSE '@@Letho of Gulet@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL010',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL010.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL010'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Menno Coehoorn'
    WHEN l.code = 'it' THEN 'Menno Coehoorn'
    ELSE '@@Menno Coehoorn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL011',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NIL011.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL011'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Morvran Voorhis'
    WHEN l.code = 'it' THEN 'Morvran Voorhis'
    ELSE '@@Morvran Voorhis@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL012',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL012.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL012'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Tibor Eggebracht'
    WHEN l.code = 'it' THEN 'Tibor Eggebracht'
    ELSE '@@Tibor Eggebracht@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL013',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL013.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL013'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Triss Merigold'
    WHEN l.code = 'it' THEN 'Triss Merigold'
    ELSE '@@Triss Merigold@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL014',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL014.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL014'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Yennefer of Vengerberg'
    WHEN l.code = 'it' THEN 'Yennefer di Vengerberg'
    ELSE '@@Yennefer of Vengerberg@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL015',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL015.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL015'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Albrich'
    WHEN l.code = 'it' THEN 'Albrich'
    ELSE '@@Albrich@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL016',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL016.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL016'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Assire var Anahid'
    WHEN l.code = 'it' THEN 'Assire var Anahid'
    ELSE '@@Assire var Anahid@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL017',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL017.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL017'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Black Infantry Archer'
    WHEN l.code = 'it' THEN 'Arciere di Fanteria Nera'
    ELSE '@@Black Infantry Archer@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL018',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL018.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL018'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Black Infantry Archer'
    WHEN l.code = 'it' THEN 'Arciere di Fanteria Nera'
    ELSE '@@Black Infantry Archer@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL019_1_2',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL019.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL019_1_2'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Bovine Defence Force'
    WHEN l.code = 'it' THEN 'Forza di Difesa Bovina'
    ELSE '@@Bovine Defence Force@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL019_2_2',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL019.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL019_2_2'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Bovine Defence Force'
    WHEN l.code = 'it' THEN 'Forza di Difesa Bovina'
    ELSE '@@Bovine Defence Force@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL020',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL020.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL020'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Cahir Mawr Dyffryn'
    WHEN l.code = 'it' THEN 'Cahir Mawr Dyffryn'
    ELSE '@@Cahir Mawr Dyffryn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL021',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL021.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL021'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Cow'
    WHEN l.code = 'it' THEN 'Mucca'
    ELSE '@@Cow@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL022',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL022.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL022'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Cynthia'
    WHEN l.code = 'it' THEN 'Cynthia'
    ELSE '@@Cynthia@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL023',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL023.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL023'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Dandelion'
    WHEN l.code = 'it' THEN 'Dandelion'
    ELSE '@@Dandelion@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL024',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL024.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL024'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Emiel Regis Rohellec'
    WHEN l.code = 'it' THEN 'Emiel Regis'
    ELSE '@@Emiel Regis Rohellec@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL025',
    1,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL025.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL025'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Etolian Auxiliary Archers'
    WHEN l.code = 'it' THEN 'Arciere'
    ELSE '@@Etolian Auxiliary Archers@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL026',
    1,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL026.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL026'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Etolian Auxiliary Archers'
    WHEN l.code = 'it' THEN 'Arciere'
    ELSE '@@Etolian Auxiliary Archers@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL027',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL027.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL027'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Fringilla Vigo'
    WHEN l.code = 'it' THEN 'Fringilla Vigo'
    ELSE '@@Fringilla Vigo@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL028',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NIL028.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL028'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm'
    ELSE '@@Gaunter O''Dimm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL029_1_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL029.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL029_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm - Darkness'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm - Oscurità'
    ELSE '@@Gaunter O''Dimm - Darkness@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL029_2_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL029.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL029_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm - Darkness'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm - Oscurità'
    ELSE '@@Gaunter O''Dimm - Darkness@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL029_3_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL029.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL029_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm - Darkness'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm - Oscurità'
    ELSE '@@Gaunter O''Dimm - Darkness@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL030',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NIL030.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL030'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Heavy Zerrikanian Fire Scorpion'
    WHEN l.code = 'it' THEN 'Megascopione di Fuoco'
    ELSE '@@Heavy Zerrikanian Fire Scorpion@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL031',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL031.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL031'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impera Brigade Guard'
    WHEN l.code = 'it' THEN 'Brigata Impera'
    ELSE '@@Impera Brigade Guard@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL032',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL032.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL032'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impera Brigade Guard'
    WHEN l.code = 'it' THEN 'Brigata Impera'
    ELSE '@@Impera Brigade Guard@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL033',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL033.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL033'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impera Brigade Guard'
    WHEN l.code = 'it' THEN 'Brigata Impera'
    ELSE '@@Impera Brigade Guard@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL034',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL034.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL034'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impera Brigade Guard'
    WHEN l.code = 'it' THEN 'Brigata Impera'
    ELSE '@@Impera Brigade Guard@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL035',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL035.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL035'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Morteisen'
    WHEN l.code = 'it' THEN 'Morteisen'
    ELSE '@@Morteisen@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL036',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL036.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL036'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Nausicaa Cavalry Rider'
    WHEN l.code = 'it' THEN 'Brigata Nausicaa'
    ELSE '@@Nausicaa Cavalry Rider@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL037',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL037.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL037'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Nausicaa Cavalry Rider'
    WHEN l.code = 'it' THEN 'Brigata Nausicaa'
    ELSE '@@Nausicaa Cavalry Rider@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL038',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL038.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL038'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Nausicaa Cavalry Rider'
    WHEN l.code = 'it' THEN 'Brigata Nausicaa'
    ELSE '@@Nausicaa Cavalry Rider@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL039',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/NIL039.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL039'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Olgierd von Everec'
    WHEN l.code = 'it' THEN 'Olgierd von Everec'
    ELSE '@@Olgierd von Everec@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL040',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL040.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL040'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Puttkammer'
    WHEN l.code = 'it' THEN 'Puttkammer'
    ELSE '@@Puttkammer@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL041',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL041.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL041'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Rainfarn'
    WHEN l.code = 'it' THEN 'Rainfarn'
    ELSE '@@Rainfarn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL042',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL042.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL042'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Renuald aep Matsen'
    WHEN l.code = 'it' THEN 'Renuald aep Matsen'
    ELSE '@@Renuald aep Matsen@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL043',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL043.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL043'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Roach'
    WHEN l.code = 'it' THEN 'Rutilia'
    ELSE '@@Roach@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL044',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NIL044.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL044'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Rotten Mangonel'
    WHEN l.code = 'it' THEN 'Manganella Putrida'
    ELSE '@@Rotten Mangonel@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL045',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL045.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL045'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Shilard Fitz-Oesterlen'
    WHEN l.code = 'it' THEN 'Shilard Fitz-Oesterlen'
    ELSE '@@Shilard Fitz-Oesterlen@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL046',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NIL046.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL046'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Siege Engineer'
    WHEN l.code = 'it' THEN 'Ingeniere d''Assedi'
    ELSE '@@Siege Engineer@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL047',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NIL047.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL047'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Siege Technician'
    WHEN l.code = 'it' THEN 'Supporto d''Assedio'
    ELSE '@@Siege Technician@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL048',
    9,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL048.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL048'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Stefan Skellen'
    WHEN l.code = 'it' THEN 'Stefan Skellen'
    ELSE '@@Stefan Skellen@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL049',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL049.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL049'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Sweers'
    WHEN l.code = 'it' THEN 'I Massicci'
    ELSE '@@Sweers@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL050',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NIL050.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL050'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vanhemar'
    WHEN l.code = 'it' THEN 'Vanhemar'
    ELSE '@@Vanhemar@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL051',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL051.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL051'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vattier de Rideaux'
    WHEN l.code = 'it' THEN 'Vattier de Rideaux'
    ELSE '@@Vattier de Rideaux@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL052',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL052.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL052'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vesemir'
    WHEN l.code = 'it' THEN 'Vesemir'
    ELSE '@@Vesemir@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL053',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL053.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL053'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Villentretenmerth'
    WHEN l.code = 'it' THEN 'Villentretenmerth'
    ELSE '@@Villentretenmerth@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL054',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL054.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL054'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vreemde'
    WHEN l.code = 'it' THEN 'Vreemde'
    ELSE '@@Vreemde@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL055',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL055.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL055'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Young Emissary'
    WHEN l.code = 'it' THEN 'Giovane Ambasciatore'
    ELSE '@@Young Emissary@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL056',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL056.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL056'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Young Emissary'
    WHEN l.code = 'it' THEN 'Giovane Ambasciatore'
    ELSE '@@Young Emissary@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL057',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NIL057.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL057'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Zerrikanian Fire Scorpion'
    WHEN l.code = 'it' THEN 'Scorpione di Fuoco'
    ELSE '@@Zerrikanian Fire Scorpion@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL058',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NIL058.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL058'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Zoltan Chivay'
    WHEN l.code = 'it' THEN 'Zoltan Chivay'
    ELSE '@@Zoltan Chivay@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL059_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL059.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL059_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Biting Frost'
    WHEN l.code = 'it' THEN 'Morsa del Gelo'
    ELSE '@@Biting Frost@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL059_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL059.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL059_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Biting Frost'
    WHEN l.code = 'it' THEN 'Morsa del Gelo'
    ELSE '@@Biting Frost@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL059_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL059.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL059_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Biting Frost'
    WHEN l.code = 'it' THEN 'Morsa del Gelo'
    ELSE '@@Biting Frost@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL060_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL060.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL060_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear Weather'
    WHEN l.code = 'it' THEN 'Clima Sereno'
    ELSE '@@Clear Weather@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL060_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL060.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL060_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear Weather'
    WHEN l.code = 'it' THEN 'Clima Sereno'
    ELSE '@@Clear Weather@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL060_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL060.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL060_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear Weather'
    WHEN l.code = 'it' THEN 'Clima Sereno'
    ELSE '@@Clear Weather@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL061_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL061.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL061_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Commander''s Horn'
    WHEN l.code = 'it' THEN 'Corno del Comandante'
    ELSE '@@Commander''s Horn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL061_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL061.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL061_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Commander''s Horn'
    WHEN l.code = 'it' THEN 'Corno del Comandante'
    ELSE '@@Commander''s Horn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL061_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL061.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL061_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Commander''s Horn'
    WHEN l.code = 'it' THEN 'Corno del Comandante'
    ELSE '@@Commander''s Horn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL062_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL062.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL062_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    WHEN l.code = 'it' THEN 'Esca'
    ELSE '@@Decoy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL062_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL062.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL062_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    WHEN l.code = 'it' THEN 'Esca'
    ELSE '@@Decoy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL062_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL062.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL062_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    WHEN l.code = 'it' THEN 'Esca'
    ELSE '@@Decoy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL063_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL063.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL063_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impenetrable Fog'
    WHEN l.code = 'it' THEN 'Nebbia Impenetrabile'
    ELSE '@@Impenetrable Fog@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL063_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL063.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL063_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impenetrable Fog'
    WHEN l.code = 'it' THEN 'Nebbia Impenetrabile'
    ELSE '@@Impenetrable Fog@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL063_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL063.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL063_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impenetrable Fog'
    WHEN l.code = 'it' THEN 'Nebbia Impenetrabile'
    ELSE '@@Impenetrable Fog@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL064_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL064.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL064_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    WHEN l.code = 'it' THEN 'Ustione'
    ELSE '@@Scorch@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL064_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL064.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL064_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    WHEN l.code = 'it' THEN 'Ustione'
    ELSE '@@Scorch@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL064_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL064.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL064_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    WHEN l.code = 'it' THEN 'Ustione'
    ELSE '@@Scorch@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL065_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL065.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL065_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige Storm'
    WHEN l.code = 'it' THEN 'Tempesta di Skellige'
    ELSE '@@Skellige Storm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL065_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL065.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL065_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige Storm'
    WHEN l.code = 'it' THEN 'Tempesta di Skellige'
    ELSE '@@Skellige Storm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL065_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL065.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL065_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige Storm'
    WHEN l.code = 'it' THEN 'Tempesta di Skellige'
    ELSE '@@Skellige Storm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL066_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL066.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL066_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Torrential Rain'
    WHEN l.code = 'it' THEN 'Pioggia Torrenziale'
    ELSE '@@Torrential Rain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL066_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL066.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL066_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Torrential Rain'
    WHEN l.code = 'it' THEN 'Pioggia Torrenziale'
    ELSE '@@Torrential Rain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NILFGAARD'
    ),
    'NIL066_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NIL066.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NIL066_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Torrential Rain'
    WHEN l.code = 'it' THEN 'Pioggia Torrenziale'
    ELSE '@@Torrential Rain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR001',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/NOR001.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR001'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Foltest, King of Temeria'
    WHEN l.code = 'it' THEN 'Foltest, Re di Temeria'
    ELSE '@@Foltest, King of Temeria@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR002',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/NOR002.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR002'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Foltest, Lord Commander of the North'
    WHEN l.code = 'it' THEN 'Foltest, Lord del Nord'
    ELSE '@@Foltest, Lord Commander of the North@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR003',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/NOR003.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR003'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Foltest, Son of Medell'
    WHEN l.code = 'it' THEN 'Foltest, Figlio di Medell'
    ELSE '@@Foltest, Son of Medell@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR004',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/NOR004.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR004'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Foltest, The Siegemaster'
    WHEN l.code = 'it' THEN 'Foltest, L''Espugnatore'
    ELSE '@@Foltest, The Siegemaster@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR005',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/NOR005.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR005'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Foltest, The Steel-Forged'
    WHEN l.code = 'it' THEN 'Foltest, L''Inarrestabile'
    ELSE '@@Foltest, The Steel-Forged@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR006',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR006.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR006'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Avallac''h'
    WHEN l.code = 'it' THEN 'Avallac''h'
    ELSE '@@Avallac''h@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR007',
    15,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR007.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR007'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Cirilla Fiona Elen Riannon'
    WHEN l.code = 'it' THEN 'Cirilla'
    ELSE '@@Cirilla Fiona Elen Riannon@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR008',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR008.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR008'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Esterad Thyssen'
    WHEN l.code = 'it' THEN 'Esterad Thyssen'
    ELSE '@@Esterad Thyssen@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR009',
    15,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR009.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR009'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Geralt of Rivia'
    WHEN l.code = 'it' THEN 'Geralt di Rivia'
    ELSE '@@Geralt of Rivia@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR010',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR010.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR010'
  ),
  CASE
    WHEN l.code = 'en' THEN 'John Natalis'
    WHEN l.code = 'it' THEN 'John Natalis'
    ELSE '@@John Natalis@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR011',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NOR011.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR011'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Philippa Eilhart'
    WHEN l.code = 'it' THEN 'Philippa Eilhart'
    ELSE '@@Philippa Eilhart@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR012',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR012.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR012'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Triss Merigold'
    WHEN l.code = 'it' THEN 'Triss Merigold'
    ELSE '@@Triss Merigold@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR013',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR013.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR013'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vernon Roche'
    WHEN l.code = 'it' THEN 'Vernon Roche'
    ELSE '@@Vernon Roche@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR014',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NOR014.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR014'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Yennefer of Vengerberg'
    WHEN l.code = 'it' THEN 'Yennefer di Vengerberg'
    ELSE '@@Yennefer of Vengerberg@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR015',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NOR015.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR015'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Ballista'
    WHEN l.code = 'it' THEN 'Balista'
    ELSE '@@Ballista@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR016',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NOR016.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR016'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Ballista'
    WHEN l.code = 'it' THEN 'Balista'
    ELSE '@@Ballista@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR017',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR017.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR017'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Blue Stripes Commando'
    WHEN l.code = 'it' THEN 'Commando Bande Blu'
    ELSE '@@Blue Stripes Commando@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR018',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR018.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR018'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Blue Stripes Commando'
    WHEN l.code = 'it' THEN 'Commando Bande Blu'
    ELSE '@@Blue Stripes Commando@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR019',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR019.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR019'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Blue Stripes Commando'
    WHEN l.code = 'it' THEN 'Commando Bande Blu'
    ELSE '@@Blue Stripes Commando@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR020_1_2',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR020.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR020_1_2'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Bovine Defence Force'
    WHEN l.code = 'it' THEN 'Forza di Difesa Bovina'
    ELSE '@@Bovine Defence Force@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR020_2_2',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR020.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR020_2_2'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Bovine Defence Force'
    WHEN l.code = 'it' THEN 'Forza di Difesa Bovina'
    ELSE '@@Bovine Defence Force@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR021',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NOR021.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR021'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Catapult'
    WHEN l.code = 'it' THEN 'Catapulta'
    ELSE '@@Catapult@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR022',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NOR022.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR022'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Catapult'
    WHEN l.code = 'it' THEN 'Catapulta'
    ELSE '@@Catapult@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR023',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NOR023.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR023'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Cow'
    WHEN l.code = 'it' THEN 'Mucca'
    ELSE '@@Cow@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR024',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NOR024.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR024'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Crinfrid Reavers Dragon Hunter'
    WHEN l.code = 'it' THEN 'Razziatore di Crinfrid'
    ELSE '@@Crinfrid Reavers Dragon Hunter@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR025',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NOR025.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR025'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Crinfrid Reavers Dragon Hunter'
    WHEN l.code = 'it' THEN 'Razziatore di Crinfrid'
    ELSE '@@Crinfrid Reavers Dragon Hunter@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR026',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NOR026.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR026'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Crinfrid Reavers Dragon Hunter'
    WHEN l.code = 'it' THEN 'Razziatore di Crinfrid'
    ELSE '@@Crinfrid Reavers Dragon Hunter@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR027',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR027.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR027'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Dandelion'
    WHEN l.code = 'it' THEN 'Dandelion'
    ELSE '@@Dandelion@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR028',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NOR028.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR028'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Dethmold'
    WHEN l.code = 'it' THEN 'Dethmold'
    ELSE '@@Dethmold@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR029',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NOR029.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR029'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Dun Banner Medic'
    WHEN l.code = 'it' THEN 'Medico Stendardo Grigio'
    ELSE '@@Dun Banner Medic@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR030',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR030.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR030'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Emiel Regis Rohellec'
    WHEN l.code = 'it' THEN 'Emiel Regis'
    ELSE '@@Emiel Regis Rohellec@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR031',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NOR031.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR031'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm'
    ELSE '@@Gaunter O''Dimm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR032_1_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NOR032.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR032_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm - Darkness'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm - Oscurità'
    ELSE '@@Gaunter O''Dimm - Darkness@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR032_2_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NOR032.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR032_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm - Darkness'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm - Oscurità'
    ELSE '@@Gaunter O''Dimm - Darkness@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR032_3_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NOR032.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR032_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm - Darkness'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm - Oscurità'
    ELSE '@@Gaunter O''Dimm - Darkness@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR033',
    1,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NOR033.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR033'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Kaedweni Siege Expert'
    WHEN l.code = 'it' THEN 'Assediante Kaedweniano'
    ELSE '@@Kaedweni Siege Expert@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR034',
    1,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NOR034.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR034'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Kaedweni Siege Expert'
    WHEN l.code = 'it' THEN 'Assediante Kaedweniano'
    ELSE '@@Kaedweni Siege Expert@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR035',
    1,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NOR035.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR035'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Kaedweni Siege Expert'
    WHEN l.code = 'it' THEN 'Assediante Kaedweniano'
    ELSE '@@Kaedweni Siege Expert@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR036',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NOR036.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR036'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Keira Metz'
    WHEN l.code = 'it' THEN 'Keira Metz'
    ELSE '@@Keira Metz@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR037',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/NOR037.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR037'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Olgierd von Everec'
    WHEN l.code = 'it' THEN 'Olgierd von Everec'
    ELSE '@@Olgierd von Everec@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR038',
    1,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR038.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR038'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Poor Fucking Infantry'
    WHEN l.code = 'it' THEN 'Soldato Malconcio'
    ELSE '@@Poor Fucking Infantry@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR039',
    1,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR039.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR039'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Poor Fucking Infantry'
    WHEN l.code = 'it' THEN 'Soldato Malconcio'
    ELSE '@@Poor Fucking Infantry@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR040',
    1,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR040.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR040'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Poor Fucking Infantry'
    WHEN l.code = 'it' THEN 'Soldato Malconcio'
    ELSE '@@Poor Fucking Infantry@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR041',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR041.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR041'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Prince Stennis'
    WHEN l.code = 'it' THEN 'Principe Stennis'
    ELSE '@@Prince Stennis@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR042',
    1,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR042.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR042'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Redanian Foot Soldier'
    WHEN l.code = 'it' THEN 'Fante Redaniano'
    ELSE '@@Redanian Foot Soldier@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR043',
    1,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR043.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR043'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Redanian Foot Soldier'
    WHEN l.code = 'it' THEN 'Fante Redaniano'
    ELSE '@@Redanian Foot Soldier@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR044',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR044.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR044'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Roach'
    WHEN l.code = 'it' THEN 'Rutilia'
    ELSE '@@Roach@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR045',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NOR045.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR045'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Sabrina Glevissig'
    WHEN l.code = 'it' THEN 'Sabrina Glevissig'
    ELSE '@@Sabrina Glevissig@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR046',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NOR046.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR046'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Sheldon Skaggs'
    WHEN l.code = 'it' THEN 'Sheldon Skaggs'
    ELSE '@@Sheldon Skaggs@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR047',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NOR047.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR047'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Siege Tower'
    WHEN l.code = 'it' THEN 'Torre d''Assedio'
    ELSE '@@Siege Tower@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR048',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR048.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR048'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Siegfried of Denesle'
    WHEN l.code = 'it' THEN 'Siegfried di Denesle'
    ELSE '@@Siegfried of Denesle@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR049',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR049.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR049'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Sigismund Dijkstra'
    WHEN l.code = 'it' THEN 'Sigismund Dijkstra'
    ELSE '@@Sigismund Dijkstra@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR050',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/NOR050.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR050'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Síle de Tansarville'
    WHEN l.code = 'it' THEN 'Síle de Tansarville'
    ELSE '@@Síle de Tansarville@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR051',
    1,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NOR051.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR051'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Thaler'
    WHEN l.code = 'it' THEN 'Thaler'
    ELSE '@@Thaler@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR052',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NOR052.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR052'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Trebuchet'
    WHEN l.code = 'it' THEN 'Trabucco'
    ELSE '@@Trebuchet@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR053',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/NOR053.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR053'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Trebuchet'
    WHEN l.code = 'it' THEN 'Trabucco'
    ELSE '@@Trebuchet@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR054',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR054.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR054'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Ves'
    WHEN l.code = 'it' THEN 'Ves'
    ELSE '@@Ves@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR055',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR055.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR055'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vesemir'
    WHEN l.code = 'it' THEN 'Vesemir'
    ELSE '@@Vesemir@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR056',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR056.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR056'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Villentretenmerth'
    WHEN l.code = 'it' THEN 'Villentretenmerth'
    ELSE '@@Villentretenmerth@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR057',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR057.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR057'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Yarpen Zigrin'
    WHEN l.code = 'it' THEN 'Yarpen Zigrin'
    ELSE '@@Yarpen Zigrin@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR058',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/NOR058.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR058'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Zoltan Chivay'
    WHEN l.code = 'it' THEN 'Zoltan Chivay'
    ELSE '@@Zoltan Chivay@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR059_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR059.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR059_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Biting Frost'
    WHEN l.code = 'it' THEN 'Morsa del Gelo'
    ELSE '@@Biting Frost@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR059_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR059.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR059_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Biting Frost'
    WHEN l.code = 'it' THEN 'Morsa del Gelo'
    ELSE '@@Biting Frost@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR059_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR059.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR059_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Biting Frost'
    WHEN l.code = 'it' THEN 'Morsa del Gelo'
    ELSE '@@Biting Frost@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR060_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR060.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR060_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear Weather'
    WHEN l.code = 'it' THEN 'Clima Sereno'
    ELSE '@@Clear Weather@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR060_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR060.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR060_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear Weather'
    WHEN l.code = 'it' THEN 'Clima Sereno'
    ELSE '@@Clear Weather@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR060_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR060.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR060_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear Weather'
    WHEN l.code = 'it' THEN 'Clima Sereno'
    ELSE '@@Clear Weather@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR061_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR061.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR061_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Commander''s Horn'
    WHEN l.code = 'it' THEN 'Corno del Comandante'
    ELSE '@@Commander''s Horn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR061_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR061.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR061_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Commander''s Horn'
    WHEN l.code = 'it' THEN 'Corno del Comandante'
    ELSE '@@Commander''s Horn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR061_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR061.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR061_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Commander''s Horn'
    WHEN l.code = 'it' THEN 'Corno del Comandante'
    ELSE '@@Commander''s Horn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR062_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR062.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR062_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    WHEN l.code = 'it' THEN 'Esca'
    ELSE '@@Decoy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR062_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR062.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR062_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    WHEN l.code = 'it' THEN 'Esca'
    ELSE '@@Decoy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR062_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR062.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR062_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    WHEN l.code = 'it' THEN 'Esca'
    ELSE '@@Decoy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR063_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR063.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR063_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impenetrable Fog'
    WHEN l.code = 'it' THEN 'Nebbia Impenetrabile'
    ELSE '@@Impenetrable Fog@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR063_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR063.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR063_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impenetrable Fog'
    WHEN l.code = 'it' THEN 'Nebbia Impenetrabile'
    ELSE '@@Impenetrable Fog@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR063_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR063.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR063_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impenetrable Fog'
    WHEN l.code = 'it' THEN 'Nebbia Impenetrabile'
    ELSE '@@Impenetrable Fog@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR064_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR064.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR064_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    WHEN l.code = 'it' THEN 'Ustione'
    ELSE '@@Scorch@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR064_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR064.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR064_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    WHEN l.code = 'it' THEN 'Ustione'
    ELSE '@@Scorch@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR064_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR064.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR064_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    WHEN l.code = 'it' THEN 'Ustione'
    ELSE '@@Scorch@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR065_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR065.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR065_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige Storm'
    WHEN l.code = 'it' THEN 'Tempesta di Skellige'
    ELSE '@@Skellige Storm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR065_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR065.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR065_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige Storm'
    WHEN l.code = 'it' THEN 'Tempesta di Skellige'
    ELSE '@@Skellige Storm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR065_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR065.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR065_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige Storm'
    WHEN l.code = 'it' THEN 'Tempesta di Skellige'
    ELSE '@@Skellige Storm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR066_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR066.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR066_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Torrential Rain'
    WHEN l.code = 'it' THEN 'Pioggia Torrenziale'
    ELSE '@@Torrential Rain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR066_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR066.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR066_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Torrential Rain'
    WHEN l.code = 'it' THEN 'Pioggia Torrenziale'
    ELSE '@@Torrential Rain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'NORTHERN_REALMS'
    ),
    'NOR066_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/NOR066.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'NOR066_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Torrential Rain'
    WHEN l.code = 'it' THEN 'Pioggia Torrenziale'
    ELSE '@@Torrential Rain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO001',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/SCO001.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO001'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Francesca Findabair, Daisy of the Valley'
    WHEN l.code = 'it' THEN 'Francesca Findabair, Margherita della Valle'
    ELSE '@@Francesca Findabair, Daisy of the Valley@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO002',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/SCO002.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO002'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Francesca Findabair, Hope of the Aen Seidhe'
    WHEN l.code = 'it' THEN 'Francesca Findabair, Speranza di Aen Seidhe'
    ELSE '@@Francesca Findabair, Hope of the Aen Seidhe@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO003',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/SCO003.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO003'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Francesca Findabair, Pureblood Elf'
    WHEN l.code = 'it' THEN 'Francesca Findabair, Elfa di Sangue Puro'
    ELSE '@@Francesca Findabair, Pureblood Elf@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO004',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/SCO004.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO004'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Francesca Findabair, Queen of Dol Blathanna'
    WHEN l.code = 'it' THEN 'Francesca Findabair, Regina di Dol Blathanna'
    ELSE '@@Francesca Findabair, Queen of Dol Blathanna@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO005',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/SCO005.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO005'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Francesca Findabair, The Beautiful'
    WHEN l.code = 'it' THEN 'Francesca Findabair, La Bellissima'
    ELSE '@@Francesca Findabair, The Beautiful@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO006',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO006.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO006'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Avallac''h'
    WHEN l.code = 'it' THEN 'Avallac''h'
    ELSE '@@Avallac''h@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO007',
    15,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO007.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO007'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Cirilla Fiona Elen Riannon'
    WHEN l.code = 'it' THEN 'Cirilla'
    ELSE '@@Cirilla Fiona Elen Riannon@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO008',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO008.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO008'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Eithné'
    WHEN l.code = 'it' THEN 'Eithné'
    ELSE '@@Eithné@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO009',
    15,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO009.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO009'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Geralt of Rivia'
    WHEN l.code = 'it' THEN 'Geralt di Rivia'
    ELSE '@@Geralt of Rivia@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO010',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO010.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO010'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Iorveth'
    WHEN l.code = 'it' THEN 'Iorveth'
    ELSE '@@Iorveth@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO011',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO011.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO011'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Isengrim Faoiltiarna'
    WHEN l.code = 'it' THEN 'Isengrim Faoiltiarna'
    ELSE '@@Isengrim Faoiltiarna@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO012',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO012.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO012'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Saesenthessis'
    WHEN l.code = 'it' THEN 'Saesenthessis'
    ELSE '@@Saesenthessis@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO013',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO013.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO013'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Triss Merigold'
    WHEN l.code = 'it' THEN 'Triss Merigold'
    ELSE '@@Triss Merigold@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO014',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO014.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO014'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Yennefer of Vengerberg'
    WHEN l.code = 'it' THEN 'Yennefer di Vengerberg'
    ELSE '@@Yennefer of Vengerberg@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO015',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/SCO015.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO015'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Barclay Els'
    WHEN l.code = 'it' THEN 'Barclay Els'
    ELSE '@@Barclay Els@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO016_1_2',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO016.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO016_1_2'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Bovine Defence Force'
    WHEN l.code = 'it' THEN 'Forza di Difesa Bovina'
    ELSE '@@Bovine Defence Force@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO016_2_2',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO016.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO016_2_2'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Bovine Defence Force'
    WHEN l.code = 'it' THEN 'Forza di Difesa Bovina'
    ELSE '@@Bovine Defence Force@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO017',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/SCO017.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO017'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Ciaran aep Easnillien'
    WHEN l.code = 'it' THEN 'Ciaran aep Easnillien'
    ELSE '@@Ciaran aep Easnillien@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO018',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO018.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO018'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Cow'
    WHEN l.code = 'it' THEN 'Mucca'
    ELSE '@@Cow@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO019',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO019.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO019'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Dandelion'
    WHEN l.code = 'it' THEN 'Dandelion'
    ELSE '@@Dandelion@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO020',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO020.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO020'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Dennis Cranmer'
    WHEN l.code = 'it' THEN 'Dennis Cranmer'
    ELSE '@@Dennis Cranmer@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO021',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO021.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO021'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Dol Blathanna Archer'
    WHEN l.code = 'it' THEN 'Arciere di Dol Blathanna'
    ELSE '@@Dol Blathanna Archer@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO022',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/SCO022.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO022'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Dol Blathanna Scout'
    WHEN l.code = 'it' THEN 'Sentinella di Dol Blathanna'
    ELSE '@@Dol Blathanna Scout@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO023',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/SCO023.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO023'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Dol Blathanna Scout'
    WHEN l.code = 'it' THEN 'Sentinella di Dol Blathanna'
    ELSE '@@Dol Blathanna Scout@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO024',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/SCO024.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO024'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Dol Blathanna Scout'
    WHEN l.code = 'it' THEN 'Sentinella di Dol Blathanna'
    ELSE '@@Dol Blathanna Scout@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO025',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO025.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO025'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Dwarven Skirmisher'
    WHEN l.code = 'it' THEN 'Guerriero Nanico'
    ELSE '@@Dwarven Skirmisher@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO026',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO026.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO026'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Dwarven Skirmisher'
    WHEN l.code = 'it' THEN 'Guerriero Nanico'
    ELSE '@@Dwarven Skirmisher@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO027',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO027.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO027'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Dwarven Skirmisher'
    WHEN l.code = 'it' THEN 'Guerriero Nanico'
    ELSE '@@Dwarven Skirmisher@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO028',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO028.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO028'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Elven Skirmisher'
    WHEN l.code = 'it' THEN 'Guerriero Elfico'
    ELSE '@@Elven Skirmisher@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO029',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO029.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO029'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Elven Skirmisher'
    WHEN l.code = 'it' THEN 'Guerriero Elfico'
    ELSE '@@Elven Skirmisher@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO030',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO030.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO030'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Elven Skirmisher'
    WHEN l.code = 'it' THEN 'Guerriero Elfico'
    ELSE '@@Elven Skirmisher@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO031',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO031.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO031'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Emiel Regis Rohellec Terzieff'
    WHEN l.code = 'it' THEN 'Emiel Regis Rohellec'
    ELSE '@@Emiel Regis Rohellec Terzieff@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO032',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/SCO032.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO032'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Filavandrel aen Fidhail'
    WHEN l.code = 'it' THEN 'Filavandrel aen Fidhail'
    ELSE '@@Filavandrel aen Fidhail@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO033',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/SCO033.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO033'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm'
    ELSE '@@Gaunter O''Dimm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO034_1_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO034.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO034_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm - Darkness'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm - Oscurità'
    ELSE '@@Gaunter O''Dimm - Darkness@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO034_2_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO034.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO034_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm - Darkness'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm - Oscurità'
    ELSE '@@Gaunter O''Dimm - Darkness@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO034_3_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO034.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO034_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm - Darkness'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm - Oscurità'
    ELSE '@@Gaunter O''Dimm - Darkness@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO035',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO035.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO035'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Havekar Healer'
    WHEN l.code = 'it' THEN 'Medico Hav''Caaren'
    ELSE '@@Havekar Healer@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO036',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO036.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO036'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Havekar Healer'
    WHEN l.code = 'it' THEN 'Medico Hav''Caaren'
    ELSE '@@Havekar Healer@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO037',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO037.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO037'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Havekar Healer'
    WHEN l.code = 'it' THEN 'Medico Hav''Caaren'
    ELSE '@@Havekar Healer@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO038',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO038.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO038'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Havekar Smuggler'
    WHEN l.code = 'it' THEN 'Hav''Caaren'
    ELSE '@@Havekar Smuggler@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO039',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO039.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO039'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Havekar Smuggler'
    WHEN l.code = 'it' THEN 'Hav''Caaren'
    ELSE '@@Havekar Smuggler@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO040',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO040.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO040'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Havekar Smuggler'
    WHEN l.code = 'it' THEN 'Hav''Caaren'
    ELSE '@@Havekar Smuggler@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO041',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO041.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO041'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Ida Emean aep Sivney'
    WHEN l.code = 'it' THEN 'Ida Emean aep Sivney'
    ELSE '@@Ida Emean aep Sivney@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO042',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO042.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO042'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Mahakaman Defender'
    WHEN l.code = 'it' THEN 'Difensori di Mahakam'
    ELSE '@@Mahakaman Defender@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO043',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO043.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO043'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Mahakaman Defender'
    WHEN l.code = 'it' THEN 'Difensori di Mahakam'
    ELSE '@@Mahakaman Defender@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO044',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO044.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO044'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Mahakaman Defender'
    WHEN l.code = 'it' THEN 'Difensori di Mahakam'
    ELSE '@@Mahakaman Defender@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO045',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO045.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO045'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Mahakaman Defender'
    WHEN l.code = 'it' THEN 'Difensori di Mahakam'
    ELSE '@@Mahakaman Defender@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO046',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO046.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO046'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Mahakaman Defender'
    WHEN l.code = 'it' THEN 'Difensori di Mahakam'
    ELSE '@@Mahakaman Defender@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO047',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO047.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO047'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Milva'
    WHEN l.code = 'it' THEN 'Milva'
    ELSE '@@Milva@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO048',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/SCO048.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO048'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Olgierd von Everec'
    WHEN l.code = 'it' THEN 'Olgierd von Everec'
    ELSE '@@Olgierd von Everec@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO049',
    1,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO049.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO049'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Riordain'
    WHEN l.code = 'it' THEN 'Riordain'
    ELSE '@@Riordain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO050',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO050.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO050'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Roach'
    WHEN l.code = 'it' THEN 'Rutilia'
    ELSE '@@Roach@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO051',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/SCO051.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO051'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Schirrù'
    WHEN l.code = 'it' THEN 'Schirrù'
    ELSE '@@Schirrù@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO052',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO052.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO052'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Toruviel'
    WHEN l.code = 'it' THEN 'Toruviel'
    ELSE '@@Toruviel@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO053',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO053.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO053'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vesemir'
    WHEN l.code = 'it' THEN 'Vesemir'
    ELSE '@@Vesemir@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO054',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO054.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO054'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Villentretenmerth'
    WHEN l.code = 'it' THEN 'Villentretenmerth'
    ELSE '@@Villentretenmerth@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO055',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SCO055.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO055'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vrihedd Brigade Recruit'
    WHEN l.code = 'it' THEN 'Cadetto Vrihedd'
    ELSE '@@Vrihedd Brigade Recruit@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO056',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/SCO056.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO056'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vrihedd Brigade Veteran'
    WHEN l.code = 'it' THEN 'Brigata Vrihedd'
    ELSE '@@Vrihedd Brigade Veteran@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO057',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/SCO057.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO057'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vrihedd Brigade Veteran'
    WHEN l.code = 'it' THEN 'Brigata Vrihedd'
    ELSE '@@Vrihedd Brigade Veteran@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO058',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/SCO058.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO058'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Yaevinn'
    WHEN l.code = 'it' THEN 'Yaevinn'
    ELSE '@@Yaevinn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO059',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SCO059.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO059'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Zoltan Chivay'
    WHEN l.code = 'it' THEN 'Zoltan Chivay'
    ELSE '@@Zoltan Chivay@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO060_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO060.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO060_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Biting Frost'
    WHEN l.code = 'it' THEN 'Morsa del Gelo'
    ELSE '@@Biting Frost@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO060_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO060.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO060_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Biting Frost'
    WHEN l.code = 'it' THEN 'Morsa del Gelo'
    ELSE '@@Biting Frost@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO060_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO060.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO060_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Biting Frost'
    WHEN l.code = 'it' THEN 'Morsa del Gelo'
    ELSE '@@Biting Frost@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO061_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO061.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO061_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear Weather'
    WHEN l.code = 'it' THEN 'Clima Sereno'
    ELSE '@@Clear Weather@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO061_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO061.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO061_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear Weather'
    WHEN l.code = 'it' THEN 'Clima Sereno'
    ELSE '@@Clear Weather@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO061_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO061.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO061_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear Weather'
    WHEN l.code = 'it' THEN 'Clima Sereno'
    ELSE '@@Clear Weather@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO062_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO062.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO062_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Commander''s Horn'
    WHEN l.code = 'it' THEN 'Corno del Comandante'
    ELSE '@@Commander''s Horn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO062_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO062.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO062_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Commander''s Horn'
    WHEN l.code = 'it' THEN 'Corno del Comandante'
    ELSE '@@Commander''s Horn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO062_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO062.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO062_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Commander''s Horn'
    WHEN l.code = 'it' THEN 'Corno del Comandante'
    ELSE '@@Commander''s Horn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO063_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO063.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO063_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    WHEN l.code = 'it' THEN 'Esca'
    ELSE '@@Decoy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO063_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO063.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO063_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    WHEN l.code = 'it' THEN 'Esca'
    ELSE '@@Decoy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO063_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO063.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO063_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    WHEN l.code = 'it' THEN 'Esca'
    ELSE '@@Decoy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO064_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO064.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO064_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impenetrable Fog'
    WHEN l.code = 'it' THEN 'Nebbia Impenetrabile'
    ELSE '@@Impenetrable Fog@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO064_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO064.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO064_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impenetrable Fog'
    WHEN l.code = 'it' THEN 'Nebbia Impenetrabile'
    ELSE '@@Impenetrable Fog@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO064_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO064.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO064_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impenetrable Fog'
    WHEN l.code = 'it' THEN 'Nebbia Impenetrabile'
    ELSE '@@Impenetrable Fog@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO065_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO065.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO065_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    WHEN l.code = 'it' THEN 'Ustione'
    ELSE '@@Scorch@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO065_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO065.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO065_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    WHEN l.code = 'it' THEN 'Ustione'
    ELSE '@@Scorch@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO065_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO065.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO065_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    WHEN l.code = 'it' THEN 'Ustione'
    ELSE '@@Scorch@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO066_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO066.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO066_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige Storm'
    WHEN l.code = 'it' THEN 'Tempesta di Skellige'
    ELSE '@@Skellige Storm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO066_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO066.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO066_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige Storm'
    WHEN l.code = 'it' THEN 'Tempesta di Skellige'
    ELSE '@@Skellige Storm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO066_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO066.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO066_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige Storm'
    WHEN l.code = 'it' THEN 'Tempesta di Skellige'
    ELSE '@@Skellige Storm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO067_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO067.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO067_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Torrential Rain'
    WHEN l.code = 'it' THEN 'Pioggia Torrenziale'
    ELSE '@@Torrential Rain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO067_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO067.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO067_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Torrential Rain'
    WHEN l.code = 'it' THEN 'Pioggia Torrenziale'
    ELSE '@@Torrential Rain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SCOIATAEL'
    ),
    'SCO067_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SCO067.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SCO067_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Torrential Rain'
    WHEN l.code = 'it' THEN 'Pioggia Torrenziale'
    ELSE '@@Torrential Rain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE001',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/SKE001.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE001'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Arnjolf, The Patricide'
    WHEN l.code = 'it' THEN 'Arnjolf, Il Patricida'
    ELSE '@@Arnjolf, The Patricide@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE002',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/SKE002.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE002'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Crach an Craite, Wild Boar of the Sea'
    WHEN l.code = 'it' THEN 'Crach an Craite, Cinghiale del Mare'
    ELSE '@@Crach an Craite, Wild Boar of the Sea@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE003',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/SKE003.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE003'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Eist Tuirseach, King of Cintra'
    WHEN l.code = 'it' THEN 'Eist Tuirseach, Re di Cintra'
    ELSE '@@Eist Tuirseach, King of Cintra@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE004',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/SKE004.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE004'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Harald an Craite, The Cripple'
    WHEN l.code = 'it' THEN 'Harald an Craite, Lo Storpio'
    ELSE '@@Harald an Craite, The Cripple@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE005',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'LEADER'
    ),
    NULL,
    '/cards/SKE005.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE005'
  ),
  CASE
    WHEN l.code = 'en' THEN 'King Bran, The Unifier'
    WHEN l.code = 'it' THEN 'King Bran, L''Unificatore'
    ELSE '@@King Bran, The Unifier@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE006',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE006.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE006'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Avallac''h'
    WHEN l.code = 'it' THEN 'Avallac''h'
    ELSE '@@Avallac''h@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE007',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE007.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE007'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Cerys'
    WHEN l.code = 'it' THEN 'Cerys'
    ELSE '@@Cerys@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE008',
    15,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE008.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE008'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Cirilla Fiona Elen Riannon'
    WHEN l.code = 'it' THEN 'Cirilla'
    ELSE '@@Cirilla Fiona Elen Riannon@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE009',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE009.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE009'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Ermion'
    WHEN l.code = 'it' THEN 'Ermellino'
    ELSE '@@Ermion@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE010',
    15,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE010.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE010'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Geralt of Rivia'
    WHEN l.code = 'it' THEN 'Geralt di Rivia'
    ELSE '@@Geralt of Rivia@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE011',
    11,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE011.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE011'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Hemdall'
    WHEN l.code = 'it' THEN 'Hemdall'
    ELSE '@@Hemdall@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE012',
    10,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE012.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE012'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Hjalmar'
    WHEN l.code = 'it' THEN 'Hjalmar'
    ELSE '@@Hjalmar@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE013',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE013.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE013'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Triss Merigold'
    WHEN l.code = 'it' THEN 'Triss Merigold'
    ELSE '@@Triss Merigold@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE014',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'HERO'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE014.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE014'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Yennefer of Vengerberg'
    WHEN l.code = 'it' THEN 'Yennefer di Vengerberg'
    ELSE '@@Yennefer of Vengerberg@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE015',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE015.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE015'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Berserker'
    WHEN l.code = 'it' THEN 'Berserker'
    ELSE '@@Berserker@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE016',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE016.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE016'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Birna Bran'
    WHEN l.code = 'it' THEN 'Birna Bran'
    ELSE '@@Birna Bran@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE017',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE017.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE017'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Blueboy Lugos'
    WHEN l.code = 'it' THEN 'Lugos il Blu'
    ELSE '@@Blueboy Lugos@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE018_1_2',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE018.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE018_1_2'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Bovine Defence Force'
    WHEN l.code = 'it' THEN 'Forza di Difesa Bovina'
    ELSE '@@Bovine Defence Force@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE018_2_2',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE018.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE018_2_2'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Bovine Defence Force'
    WHEN l.code = 'it' THEN 'Forza di Difesa Bovina'
    ELSE '@@Bovine Defence Force@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE019_1_3',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE019.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE019_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clan an Craite Warrior'
    WHEN l.code = 'it' THEN 'Guerriero degli An Craite'
    ELSE '@@Clan an Craite Warrior@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE019_2_3',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE019.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE019_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clan an Craite Warrior'
    WHEN l.code = 'it' THEN 'Guerriero degli An Craite'
    ELSE '@@Clan an Craite Warrior@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE019_3_3',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE019.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE019_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clan an Craite Warrior'
    WHEN l.code = 'it' THEN 'Guerriero degli An Craite'
    ELSE '@@Clan an Craite Warrior@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE020_1_3',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE020.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE020_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clan Brokva Archer'
    WHEN l.code = 'it' THEN 'Arciere dei Brokvar'
    ELSE '@@Clan Brokva Archer@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE020_2_3',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE020.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE020_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clan Brokva Archer'
    WHEN l.code = 'it' THEN 'Arciere dei Brokvar'
    ELSE '@@Clan Brokva Archer@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE020_3_3',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE020.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE020_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clan Brokva Archer'
    WHEN l.code = 'it' THEN 'Arciere dei Brokvar'
    ELSE '@@Clan Brokva Archer@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE021',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE021.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE021'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clan Dimun Pirate'
    WHEN l.code = 'it' THEN 'Pirata dei Dimun'
    ELSE '@@Clan Dimun Pirate@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE022',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE022.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE022'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clan Drummond Shield Maiden'
    WHEN l.code = 'it' THEN 'Fanciulla Scudo dei Drummond'
    ELSE '@@Clan Drummond Shield Maiden@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE023',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE023.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE023'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clan Drummond Shield Maiden'
    WHEN l.code = 'it' THEN 'Fanciulla Scudo dei Drummond'
    ELSE '@@Clan Drummond Shield Maiden@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE024',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE024.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE024'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clan Drummond Shield Maiden'
    WHEN l.code = 'it' THEN 'Fanciulla Scudo dei Drummond'
    ELSE '@@Clan Drummond Shield Maiden@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE025',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE025.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE025'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clan Heymaey Skald'
    WHEN l.code = 'it' THEN 'Bardo dei Heymaey'
    ELSE '@@Clan Heymaey Skald@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE026',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE026.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE026'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clan Tordarroch Armorsmith'
    WHEN l.code = 'it' THEN 'Armaiolo dei Tordarroch'
    ELSE '@@Clan Tordarroch Armorsmith@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE027',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE027.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE027'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Cow'
    WHEN l.code = 'it' THEN 'Mucca'
    ELSE '@@Cow@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE028',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE028.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE028'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Dandelion'
    WHEN l.code = 'it' THEN 'Dandelion'
    ELSE '@@Dandelion@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE029',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE029.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE029'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Donar an Hindar'
    WHEN l.code = 'it' THEN 'Donar an Hindar'
    ELSE '@@Donar an Hindar@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE030',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/SKE030.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE030'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Draig Bon-Dhu'
    WHEN l.code = 'it' THEN 'Draig Bon-Dhu'
    ELSE '@@Draig Bon-Dhu@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE031',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE031.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE031'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Emiel Regis Rohellec'
    WHEN l.code = 'it' THEN 'Emiel Regis'
    ELSE '@@Emiel Regis Rohellec@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE032',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/SKE032.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE032'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm'
    ELSE '@@Gaunter O''Dimm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE033_1_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE033.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE033_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm - Darkness'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm - Oscurità'
    ELSE '@@Gaunter O''Dimm - Darkness@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE033_2_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE033.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE033_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm - Darkness'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm - Oscurità'
    ELSE '@@Gaunter O''Dimm - Darkness@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE033_3_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE033.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE033_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Gaunter O''Dimm - Darkness'
    WHEN l.code = 'it' THEN 'Gaunter O''Dimm - Oscurità'
    ELSE '@@Gaunter O''Dimm - Darkness@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE034',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/SKE034.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE034'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Holger Blackhand'
    WHEN l.code = 'it' THEN 'Holger Manonera'
    ELSE '@@Holger Blackhand@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE035',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE035.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE035'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Kambi'
    WHEN l.code = 'it' THEN 'Kambi'
    ELSE '@@Kambi@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE036_1_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE036.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE036_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Light Longship'
    WHEN l.code = 'it' THEN 'Nave Leggera'
    ELSE '@@Light Longship@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE036_2_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE036.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE036_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Light Longship'
    WHEN l.code = 'it' THEN 'Nave Leggera'
    ELSE '@@Light Longship@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE036_3_3',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE036.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE036_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Light Longship'
    WHEN l.code = 'it' THEN 'Nave Leggera'
    ELSE '@@Light Longship@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE037',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE037.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE037'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Madman Lugos'
    WHEN l.code = 'it' THEN 'Lugos il Pazzo'
    ELSE '@@Madman Lugos@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE038',
    12,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/SKE038.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE038'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Olaf'
    WHEN l.code = 'it' THEN 'Olaf'
    ELSE '@@Olaf@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE039',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'AGILE'
    ),
    '/cards/SKE039.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE039'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Olgierd von Everec'
    WHEN l.code = 'it' THEN 'Olgierd von Everec'
    ELSE '@@Olgierd von Everec@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE040',
    3,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE040.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE040'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Roach'
    WHEN l.code = 'it' THEN 'Rutilia'
    ELSE '@@Roach@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE041',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE041.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE041'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Svanrige'
    WHEN l.code = 'it' THEN 'Svanrige'
    ELSE '@@Svanrige@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE042',
    14,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE042.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE042'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Transformed Vildkaarl'
    WHEN l.code = 'it' THEN 'Vildkaarl Trasformato'
    ELSE '@@Transformed Vildkaarl@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE043_1_3',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE043.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE043_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Transformed Young Vildkaarl'
    WHEN l.code = 'it' THEN 'Giovane Vildkaarl Trasformato'
    ELSE '@@Transformed Young Vildkaarl@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE043_2_3',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE043.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE043_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Transformed Young Vildkaarl'
    WHEN l.code = 'it' THEN 'Giovane Vildkaarl Trasformato'
    ELSE '@@Transformed Young Vildkaarl@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE043_3_3',
    8,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE043.webp',
    FALSE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE043_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Transformed Young Vildkaarl'
    WHEN l.code = 'it' THEN 'Giovane Vildkaarl Trasformato'
    ELSE '@@Transformed Young Vildkaarl@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE044',
    4,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE044.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE044'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Udalryk'
    WHEN l.code = 'it' THEN 'Udalryk'
    ELSE '@@Udalryk@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE045',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE045.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE045'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Vesemir'
    WHEN l.code = 'it' THEN 'Vesemir'
    ELSE '@@Vesemir@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE046',
    7,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE046.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE046'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Villentretenmerth'
    WHEN l.code = 'it' THEN 'Villentretenmerth'
    ELSE '@@Villentretenmerth@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE047_1_3',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/SKE047.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE047_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'War Longship'
    WHEN l.code = 'it' THEN 'Nave da Guerra'
    ELSE '@@War Longship@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE047_2_3',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/SKE047.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE047_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'War Longship'
    WHEN l.code = 'it' THEN 'Nave da Guerra'
    ELSE '@@War Longship@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE047_3_3',
    6,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'SIEGE'
    ),
    '/cards/SKE047.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE047_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'War Longship'
    WHEN l.code = 'it' THEN 'Nave da Guerra'
    ELSE '@@War Longship@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE048_1_3',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE048.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE048_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Young Berserker'
    WHEN l.code = 'it' THEN 'Berserker Giovane'
    ELSE '@@Young Berserker@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE048_2_3',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE048.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE048_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Young Berserker'
    WHEN l.code = 'it' THEN 'Berserker Giovane'
    ELSE '@@Young Berserker@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE048_3_3',
    2,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'RANGED'
    ),
    '/cards/SKE048.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE048_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Young Berserker'
    WHEN l.code = 'it' THEN 'Berserker Giovane'
    ELSE '@@Young Berserker@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE049',
    5,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'UNIT'
    ),
    (
      SELECT
        id
      FROM
        card_range
      WHERE
        code = 'CLOSE'
    ),
    '/cards/SKE049.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE049'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Zoltan Chivay'
    WHEN l.code = 'it' THEN 'Zoltan Chivay'
    ELSE '@@Zoltan Chivay@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE050_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE050.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE050_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Biting Frost'
    WHEN l.code = 'it' THEN 'Morsa del Gelo'
    ELSE '@@Biting Frost@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE050_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE050.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE050_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Biting Frost'
    WHEN l.code = 'it' THEN 'Morsa del Gelo'
    ELSE '@@Biting Frost@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE050_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE050.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE050_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Biting Frost'
    WHEN l.code = 'it' THEN 'Morsa del Gelo'
    ELSE '@@Biting Frost@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE051_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE051.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE051_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear Weather'
    WHEN l.code = 'it' THEN 'Clima Sereno'
    ELSE '@@Clear Weather@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE051_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE051.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE051_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear Weather'
    WHEN l.code = 'it' THEN 'Clima Sereno'
    ELSE '@@Clear Weather@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE051_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE051.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE051_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Clear Weather'
    WHEN l.code = 'it' THEN 'Clima Sereno'
    ELSE '@@Clear Weather@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE052_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE052.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE052_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Commander''s Horn'
    WHEN l.code = 'it' THEN 'Corno del Comandante'
    ELSE '@@Commander''s Horn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE052_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE052.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE052_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Commander''s Horn'
    WHEN l.code = 'it' THEN 'Corno del Comandante'
    ELSE '@@Commander''s Horn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE052_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE052.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE052_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Commander''s Horn'
    WHEN l.code = 'it' THEN 'Corno del Comandante'
    ELSE '@@Commander''s Horn@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE053_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE053.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE053_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    WHEN l.code = 'it' THEN 'Esca'
    ELSE '@@Decoy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE053_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE053.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE053_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    WHEN l.code = 'it' THEN 'Esca'
    ELSE '@@Decoy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE053_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE053.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE053_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Decoy'
    WHEN l.code = 'it' THEN 'Esca'
    ELSE '@@Decoy@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE054_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE054.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE054_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impenetrable Fog'
    WHEN l.code = 'it' THEN 'Nebbia Impenetrabile'
    ELSE '@@Impenetrable Fog@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE054_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE054.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE054_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impenetrable Fog'
    WHEN l.code = 'it' THEN 'Nebbia Impenetrabile'
    ELSE '@@Impenetrable Fog@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE054_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE054.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE054_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Impenetrable Fog'
    WHEN l.code = 'it' THEN 'Nebbia Impenetrabile'
    ELSE '@@Impenetrable Fog@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE055_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE055.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE055_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Mardroeme'
    WHEN l.code = 'it' THEN 'Mardroeme'
    ELSE '@@Mardroeme@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE055_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE055.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE055_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Mardroeme'
    WHEN l.code = 'it' THEN 'Mardroeme'
    ELSE '@@Mardroeme@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE055_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE055.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE055_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Mardroeme'
    WHEN l.code = 'it' THEN 'Mardroeme'
    ELSE '@@Mardroeme@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE056_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE056.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE056_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    WHEN l.code = 'it' THEN 'Ustione'
    ELSE '@@Scorch@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE056_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE056.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE056_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    WHEN l.code = 'it' THEN 'Ustione'
    ELSE '@@Scorch@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE056_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE056.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE056_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Scorch'
    WHEN l.code = 'it' THEN 'Ustione'
    ELSE '@@Scorch@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE057_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE057.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE057_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige Storm'
    WHEN l.code = 'it' THEN 'Tempesta di Skellige'
    ELSE '@@Skellige Storm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE057_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE057.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE057_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige Storm'
    WHEN l.code = 'it' THEN 'Tempesta di Skellige'
    ELSE '@@Skellige Storm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE057_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE057.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE057_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Skellige Storm'
    WHEN l.code = 'it' THEN 'Tempesta di Skellige'
    ELSE '@@Skellige Storm@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE058_1_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE058.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE058_1_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Torrential Rain'
    WHEN l.code = 'it' THEN 'Pioggia Torrenziale'
    ELSE '@@Torrential Rain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE058_2_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE058.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE058_2_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Torrential Rain'
    WHEN l.code = 'it' THEN 'Pioggia Torrenziale'
    ELSE '@@Torrential Rain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card (
    deck_id,
    code,
    power,
    type_id,
    range_id,
    image_url,
    is_deck_card
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        deck
      WHERE
        code = 'SKELLIGE'
    ),
    'SKE058_3_3',
    0,
    (
      SELECT
        id
      FROM
        card_type
      WHERE
        code = 'SPECIAL'
    ),
    NULL,
    '/cards/SKE058.webp',
    TRUE
  );

INSERT INTO
  card_translation (language_id, card_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'SKE058_3_3'
  ),
  CASE
    WHEN l.code = 'en' THEN 'Torrential Rain'
    WHEN l.code = 'it' THEN 'Pioggia Torrenziale'
    ELSE '@@Torrential Rain@@'
  END,
  ''
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');