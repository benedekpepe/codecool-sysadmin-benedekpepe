# Classic Cloud Models

## Story

Classic Models Inc. is a company which buys collectable model cars, trains, trucks, buses, trains and ships directly from manufacturers and sells them to distributors across the globe. You've been given access to their cloud database instance and tasked to create reports ASAP! Santa's made a _HUGE_ order for next Christmas, no time to waste!

## What are you going to learn?

- How to create an RDS instance
- How to use parameter groups to modify the behavior of managed DB servers
- The basics of monitoring a service in CloudWath
- Practicing SQL queries

## Tasks

1. Mentors setup a MySQL 5.7.x database server in the cloud and give access to students to connect to it and create queries.
    - Started a MySQL 5.7.x database instance in the cloud
    - Imported the database defined in `ClassicModels.sql`
    - Created credentials for students and shared it with them
    - Shared the host's public domain name and/or IP address where students can connect to the instance

2. Find the account representative for each customer.
    - `reps.sql` exists and contains the solution
    - Running the query in `reps.sql` returns the following:

```
+------------------------------------+------------------------+
| Customer                           | Account Repersentative |
+------------------------------------+------------------------+
| Alpha Cognac                       | Gerard Hernandez       |
| American Souvenirs Inc             | Foon Yue Tseng         |
| Amica Models & Co.                 | Pamela Castillo        |
| Anna's Decorations, Ltd            | Andy Fixter            |
...
omitted rows
...
| Volvo Model Replicas, Co           | Barry Jones            |
| West Coast Collectables Co.        | Leslie Thompson        |
+------------------------------------+------------------------+
100 rows in set ...
```
    - Results are listed alphabetically by customer names, then account representative names

3. Find account representatives who have customers without any orders/purchases.
    - `clients.sql` exists and contains the solution
    - Running the query in `clients.sql` returns the following:

```
+------------------------+--------------+------------------------+
| Account Repersentative | Customer No. | Customer               |
+------------------------+--------------+------------------------+
| Foon Yue Tseng         |          168 | American Souvenirs Inc |
| Martin Gerard          |          376 | Precious Collectables  |
+------------------------+--------------+------------------------+
2 rows in set ...
```
    - Results are listed alphabetically by account customer name

4. Find customers having more than 4 _Shipped_ orders.
    - `shipped.sql` exists and contains the solution
    - Running the query in `shipped.sql` returns the following:

```
+------------------------------+----------------+
| Customer                     | Shipped Orders |
+------------------------------+----------------+
| Australian Collectors, Co.   |              5 |
| Down Under Souveniers, Inc   |              5 |
| Dragon Souveniers, Ltd.      |              5 |
| Euro+ Shopping Channel       |             22 |
| Mini Gifts Distributors Ltd. |             16 |
| Reims Collectables           |              5 |
+------------------------------+----------------+
6 rows in set ...
```
    - Results are listed alphabetically by customer names

5. List products and how many times they were sold by order date (only display the date of the first sale).
    - `purchases.sql` exists and contains the solution
    - Running the query in `purchases.sql` returns the following:

```
+---------------------------------------------+---------------------+---------------------+
| Product Name                                | Date of First Sale  | Number of Purchases |
+---------------------------------------------+---------------------+---------------------+
| 1911 Ford Town Car                          | 2003-01-06          |                  25 |
| 1917 Grand Touring Sedan                    | 2003-01-06          |                  25 |
| 1932 Alfa Romeo 8C2300 Spider Sport         | 2003-01-06          |                  25 |
| 1936 Mercedes Benz 500k Roadster            | 2003-01-06          |                  25 |
| 1928 Mercedes-Benz SSK                      | 2003-01-09          |                  28 |
...
omitted rows
...
| 1970 Chevy Chevelle SS 454                  | 2003-03-18          |                  25 |
| 2002 Chevy Corvette                         | 2003-03-18          |                  25 |
+---------------------------------------------+---------------------+---------------------+
109 rows in set ...
```
    - Results are listed by the date of the first sale, the purchased product's name and how many times it was purchased

6. List the names of the first 10 customers and their corresponding order number where a particular order from that customer has a value greater than $25,000.
    - `value.sql` exists and contains the solution
    - Running the query in `value.sql` returns the following:

```
+------------------------------+-----------+---------+
| Customer                     | Order No. | Total   |
+------------------------------+-----------+---------+
| Dragon Souveniers, Ltd.      | 10165     | $67,393 |
| Vida Sport, Ltd              | 10287     | $61,402 |
| Toms Spezialit               | 10310     | $61,235 |
| Euro+ Shopping Channel       | 10212     | $59,831 |
| Diecast Collectables         | 10207     | $59,265 |
| Muscle Machine Inc           | 10127     | $58,841 |
| Muscle Machine Inc           | 10204     | $58,794 |
| Corrida Auto Replicas, Ltd   | 10126     | $57,132 |
| Collectable Mini Designs Co. | 10222     | $56,823 |
| Mini Gifts Distributors Ltd. | 10142     | $56,053 |
+------------------------------+-----------+---------+
10 rows in set ...
```
    - Results are listed by the total value of orders and the name of the customer who placed it

7. Calculate the difference in the amount of money received for each month of 2004 compared to 2003.
    - `diff.sql` exists and contains the solution
    - Running the query in `value.sql` returns the following:

```
+-----------+--------------+
| Month     | Difference   |
+-----------+--------------+
| January   | $207,884.51  |
| February  | $-37,732.35  |
| March     | $204,898.73  |
| April     | $36,932.04   |
| May       | $48,642.45   |
| June      | $5,623.88    |
| July      | $125,944.48  |
| August    | $131,889.44  |
| September | $315,239.30  |
| October   | $-131,754.53 |
| November  | $162,894.62  |
| December  | $-7,352.02   |
+-----------+--------------+
12 rows in set ...
```
    - Results are listed by month

## General requirements

None

## Hints

- **Make sure to check out the _Classic Models schema_ and _description_ background materials**
- You can connect ot the RDS instance from a local VM or from an EC2 instance, it's up to you
- You can install the 5.7 version of the MySQL client (without installing a DB) using `sudo apt-get install mysql-client-5.7`
- ` mysql -h <host> -u <user> -p<password>` (**watch out**, there should be no space between the `-p` and the actual password)

## Background materials

- [Classic Models schema](https://www.richardtwatson.com/dm6e/images/general/ClassicModels.png)
- [Classic Models description](https://www.richardtwatson.com/dm6e/Reader/ClassicModels.html)
- [MySQL `CONCAT`](https://www.w3schools.com/sql/func_mysql_concat.asp)
- [MySQL `FORMAT`](https://www.mysqltutorial.org/mysql-format-function/)
- [MySQL `EXTRACT`](https://www.w3schools.com/sql/func_mysql_extract.asp)
- [Compare by year and month](https://stackoverflow.com/a/17541196/433835)
- [RDS parameter groups](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithParamGroups.html)
- [MySQL database logs in RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.Concepts.MySQL.html)
