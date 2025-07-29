-- 두 번 이상 쓰인 이름(이름별), 이름이 쓰인 횟수
-- '이름이 없는 동물은 집계에서 제외한다.'
SELECT name, COUNT(animal_id) as count
FROM animal_ins
WHERE name IS NOT NULL
GROUP BY 1
HAVING count >= 2
ORDER BY 1