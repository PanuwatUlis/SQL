#1. Profile the data by finding the total number of records for each of the tables
#Code
SELECT COUNT(*)
FROM attribute;

SELECT COUNT(*)
FROM business;

SELECT COUNT(*)
FROM category;

SELECT COUNT(*)
FROM checkin;

SELECT COUNT(*)
FROM elite_years;

SELECT COUNT(*)
FROM friend;

SELECT COUNT(*)
FROM hours;

SELECT COUNT(*)
FROM photo;

SELECT COUNT(*)
FROM review;

SELECT COUNT(*)
FROM tip;
"""Answer Questions
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
"""

#2. Find the total distinct records by either the foreign key or primary key for each table. 
#If two foreign keys are listed in the table, please specify which foreign key.
#Code
SELECT COUNT(DISTINCT id)
FROM business;

SELECT COUNT(DISTINCT business_id)
FROM hours;

SELECT COUNT(DISTINCT business_id)
FROM category;

SELECT COUNT(DISTINCT business_id)
FROM attribute;

SELECT COUNT(DISTINCT id)
FROM review;

SELECT COUNT(DISTINCT business_id)
FROM review;

SELECT COUNT(DISTINCT user_id)
FROM review;

SELECT COUNT(DISTINCT business_id)
FROM checkin;

SELECT COUNT(DISTINCT id)
FROM photo;

SELECT COUNT(DISTINCT business_id)
FROM photo;

SELECT COUNT(DISTINCT user_id)
FROM tip;

SELECT COUNT(DISTINCT business_id)
FROM tip;

SELECT COUNT(DISTINCT id)
FROM user;

SELECT COUNT(DISTINCT user_id)
FROM friend;

SELECT COUNT(DISTINCT user_id)
FROM elite_years;

""" Answer Questions
i. Business = 10000 primary key of id
ii. Hours = 1562 foreign key of business_id
iii. Category = 2643 foreign key of category
iv. Attribute = 1115 foreign key of attribute
v. Review = 10000 primary key of id, 8090 foreign key of business_id, and 9581 foreign key of user_id
vi. Checkin = 493 foreign key of business_id
vii. Photo = 10000 primary key of id, and 6493 foreign key of business_id
viii. Tip = 537 foreign key of user_id, and 3979 foreign key of business_id
ix. User = 10000 primary key of id 
x. Friend = 11 foreign key of user_id
xi. Elite_years = 2780 foreign key of user_id
"""

#3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

SELECT count(*)
FROM user
WHERE id is null or 
      name is null or 
      review_count is null or 
      yelping_since is null or
      useful is null or 
      funny is null or 
      cool is null or 
      fans is null or 
      average_stars is null or 
      compliment_hot is null or 
      compliment_more is null or 
      compliment_profile is null or 
      compliment_cute is null or 
      compliment_list is null or 
      compliment_note is null or 
      compliment_plain is null or 
      compliment_cool is null or 
      compliment_funny is null or 
      compliment_writer is null or 
      compliment_photos is null; 

"Answer no NULL value"

#4 For each table and column listed below, display the smallest (minimum), 
#largest (maximum), and average (mean) value for the following fields:
#Code

#i
SELECT min(stars)
FROM review;

SELECT max(stars)
FROM review;

SELECT round(avg(stars),2)
FROM review;

#ii
SELECT min(stars)
FROM business;

SELECT max(stars)
FROM business;

SELECT round(avg(stars),2)
FROM business;

#iii
SELECT min(likes)
FROM tip;

SELECT max(likes)
FROM tip;

SELECT round(avg(likes),2)
FROM tip;

#iv
SELECT min(count)
FROM checkin;

SELECT max(count)
FROM checkin;

SELECT round(avg(count),2)
FROM checkin;

#v
SELECT min(review_count)
FROM user;    

SELECT max(review_count)
FROM user;

