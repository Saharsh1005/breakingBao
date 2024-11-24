SELECT rt.role, n.gender, COUNT(*) AS role_count FROM role_type rt JOIN cast_info ci ON rt.id = ci.role_id JOIN name n ON ci.person_id = n.id WHERE rt.role IN ('supporting', 'minor role') GROUP BY rt.role, n.gender ORDER BY role_count DESC;