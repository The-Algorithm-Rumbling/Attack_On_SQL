# 년, 월, 성별 별 - 상품 구매한 회원수 (같은 회원이 년,월에 2번 구매하면 그것도 count로 같이 세짐)
# ** 성별 정보가 없는 경우는 결과에서 제거
SELECT  YEAR(s.sales_date) as year, 
        MONTH(s.sales_date) as month, 
        i.gender, 
        COUNT(distinct i.user_id) as users
FROM user_info as i 
    JOIN online_sale as s ON i.user_id = s.user_id
WHERE i.gender IS NOT NULL
GROUP BY 1,2,3
ORDER BY 1,2,3