-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/a4u9hc
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

DROP DATABASE keycard_db;
CREATE DATABASE keycard_db;

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

CREATE TABLE group_assignment (
    id int  NOT NULL AUTO_INCREMENT,
    group_id int  NOT NULL ,
    user_id int  NOT NULL ,
    assigned_group varchar(30)  NOT NULL ,
    PRIMARY KEY (
        id
    )
);

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

ALTER TABLE `group_assignment` ADD CONSTRAINT `fk_group_assignment_user_id` FOREIGN KEY(`user_id`)
REFERENCES `users` (`user_id`);

ALTER TABLE `room_assignment` ADD CONSTRAINT `fk_room_assignment_room_id` FOREIGN KEY(`room_id`)
REFERENCES `rooms` (`room_id`);

ALTER TABLE `room_assignment` ADD CONSTRAINT `fk_room_assignment_group_id` FOREIGN KEY(`group_id`)
REFERENCES `key_groups` (`group_id`);

