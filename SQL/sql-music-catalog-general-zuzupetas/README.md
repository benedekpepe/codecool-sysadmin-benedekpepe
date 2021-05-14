# SQL Music Catalog

## Story

Chinook is a digital media store which has all sorts of tracks
and playlists from around the world for sale. You are a member of the Data
analysis team, and your task is to help the management to understand
what is going on in the company.

Here is the Entity-Relationship Diagram for the database.
![chinook-database-schema.png](media/sql/chinook-database-schema.png)

## What are you going to learn?

- How to answer complex business questions using advanced SQL commands
- How to join database tables (`JOIN`)
- How to use aliases (`AS`)
- How to group results to use aggregated functions (`GROUP BY`, `COUNT`)
- How to order rows (`ORDER BY`)
- How to filter aggregated results (`HAVING`)
- How to use some PostgreSQL specific aggregate functions (`ARRAY_AGG`, `STRING_AGG`)

## Tasks

1. Run the `chinook_data.sql` script to create the tables and seed it with data.
    - After executing the script the same database schema are created as you see in the `data/chinook-database-schema.png`

2. Write a query to create an `Account` table to store the account's `Username` and `Password`. Every record should have a unique ID.
    - After executing the script the `Account` table exists:
```
+----------------+-----------------------+-----------------------+
| AccountId(int) | Username(varchar(50)) | Password(varchar(20)) |
+----------------+-----------------------+-----------------------+
```
    - The SQL command(s) are saved in a file called `create-account-table.sql`

3. Write a query which adds a new column to the `Customer` table. This column should store the `AccountId` as an integer.
    - After executing the script the `Customer` table contains an `AccountId` column
    - The SQL command(s) are saved in a file called `add-column-to-customer.sql`

4. Write a query which adds a foreign key constraint between the `Account` and the `Customer` tables.
    - Customer's `AccountId` is a foreign key
    - Account's ID is the Account's primary key
    - There is a connection between `CustomerId` and `AccountId`
    - The SQL command(s) are saved in a file called `add-foreign-key-constraint.sql`

5. Write a query which adds a column to the `Track` table. The new column's name is `IsLarge` and its type is `BOOLEAN`
    - The `Track` table contains an `IsLarge` field
```
+------------------+
| IsLarge(BOOLEAN) |
+------------------+
```
    - The SQL command(s) are saved in a file called `add-islarge-column.sql`

6. Write a query to update every record's `IsLarge` field in the `Track` table.
    - `IsLarge` is `true` where `Bytes` is greater or equal than 10000000
    - `IsLarge` is `false` where `Bytes` is smaller than 10000000
    - The SQL command(s) are saved in a file called `update-track-islarge.sql`

7. Create a query to show each customer's full name and city. List customers and their location (city). Display the full name of the customers and the name of the city they live in.
    - Only customers from `Canada` are shown in the results
    - The result of your query starts with the following lines:
```
  FirstName | LastName |    City
------------+----------+-------------
  Mark      | Philips  | Edmonton
  Jennifer  | Peterson | Vancouver
  Robert    | Brown    | Toronto
  Edward    | Francis  | Ottawa
  Martha    | Silk     | Halifax
  Aaron     | Mitchell | Winnipeg
  Ellie     | Sullivan | Yellowknife
  (8 rows)
  ```
    - The result of your query contains 8 rows
    - The SQL command(s) are saved in a file called `query-costumer-by-country.sql`

8. Create a query to show each artists and albums. List artists and album titles. The header of result shoul be named as `Name` and `Title`.
    - The result of your query starts with the following lines:
```
 Name                        |                Title
-----------------------------+----------------------------------------
 AC/DC                       | For Those About To Rock We Salute You
 Accept                      | Balls to the Wall
 Accept                      | Restless and Wild
 AC/DC                       | Let There Be Rock
 Aerosmith                   | Big Ones
 Alanis Morissette           | Jagged Little Pill
 Alice In Chains             | Facelift
 Apocalyptica                | Plays Metallica By Four Cellos
 Audioslave                  | Audioslave
 ...
```
    - The result of your query contains 347 rows
    - The SQL command(s) are saved in a file called `query-album-artists.sql`

9. Create a query to show each reggea track's name and genre. List track names and genres. Only display tracks in the `Reggae` genre. The header of result should be named as `Name` and `Genre`
    - The result of your query starts with the following lines:
```
          Name                | Genre
------------------------------+--------
A Sombra Da Maldade           | Reggae
A Estrada                     | Reggae
Falar A Verdade               | Reggae
Firmamento                    | Reggae
Pensamento                    | Reggae
Realidade Virtual             | Reggae
Doutor                        | Reggae
Na Frente Da TV               | Reggae
Downtown                      | Reggae
A Cor Do Sol                  | Reggae
Johnny B. Goode               | Reggae
...
```
    - The result of your query contains 58 rows
    - The SQL command(s) are saved in a file called `query-tracks-by-genre.sql`

## General requirements

None

## Hints

- You can find the SQL file with the sample data in the data folder.
  To use it, create a new database for this project and use `psql` to
  execute the SQL commands in that file:
    - Start `psql` in a terminal at the `data` folder of the project
    - Connect to your already created new database eg. `\connect chinook`
    - Execute the commands in the sql file `\i chinook_data.sql`


## Background materials

- <i class="far fa-exclamation"></i> [Working with more complex data](project/curriculum/materials/pages/sql/sql-working-with-data)
- <i class="far fa-book-open"></i> [Database glossary](project/curriculum/materials/pages/sql/database-glossary)
- <i class="far fa-book-open"></i> [Short guide about psql](http://postgresguide.com/utilities/psql.html)
- <i class="far fa-book-open"></i> [PostgreSQL documentation page about psql](https://www.postgresql.org/docs/current/app-psql.html)
- <i class="far fa-exclamation"></i> [Chinook database](https://github.com/lerocha/chinook-database)
