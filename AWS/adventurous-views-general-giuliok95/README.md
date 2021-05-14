# Adventurous Views

## Story

Your team is participating in the annual _SQL Query Marathon_ where teams post report/query ideas for other teams to solve. Will your team be the best?

## What are you going to learn?

- How to create complex SQL queries
- What is and how to use the `VIEW` statement
- Handle users, groups and roles in PostgreSQL
- Use CloudWatch to monitor database activity

## Tasks

1. Mentors create a shared spreadsheet for teams to post their problems/query ideas for other teams to solve.
    - Mentors shared the spreadsheet's link with all teams
    - Teams posted their problems for other teams to solve (**at the least as many problems as many team members**)
    - **Teams only posted problems they are able solve**

2. Create a free tier PostgreSQL RDS instance for the team.
    - PostgreSQL 11.x is used as the database engine
    - The instance is started using the _free tier_ template (`db.t2.micro` DB class)
    - The instance's name is the team number without dots or special characters with a `-pg` suffix (e.g. if you're in team 15 it'll be `team15-pg`)
    - The master username is `postgres` and a password is given (don't forget it)
    - The instance is provisioned with 5 GiB of magnetic storage
    - The instance is **not** available publicly (e.g. has no IPv4 address), only within the default VPC and all of its subnets
    - The instance is created in the default VPC and assigned to one of the default subnets
    - A new security group is created for the instance named after the team number without dots or special characters with a `-pg` suffix
    - Automatic backups are disabled
    - Performance insights are disabled
    - PostgreSQL logs are enabled/published to CloudWatch
    - Automatic minor version upgrade maintenance is disabled
    - No maintenance window is selected

3. Import the AdventureWorks database into the team's RDS instance, create access for the other teams.
    - An empty `adventureworks` works database is created
    - Imported the AdventureWorks database using the `AdventureWorks.sql` script (make sure to _untar_ the `data.tar.gz` archive before doing so)
    - Created a user with permission to execute `SELECT` queries and to create `VIEW` objects for other teams (named like `team1`, `team2`, etc. the password should be the same as the username)

4. Teams create a `VIEW` for each problem they can solve in another team's database.
    - Created a schema called `solutions` where other teams can put _their_ solutions
    - A `VIEW` is created for each problem solved by your team in the `solutions` schema (in other teams' databases)
    - `VIEW`s are named according to the following rule: if you're in _Team 13_ and you solve _Problem 82_ posted by _Team 666_ you should create a `VIEW` called `team13problem82` in Team 666's database)

5. Monitor what the other teams are doing on your server, maybe you can find useful ideas in your logs! :)
    - A new parameter group is created for the RDS instance named after the team number without dots or special characters with a `-pg` suffix
    - Configured the `log_statement` parameter in order to log every query executed on the server
    - CloudWatch is monitored for "useful" information :)

## General requirements

None

## Hints

- The AdventureWorks database is split up into multiple _schemas_, run `\dn` the list available schemas in the database and use `\dt humanresources.*` to list tables in a specific schema (**note, that the default `public` schema will be empty**)
- When referring to objects in a schema (other than the `public` one) always specify the schema name, e.g. `CREATE VIEW solutions.team123problem456 AS ...`, or `SELECT * FROM person.person LIMIT 10`
- Make sure to check out the [_AdventureWorks diagram_](media/admin/AdventureWorks.jpg) (please note that the diagram is for the 2008 version, while the dataset is for version 2014, so there may be slight differences)
- You can use the `CREATE GROUP` and `CREATE USER` commands along with `GRANT` to allow other teams to access your DB
- To grant a _role_ access to a particular schema use `GRANT USAGE ON SCHEMA <schema> TO <role>;`
- To grant a _role_ querying rights on all tables in a schema use: `GRANT SELECT ON ALL TABLES IN SCHEMA <schema> TO <role>;`
- To grant a _role_ to be able to create `VIEW` objects in a schema use: `GRANT CREATE ON SCHEMA <schema> TO <role>;` (**note that this grants right to create other type of objects as well**)
- To drop users/groups use:

  ```sql
  REVOKE ALL ON SCHEMA <schema> FROM <role>;
  REVOKE ALL ON ALL TABLES IN SCHEMA <schema> FROM <role>;
  DROP ROLE <role>;
  ```

- After you configure `log_statement` you might need to restart the RDS instance in order for it to pick up the config change
- Disclaimer: it's not a good idea to monitor _every_ query executed on an database server in a production situation, because this can be a resource intensive operation and it can reveal sensitive information (e.g. passwords, addresses, phone numbers, etc.)

## Background materials

- [AdventureWorks diagram](media/admin/AdventureWorks.jpg)
- [AdventureWorks 2014 PostgreSQL](https://github.com/NorfolkDataSci/adventure-works-postgres)
- [PostgreSQL `log_statement`](https://postgresqlco.nf/doc/en/param/log_statement/11/)
- [CloudWatch Log Groups](https://console.aws.amazon.com/cloudwatch/home#logsV2:log-groups)
- [CloudWatch Filter Patterns](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html#matching-terms-events)
