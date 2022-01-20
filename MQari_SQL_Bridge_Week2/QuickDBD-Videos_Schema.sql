-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/a4u9hc
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE DATABASE movies_db;
DROP DATABASE movies_db;


DROP TABLE videos;
CREATE TABLE videos (
    video_id INT  NOT NULL AUTO_INCREMENT,
    title VARCHAR(30) NOT NULL,
    length_in_minutes INT  NOT NULL ,
    PRIMARY KEY (
        video_id
    )
);

DROP TABLE ratings;
CREATE TABLE ratings (
    id INT  NOT NULL AUTO_INCREMENT,
    video_id INT  NOT NULL ,
    user_name VARCHAR(30)  NOT NULL ,
    review VARCHAR(30)  NOT NULL ,
    rating VARCHAR(30)  NOT NULL ,
    PRIMARY KEY (
        id
    )
);

SELECT * 
FROM videos;

INSERT INTO videos(title, length_in_minutes)
VALUES ('Lion King', 120),
('Pocahantas', 160),
('Madagascar', 120);

SELECT * 
FROM videos;

INSERT INTO ratings(video_id, user_name, rating, review)
VALUES (1, 'LeeQ', 5, 'Excellent'),
(2, 'AshP', 5, 'Excellent'),
(1, 'UzmaQ', 4, 'Very Good'),
(3, 'SarahA', 5, 'Excellent'),
(1, 'LeeQ', 5, 'Excellent');

SELECT v.title, v.length_in_minutes, r.video_id, r.user_name, r.rating, r.review
FROM videos v
INNER JOIN ratings r
WHERE v.video_id = r.video_id
GROUP BY v.title
ORDER BY v.title;

