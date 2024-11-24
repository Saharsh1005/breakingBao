SELECT t.title, it.info FROM title AS t JOIN movie_info AS mi ON t.id = mi.movie_id JOIN info_type AS it ON mi.info_type_id = it.id WHERE it.info LIKE '%cast%';