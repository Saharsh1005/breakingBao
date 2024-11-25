SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
     movie_info AS mi2,
     info_type AS it2,
     cast_info AS ci,
     role_type AS rt,
     name AS n,
     movie_keyword AS mk,
     keyword AS k
WHERE
        t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = mk.movie_id
  AND k.id = mk.keyword_id
  AND mi1.movie_id = mi2.movie_id
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND (it1.id IN ('7', '10'))  -- Modified: Added an additional ID filter for info_type
  AND (it2.id IN ('8', '12'))  -- Modified: Added an additional ID filter for info_type
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND (mi1.info IN ('OFM:16 mm', 'OFM:35 mm', 'PCS:Spherical', 'PFM:35 mm', 'RAT:1.85 : 1', 'RAT:2.35 : 1'))  -- Modified: Reduced and updated the camera/format info
  AND (mi2.info IN ('USA', 'Canada', 'UK', 'Australia'))  -- Modified: Simplified countries for mi2
  AND (kt.kind IN ('movie', 'tv series'))  -- Modified: Replaced 'episode' with 'tv series'
  AND (rt.role IN ('production designer', 'director'))  -- Modified: Added 'director' to the roles
  AND (n.gender IN ('f', 'm'))  -- Modified: Included both male and female genders
  AND (t.production_year <= 2015 AND t.production_year >= 1990)  -- Modified: Adjusted the year range
  AND (k.keyword IN ('murder', 'family-drama', 'thriller', 'romance', 'crime', 'action', 'comedy'));  -- Modified: Changed the keywords to different themes
