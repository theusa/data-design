ALTER DATABASE ualnaji CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS itemResult;
DROP TABLE IF EXISTS profile;


CREATE TABLE profile (
                         profileId BINARY (16) NOT NULL,
                         profileActivationToken CHAR(32),
                         profileEmail VARCHAR(128) NOT NULL,
                         profileHash CHAR(97) NOT NULL,
                         UNIQUE (profileEmail),
                         UNIQUE (profileId),
                         PRIMARY KEY (profileId)
);
CREATE TABLE itemResult (
                            itemId BINARY (16) NOT NULL,
                            itemProfileId BINARY (16) NOT NULL,
                            itemDate DATETIME (6) NOT NULL,
                            itemPrice DECIMAL (20) NOT NULL,
                            itemTitle VARCHAR (80) NOT NULL,
                            INDEX (itemProfileId),
                            FOREIGN KEY (itemProfileId) REFERENCES profile(profileId),
                            PRIMARY KEY (itemId)
);
CREATE TABLE review (
                        reviewProfileId BINARY (16) NOT NULL,
                        reviewAggregate DECIMAL (5) NOT NULL,
                        reviewCount INTEGER (200) NOT NULL,
                        reviewStars INTEGER (5) NOT NULL,
                        INDEX (reviewProfileId),
                        FOREIGN KEY (reviewProfileId) REFERENCES itemResult(itemId),
                        PRIMARY KEY (reviewProfileId)
);

INSERT INTO profile (profileId, profileActivationToken, profileEmail, profileHash)
VALUES (UNHEX('63fbabe959f1411caa1cc444dbaf71c5'),1,'hello@hello.com',1);

INSERT INTO itemResult (itemId, itemProfileId, itemDate, itemPrice, itemTitle)
VALUES (UNHEX('90da43f681544891bb36f29386790895'), UNHEX('63fbabe959f1411caa1cc444dbaf71c5'), 01-03-08, 3.5,'book');

INSERT INTO review (reviewProfileId, reviewAggregate, reviewCount, reviewStars)
VALUES (UNHEX('63fbabe959f1411caa1cc444dbaf71c5'), 4,130,3.4);

UPDATE itemResult SET itemTitle = 'toy', itemId = 4, itemPrice = 10.1, itemDate = 60, itemProfileId = UNHEX('5cb0d1f630ba4d69be29a9a432421a36') WHERE itemId = UNHEX('90da43f681544891bb36f29386790895');

DELETE FROM profile WHERE profileId = UNHEX ('63fbabe959f1411caa1cc444dbaf71c5');

SELECT itemId FROM itemResult;

SELECT profile.profileId, itemResult.itemId, itemResult.itemProfileId, itemResult.itemPrice
    FROM profile
    JOIN itemResult
    ON   profile.profileId =   itemResult.itemProfileId
    WHERE profile.profileId = true;

/*SELECT tweet.tweetId, SUM(likeProfileId)*/
/*    FROM tweet*/
/*    JOIN like*/
/*    ON  tweet.tweetId = likeTweetId*/
/*    WHERE tweet.tweetId = true;*/
/**/                                          

/*SELECT students.first_name, students.last_name, students.email, student_grades.test, student_grades.grade FROM students*/
/*    JOIN student_grades*/
/*    ON students.id = student_grades.student_id*/
/*    WHERE grade > 90;*/
/**/
/*SELECT tableA.column1, tableA.column2, tableA.column3, tableB.column3 FROM tableA INNER JOIN tableB on tableA.primaryKeyA = tableB.foreignKeyA WHERE tableA.column = true*/