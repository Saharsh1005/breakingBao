SELECT k.keyword, AVG(t.production_year) AS avg_year FROM title t JOIN movie_keyword mk ON t.id = mk.movie_id JOIN keyword k ON mk.keyword_id = k.id WHERE t.production_year BETWEEN 1900 AND 2020 GROUP BY k.keyword HAVING COUNT(*) > 50;