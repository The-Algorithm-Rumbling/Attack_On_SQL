# 저자ID별, 카테고리별 '매출액(판매량 * 판매가)'
SELECT a.author_id, a.author_name, b.category, 
        SUM(b.price * bs.sales) as total_sales
FROM BOOK as b
    JOIN AUTHOR as a ON b.author_id = a.author_id
    JOIN BOOK_SALES as bs ON b.book_id = bs.book_id
WHERE bs.sales_date LIKE "2022-01%"
GROUP BY 1,3 
ORDER BY 1,3 DESC;