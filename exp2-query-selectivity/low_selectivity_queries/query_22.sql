SELECT t.title, mi.info FROM title AS t JOIN movie_info AS mi ON t.id = mi.movie_id WHERE t.production_year BETWEEN 2000 AND 2009;