-- Create two tables, one to store the users and one for the todos
CREATE TABLE names (
id int,
name varchar(50)
);

CREATE TABLE todo (
id int,
task varchar(100),
user_id int
);

