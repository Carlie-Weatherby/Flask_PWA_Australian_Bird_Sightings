-- *** COMMANDS I'VE PLAYED WITH (NOT IN ORDER) ***
-- DROP TABLE birdFamily;
-- ALTER TABLE birdFamily RENAME COLUMN family_name TO family_name_english;
-- ALTER TABLE birdFamily RENAME COLUMN common_family_name TO family_name_latin;
-- ALTER TABLE birdFamily RENAME TO birdFamilies;
-- UPDATE birdFamilies SET family_name_latin = 'Artamidae' WHERE family_id = 1003;
-- ALTER TABLE birdSpecies RENAME COLUMN jouvenile TO juvenile;
-- DROP TABLE birdSpecies;
-- DELETE FROM birdGenera WHERE genus_id = 1009;
-- UPDATE birdSpecies SET genus_id = 1008 WHERE species_id = 3005;
-- UPDATE birdSpecies SET image_bird2_desc = 'Midshot view of an adult Laughing Kookaburra, left profile view.' 
-- WHERE species_id = 3001;
-- DROP TABLE sightings;


 -- *******************************************************

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
--     ('Gulls, Terns, Skimmers', 'Laridae', 'Noddies, skimmers, gulls, terns, skuas, auks')
--     ('Old World Parrots', 'Psittaculidae', 'Parrots, cockatoos');


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

-- INSERT INTO birdGenera(family_id, genus_name, description)
-- VALUES
--     (1002, 'Trichoglossus', 'Rainbow Lorikeets and Allies'),
--     (1003, 'Cracticus', 'Typical Butcherbirds'),
--     (1003, 'Strepera', 'Currawongs'),
--     (1004, 'Pelecanus', 'Pelicans'),
--     (1002, 'Zanda', 'Australian Cockatoos'),
--     (1001, 'Dacelo', 'Kookaburras'),
--     (1006, 'Alisterus', 'King Parrots'),
--     (1002, 'Cacatua', 'White Cockatoos and Corellas');


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
--     type_id INTEGER, -- foreign key
--     abundance_id INTEGER, -- foreign key
--     movement_id INTEGER, -- foreign key
--     description TEXT NOT NULL,
--     size_avg_min INTEGER,
--     size_avg_max INTEGER,
--     size_unit TEXT,
--     juvenile TEXT,
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

