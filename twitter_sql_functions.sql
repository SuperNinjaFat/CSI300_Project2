#Allow users to post short messages (the length limit is up to you)
INSERT INTO `mydb`.`tweets`
(`Tweet_PrimaryKey`,`Content`,`Date`,`Users_idUsers`)
VALUES
(01,"Hello World! This is our first post!",NOW(),1);
INSERT INTO `mydb`.`tweets`
(`Tweet_PrimaryKey`,`Content`,`Date`,`Users_idUsers`)
VALUES
(02,"Ayyyyyyyy another post!",NOW(),1);
INSERT INTO `mydb`.`tweets`
(`Tweet_PrimaryKey`,`Content`,`Date`,`Users_idUsers`)
VALUES
(03,"ffkjhalkfj Oops better delete this tweet!",NOW(),1);


/*
# Return tweet and possible retweet data for a specific tweet
SELECT
    t.Tweet_PrimaryKey, t.Users_idUsers, t.Content, t.`Date`
FROM
    tweets AS t
LEFT OUTER JOIN retweet AS rt ON rt.Tweets_Tweet_PrimaryKey = t.Tweet_PrimaryKey
WHERE
    t.Tweet_PrimaryKey = 01;
*/


#Follow/unfollow other users
# Super Ninja Fat follows TheAllMightyRa
INSERT INTO `mydb`.`following`
(`Users_idUsers_followed`,
`Users_idUsers_follower`)
VALUES
(2,
1);


#see a user’s timeline (in chronological order - the timeline is the combination of tweets/retweets of all users that one follows)
# Super Ninja Fat's timeline (He follows TheAllMightyRa)
select * from (
    select u.Username, t.Content, t.`Date` from tweets as t
INNER JOIN
    users u
ON t.Users_idUsers = u.idUsers
where Users_idUsers = 1
    union
    select u.Username, t.Content, rt.`Date` from tweets as t
INNER JOIN
    users u
ON t.Users_idUsers = u.idUsers
    inner join retweet as rt on rt.Tweets_Tweet_PrimaryKey = t.Tweet_PrimaryKey where rt.Users_idUsers = 1)
a order by `Date` desc;
# Same code but focusing on TheAllMightyRa (He follows Super Ninja Fat)


#Retweet
# Super Ninja Fat retweets his own first tweet
INSERT INTO `mydb`.`retweet`
(`Users_idUsers`,`Tweets_Tweet_PrimaryKey`,`Date`)
VALUES
(1,01,NOW());
# TheAllMightyRa retweets Super Ninja Fat's first tweet
INSERT INTO `mydb`.`retweet`
(`Users_idUsers`,`Tweets_Tweet_PrimaryKey`,`Date`)
VALUES
(2,01,NOW());
# Super Ninja Fat retweets his own second tweet
INSERT INTO `mydb`.`retweet`
(`Users_idUsers`,`Tweets_Tweet_PrimaryKey`,`Date`)
VALUES
(1,02,NOW());

#Delete a tweet
# Delete Super Ninja Fat's third tweet
DELETE FROM tweets
WHERE Tweet_PrimaryKey = 3;

#Favorite/unfavorite tweets
INSERT INTO `mydb`.`favorites`
(`idFavorites`,
`Users_idUsers`,
`Tweets_Tweet_PrimaryKey`)
VALUES
(01,
1,
02);
INSERT INTO `mydb`.`favorites`
(`idFavorites`,
`Users_idUsers`,
`Tweets_Tweet_PrimaryKey`)
VALUES
(02,
1,
01);
INSERT INTO `mydb`.`favorites`
(`idFavorites`,
`Users_idUsers`,
`Tweets_Tweet_PrimaryKey`)
VALUES
(04,
2,
01);

#See a user’s favorited tweets
/*SELECT u.Username, t.Content, t.`Date` from tweets as t
INNER JOIN
    users u
ON t.Users_idUsers = u.idUsers where t.Users_idUsers = 1;*/
# View TheAllMightyRa's Favorites:
Select u.Username, t.Content, t.`Date` from tweets as t
INNER JOIN
    users u
ON t.Users_idUsers = u.idUsers
      join favorites f on t.Tweet_PrimaryKey = f.Tweets_Tweet_PrimaryKey
where f.Users_idUsers = 2;

#See a list of whom a user is following
# Who is Super Ninja Fat following?
Select u.Username from users u
JOIN
	following fo
ON fo.Users_idUsers_followed = u.idUsers
WHERE fo.Users_idUsers_follower = 1;

#See a list of a user’s followers
# Who is following Super Ninja Fat?
Select u.Username from users u
JOIN
	following fo
ON fo.Users_idUsers_followed = u.idUsers
WHERE fo.Users_idUsers_followed = 1;

#View how many times a tweet has been favorited
# Super Ninja Fat's first post has been favorited 2 times, as you can see.
SELECT
    t.Tweet_PrimaryKey,
    count(*), t.Content, t.`Date`
FROM
    tweets AS t
INNER JOIN favorites AS fa ON fa.Tweets_Tweet_PrimaryKey = t.Tweet_PrimaryKey
GROUP BY
    t.Tweet_PrimaryKey;

#View how many times a tweet has been retweeted
# Return all tweets which have been retweeted
SELECT
    t.Tweet_PrimaryKey,
    count(*), t.Content, t.`Date`
FROM
    tweets AS t
INNER JOIN retweet AS rt ON rt.Tweets_Tweet_PrimaryKey = t.Tweet_PrimaryKey
GROUP BY
    t.Tweet_PrimaryKey;

#View how many followers a user has
# TheAllMightyRa is only followed by Super Ninja Fat
SELECT
    u.Username,
    count(*)
FROM
    users AS u
INNER JOIN following AS fo ON fo.Users_idUsers_followed = u.idUsers
GROUP BY
    u.Username;

#View how many users one is following.
# Super Ninja Fat is following only TheAllMightyRa
SELECT
    u.Username,
    count(*)
FROM
    users AS u
INNER JOIN following AS fo ON fo.Users_idUsers_follower = u.idUsers
GROUP BY
    u.Username;

