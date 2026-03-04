-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

query1: select * from crime_scene where location = "Coral Bay Marina";

id: 43
date: 19860814
location: Coral Bay Marina
description: The body of an unidentified man was found near the docks. Two people were seen nearby: one who lives on 300ish "Ocean Drive" and another whose first name ends with "ul" and his last name ends with "ez".

query2: SELECT * FROM person WHERE address LIKE '%Ocean Drive%';

this gave 5 results:

id	name	alias	occupation	address
1	Marco Romano	The Shadow	Fisherman	22 Ocean Drive
5	Michael Santos	Silent Mike	Bartender	33 Ocean Drive
62	Jesse Brooks	The Judge	Court Clerk	234 Ocean Drive
101	Carlos Mendez	Los Ojos	Fisherman	369 Ocean Drive
105	Victor Martinez	Slick Vic	Bartender	33 Ocean Drive

query3: SELECT * FROM person WHERE name LIKE '%ul%';

This gave 5 results: 

11	Paul Thompson	The Eagle	Private Investigator	123 Coast Ave
68	Terry Sullivan	The Torch	Fire Performer	321 Shell Street
102	Raul Gutierrez	The Cobra	Nightclub Owner	45 Sunset Ave
139	Paul Price	The Prophet	Fortune Teller	27 Shell Drive
173	Steve Fuller	The Shield	Police Officer	71 Marina Point

query4: SELECT * FROM person WHERE name LIKE '%ez%';

This gave 5 results: 

id	name	alias	occupation	address
101	Carlos Mendez	Los Ojos	Fisherman	369 Ocean Drive
102	Raul Gutierrez	The Cobra	Nightclub Owner	45 Sunset Ave
103	Luis Sanchez	Lucky Lou	Smuggler	88 Harbor St
104	Diego Ramirez	El Fuego	Contractor	101 Palm Blvd
105	Victor Martinez	Slick Vic	Bartender	33 Ocean Drive

From the clue in the crime scene record, there are two people of interest. The first one lives in the 300 range of Ocean Drive. 
From the address records, we find only Carlos Mendez Los Ojos having an address like that. He is our first suspect and has an id of 101.
The second suspect has a first-name that ends in "ul" and a last-name that ends in "ez".
From the name records, we find only Raul Gutierrez matching that criteria. He is our second suspect and has an id of 102.

query5: SELECT * FROM interviews where person_id == 101 or person_id == 102;

id	person_id	transcript
101	101	I saw someone check into a hotel on August 13. The guy looked nervous.
103	102	I heard someone checked into a hotel with "Sunset" in the name.

Carlos Mendez tells us about a guy at a hotel checking in on August 13
Raul Gutierrez tells us about someone checking into a hotel with Sunset in the name.

query6: SELECT * FROM confessions where person_id == 101 or person_id == 102;

id	person_id	confession
96	101	This is just a misunderstanding.
97	102	Alright! Ive been running a blackmail operation.

query7: SELECT * FROM surveillance_records where person_id == 101 or person_id == 102;

id	person_id	hotel_checkin_id	suspicious_activity
101	101	45	Asked for room service menu
102	102	12	NULL

No leads from the confessions and interviews for these two people. 

So lets look at everyone who checked in to a hotel with "Sunset" in the name on Aug 13, and see if they show up in any surveillance records:

query8: 
SELECT sr.*
FROM surveillance_records sr
JOIN hotel_checkins hc
  ON sr.person_id = hc.person_id
WHERE hc.check_in_date = 19860813
  AND hc.hotel_name LIKE "%Sunset%";


We get this:

id	person_id	hotel_checkin_id	suspicious_activity
27	27	31	Requested newspaper delivery
12	12	88	NULL
15	15	44	Asked for directions to beach
17	17	82	NULL
19	19	93	NULL
6	6	34	Spotted entering late at night
23	23	19	Asked about checkout time
25	25	47	Used hotel vending machine
7	7	89	Seen arguing with an unknown person
29	29	22	Used hotel restaurant
31	31	41	Asked about room service menu
33	33	8	NULL
35	35	27	NULL
37	37	16	NULL
39	39	54	Used ice machine
41	41	69	Requested extra soap
43	43	75	Used hotel phone
45	45	94	Asked about check-in time
47	47	61	NULL
49	49	87	NULL
51	51	72	NULL
53	53	58	Used hotel gym
55	55	43	Requested extra pillows
9	9	67	Requested wake-up call
11	11	15	Had breakfast at hotel restaurant
8	8	2	Left suddenly at 3 AM
13	13	33	Used valet parking
14	14	76	NULL
16	16	29	Used the business center
18	18	51	Requested city map
20	20	38	Used concierge service
21	21	5	NULL
22	22	71	Borrowed pool towels
24	24	84	NULL
26	26	63	NULL
28	28	95	NULL
30	30	86	NULL
32	32	73	Used the elevator
34	34	59	Requested fresh towels
36	36	92	Used hotel parking
38	38	83	Asked about laundromat service
40	40	37	NULL
42	42	11	NULL
44	44	48	NULL
46	46	25	Used lobby restroom
48	48	14	Requested room cleaning
50	50	36	Used hotel elevator
52	52	3	Asked about breakfast hours
10	10	91	NULL
54	54	96	NULL

One of the entries says "Left suddenly at 3AM" and the person_id associated to it is 8.

query9: SELECT * from interviews where person_id == 8;

id	person_id	transcript
113	8	NULL

query10: SELECT * from confessions where person_id == 8;

id	person_id	confession
73	8	Alright! I did it. I was paid to make sure he never left the marina alive.

We found a confession. Now we get the name.

query11: SELECT * from person where id == 8;


id	name	alias	occupation	address
8	Thomas Brown	The Fox	Dock Worker	234 Port Street

The killer is Thomas Brown.


