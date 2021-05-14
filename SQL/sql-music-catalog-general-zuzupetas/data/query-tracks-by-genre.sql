SELECT track.name, genre.name
	FROM Genre
	JOIN Track ON Genre.GenreID = Track.GenreID
	WHERE Genre.GenreID = 8;


