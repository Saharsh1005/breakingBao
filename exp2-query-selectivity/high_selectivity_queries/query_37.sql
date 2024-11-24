SELECT t.title, mii1.info AS rating FROM title t JOIN movie_info_idx mii1 ON t.id = mii1.movie_id JOIN info_type it1 ON mii1.info_type_id = it1.id WHERE it1.id = 101 AND mii1.info ~ '^[0-9]+(\.[0-9]*)?$' ORDER BY mii1.info::FLOAT DESC LIMIT 10;