SELECT round(avg(review_count),2)
FROM user;
"Answer Questions
i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg:3.71
		
	
ii. Table: Business, Column: Stars
	
		min:1.0		max:5.0		avg:3.65
		
	
iii. Table: Tip, Column: Likes
	
		min: 0		max: 2		avg:0.01
		
	
iv. Table: Checkin, Column: Count
	
		min: 1		max:53		avg:1.94
		
	
v. Table: User, Column: Review_count
	
		min: 0		max: 2000		avg:24.3

"

#5. List the cities with the most reviews in descending order:
#Code
SELECT
  city,
  SUM(review_count) AS total_review
FROM business
GROUP BY city
ORDER BY total_review DESC;

#Result
"+-----------------+--------------+
| city            | total_review |
+-----------------+--------------+
| Las Vegas       |        82854 |
| Phoenix         |        34503 |
| Toronto         |        24113 |
| Scottsdale      |        20614 |
| Charlotte       |        12523 |
| Henderson       |        10871 |
| Tempe           |        10504 |
| Pittsburgh      |         9798 |
| Montréal        |         9448 |
| Chandler        |         8112 |
| Mesa            |         6875 |
| Gilbert         |         6380 |
| Cleveland       |         5593 |
| Madison         |         5265 |
| Glendale        |         4406 |
| Mississauga     |         3814 |
| Edinburgh       |         2792 |
| Peoria          |         2624 |
| North Las Vegas |         2438 |
| Markham         |         2352 |
| Champaign       |         2029 |
| Stuttgart       |         1849 |
| Surprise        |         1520 |
| Lakewood        |         1465 |
| Goodyear        |         1155 |
+-----------------+--------------+
(Output limit exceeded, 25 of 362 total rows shown)"


#6. Find the distribution of star ratings to the business in the following cities:

#i. Avon
SELECT
  stars,
  COUNT(stars) as count
FROM business
WHERE city ='Avon'
GROUP BY stars;

"+-------+-------+
| stars | count |
+-------+-------+
|   1.5 |     1 |
|   2.5 |     2 |
|   3.5 |     3 |
|   4.0 |     2 |
|   4.5 |     1 |
|   5.0 |     1 |
+-------+-------+"

#ii. Beachwood
SELECT
  stars,
  COUNT(stars) as count
FROM business
WHERE city ='Beachwood'
GROUP BY stars;
"+-------+-------+
| stars | count |
+-------+-------+
|   2.0 |     1 |
|   2.5 |     1 |
|   3.0 |     2 |
|   3.5 |     2 |
|   4.0 |     1 |
|   4.5 |     2 |
|   5.0 |     5 |
+-------+-------+"

#7. Find the top 3 users based on their total number of reviews:
SELECT
  id,
  name,
  review_count
FROM user
ORDER BY review_count DESC
LIMIT 3;

"+------------------------+--------+--------------+
| id                     | name   | review_count |
+------------------------+--------+--------------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
+------------------------+--------+--------------+"


#8. Does posing more reviews correlate with more fans?
#Please explain your findings and interpretation of the results:
#Code:

SELECT
  name,
  review_count,
  fans
FROM user
ORDER BY fans DESC;


SELECT
  name,
  review_count,
  fans
FROM user
ORDER BY review_count DESC;



#Result:
"+-----------+--------------+------+    
| name      | review_count | fans |
+-----------+--------------+------+
| Amy       |          609 |  503 |
| Mimi      |          968 |  497 |
| Harald    |         1153 |  311 |
| Gerald    |         2000 |  253 |
| Christine |          930 |  173 |
| Lisa      |          813 |  159 |
| Cat       |          377 |  133 |
| William   |         1215 |  126 |
| Fran      |          862 |  124 |
| Lissa     |          834 |  120 |
| Mark      |          861 |  115 |
| Tiffany   |          408 |  111 |
| bernice   |          255 |  105 |
| Roanna    |         1039 |  104 |
| Angela    |          694 |  101 |
| .Hon      |         1246 |  101 |
| Ben       |          307 |   96 |
| Linda     |          584 |   89 |
| Christina |          842 |   85 |
| Jessica   |          220 |   84 |
| Greg      |          408 |   81 |
| Nieves    |          178 |   80 |
| Sui       |          754 |   78 |
| Yuri      |         1339 |   76 |
| Nicole    |          161 |   73 |


