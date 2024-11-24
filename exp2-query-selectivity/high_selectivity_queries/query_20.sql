SELECT rt.role, n.gender, COUNT(*) AS total
FROM cast_info ci
JOIN role_type rt ON ci.role_id = rt.id
JOIN name n ON ci.person_id = n.id
GROUP BY rt.role, n.gender
ORDER BY total DESC;