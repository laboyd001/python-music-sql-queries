-- 1.Query all of the entries in the Genre table

SELECT * from Genre

-- ================================================

-- 2. Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT INTO Artist
VALUES (null, 'Radiohead', 1985);

-- =================================================

-- 3. Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album
VALUES (null,"OK Computer", "1997", 123, "Parlophone", 31, 2)
-- ==================================================

-- 4. Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song
VALUES (null,"Karma Police", 456, "1997", 2, 31, 26)

-- ===================================================

-- 5. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

-- Reminder: Direction of join matters. Try the following statements and see the difference in results.

-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

SELECT a.Title as album_title, s.Title as song_title, art.artistName as artist_name
FROM Song s
LEFT JOIN Album a 
ON s.AlbumId = a.AlbumId
LEFT Join Artist art
ON s.ArtistId = art.ArtistId
WHERE s.ArtistId = 31

-- ==========================================================

-- 6. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT (AlbumId),AlbumId
FROM Song
GROUP BY AlbumId

-- ============================================================

-- 7. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT (ArtistId),ArtistId
FROM Song
GROUP BY ArtistId

-- ============================================================
-- 8. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT (GenreId),GenreId
FROM Song
GROUP BY GenreId

-- =============================================================

-- 9. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT Title as album_title, MAX(AlbumLength)
FROM Album

-- ============================================================

-- 10. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

SELECT Title as song_title, MAX(SongLength)
FROM Song

-- ===========================================================

-- 11. Modify the previous query to also display the title of the album.

SELECT s.Title as song_title,al.Title as album_title, MAX(SongLength)
FROM Song s
Left JOIN Album al
ON s.AlbumId = al.AlbumId