+-----------+--------------+------+
| name      | review_count | fans |
+-----------+--------------+------+
| Gerald    |         2000 |  253 |
| Sara      |         1629 |   50 |
| Yuri      |         1339 |   76 |
| .Hon      |         1246 |  101 |
| William   |         1215 |  126 |
| Harald    |         1153 |  311 |
| eric      |         1116 |   16 |
| Roanna    |         1039 |  104 |
| Mimi      |          968 |  497 |
| Christine |          930 |  173 |
| Ed        |          904 |   38 |
| Nicole    |          864 |   43 |
| Fran      |          862 |  124 |
| Mark      |          861 |  115 |
| Christina |          842 |   85 |   
| Dominic   |          836 |   37 |
| Lissa     |          834 |  120 |
| Lisa      |          813 |  159 |
| Alison    |          775 |   61 |
| Sui       |          754 |   78 |
| Tim       |          702 |   35 |
| L         |          696 |   10 |
| Angela    |          694 |  101 |
| Crissy    |          676 |   25 |
| Lyn       |          675 |   45 |
+-----------+--------------+------+
"

"From the result you will see Sara got review_count more than Yuri, Hon, Harald, and Mimi 
but she still has less fans   OR if review_count and fans are correlated, SQL code from different ORDER BY either
fans or review_count should be almost the same."

#9. Are there more reviews with the word "love" or with the word "hate" in them?
SELECT 
  COUNT(text) as good_review
FROM review
WHERE text LIKE '%love%'
"+-------------+
| good_review |
+-------------+
|        1780 |
+-------------+"

SELECT 
  COUNT(text) as bad_review
FROM review
WHERE text LIKE '%hate%'

"+------------+
| bad_review |
+------------+
|        232 |
+------------+"

"Answer It more review with word ""love" "than ""hate"


#10. Find the top 10 users with the most fans:
SELECT
  name,
  fans
FROM user
ORDER BY fans DESC
Limit 10;

#Result

"+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+"

#11. Is there a strong relationship (or correlation) between having a high number of fans and being listed as "useful" or "funny?" 
#Out of the top 10 users with the highest number of fans, what percent are also listed as “useful” or “funny”?

SELECT 
  name,
  fans,
  useful
FROM user
ORDER BY fans DESC
LIMIT 10;

"+-----------+------+--------+
| name      | fans | useful |
+-----------+------+--------+
| Amy       |  503 |   3226 |
| Mimi      |  497 |    257 |
| Harald    |  311 | 122921 |
| Gerald    |  253 |  17524 |
| Christine |  173 |   4834 |
| Lisa      |  159 |     48 |
| Cat       |  133 |   1062 |
| William   |  126 |   9363 |
| Fran      |  124 |   9851 |
| Lissa     |  120 |    455 |
+-----------+------+--------+"

SELECT 
  name,
  fans,
  funny
FROM user
ORDER BY fans DESC
LIMIT 10;

"+-----------+------+--------+
| name      | fans |  funny |
+-----------+------+--------+
| Amy       |  503 |   2554 |
| Mimi      |  497 |    138 |
| Harald    |  311 | 122419 |
| Gerald    |  253 |   2324 |
| Christine |  173 |   6646 |
| Lisa      |  159 |     13 |
| Cat       |  133 |    672 |
| William   |  126 |   9361 |
| Fran      |  124 |   7606 |
| Lissa     |  120 |    150 |
+-----------+------+--------+"

"Answer:   I copy the data and find correlation in exel by using command correlation
So the data from both useful and funny shown 14% correlation to more fans that means
0% - 25% - Low relationship"

#Part 2: Inferences and Analysis