-- INSERT INTO birdSpecies(
--     genus_id,
--     scientific_name,
--     common_name,
--     type_id,
--     abundance_id,
--     movement_id,
--     description,
--     size_avg_min,
--     size_avg_max,
--     size_unit,
--     juvenile,
--     voice,
--     habitat,
--     image_bird1_path,
--     image_bird1_desc,
--     image_bird2_path,
--     image_bird2_desc,
--     image_bird3_path,
--     image_bird3_desc,
--     image_map1_path,
--     image_map1_desc,
--     audio_call1_path
-- ) VALUES 
--     (
--         1007,
--         'Dacelo novaeguineae',
--         'Laughing Kookaburra',
--         1002,
--         1003,
--         1004,
--         'Largest kookaburra. Families 4-8 birds. White wing-patches in heavy direct flight. Tail up on alighting, slowly lowered. Massive bill, black above, horn below. Dark eye-stripe. Large, pale head; brown spots, crown patch. Back, wings, brown; wings mottled pale blue. Often blue rump. Tail barred ruffous-brown and black; edged white. Plain white below. **M br.** Centre rump bright blue. Race minor (B) Smaller. **F** Brown or pale blue rump; head more buff', 
--         40,
--         48,
--         'cm',
--         'More barred, washed warm-brown. All black bill. **Imm** As female.',
--         'Raucous "koo-koo-ka-ka-kook" chorus; warning "kooaa".',
--         'Open forest, woodland.',
--         '../static/images/birds/laughing_kookaburra_by_Shane_Little.jpg',
--         'Male and female Laughing Kookaburra sitting on a tree together. Photograph by Shane Little.',
--         '../static/images/birds/laughing_kookaburra_2.jpg',
--         'Midshot view of an adult Laughing Kookaburra, left profile view.',
--         NULL,
--         NULL,
--         '../static/images/birds/maps/map-laughing_kookaburra.png',
--         'Distribution map - Laughing kookaburra.', 
--         '../static/audio/Laughing_Kookaburra.mp3'
--     ),
--     (
--         1002,
--         'Trichoglossus moluccanus',
--         'Rainbow Lorikeet',
--         NULL,
--         1003,
--         1003,
--         'Sociable, noisy, acrobatic. Bright red bill. Blue head. Lime-green half-collar. Breast red/ yellow; abdomen blue. Underwing coverts red; yellow underwing bar.',
--         30,
--         30,
--         'cm',
--         'Duller; bill brown.',
--         'Strong, "screet, screet" noisy chattering.',
--         'Rainforest, open forest, woodland, heath, gardens, urban parks.',
--         '../static/images/birds/rainbow_lorikeet.jpg',
--         'Photogrpagh of a Rainbow Lorikeet (full shot) on a small branch; left profile.',
--         NULL,
--         NULL,
--         NULL,
--         NULL,
--         '../static/images/birds/maps/map-rainbow_lorikeet.png',
--         'Distribution map - Rainbow Lorikeet.', 
--         '../static/audio/Rainbow_Lorikeet.mp3'
--     ),
--     (
--         1003,
--         'Cracticus torquatus',
--         'Grey Butcherbird',
--         1002,
--         1008,
--         1003,
--         'Direct "flat" glide. Strong hooked bill. White lores, half collar. Black head; dark grey back. Black wing, thin white stripe. Black tail; white tip. White below, washed grey. Race cinereus (B) Larger, duskier. Race leucopterus (C) Smaller, lores less white; wing whiter. **F** Duskier.',
--         28,
--         32,
--         'cm',
--         'Dark bill, brown above; buff where adult white or greyish. Mottled brown, buff below. **Imm** Bill-base pale; dusky bird.',
--         'Rich melodious piping.',
--         'Open forest, woodland, mallee, urban farmland.',
--         '../static/images/birds/grey_butcherbird.jpg',
--         'Photogrpagh of a Grey Butcherbird (full shot) on a small branch; right profile.',
--         NULL,
--         NULL,
--         NULL,
--         NULL,
--         '../static/images/birds/maps/map-grey_butcherbird.png',
--         'Distribution map - Grey Butcherbird.', 
--         '../static/audio/Grey_Butcherbird.mp3'    
--     ),
--     (
--         1004,
--         'Strepera graculina',
--         'Pied Currawong',
--         1002,
--         1003,
--         1003,
--         'Winter flocks. "Rowing" flight when travelling. Robust hooked bill. Yellow eye. Black upper body with prominent white crescent-shaped patch (window or speculum ) on wing. Crescentric "rump" (tail-base) and undertail coverts form broad white ring around base of tail. White tail tip. Sooty-black underparts. **ADD RACE INFO**',
--         41,
--         51,
--         'cm',
--         'Washed brown. Less white on wings, til-base. Pale gape; dark eye gets paler with age.',
--         'Noisy, distinctive, ringing, double-call "curra-wong".',
--         'Open forest, woodland, scrubland, farms, urban.',
--         '../static/images/birds/pied_currawong.jpg',
--         'Photogrpagh of a Pied Currawong (full shot) on a branch; left profile.',
--         NULL,
--         NULL,
--         NULL,
--         NULL,
--         '../static/images/birds/maps/map-pied_currawong.png',
--         'Distribution map - Pied Currawong.', 
--         '../static/audio/Pied_Currawong.mp3'
--     ),
--     (
--         1008,
--         'Alisterus scapularis',
--         'Australian King-Parrot',
--         1002,
--         1003,
--         1003,
--         'Small flocks. Strong rocking, undulating flight. Distinctive, dimorphic. Red and black bill. Bright yellow eye. Head, neck, underparts, brilliant flame-scarlet. Dark green mantle, wings. Light green inner wing-coverts ("shoulder" stripe). Dark blue hindneck, back, rump. Tail blackish-blue. Green-black crescents on red undertail coverts. Yellow spotted feathers on some birds are areas lacking melanin. **F* Greyish bill. Red-brown eye. Green head, neck; little or no "shoulder" stripe. Tail narrow pink tips.',
--         40,
--         45,
--         'cm',
--         'Brownish bill, chest, throat (Same for **Imm**). **1st yr** No blue on tips.',
--         'Loud "carrak-carak" in flight. Far-carrying, shrill piping whistle by male.',
--         'Moist, tall forest;nearby farmland. Orchards, parks, gardens, autumn/winter.',
--         '../static/images/birds/australian_king_parrot.jpg',
--         'Photogrpagh of a male Australian King-Parrot (full shot) on a small branch; left profile.',
--         '../static/images/birds/australian_king_parrot_2.jpg',
--         'Photogrpagh of a male Australian King-Parrot (full shot) on a stump; right profile.',
--         NULL,
--         NULL,
--         '../static/images/birds/maps/map-australian_king_parrot.png',
--         'Distribution map - Australian King-Parrot.', 
--         '../static/audio/Australian_King_Parrot.mp3'    
--     ),
--     (
--         1004,
--         'Strepera versicolor',
--         'Grey Currawong',
--         1002,
--         1003,
--         1003,
--         '“Rowing” flight. Forages in trees from canopy to ground. May resemble Laughing Kookaburra when flying away from observer. Darker races: check Pied Currawong, but upper bill-base wider; no white rump. Bill slender, without well-defined hook. Smoky grey, sootier on face, throat. Large, prominent white speculum in wing. Flight feathers tipped white; white undertail coverts, broad white tail-band. **F** Slightly smaller; lighter grey. **ADD RACE INFO**', 
--         45,
--         53,
--         'cm',
--         'Cream gape obvious; persis for some months. Duller, browner. **Imm** Markings as for adult, but body generally greyer; more brownish on throat, mantle. Adults in body moult may resemble imm. birds.',
--         'Ringing, clinking call; also repeated loud bell-like "chimes"',
--         'Open and low open forest, woodland generally; mallee heath, scrub and agricultural lands, urban fringes.',
--         '../static/images/birds/grey_currawong.jpg',
--         'Photograph of a Grey Currawong (full shot) standing on small stump; left profile.',
--         '../static/images/birds/grey_currawong_2.jpg',
--         'Photograph of a Grey Currawong (full shot) standing on branch; right profile.',
--         NULL,
--         NULL,
--         '../static/images/birds/maps/map-grey_currawong.png',
--         'Distribution map - Grey Currawong.', 
--         '../static/audio/Grey_Currawong.mp3'   
--     ),
    (
        1010,
        'Cacatua galerita',
        'Sulphur-crested Cockatoo',
        NULL,
        1003,
        1004,
        'Flocks feed on ground. White; distinctive in flight; uneven wing-beat (flap-flap-glide) on stiff, broad, rounded wings. Erectile, forward-curving sulphur crest. Underwing, washed yellow.', 
        48,
        55,
        'cm',
        NULL,
        'Extremely raucous screech; single squark in flight.',
        'Many, varied vegetation types.',
        '../static/images/birds/sulfur_crested_cockatoo_by_Wendy_Smith.jpg',
        'Photo of a Sulphur-crested Cockatoo landing on a branch, wings outstretched. Photograph by Wendy Smith.',
        NULL,
        NULL,
        NULL,
        NULL,
        '../static/images/birds/maps/map-sulphur_crested_cockatoo.png',
        'Distribution map - Laughing kookaburra.', 
        '../static/audio/Sulphur_Crested_Cockatoo.mp3'
    );




