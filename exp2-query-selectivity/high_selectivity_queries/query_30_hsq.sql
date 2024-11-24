SELECT n.name, COUNT(DISTINCT rt.role) AS role_types FROM name n JOIN cast_info ci ON n.id = ci.person_id JOIN role_type rt ON ci.role_id = rt.id GROUP BY n.name ORDER BY role_types DESC LIMIT 10;