#1. Pick one city and category of your choice and group the businesses in that city or category 
#by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars 
#and answer the following questions. Include your code.

#i. Do the two groups you chose to analyze have a different distribution of hours?

SELECT 
  b.name,
  c.category,
  b.stars,
  h.hours
FROM (business AS b LEFT JOIN hours AS h
ON b.id = h.business_id) LEFT JOIN category AS c
ON b.id = c.business_id
WHERE b.city ='Las Vegas' AND stars IN (2,3) AND hours IS NOT NULL
GROUP BY category;

"+----------+----------------+-------+---------------------+
| name     | category       | stars | hours               |
+----------+----------------+-------+---------------------+
| Wingstop | American (New) |   3.0 | Saturday|11:00-0:00 |
| Wingstop | Chicken Wings  |   3.0 | Saturday|11:00-0:00 |
| Wingstop | Restaurants    |   3.0 | Saturday|11:00-0:00 |
+----------+----------------+-------+---------------------+"

SELECT 
  b.name,
  c.category,
  b.stars,
  h.hours
FROM (business AS b LEFT JOIN hours AS h
ON b.id = h.business_id) LEFT JOIN category AS c
ON b.id = c.business_id
WHERE b.city ='Las Vegas' AND stars IN (4,5) AND hours IS NOT NULL
GROUP BY category;
"+-----------------------------+---------------------------------+-------+----------------------+
| name                        | category                        | stars | hours                |
+-----------------------------+---------------------------------+-------+----------------------+
| Jacques Cafe                | American (New)                  |   4.0 | Saturday|11:00-20:00 |
| Vue at Centennial           | Apartments                      |   4.0 | Saturday|9:00-17:00  |
| Big Wong Restaurant         | Asian Fusion                    |   4.0 | Saturday|10:00-23:00 |
| Sweet Ruby Jane Confections | Bakeries                        |   4.0 | Saturday|10:00-19:00 |
| Jacques Cafe                | Breakfast & Brunch              |   4.0 | Saturday|11:00-20:00 |
| Big Wong Restaurant         | Chinese                         |   4.0 | Saturday|10:00-23:00 |
| Sweet Ruby Jane Confections | Chocolatiers & Shops            |   4.0 | Saturday|10:00-19:00 |
| Children's Dental Center    | Dentists                        |   4.0 | Monday|7:30-17:00    |
| Sweet Ruby Jane Confections | Desserts                        |   4.0 | Saturday|10:00-19:00 |
| Anthem Pediatrics           | Doctors                         |   4.0 | Saturday|8:00-12:00  |
| Sweet Ruby Jane Confections | Food                            |   4.0 | Saturday|10:00-19:00 |
| Jacques Cafe                | French                          |   4.0 | Saturday|11:00-20:00 |
| Jacques Cafe                | Gluten-Free                     |   4.0 | Saturday|11:00-20:00 |
| Desert Medical Equipment    | Health & Medical                |   5.0 | Monday|8:00-17:00    |
| Motors & More               | Heating & Air Conditioning/HVAC |   5.0 | Saturday|8:00-12:00  |
| Vue at Centennial           | Home Services                   |   4.0 | Saturday|9:00-17:00  |
| Big Wong Restaurant         | Malaysian                       |   4.0 | Saturday|10:00-23:00 |
| Desert Medical Equipment    | Medical Supplies                |   5.0 | Monday|8:00-17:00    |
| Big Wong Restaurant         | Noodles                         |   4.0 | Saturday|10:00-23:00 |
| Children's Dental Center    | Pediatric Dentists              |   4.0 | Monday|7:30-17:00    |
| Anthem Pediatrics           | Pediatricians                   |   4.0 | Saturday|8:00-12:00  |
| Vue at Centennial           | Real Estate                     |   4.0 | Saturday|9:00-17:00  |
| Big Wong Restaurant         | Restaurants                     |   4.0 | Saturday|10:00-23:00 |
| Jacques Cafe                | Sandwiches                      |   4.0 | Saturday|11:00-20:00 |
| Desert Medical Equipment    | Shopping                        |   5.0 | Monday|8:00-17:00    |
+-----------------------------+---------------------------------+-------+----------------------+
(Output limit exceeded, 25 of 30 total rows shown)

