-- 만원 단위 가격대 별로 -> 상품 개수 출력하는 SQL문 작성
# 풀이1
SELECT FLOOR((price / 10000))*10000 as price_group, count(product_id) as products
FROM product
GROUP BY 1
ORDER BY 1

# 풀이2
SELECT TRUNCATE(price, -4) as price_group, count(product_id) as products
FROM product
GROUP BY 1
ORDER BY 1