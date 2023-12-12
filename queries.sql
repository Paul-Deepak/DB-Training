use movie_ticket_system;
select * from movies;
select * from theatres;
select * from users;
select * from user_history;
select * from showtime;
select * from tickets;
select * from bookings;
select * from screens;

-- MOST WATCHED MOVIES(TOP 3):
SELECT m.movie_title AS MovieTitle, COUNT(u.Movie_ID) AS WatchCount
FROM Movies as m
LEFT JOIN user_history as u ON m.Movie_ID = u.Movie_ID
GROUP BY m.Movie_ID ORDER BY WatchCount DESC LIMIT 3;

-- MOVIES AND THEIR TOTAL COLLECTION:
SELECT m.movie_title AS 'MOVIE TITLE', SUM(b.Total_Amount) AS TotalCollection
FROM Movies m
INNER JOIN Showtime s ON m.movie_id = s.movie_id
INNER JOIN Bookings b ON s.Showtime_ID = b.Showtime_ID
GROUP BY m.movie_id
ORDER BY TotalCollection DESC;

-- TRACK USER WATCHED MOVIES:
SELECT u.user_name, m.movie_title from users as u
INNER JOIN user_history as uh on u.user_id=uh.user_id
INNER JOIN movies as m on m.movie_id=uh.movie_id;

-- SHOW MOVIES THEATRE WISE:
SELECT m.movie_title, theatre_name,sc.screen_id from movies as m
INNER JOIN showtime as s on s.movie_id=m.movie_id
INNER JOIN screens as sc on sc.screen_id=s.screen_id
INNER JOIN theatres as t on t.theatre_id=sc.theatre_id;

-- UPCOMING MOVIES WITH DATE
SELECT movie_title, movie_release_date, s.available_seats
FROM movies as m INNER JOIN showtime as s on m.movie_id=s.movie_id
WHERE movie_release_date>NOW();

-- HOUSEFULL SCREENS WITH THEATRE AND MOVIE NAME
SELECT s.screen_id, t.theatre_name, m.movie_title
FROM showtime as st
JOIN screens as s on st.screen_id=s.screen_id
JOIN theatres as t on s.theatre_id=t.theatre_id
JOIN movies as m on st.movie_id=m.movie_id
WHERE st.available_seats=0;

-- 
