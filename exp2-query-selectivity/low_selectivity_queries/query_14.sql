SELECT DISTINCT cn.name FROM company_name AS cn JOIN movie_companies AS mc ON cn.id = mc.company_id;