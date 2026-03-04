-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

query1: select * from crime_scene where location == "Fontainebleau Hotel";

id	date	location	description
48	19870520	Fontainebleau Hotel	The Heart of Atlantis necklace disappeared. Many guests were questioned but only two of them gave valuable clues. One of them is a really famous actor. The other one is a woman who works as a consultant for a big company and her first name ends with "an".

We see that the theft occurred on 19870520 and we need to find a famous actor to talk to an a consultant whose first name ends with "an"

query2: select * from guest where occupation == "Actor" or occupation == "Consultant";

id	name	occupation	invitation_code
36	Max Cooper	Consultant	VIP-G
43	Ruby Baker	Actor	VIP-R
108	Phoenix Barton	Consultant	VIP-G
116	Vivian Nair	Consultant	VIP-R
129	Clint Eastwood	Actor	VIP-G
135	Sage Russo	Consultant	VIP-G
138	Phoenix Sandoval	Consultant	VIP-G
155	Luna Conley	Consultant	VIP-B
162	Phoenix Farley	Consultant	VIP-G
164	River Bowers	Actor	VIP-B
186	Phoenix Kinney	Consultant	VIP-G
189	Sage Dillon	Actor	VIP-G
192	Phoenix Pitts	Actor	VIP-G

We see "Clint Eastwood" as a famous actor. The other person that stands out is Vivian Nair, the only consultant whose first name ends with "an". We can get our clues from them.

Their guest_ids are 129 and 116. We can see their witness statements

query3: select * from witness_statements where guest_id == 129 or guest_id == 116;


id	guest_id	clue
16	116	I saw someone holding an invitation ending with "-R". He was wearing a navy suit and a white tie.
50	129	I overheard someone say, "Meet me at the marina, dock 3".

query4: select ar.* from attire_registry ar join guest g on ar.guest_id = g.id where g.invitation_code LIKE "%-R";

id	guest_id	note
1	1	black tuxedo, emerald cufflinks
2	2	navy suit, red tie
3	3	red gown, diamond necklace
4	4	navy suit, blue tie
10	34	navy suit, purple tie
11	178	blue silk dress, pearl necklace
20	178	navy suit, navy tie
29	178	emerald silk gown, crystal bracelet
38	178	burgundy suit, pearl tie clip
47	178	champagne dress, ruby pendant
48	105	navy suit, white tie
56	178	cream tuxedo, emerald studs
65	178	gold velvet gown, crystal pendant
74	178	purple evening gown, diamond pendant
83	178	navy pinstripe suit, topaz cufflinks
92	178	red evening gown, sapphire pendant
98	116	blue velvet dress, pearl choker
101	178	white suit, crystal cufflinks

We find out all the attire registered by anyone who attended with invitation codes ending with "-R"

Only one of them shows up with a "navy suit, white tie". This is guest 105.

query5: 
select * from marina_rentals where dock_number == 3 and renter_guest_id == 105;

id	dock_number	renter_guest_id	rental_date	boat_name
44	3	105	19870520	Coastal Spirit

We have guest 105 heading to Dock 3 on the night of the theft.

query6: select * from final_interviews where guest_id == 105;

id	guest_id	confession
105	105	I was the one who took the crystal. I guess I need a lawyer now?

Guest 105 has a confession in their final interview. We need their name.

query7: select * from guest where id == 105;

id	name	occupation	invitation_code
105	Mike Manning	Wealth Reallocation Expert	VIP-R

The thief is Mike Manning.