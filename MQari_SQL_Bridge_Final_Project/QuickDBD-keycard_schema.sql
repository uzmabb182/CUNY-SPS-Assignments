-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/a4u9hc
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

DROP DATABASE keycard_db;
CREATE DATABASE keycard_db;

DROP TABLE users;
CREATE TABLE users (
    user_id int  NOT NULL AUTO_INCREMENT ,
    user_name varchar(30)  NOT NULL ,
    PRIMARY KEY (
        user_id
    )
);

CREATE TABLE key_groups (
    group_id int  NOT NULL AUTO_INCREMENT,
    group_name varchar(30)  NULL ,
    PRIMARY KEY (
        group_id
    )
);

CREATE TABLE rooms (
    room_id int  NOT NULL AUTO_INCREMENT,
    room_name varchar(30)  NOT NULL ,
    PRIMARY KEY (
        room_id
    )
);

DROP TABLE group_assignment;
CREATE TABLE group_assignment (
    id int  NOT NULL AUTO_INCREMENT,
    group_id int  NOT NULL ,
    user_id int  NOT NULL ,
    assigned_group varchar(30)  NOT NULL ,
    PRIMARY KEY (
        id
    )
);

DROP TABLE room_assignment;
CREATE TABLE room_assignment (
    id int  NOT NULL AUTO_INCREMENT,
    room_id int  NOT NULL ,
    group_id int  NOT NULL ,
    assigned_room varchar(30)  NOT NULL ,
    PRIMARY KEY (
        id
    )
);

ALTER TABLE group_assignment ADD CONSTRAINT fk_group_assignment_group_id FOREIGN KEY(group_id)
REFERENCES key_groups (group_id);

ALTER TABLE group_assignment ADD CONSTRAINT fk_group_assignment_user_id FOREIGN KEY(user_id)
REFERENCES users (user_id);

ALTER TABLE room_assignment ADD CONSTRAINT fk_room_assignment_room_id FOREIGN KEY(room_id)
REFERENCES rooms (room_id);

ALTER TABLE room_assignment ADD CONSTRAINT fk_room_assignment_group_id FOREIGN KEY(group_id)
REFERENCES key_groups (group_id);

SELECT * 
FROM users;

INSERT INTO users(user_name)
VALUES ('Modesto'),
('Ayine'),
('Cheong Woo'),
('Heidy'),
('Saulet');

INSERT INTO users(user_name)
VALUES ('Christopher');

SELECT * 
FROM key_groups;

INSERT INTO key_groups(group_name)
VALUES ('I.T.'),
('Sales'),
('Administration'),
('Operation');

SELECT * 
FROM rooms;

INSERT INTO rooms(room_name)
VALUES ('Room 101'),
('Room 102'),
('Auditorium A'),
('Auditorium B');

SELECT * 
FROM room_assignment;


INSERT INTO room_assignment(room_id, group_id, assigned_room)
VALUES (1, 1, 'Room 101'),
(2, 1, 'Room 102'),
(2, 2, 'Room 102'),
(3, 2, 'Auditorium A'),
(3, 4, 'Auditorium A'),
(4, 4, 'Auditorium B');

SELECT * 
FROM group_assignment;


INSERT INTO group_assignment(group_id, user_id, assigned_group)
VALUES (1, 1, 'I.T.'),
(1, 2, 'I.T.'),
(2, 3, 'Sales'),
(2, 4, 'Sales'),
(3, 5, 'Administration');



-- write SELECT statements that provide the following information:
-- All groups, and the users in each group. A group should appear even if there are no users assigned to the group.
 SELECT k.group_name, u.user_name
 FROM key_groups k, users u, group_assignment ga
 WHERE k.group_id = ga.group_id
 AND u.user_id = ga.user_id;
 
 -- All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been
-- assigned to them.
 
SELECT g.group_name, r.room_name
FROM rooms r, key_groups g, room_assignment ra
WHERE r.room_id = ra.room_id
AND g.group_id = ra.group_id;
 
 -- A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted
-- alphabetically by user, then by group, then by room.
 SELECT u.user_name, g.group_name, r.room_name
 FROM users u, key_groups g, rooms r, room_assignment ra, group_assignment ga
 WHERE r.room_id = ra.room_id
 AND g.group_id = ga.group_id
 AND u.user_id = ga.user_id
 ORDER BY u.user_name, g.group_name, r.room_name;
 