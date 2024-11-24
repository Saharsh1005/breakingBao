SELECT kt.kind, AVG(mii1.info::FLOAT) AS avg_runtime FROM title t JOIN kind_type kt ON t.kind_id = kt.id JOIN movie_info_idx mii1 ON t.id = mii1.movie_id JOIN info_type it1 ON mii1.info_type_id = it1.id WHERE it1.id = 102 AND mii1.info ~ '^[0-9]+(\.[0-9]*)?$' GROUP BY kt.kind ORDER BY avg_runtime DESC;