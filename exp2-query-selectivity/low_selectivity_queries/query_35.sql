SELECT t.title, t.production_year FROM title AS t JOIN kind_type AS kt ON t.kind_id = kt.id WHERE kt.kind IN ('movie', 'tv series');