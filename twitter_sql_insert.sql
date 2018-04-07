
# Creating users
INSERT INTO `mydb`.`users`
(`idUsers`, `Username`)
VALUES
(1, 'Super Ninja Fat');
INSERT INTO `mydb`.`users`
(`idUsers`, `Username`)
VALUES
(2, 'TheAllMightyRa');

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
INSERT INTO `mydb`.`tweets`
(`Tweet_PrimaryKey`,`Content`,`Date`,`Users_idUsers`)
VALUES
(04,"YEET.",NOW(),2);

#Follow/unfollow other users
# Super Ninja Fat follows TheAllMightyRa
INSERT INTO `mydb`.`following`
(`Users_idUsers_followed`,`Users_idUsers_follower`)
VALUES
(2,1);
# TheAllMightyRa follows Super Ninja Fat
INSERT INTO `mydb`.`following`
(`Users_idUsers_followed`,`Users_idUsers_follower`)
VALUES
(1,2);


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
# Delete Super Ninja Fat's third tweet # cascade
DELETE FROM tweets
WHERE Tweet_PrimaryKey = 3;

#Favorite/unfavorite tweets
INSERT INTO `mydb`.`favorites`
(`idFavorites`,`Users_idUsers`,`Tweets_Tweet_PrimaryKey`)
VALUES
(01,1,02);
INSERT INTO `mydb`.`favorites`
(`idFavorites`,`Users_idUsers`,`Tweets_Tweet_PrimaryKey`)
VALUES
(02,1,01);
INSERT INTO `mydb`.`favorites`
(`idFavorites`,
`Users_idUsers`,
`Tweets_Tweet_PrimaryKey`)
VALUES
(04,2,01);

