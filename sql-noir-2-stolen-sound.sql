-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

-- query
SELECT * FROM crime_scene
WHERE date = 19830715
AND location = 'West Hollywood Records';

-- result 
id = 65
date = 19830715
type = theft
location = West Hollywood Records
description = a prized vinyl record was stolen from the store during a busy evening 

-- query
SELECT * FROM witnesses
WHERE crime_scene_id = 65;

-- result

id = 28
crime_scene_id = 65 
clue = I saw a man wearing a red bandana rushing out of the store

id = 75
crime_scene_id = 65 
clue = The main thing I remember is that he had a distinctive gold watch on his wrist

-- query

SELECT * FROM suspects
WHERE id = 28;

-- result
-- id = 28
-- name = Javier Soto
-- bandana_color = grey
-- accessory = leather jacket

-- query

SELECT * FROM suspects
WHERE id = 75;

-- result

-- id = 75
-- name = Jorge Vega
-- bandana_color = green
-- accessory = gold ring

-- query
SELECT * FROM suspects
WHERE bandana_color = 'red' AND accessory = 'gold watch';

-- result
-- id = 35
-- name = tony ramirez
-- bandana_color = red
-- accessory = gold watch 

-- id = 44
-- name = Mickey Riveria
-- bandana_color = red
-- accessory = gold watch 

-- id = 97
-- name = Rico Delgado
-- bandana_color = red
-- accessory = gold watch 

-- query
SELECT * FROM interviews
WHERE suspect_id = 35;

-- result 
-- suspect_id = 35
-- transcript = I wasn't anywhere near West Hollywood Records that night

SELECT * FROM interviews
WHERE suspect_id = 44;

-- result
-- suspect_id = 44
-- transcript = I was busy with my music career; I have nothing to do with this theft

SELECT * FROM interviews
WHERE suspect_id = 97;

-- result
-- -- suspect_id = 97
-- transcript = I couldn't help it, I snapped and took the record

The theif was suspect 97, Rico Delgado