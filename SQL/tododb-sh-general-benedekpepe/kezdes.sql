DROP TABLE "user";
DROP TABLE "todo";

CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    "name" varchar(50) UNIQUE
);

CREATE TABLE todo (
    id SERIAL,
    task varchar(100),
    user_id int,
    done boolean DEFAULT 'false'
);

ALTER TABLE todo
    ADD CONSTRAINT fk_user_todo FOREIGN KEY(user_id) REFERENCES "user"(id);