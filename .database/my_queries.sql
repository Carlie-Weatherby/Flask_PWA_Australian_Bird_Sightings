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
-- VALUES ('1005', 'Chroicocephalus', 'Masked Gulls and Allies')

-- INSERT INTO birdGenera(family_id, genus_name, description)
-- VALUES
--     ('1002', 'Trichoglossus', 'Rainbow Lorikeets and Allies'),
--     ('1003', 'Cracticus', 'Typical Butcherbirds'),
--     ('1003', 'Strepera', 'Currawongs'),
--     ('1004', 'Pelecanus', 'Pelicans'),
--     ('1002', 'Zanda', 'Australian Cockatoos'),
--     ('1001', 'Dacelo', 'Kookaburras');

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

-- CREATE TABLE birdSpecies (
--     species_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     genus_id INTEGER NOT NULL,
--     scientific_name TEXT NOT NULL,

--     FOREIGN KEY (genus_id) REFERENCES birdGenera(genus_id)
--     );




-- *** QUERIES ***
-- SELECT * FROM birdGenera;
-- WHERE family_id=1002;

-- LIMIT 3;

-- SELECT birdGenera.*
-- FROM birdGenera
-- INNER JOIN birdFamilies ON birdGenera.family_id = birdFamilies.family_id
-- WHERE birdFamilies.family_name_latin = 'Artamidae';
