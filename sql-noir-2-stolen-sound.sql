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