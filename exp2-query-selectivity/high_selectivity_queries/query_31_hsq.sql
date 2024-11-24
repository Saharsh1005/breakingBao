SELECT k1.keyword AS keyword1, k2.keyword AS keyword2, COUNT(*) AS co_occurrence_count FROM movie_keyword mk1 JOIN movie_keyword mk2 ON mk1.movie_id = mk2.movie_id AND mk1.keyword_id < mk2.keyword_id JOIN keyword k1 ON mk1.keyword_id = k1.id JOIN keyword k2 ON mk2.keyword_id = k2.id GROUP BY keyword1, keyword2 ORDER BY co_occurrence_count DESC LIMIT 15;