Answer: Yes they have different time distribution"

#ii. Do the two groups you chose to analyze have a different number of reviews?
SELECT 
  b.name,
  c.category,
  b.stars,
  b.review_count
FROM (business AS b LEFT JOIN hours AS h
ON b.id = h.business_id) LEFT JOIN category AS c
ON b.id = c.business_id
WHERE b.city ='Las Vegas' AND stars IN (2,3)
GROUP BY category;

"+-----------------------------+----------------+-------+--------------+
| name                        |       category | stars | review_count |
+-----------------------------+----------------+-------+--------------+
| AutoNation Toyota Las Vegas |           None |   3.0 |          355 |
| Wingstop                    | American (New) |   3.0 |          123 |
| Wingstop                    |  Chicken Wings |   3.0 |          123 |
| Wingstop                    |    Restaurants |   3.0 |          123 |
+-----------------------------+----------------+-------+--------------+"

SELECT 
  b.name,
  c.category,
  b.stars,
  b.review_count
FROM (business AS b LEFT JOIN hours AS h
ON b.id = h.business_id) LEFT JOIN category AS c
ON b.id = c.business_id
WHERE b.city ='Las Vegas' AND stars IN (4,5)
GROUP BY category;

"+------------------------------------------------+---------------------------------+-------+--------------+
| name                                           |                        category | stars | review_count |
+------------------------------------------------+---------------------------------+-------+--------------+
| Martin's Mart Thrift Store                     |                            None |   4.0 |            4 |
| Jacques Cafe                                   |                  American (New) |   4.0 |          168 |
| Vue at Centennial                              |                      Apartments |   4.0 |            6 |
| Big Wong Restaurant                            |                    Asian Fusion |   4.0 |          768 |
| Sweet Ruby Jane Confections                    |                        Bakeries |   4.0 |           30 |
| Trendsetters                                   |                   Beauty & Spas |   5.0 |            3 |
| Jacques Cafe                                   |              Breakfast & Brunch |   4.0 |          168 |
| Big Wong Restaurant                            |                         Chinese |   4.0 |          768 |
| Jon Petrick, DC - Las Vegas Pain Relief Center |                   Chiropractors |   5.0 |            5 |
| Sweet Ruby Jane Confections                    |            Chocolatiers & Shops |   4.0 |           30 |
| Children's Dental Center                       |                        Dentists |   4.0 |           11 |
| Sweet Ruby Jane Confections                    |                        Desserts |   4.0 |           30 |
| Jon Petrick, DC - Las Vegas Pain Relief Center |                         Doctors |   5.0 |            5 |
| Sweet Ruby Jane Confections                    |                            Food |   4.0 |           30 |
| Jacques Cafe                                   |                          French |   4.0 |          168 |
| Jacques Cafe                                   |                     Gluten-Free |   4.0 |          168 |
| Trendsetters                                   |                     Hair Salons |   5.0 |            3 |
| Jon Petrick, DC - Las Vegas Pain Relief Center |                Health & Medical |   5.0 |            5 |
| Motors & More                                  | Heating & Air Conditioning/HVAC |   5.0 |            7 |
| Vue at Centennial                              |                   Home Services |   4.0 |            6 |
| Big Wong Restaurant                            |                       Malaysian |   4.0 |          768 |
| Desert Medical Equipment                       |                Medical Supplies |   5.0 |            4 |
| Big Wong Restaurant                            |                         Noodles |   4.0 |          768 |
| Jon Petrick, DC - Las Vegas Pain Relief Center |                 Pain Management |   5.0 |            5 |
| Children's Dental Center                       |              Pediatric Dentists |   4.0 |           11 |
+------------------------------------------------+---------------------------------+-------+--------------+
(Output limit exceeded, 25 of 36 total rows shown)

