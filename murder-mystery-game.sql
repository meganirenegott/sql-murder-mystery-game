-- Record your SQL detective process here!  Write down: 
--   1. The SQL queries you ran
--   2. Any notes or insights as SQL comments
--   3. Your final conclusion: who did it?

-- Using these SQL clauses will help you solve the mystery: 
--    SELECT, FROM, WHERE, AND, OR, ORDER BY, LIMIT, LIKE, DISTINCT, BETWEEN, AS

-- writing a comment like this

-- selecting all columns from the crime scene report
SELECT * FROM crime_scene_report;

-- first query crime report 
SELECT * 
FROM crime_scene_report 
WHERE date = '20180115'
AND city = 'SQL City'
AND type = 'murder'

-- clue was in the description 
-- Security footage shows that there were 2 witnesses.  The first witness lives at the last house
-- on "Northwestern Dr" . The second witness, named Annabel, lives somewhere on "Franklin Ave"

-- second query witness named Annabel
SELECT *
FROM person
WHERE address_street_name = 'Franklin Ave' 
AND name LIKE 'Annabel%'

-- result 
id = 16371
name = Annabel Miller
license_id = 490173
address_number = 103
address_street_name = Franklin Ave
ssn = 318771143

-- 3rd query annabel drivers liscense

SELECT * 
FROM drivers_liscense
WHERE id = 490173;

-- result Annabel drivers liscense
age = 35
height = 65
eye_color = brown
gender = female
plate_number = 23AM98
car_make = toyota
car_model = Yaris

-- query 4 address for last house on Northwestern Dr.
SELECT * 
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC

-- result person id for Morty
id = 14887
name = Morty Schapiro
liscence_id = 118009
address_number = 4919
address_street_name = Northwestern Dr
ssn = 111564949

-- query 5 
-- for suspecy Morty drivers license query

SELECT *
FROM drivers_license
WHERE id = 118009
              
-- result
id = 118009
age = 64
eye_color = blue
hair_color = white
gender = male
plate_number = OONUOO
car_make = Mercedes-Benz
car_model = E-Class

-- query 6 annabel interview
SELECT * 
FROM interview
WHERE person_id = 16371;

-- annabel interview result
person_id = 16371
transcript = 'I saw the murder happen, and I recognized the killer from my gym when I was 
working out last week on January the 9th'

-- query 7 Morty interview
SELECT * 
FROM interview
WHERE person_id = 14887;

-- result for Morty Interview
person_id = 14887
transcript = 'I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership 
number on the bag started with "48Z" Only gold members have those bags. The man got into a car with a plate 
that included "H42W"'

-- query 8 drivers liscence search from Morty Interview Clues

SELECT *
FROM drivers_license 
WHERE plate_number LIKE '%H42W%'

-- results (3, 2 men 1 woman)
-- woman liscence match, doesn't fit witness description based on gender
id = 183779
age = 21
height = 65
eye_color = blue
hair_color= blonde
gender = female
plate_number = H42WDX
car_make = Toyota
car_model = Prius

-- male witness suspect 1 (Jeremy Bowers)
id = 423327
age = 30
height = 70
eye_color = brown
hair_color= brown
gender = male
plate_number = OH42W2
car_make = Chevrolet
car_model = Spark LS

-- male suspect 2 (Tushar Chandra)
id = 664760
age = 21
height = 71
eye_color = black
hair_color= black
gender = male
plate_number = 4H42WR
car_make = Nissan
car_model = Altima

-- query 9 (suspect 1 by person/license_id)
SELECT *
FROM person
WHERE license_id = 423327;

-- result
id = 67318
name = Jeremy Bowers
license_id = 423327
address_number = 530
address_street = Washingto Pl, APT 3A
ssn = 8715339279

-- query 9 (suspect 2 by person/license_id)
SELECT *
FROM person
WHERE license_id = 664760;

-- result 
id = 51739
name = Tushar Chandra
license_id = 664760
address_number = 312
address_street_name = Phi St
ssn = 137882671