-- CREATE TABLE sightings (
--     sighting_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     species_id INTEGER NOT NULL, -- foreign key
--     date_sighted TEXT NOT NULL, -- Stores date in 'YYYY-MM-DD' format
--     location_suburb TEXT NOT NULL,
--     location_state TEXT NOT NULL,
--     location_desc TEXT,
--     location_coord_lat FLOAT, -- Stores latitude in -NN.NNNNNNNN format
--     location_coord_long FLOAT, -- Stores longitude in NNN.NNNNNNNN format
--     notes TEXT,
--     cfw_photo_path TEXT,
--     cfw_photo_desc TEXT,
--     FOREIGN KEY (species_id) REFERENCES birdSpecies(species_id)
--     );

-- INSERT INTO sightings(
--     species_id,
--     date_sighted,
--     location_suburb,
--     location_state,
--     location_desc,
--     location_coord_lat,
--     location_coord_long,
--     notes,
--     cfw_photo_path,
--     cfw_photo_desc
-- ) 
-- VALUES (
--     3005,
--     '2024-12-24',
--     'Illawong',
--     'NSW',
--     'Sitting in a tree.',
--     -33.99883889, 
--     151.07013056,
--     'Sighted at home.',
--     NULL,
--     NULL
-- );


-- INSERT INTO sightings(
--     species_id,
--     date_sighted,
--     location_suburb,
--     location_state,
--     location_desc,
--     location_coord_lat,
--     location_coord_long,
--     notes,
--     cfw_photo_path,
--     cfw_photo_desc
-- ) 
-- VALUES 
--     (
--         3001,
--         '2025-01-18',
--         'Illawong',
--         'NSW',
--         'Pair, sitting in a tree. Calling (laughing).',
--         -33.99892500, 
--         151.07021944,
--         'Calling for Cy. 💕 18/1/2025. Sighted at home.',
--         NULL,
--         NULL
--     ),
--     (
--         3003,
--         '2024-12-25',
--         'Illawong',
--         'NSW',
--         'Sitting on the clothes line.',
--         -33.99870833, 
--         151.07039444,
--         'Christmas day - Family dinner, (day light savings). Sighted at home.',
--         NULL,
--         NULL
--     ),
--     (
--         3002,
--         '2025-01-27',
--         'Illawong',
--         'NSW',
--         'Sitting in a tree, feeding on flowers. Calling.',
--         -33.99883889, 
--         151.07013056,
--         'Part of a small flock (4-5) in the same tree. Sighted at home.',
--         NULL,
--         NULL
--     ),
--     (
--         3005,
--         '2024-12-22',
--         'Illawong',
--         'NSW',
--         'Sitting in a tree.',
--         -33.99883889, 
--         151.07013056,
--         'Sighted at home.',
--         NULL,
--         NULL
--     ),
--     (
--         3004,
--         '2024-12-24',
--         'Illawong',
--         'NSW',
--         'In flight.',
--         -33.99903611, 
--         151.07011667,
--         'Sighted at home.',
--         NULL,
--         NULL
--     ),
--     (
--         3006,
--         '2025-01-29',
--         'Illawong',
--         'NSW',
--         'Sitting on a brick wall.',
--         -33.99868056, 
--         151.07020278,
--         '90% sure this was a Grey Currawong. Browner, less white. Sighted at home.',
--         NULL,
--         NULL
--     ),
--     (
--         3001,
--         '2024-12-24',
--         'Illawong',
--         'NSW',
--         'Sitting on the clothes line. Hunting.',
--         -33.99874722, 
--         151.07034722,
--         'Taking advantage of newly mowed lawn (hunting ground). Sighted at home.',
--         NULL,
--         NULL
--     ),
--     (
--         3004,
--         '2025-01-29',
--         'Illawong',
--         'NSW',
--         'Sitting on a brick wall.',
--         -33.99868889, 
--         151.07039444,
--         'Sighted at home.',
--         NULL,
--         NULL
--     ),
--     (
--         3002,
--         '2024-01-27',
--         'Illawong',
--         'NSW',
--         'Exiting from a hole in a tree (Angophora).',
--         -33.99883889, 
--         151.07013056,
--         'Sighted two birds exiting hole (nest?); both stood at entrance prior to taking flight; ossible nest in tree hole; sighted at home.',
--         NULL,
--         NULL
--     ),
--     (
--         3004,
--         '2025-01-29',
--         'Illawong',
--         'NSW',
--         'Sitting in a tree.',
--         -34.00754444, 
--         151.04940556,
--         'Sighted near Illawong Village shops.',
--         NULL,
--         NULL
--     ),
--     (
--         3001,
--         '2025-01-26',
--         'Illawong',
--         'NSW',
--         'Sitting in a tree.',
--         -34.00396389, 
--         151.05332500,
--         'Sighted near "Letterbox Lane".',
--         NULL,
--         NULL
--     ),
--     (
--         3001,
--         '2024-12-16',
--         'Illawong',
--         'NSW',
--         'Sitting on a wire.',
--         -34.00396389, 
--         151.05332500,
--         'Sighted near Bignell Street bus stop.',
--         NULL,
--         NULL
--     ),
--     (
--         3001,
--         '2025-01-31',
--         'Illawong',
--         'NSW',
--         'Sitting in a tree.',
--         -33.99969167, 
--         151.06240000,
--         NULL,
--         NULL,
--         NULL
--     ),
--     (
--         3005,
--         '2025-01-31',
--         'Illawong',
--         'NSW',
--         'Sitting in a large, old Angophora (Sydney Red Gum) adjacent to northern footpath; Laughing Kookaburras (x6) and Sulphur-Crested Cockatoos (x2) in same tree; sighted along Griffin Parage.',
--         -34.00346944, 
--         151.06030000,
--         NULL,
--         NULL,
--         NULL
--     ),
--     (
--         3001,
--         '2025-01-31',
--         'Illawong',
--         'NSW',
--         'Flock of 6 sitting in a large, old Angophora (Sydney Red Gum) adjacent to northern footpath; calling (laughing); Australian King-Parrot and Sulphur-Crested Cockatoos (x2) in same tree; sighted along Griffin Parade.', 
--         -34.00346944, 
--         151.06030000,
--         NULL,
--         NULL,
--         NULL
--     ),
--     (
--         3005,
--         '2025-01-31',
--         'Illawong',
--         'NSW',
--         'Flock of 4 sitting in a group of trees on southern edge of roadway, within reserve; sighted in Thompsons Bay Reserve.',
--         -34.00346944, 
--         151.06030000,
--         NULL,
--         NULL,
--         NULL
--     ),
--     (
--         3007,
--         '2025-01-31',
--         'Illawong',
--         'NSW',
--         'Two sitting in a large, old Angophora (Sydney Red Gum) adjacent to northern footpath; Australian King-Parrot and Laughing Kookaburras (x6) in same tree; sighted along Griffin Parade.', 
--         -34.00346944, 
--         151.06030000,
--         NULL,
--         NULL,
--         NULL
--     );




