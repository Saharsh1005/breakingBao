SELECT t.title, t.production_year FROM title AS t WHERE t.kind_id = (SELECT id FROM kind_type WHERE kind = 'tv series');