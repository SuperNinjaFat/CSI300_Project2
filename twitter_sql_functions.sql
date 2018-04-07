
#see a user’s timeline (in chronological order - the timeline is the combination of tweets/retweets of all users that one follows)
# Super Ninja Fat's timeline (He follows TheAllMightyRa)
select Content as 'Tweet/Retweet', t.`Date`
	from tweets t join
		(select Users_idUsers_followed from following where Users_idUsers_follower = 1) a on t.Users_idUsers = a.Users_idUsers_followed
        join users u on u.idUsers = a.Users_idUsers_followed
union
select Content, rt.`Date`
	from retweet rt join (select Users_idUsers_followed from following where Users_idUsers_follower = 1) a on rt.Users_idUsers = a.Users_idUsers_followed
    join tweets t on rt.Tweets_Tweet_PrimaryKey = t.Tweet_PrimaryKey
    join users u on u.idUsers = rt.Users_idUsers
order by `date` desc;

# TheAllMightyRa (He follows Super Ninja Fat)
select Content as 'Tweet/Retweet', t.`Date`
	from tweets t join
		(select Users_idUsers_followed from following where Users_idUsers_follower = 2) a on t.Users_idUsers = a.Users_idUsers_followed
        join users u on u.idUsers = a.Users_idUsers_followed
union
select Content, rt.`Date`
	from retweet rt join (select Users_idUsers_followed from following where Users_idUsers_follower = 2) a on rt.Users_idUsers = a.Users_idUsers_followed
    join tweets t on rt.Tweets_Tweet_PrimaryKey = t.Tweet_PrimaryKey
    join users u on u.idUsers = rt.Users_idUsers
order by `date` desc;

#See a user’s favorited tweets
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
# TheAllMightyRa is only followed by Super Ninja Fat and Super Ninja Fat is only followed by TheAllMightyRa
SELECT
    u.Username,
    count(*)
FROM
    users AS u
INNER JOIN following AS fo ON fo.Users_idUsers_followed = u.idUsers
GROUP BY
    u.Username;

#View how many users one is following.
# Super Ninja Fat is following only TheAllMightyRa and TheAllMightyRa is following only Super Ninja Fat
SELECT
    u.Username,
    count(*)
FROM
    users AS u
INNER JOIN following AS fo ON fo.Users_idUsers_follower = u.idUsers
GROUP BY
    u.Username;

    
    
    
    
    
    
    
