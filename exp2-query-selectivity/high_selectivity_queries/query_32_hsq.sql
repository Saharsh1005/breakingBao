SELECT kt.kind, k.keyword, COUNT(*) AS keyword_count FROM title t JOIN kind_type kt ON t.kind_id = kt.id JOIN movie_keyword mk ON t.id = mk.movie_id JOIN keyword k ON mk.keyword_id = k.id GROUP BY kt.kind, k.keyword ORDER BY keyword_count DESC;