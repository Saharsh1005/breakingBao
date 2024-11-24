SELECT mi1.info AS technical_info_1, mi2.info AS technical_info_2, COUNT(*) 
FROM movie_info mi1
JOIN movie_info mi2 ON mi1.movie_id = mi2.movie_id
WHERE mi1.info_type_id = 7 AND mi2.info_type_id = 8
  AND mi1.info IN ('OFM:16 mm', 'OFM:35 mm')
  AND mi2.info IN ('USA', 'UK', 'India')
GROUP BY mi1.info, mi2.info
ORDER BY COUNT(*) DESC;