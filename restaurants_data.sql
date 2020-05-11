  SELECT *
 FROM nomnom
 WHERE cuisine = 'Japanese' AND price = '$$';
 
 SELECT * 
 FROM nomnom
 WHERE name LIKE "%noodle%";
 
 SELECT *
FROM nomnom
WHERE health IS NULL; 