# 풀이 1
WITH 
cte AS (
    SELECT MAX(views) as max_view
    FROM USED_GOODS_BOARD
), 
cte2 AS (
    SELECT board_id
    FROM USED_GOODS_BOARD
    WHERE views = (SELECT max_view FROM cte)
)

SELECT concat('/home/grep/src/', board_id, '/', file_id, file_name, file_ext) as file_path
FROM USED_GOODS_FILE as f
WHERE board_id = (SELECT board_id FROM cte2)
ORDER BY file_id DESC

####################################################
# 풀이 2
SELECT concat('/home/grep/src/', board_id, '/', file_id, file_name, file_ext) as file_path
FROM USED_GOODS_FILE as f
WHERE board_id = (SELECT board_id FROM USED_GOODS_BOARD ORDER BY views DESC LIMIT 1)
ORDER BY file_id DESC