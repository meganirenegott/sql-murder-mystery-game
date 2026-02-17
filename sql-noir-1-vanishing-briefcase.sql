-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

-- query
SELECT * FROM crime_scene WHERE location = 'Blue Note Lounge';

-- result 
id = 76
date = 19851120
location = Blue Note Lounge
description = "a briefcase containing sensitive documents vanished. A 
witness reported a man in a trench coat with a scar on his left cheek fleeing
the scene"

-- query
SELECT * FROM suspects WHERE id = 76;

-- result 
id = 76
name = emma hall
attire = jacket 
scar = none


-- query
SELECT * FROM interviews WHERE suspect_id = 76;

-- result 
supect_id = 76
transcript = null 

-- query
SELECT * FROM suspects WHERE attire = 'trench coat' AND scar = 'left cheek';

-- results 
id = 3
name = Frankie Lombardi 
attire = trench coat
scar = left cheek 

id = 183
name = Vincent Malone
attire = trench coat
scar = left cheek 

-- query
SELECT * FROM interviews WHERE suspect_id = 3;

-- result
suspect_id = 3
transcript = null

-- query
SELECT * FROM interviews WHERE suspect_id = 183;

result
suspect_id = 183
transcript = "I wasn't gonna steal it but I did"

-- culprit is Vincent Malone