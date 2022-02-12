-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/a4u9hc
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
DROP TABLE "consumer";
CREATE TABLE "consumer" (
    "consumer_id" INT NOT NULL,
    "consumer_name" VARCHAR   NOT NULL,
    "email" VARCHAR   NOT NULL,
    "updated" DATE   NOT NULL,
    CONSTRAINT "pk_consumer" PRIMARY KEY (
        "consumer_id"
     )
);

DROP TABLE "movie";
CREATE TABLE "movie" (
    "movie_id" INT NOT NULL,
    "movie_name" VARCHAR   NOT NULL,
    "release_year" INT   NOT NULL,
    "movie_class" VARCHAR   NOT NULL,
    "updated" DATE   NOT NULL,
    CONSTRAINT "pk_movie" PRIMARY KEY (
        "movie_id"
     )
);

DROP TABLE "rating";
CREATE TABLE "rating" (
    "movie_id" INT   NOT NULL,
    "consumer_id" INT   NOT NULL,
    "rating" INT,
    CONSTRAINT "pk_rating" PRIMARY KEY (
        "movie_id","consumer_id"
     )
);

DROP TABLE "site";
CREATE TABLE "site" (
    "site_id" INT NOT NULL,
    "site_name" VARCHAR   NOT NULL,
    "site_option" VARCHAR   NOT NULL,
    CONSTRAINT "pk_site" PRIMARY KEY (
        "site_id"
     )
);

DROP TABLE "site_movie";
CREATE TABLE "site_movie" (
    "movie_id" INT   NOT NULL,
    "site_id" INT   NOT NULL,
    "consumer_id" INT   NOT NULL,
    "number_of_views" INT,
    CONSTRAINT "pk_site_movie" PRIMARY KEY (
        "movie_id","site_id","consumer_id"
     )
);

ALTER TABLE "rating" ADD CONSTRAINT "fk_rating_movie_id" FOREIGN KEY("movie_id")
REFERENCES "movie" ("movie_id");

ALTER TABLE "rating" ADD CONSTRAINT "fk_rating_consumer_id" FOREIGN KEY("consumer_id")
REFERENCES "consumer" ("consumer_id");

ALTER TABLE "site_movie" ADD CONSTRAINT "fk_site_movie_movie_id" FOREIGN KEY("movie_id")
REFERENCES "movie" ("movie_id");

ALTER TABLE "site_movie" ADD CONSTRAINT "fk_site_movie_site_id" FOREIGN KEY("site_id")
REFERENCES "site" ("site_id");

ALTER TABLE "site_movie" ADD CONSTRAINT "fk_site_movie_consumer_id" FOREIGN KEY("consumer_id")
REFERENCES "consumer" ("consumer_id");

SELECT *
FROM movie;

SELECT *
FROM consumer;

INSERT INTO consumer
VALUES (11, 'Sarah Ryan', 'Sarah.Ryan@gmail.com', '2022-02-14');

INSERT INTO consumer
VALUES (12, 'Ryan Zack', 'Ryan.Zack@gmail.com', '2022-02-24');

SELECT *
FROM rating;

INSERT INTO rating
VALUES (4, 6, -1);

INSERT INTO rating
VALUES (8, 11, -1);

INSERT INTO rating
VALUES (1, 10, -1);

INSERT INTO rating
VALUES (2, 5, 9);

INSERT INTO rating
VALUES (3, 4, 6);

SELECT *
FROM site;

SELECT *
FROM site_movie;

INSERT INTO site_movie
VALUES (3, 4, 6, -1);

INSERT INTO site_movie
VALUES (6, 2, 6, -1);

INSERT INTO site_movie
VALUES (6, 4, 8, -1);