Answer: Yes they have different number of review"

#iii. Are you able to infer anything from the location data provided between these two groups? Explain.
SELECT 
  b.stars,
  COUNT(b.stars)
FROM (business AS b LEFT JOIN hours AS h
ON b.id = h.business_id) LEFT JOIN category AS c
ON b.id = c.business_id
WHERE b.city ='Las Vegas' AND stars IN (2,2.5,3)
GROUP BY stars;

"+-------+----------------+
| stars | COUNT(b.stars) |
+-------+----------------+
|   2.0 |             74 |
|   2.5 |            173 |
|   3.0 |            224 |
+-------+----------------+"

SELECT 
  b.stars,
  COUNT(b.stars)
FROM (business AS b LEFT JOIN hours AS h
ON b.id = h.business_id) LEFT JOIN category AS c
ON b.id = c.business_id
WHERE b.city ='Las Vegas' AND stars IN (4,4.5,5)
GROUP BY stars;
"+-------+----------------+
| stars | COUNT(b.stars) |
+-------+----------------+
|   4.0 |            451 |
|   4.5 |            364 |
|   5.0 |            330 |
+-------+----------------+"

SELECT 
  c.category,
  COUNT(c.category)
FROM (business AS b LEFT JOIN hours AS h
ON b.id = h.business_id) LEFT JOIN category AS c
ON b.id = c.business_id
WHERE b.city ='Las Vegas' AND stars IN (2,2.5,3)
GROUP BY category
ORDER BY COUNT(c.category) DESC;

"+-------------------------------+-------------------+
| category                      | COUNT(c.category) |
+-------------------------------+-------------------+
| American (New)                |                 7 |
| Beauty & Spas                 |                 7 |
| Chicken Wings                 |                 7 |
| Convenience Stores            |                 7 |
| Cosmetics & Beauty Supply     |                 7 |
| Drugstores                    |                 7 |
| Food                          |                 7 |
| Photography Stores & Services |                 7 |
| Restaurants                   |                 7 |
| Shopping                      |                 7 |
| None                          |                 0 |
+-------------------------------+-------------------+"

SELECT 
  c.category,
  COUNT(c.category)
FROM (business AS b LEFT JOIN hours AS h
ON b.id = h.business_id) LEFT JOIN category AS c
ON b.id = c.business_id
WHERE b.city ='Las Vegas' AND stars IN (4,4.5,5)
GROUP BY category
ORDER BY COUNT(c.category) DESC;

"+------------------------------+-------------------+
| category                     | COUNT(c.category) |
+------------------------------+-------------------+
| Health & Medical             |                16 |
| Restaurants                  |                15 |
| Home Services                |                13 |
| Shopping                     |                12 |
| Active Life                  |                 7 |
| American (New)               |                 7 |
| Apartments                   |                 7 |
| Asian Fusion                 |                 7 |
| Breakfast & Brunch           |                 7 |
| Chinese                      |                 7 |
| Community Service/Non-Profit |                 7 |
| Doctors                      |                 7 |
| Education                    |                 7 |
| Flowers & Gifts              |                 7 |
| French                       |                 7 |
| Gift Shops                   |                 7 |
| Gluten-Free                  |                 7 |
| Hiking                       |                 7 |
| Hotels & Travel              |                 7 |
| Local Services               |                 7 |
| Malaysian                    |                 7 |
| Noodles                      |                 7 |
| Parks                        |                 7 |
| Professional Services        |                 7 |
| Real Estate                  |                 7 |
+------------------------------+-------------------+
(Output limit exceeded, 25 of 50 total rows shown)"

"Answer: In Las Vegas, there are more 4-5 stars business than 2-3 stars business. You will see for 2-3 stars businees in Las Vegas
there are only 10 categories and each catagory is 7 businesses. In case of 4-5 stars businesses, there are 50 categories and the
highest number of business is Health & Medical Care 16 businesses, the 2nd one is Restaurants 15 businesses and the 3rd one is Home
Services 13 businesses"

