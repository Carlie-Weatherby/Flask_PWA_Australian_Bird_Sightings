--  CREATE TABLE birdFamilies (
--     family_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     family_name_english TEXT NOT NULL,
--     family_name_latin TEXT NOT NULL,
--     description TEXT NOT NULL
--     );

-- *** FAMILIES TABLE - TEMPLATE FOR DATA ENTRY ***
-- INSERT INTO birdFamilies(family_name_english, family_name_latin, description)
-- VALUES('name-english', 'name-latin', 'description of family');

-- INSERT INTO birdFamilies(family_name_english, family_name_latin, description)
-- VALUES ('kingfishers', 'Alcedinidae', 'Rollers, ground rollers, kingfishers');

-- INSERT INTO birdFamilies(family_name_english, family_name_latin, description)
-- VALUES
--     ('Cockatoos', 'Cacatuidae', 'Parrots, cockatoos'),]
--     ('Woodswallows, Butcherbirds, Peltops', 'Artamidae', 'Bristlehead, butcherbirds, woodswallows, Mottled Berryhunter, ioras, cuckooshrikes'),
--     ('Pelicans', 'Pelecanidae', 'Ibises, spoonbills, herons, Hamerkop, Shoebill, pelicans'),
--     ('Gulls, Terns, Skimmers', 'Laridae', 'Noddies, skimmers, gulls, terns, skuas, auks');

-- *** COMMANDS I'VE PLAYED WITH (NOT IN OPRDER) ***
-- DROP TABLE birdFamily;
-- ALTER TABLE birdFamily RENAME COLUMN family_name TO family_name_english;
-- ALTER TABLE birdFamily RENAME COLUMN common_family_name TO family_name_latin;
-- ALTER TABLE birdFamily RENAME TO birdFamilies;
-- UPDATE birdFamilies SET family_name_latin = 'Artamidae' WHERE family_id = 1003;

-- CREATE TABLE birdGenera (
--     genus_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     family_id INTEGER NOT NULL,
--     --family_id INTEGER REFERENCES birdFamilies(family_id), -- alternate way (inline)
--     genus_name TEXT NOT NULL,
--     description TEXT NOT NULL,
--     FOREIGN KEY (family_id) REFERENCES birdFamilies(family_id)
--     );

-- *** GENERA TABLE - TEMPLATE FOR DATA ENTRY ***
-- INSERT INTO birdGenera(family_id, genus_name, description)
-- VALUES('family id', 'genus name', 'description of genus');

-- INSERT INTO birdGenera(family_id, genus_name, description)
-- VALUES (1005, 'Chroicocephalus', 'Masked Gulls and Allies')

INSERT INTO birdGenera(family_id, genus_name, description)
VALUES
    (1002, 'Trichoglossus', 'Rainbow Lorikeets and Allies'),
    (1003, 'Cracticus', 'Typical Butcherbirds'),
    (1003, 'Strepera', 'Currawongs'),
    (1004, 'Pelecanus', 'Pelicans'),
    (1002, 'Zanda', 'Australian Cockatoos'),
    (1001, 'Dacelo', 'Kookaburras');


--  CREATE TABLE birdType (
--     type_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     type_code TEXT NOT NULL,
--     description TEXT NOT NULL
--     );

-- INSERT INTO birdType(type_code, description)
-- VALUES ('Intro.', 'A bird species deliberately introduced in Australia');

-- INSERT INTO birdType(type_code, description)
-- VALUES
--     ('E', 'An endemic species recorded only in Australia.'),
--     ('Br. E', 'A breeding endemic species recorded beyond Australia in certain seasons, e.g. Short-tailed Shearwater.');


-- CREATE TABLE birdAbundance (
--     abundance_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     abundance_code TEXT NOT NULL,
--     description TEXT NOT NULL
--     );

-- INSERT INTO birdAbundance(abundance_code, description)
-- VALUES ('A', 'Abundant');

-- INSERT INTO birdAbundance(abundance_code, description)
-- VALUES
--     ('LA', 'Locally abundant'),
--     ('C', 'Common'),
--     ('MC', 'Moderately common'),
--     ('LC', 'Locally common'),
--     ('LMC', 'Locally moderately common'),
--     ('UC', 'Uncommon'),
--     ('LUC', 'Locally uncommon'),
--     ('R', 'Rare'),
--     ('V', 'Vagrant');


-- CREATE TABLE birdMovement (
--     movement_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     movement_code TEXT NOT NULL,
--     description TEXT NOT NULL,
--     movement_icon TEXT NOT NULL -- This will store emojis as Unicode text
--     );

-- INSERT INTO birdMovement(movement_code, description, movement_icon)
-- VALUES ('AM', 'Annual migrant', '🔃');

-- INSERT INTO birdMovement(movement_code, description, movement_icon)
-- VALUES
--     ('PM', 'Partial migrant', '⤵️'),
--     ('N', 'Nomadic', '*️⃣'),
--     ('S', 'Sedentary', '⏺️');


-- CREATE TABLE birdSpecies (
--     species_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     genus_id INTEGER NOT NULL, -- foreign key
--     scientific_name TEXT NOT NULL,
--     common_name TEXT NOT NULL,
--     type_id INTEGER NOT NULL, -- foreign key
--     abundance_id INTEGER NOT NULL, -- foreign key
--     movement_id INTEGER NOT NULL, -- foreign key
--     description TEXT NOT NULL,
--     size_avg_min INTEGER,
--     size_avg_max INTEGER,
--     size_unit TEXT,
--     jouvenile TEXT,
--     voice TEXT,
--     habitat TEXT,
--     image_bird1_path TEXT,
--     image_bird1_desc TEXT,
--     image_bird2_path TEXT,
--     image_bird2_desc TEXT,
--     image_bird3_path TEXT,
--     image_bird3_desc TEXT,
--     image_map1_path TEXT,
--     image_map1_desc TEXT,
--     audio_call1_path TEXT,
--     FOREIGN KEY (genus_id) REFERENCES birdGenera(genus_id),
--     FOREIGN KEY (type_id) REFERENCES birdType(type_id),
--     FOREIGN KEY (abundance_id) REFERENCES birdAbundance(abundance_id),
--     FOREIGN KEY (movement_id) REFERENCES birdMovement(movement_id)
--     );

INSERT INTO birdSpecies(genus_id, scientific_name, common_name, type_id, abundance_id, movement_id, description, size_avg_min, size_avg_max, size_unit, jouvenile, voice, habitat, image_bird1_path, image_bird1_desc, image_bird2_path, image_bird2_desc, image_bird3_path, image_bird3_desc, image_map1_path, image_map1_desc, audio_call1_path)
VALUES (1007, 'Dacelo novaeguineae 'Laughing Kookaburra', '🔃');

-- *** QUERIES ***
-- SELECT * FROM birdGenera;
-- WHERE family_id=1002;

-- LIMIT 3;

-- SELECT birdGenera.*
-- FROM birdGenera
-- INNER JOIN birdFamilies ON birdGenera.family_id = birdFamilies.family_id
-- WHERE birdFamilies.family_name_latin = 'Artamidae';