-- *** QUERIES ***
-- SELECT * FROM birdGenera;
-- WHERE family_id=1002;

-- LIMIT 3;

-- SELECT birdGenera.*
-- FROM birdGenera
-- INNER JOIN birdFamilies ON birdGenera.family_id = birdFamilies.family_id
-- WHERE birdFamilies.family_name_latin = 'Artamidae';

-- SELECT * FROM birdSpecies;

-- SELECT birdGenera.*
-- FROM birdGenera
-- INNER JOIN birdSpecies ON birdGenera.genus_id = birdSpecies.genus_id
-- WHERE birdSpecies.common_name = 'Pied Currawong';

-- SELECT birdGenera.*, birdSpecies.*
-- FROM birdGenera
-- INNER JOIN birdSpecies ON birdGenera.genus_id = birdSpecies.genus_id
-- WHERE birdSpecies.common_name LIKE '%Currawong%';

-- SELECT birdGenera.*, birdSpecies.*
-- FROM birdGenera
-- INNER JOIN birdSpecies ON birdGenera.genus_id = birdSpecies.genus_id
-- WHERE birdSpecies.common_name LIKE '%Currawong%';

-- *** QUERY - Search based on common genus name ***
-- SELECT 
--     birdSpecies.common_name, 
--     birdSpecies.scientific_name, 
--     birdSpecies.size_avg_min, 
--     birdSpecies.size_avg_max
-- FROM 
--     birdSpecies
-- INNER JOIN 
--     birdGenera 
-- ON 
--     birdSpecies.genus_id = birdGenera.genus_id
-- WHERE 
--     birdGenera.genus_name = 'Strepera';