#2. Group business based on the ones that are open and the ones that are closed. 
#What differences can you find between the ones that are still open and the ones that are closed? 
#List at least two differences and the SQL code you used to arrive at your answer.
		
#i. Difference 1:
SELECT 
  b.is_open,
  t.likes,
  COUNT(t.likes) AS likes_number
FROM business AS b LEFT JOIN tip AS t
ON b.id = t.business_id
WHERE b.is_open = 1 AND t.likes IS NOT NULL
GROUP BY t.likes
ORDER BY COUNT(t.likes) DESC;

"+---------+-------+--------------+
| is_open | likes | likes_number |
+---------+-------+--------------+
|       1 |     0 |          572 |
|       1 |     1 |            7 |
|       1 |     2 |            1 |
+---------+-------+--------------+"

SELECT 
  b.is_open,
  t.likes,
  COUNT(t.likes) AS likes_number
FROM business AS b LEFT JOIN tip AS t
ON b.id = t.business_id
WHERE b.is_open = 0 AND t.likes IS NOT NULL
GROUP BY t.likes
ORDER BY COUNT(t.likes) DESC;

"+---------+-------+--------------+
| is_open | likes | likes_number |
+---------+-------+--------------+
|       0 |     0 |           96 |
|       0 |     1 |            1 |
+---------+-------+--------------+"

"Answer: There is no 2 likes on closed business"
         
         
#ii. Difference 2:
SELECT 
  state,
  is_open,
  COUNT(is_open) AS open
FROM business
WHERE is_open =1
GROUP BY state
ORDER BY open DESC;

SELECT 
  state,
  is_open,
  COUNT(is_open) AS open
FROM business
WHERE is_open =0
GROUP BY state
ORDER BY open DESC;


"If compare between close & open business in each state
only 7 states there is no closed business as per result below
| FIF   |       1 |    5 |
| C     |       1 |    3 |
| NY    |       1 |    3 |
| NYK   |       1 |    3 |
| ST    |       1 |    2 |
| WLN   |       1 |    2 |
| ESX   |       1 |    1 |"


#3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

#Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
#i. Indicate the type of analysis you chose to do: 
"Business's star rating"
         
         
#ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
 " I would like to know which state has high number of 5 star rating business and which category is top 5 numbers of business. 
 Therefore I need table business, and category to find the insight due to business table has stars rating & state, and 
 category table has category detail in each business"                                        

#iii. Output of your finished dataset:
"+-------+-----+
| state |   n |
+-------+-----+
| AZ    | 683 |
| NV    | 359 |
| ON    | 129 |
| NC    |  91 |
| OH    |  89 |
| PA    |  76 |
| WI    |  39 |
| QC    |  32 |
| EDH   |  21 |
| BW    |  19 |
| IL    |  17 |
| SC    |   8 |
| ST    |   2 |
+-------+-----+"
"Right now I know AZ is the highest number of 5 stars business after that I gonna find only this state
which business category is top 5 number of business"

"+------------------+---+
| category         | n |
+------------------+---+
| Automotive       | 3 |
| Health & Medical | 3 |
| Active Life      | 2 |
| Beauty & Spas    | 2 |
| Chiropractors    | 2 |
+------------------+---+"


         
         
#iv. Provide the SQL code you used to create your final dataset:
#Code to find which state is high number of 5 stars rating business
SELECT 
  state,
  COUNT(stars) as n
FROM business
WHERE stars =5
GROUP BY state
ORDER BY n DESC;

#Join the table to find top 5 category
SELECT 
  c.category,
  COUNT(c.category) AS n
FROM business AS b LEFT JOIN category AS c
ON b.id = c.business_id
WHERE b.stars =5 AND b.state ='AZ'
GROUP BY c.category
ORDER BY n DESC
LIMIT 5;