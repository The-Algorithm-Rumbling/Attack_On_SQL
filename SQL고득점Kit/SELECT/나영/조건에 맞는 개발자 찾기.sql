SELECT ID, EMAIL, FIRST_NAME, LAST_NAME 
FROM DEVELOPERS 
WHERE SKILL_CODE & 
    (SELECT SUM(CODE) 
     FROM SKILLCODES 
     WHERE NAME IN('C#', 'Python'))
ORDER BY ID