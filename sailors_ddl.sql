
DROP DATABASE IF EXISTS sailors_036;

CREATE DATABASE IF NOT EXISTS sailors_036;
USE sailors_036;

CREATE TABLE IF NOT EXISTS sailors (
sid VARCHAR(10) NOT NULL,
sname TEXT NOT NULL,
rating INTEGER NOT NULL,
age INTEGER,
PRIMARY KEY (sid)
);

CREATE TABLE IF NOT EXISTS boat (
bid VARCHAR(10) NOT NULL,
bname TEXT NOT NULL,
color TEXT,
PRIMARY KEY (bid)
);

CREATE TABLE IF NOT EXISTS reserves (
sid VARCHAR(10) NOT NULL,
bid VARCHAR(10) NOT NULL,
s_date DATE,
FOREIGN KEY (sid) REFERENCES sailors(sid) ON DELETE CASCADE,
FOREIGN KEY (bid) REFERENCES boat(bid) ON DELETE CASCADE
);

INSERT INTO sailors VALUES
("S111", "Sailor_1", 4, 23),
("S222", "Sailor_2", 2, 20),
("S333", "Sailor_3", 5, 26),
("S444", "Sailor_4", 4, 30),
("S555", "Sailor_5", 5, 25);

INSERT INTO boat VALUES
("B111", "Billy", "Black"),
("B222", "Pilly", "Red"),
("B333", "Trilly", "Green"),
("B444", "Willy", "White"),
("B555", "Lilly", "Blue");

INSERT INTO reserves VALUES
("S111", "B444", "2020-04-05"),
("S222", "B222", "2019-12-16"),
("S333", "B111", "2020-05-14");

ALTER TABLE sailors MODIFY age INTEGER NOT NULL;
ALTER TABLE sailors MODIFY rating INTEGER;
ALTER TABLE reserves MODIFY s_date DATE NOT NULL;

SELECT * FROM sailors;
SELECT * FROM boat;
SELECT * FROM reserves;

INSERT INTO sailors VALUES 
("S666", "Sailor_6", 2, 19);

INSERT INTO boat VALUES
("B666", "Hilly", "Yellow");

INSERT INTO reserves VALUES
("S666", "B666", "2021-12-21");

UPDATE sailors SET rating = 4 WHERE sid = "S666";

DELETE FROM sailors WHERE sid = "S222";
DELETE FROM boat WHERE bid = "B222";
DELETE FROM reserves WHERE sid = "S222";

SELECT * FROM sailors;
SELECT * FROM boat;
SELECT * FROM reserves;
