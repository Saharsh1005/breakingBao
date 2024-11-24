SELECT n.name, COUNT(*) AS appearances FROM name n JOIN cast_info ci ON n.id = ci.person_id JOIN title t ON ci.movie_id = t.id WHERE t.production_year BETWEEN 1990 AND 2000 GROUP BY n.name ORDER BY appearances DESC LIMIT 20;