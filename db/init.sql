CREATE TABLE IF NOT EXISTS user (
    id integer PRIMARY KEY,
    username text NOT NULL UNIQUE,
    password text NOT NULL
);

CREATE TABLE IF NOT EXISTS hero (
    id integer,
    name text NOT NULL,
    year integer,
    info text NOT NULL,
    user_id integer NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id)
    PRIMARY KEY (id, user_id)
);


-- TEST DATA - just to visualize the schema!
-- Comment it out once you've got an idea. Use the application to add data

-- user passwords are not stored in plaintext! Just for demonstration.
INSERT INTO user (username, password) VALUES ("manman", "manman");
INSERT INTO user (username, password) VALUES ("frogboy", "frogboy");

INSERT INTO hero (id, name, year, info, user_id)
    VALUES ((SELECT IFNULL(max(id), 0) + 1 FROM hero WHERE user_id = 1), "Aquaman", 2000, "king of atlantis", 1);
INSERT INTO hero (id, name, year, info, user_id)
    VALUES ((SELECT IFNULL(max(id), 0) + 1 FROM hero WHERE user_id = 1), "Flash", 2000, "Speedster", 1);
INSERT INTO hero (id, name, year, info, user_id)
    VALUES ((SELECT IFNULL(max(id), 0) + 1 FROM hero WHERE user_id = 1), "Wonder Woman", 2000, "Queen", 1);

INSERT INTO hero (id, name, year, info, user_id)
    VALUES ((SELECT IFNULL(max(id), 0) + 1 FROM hero WHERE user_id = 2), "Green Arrow", 1999, "arrow", 2);
INSERT INTO hero (id, name, year, info, user_id)
    VALUES ((SELECT IFNULL(max(id), 0) + 1 FROM hero WHERE user_id = 2), "Green Lanturn", 1999, "arrow", 2);
