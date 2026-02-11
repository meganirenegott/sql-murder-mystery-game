-- Record your SQL detective process here!  Write down: 
--   1. The SQL queries you ran
--   2. Any notes or insights as SQL comments
--   3. Your final conclusion: who did it?

-- Using these SQL clauses will help you solve the mystery: 
--    SELECT, FROM, WHERE, AND, OR, ORDER BY, LIMIT, LIKE, DISTINCT, BETWEEN, AS

-- writing a comment like this

-- selecting all columns from the crime scene report
SELECT * FROM crime_scene_report;

-- first query
SELECT * 
FROM crime_scene_report 
WHERE date = '20180115'
AND city = 'SQL City'
AND type = 'murder'

-- clue was in the description 
-- Security footage shows that there were 2 witnesses.  The first witness lives at the last house
-- on "Northwestern Dr" . The second witness, named Annabel, lives somewhere on "Franklin Ave"

-- clue 2
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