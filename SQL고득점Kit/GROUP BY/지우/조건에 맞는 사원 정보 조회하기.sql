WITH 
cte AS (
    SELECT emp_no, year, SUM(score) as sum_score
    FROM hr_grade
    WHERE year = '2022'
    GROUP BY 1
)

SELECT distinct c.sum_score as score, c.emp_no, e.emp_name, e.position, e.email
FROM HR_EMPLOYEES as e
    JOIN HR_GRADE as g ON e.emp_no = g.emp_no
    JOIN cte as c ON g.emp_no = c.emp_no
WHERE g.year = '2022'
ORDER BY 1 DESC
LIMIT 1