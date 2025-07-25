WITH COUNT_CAR AS ( 
    SELECT 
        CAR_ID 
    FROM 
        CAR_RENTAL_COMPANY_RENTAL_HISTORY 
    WHERE 
        MONTH(START_DATE) BETWEEN 8 AND 10
    GROUP BY 
        CAR_ID 
    HAVING 
        COUNT(CAR_ID) >= 5
) 

SELECT 
    MONTH(START_DATE) AS MONTH, 
    CAR_ID, 
    COUNT(CAR_ID) AS RECORDS 
FROM 
    CAR_RENTAL_COMPANY_RENTAL_HISTORY 
WHERE 
    CAR_ID IN (SELECT CAR_ID FROM COUNT_CAR) 
    AND
    MONTH(START_DATE) BETWEEN 8 AND 10 
GROUP BY 
    MONTH(START_DATE),
    CAR_ID 
ORDER BY 
    MONTH, 
    CAR_ID DESC
