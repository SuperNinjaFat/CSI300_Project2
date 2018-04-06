use `mydb`;
SELECT `favorites`.`idFavorites`,
    `favorites`.`Users_idUsers`,
    `favorites`.`Posts_Posts_PrimaryKey`
FROM `mydb`.`favorites`;

SELECT `following`.`Users_idUsers_followed`,
    `following`.`Users_idUsers_follower`
FROM `mydb`.`following`;

SELECT `posts`.`Posts_PrimaryKey`,
    `posts`.`Tweets_Tweet_PrimaryKey`,
    `posts`.`Retweet_Retweet_PrimaryKey`
FROM `mydb`.`posts`;

SELECT `retweet`.`Retweet_PrimaryKey`,
    `retweet`.`Users_idUsers`,
    `retweet`.`Tweets_Tweet_PrimaryKey`,
    `retweet`.`Date`
FROM `mydb`.`retweet`;

SELECT `tweets`.`Tweet_PrimaryKey`,
    `tweets`.`Content`,
    `tweets`.`Date`,
    `tweets`.`Users_idUsers`
FROM `mydb`.`tweets`;

SELECT `users`.`idUsers`,
    `users`.`Username`
FROM `mydb`.`users`;
