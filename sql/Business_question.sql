--1: Doanh thu, số đơn, AOV?
SELECT 
    ROUND(SUM(oi.price), 2) AS Revenue,
    COUNT(DISTINCT oi.order_id) AS So_don,
    ROUND(
        SUM(oi.price) / COUNT(DISTINCT oi.order_id),
        2
    ) AS AOV
FROM  [dbo].[order_items_cleaned] as oi
JOIN  [dbo].[order_cleaned] as o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered';


--2. Top 10 category theo số lượng bán?
select top 10 p.product_category_name_english as product_name_english,
count(o.order_id) as count_product
from [dbo].[order_items_cleaned] as oi
join [dbo].[products_cleaned] as p on oi.product_id=p.product_id
join [dbo].[order_cleaned] as o on oi.order_id=o.order_id
where o.order_status='delivered'
group by p.product_category_name,p.product_category_name_english
order by count_product desc

--3. Tỷ lệ đơn hàng có review <=3
SELECT 
    CAST(
        SUM(CASE WHEN r.review_score <= 3 THEN 1 ELSE 0 END) 
        AS DECIMAL(10,2)
    ) / COUNT(o.order_id) * 100 AS ty_le_review
FROM [dbo].[order_cleaned] AS o
LEFT JOIN [dbo].[review_cleaned] AS r 
    ON o.order_id = r.order_id;


--4. Ở mỗi state, top khách hàng nào có tổng giá trị mua hàng cao nhất?
with customer_revenue as (
    select c.customer_state,
    c.customer_unique_id,
    sum(oi.price+oi.freight_value) as total_spent,
    rank()over(partition by c.customer_state order by (sum(oi.price+oi.freight_value))) as rank_customer
    from [dbo].[customer_cleaned] as c
    join [dbo].[order_cleaned] as o on c.customer_id=o.customer_id
    join [dbo].[order_items_cleaned] as oi on o.order_id=oi.order_id
    where o.order_status='delivered'
    group by c.customer_state,c.customer_unique_id
)
select customer_state,
customer_unique_id,
total_spent,
rank_customer
from customer_revenue
where rank_customer<=3


--5. Payment_type nào phổ biến nhất và số kỳ trả góp trung bình
select payment_type,
count(order_id) as so_luong_order,
AVG(CAST(payment_installments AS DECIMAL(10,2))) AS avg_installments
from [dbo].[payments_cleaned] 
group by payment_type 
order by so_luong_order desc

--6. Giao hàng trễ ảnh hưởng đến review_score như thế nào?
 select avg(datediff(DAY,o.order_estimated_delivery_date,o.order_delivered_customer_date))*1.0 as ngay_doi,
r.review_score 
from [dbo].[order_cleaned] as o
join [dbo].[review_cleaned] as r on o.order_id=r.order_id
where o.order_status='delivered'
group by r.review_score 
order by r.review_score
--====> Thời gian giao hàng có sự khác biệt giữa các mức đánh giá. Các đơn hàng có review 5 sao được giao sớm hơn dự kiến 
--trung bình 13 ngày, trong khi nhóm 1 sao chỉ sớm khoảng 4 ngày. Điều này cho thấy mức độ giao hàng 
--đúng/sớm dự kiến có thể có mối liên hệ với mức độ hài lòng của khách hàng.

--7.Tỷ lệ khách mua lại (repeat purchase rate) là bao nhiêu?
with KH as(
    select count(o.order_id) as so_luong_order
    from [dbo].[customer_cleaned] as c 
    left join [dbo].[order_cleaned] as o
    on c.customer_id = o.customer_id
    group by c.customer_unique_id
)
select sum(case when so_luong_order<=1 then 1 else 0 end) as so_luong_churn,
sum(case when so_luong_order>=2 then 1 else 0 end) as so_luong_kochurn,
ROUND(
        100.0 * SUM(CASE 
                        WHEN so_luong_order >= 2 THEN 1 
                        ELSE 0 
                    END) / COUNT(*),
        2
    ) AS ty_le_khach_mua_lai
from KH
--8.Khách hàng mới có xu hướng chi tiêu khác khách hàng mua lại như thế nào?
;with customer_order as (
    select
    c.customer_unique_id,
    o.order_id,
    sum(oi.price+oi.freight_value) as order_value
    from [dbo].[customer_cleaned] as c
    join [dbo].[order_cleaned] as o on c.customer_id=o.customer_id
    join [dbo].[order_items_cleaned] as oi on o.order_id=oi.order_id
    where o.order_status='delivered'
    group by c.customer_unique_id,o.order_id
),
customer_summary as(
    select customer_unique_id,
    count(order_id) as so_luong_order,
    sum(order_value) as total_spent,
    avg(order_value) as avg_order_value
    from customer_order
    group by customer_unique_id
)
select 
case
    when so_luong_order=1 then'Khach mua 1 lan' 
    else 'Khach mua lai >1'
    end as nhom_khach,
COUNT(*) AS so_khach,
ROUND(AVG(total_spent), 2) AS avg_total_spent,
ROUND(AVG(avg_order_value), 2) AS avg_order_value
from customer_summary
group by 
case
    when so_luong_order=1 then'Khach mua 1 lan' 
    else 'Khach mua lai>1'
    end
--===> Chỉ khoảng 3% khách hàng quay lại mua hàng, nhưng nhóm này có mức chi tiêu trung bình 308.53, 
--cao gần gấp đôi nhóm chỉ mua một lần (160.74). Đáng chú ý, AOV của khách mua lại thấp hơn khoảng 9.3%, 
--cho thấy giá trị của nhóm khách này chủ yếu đến từ việc mua hàng nhiều lần thay vì giá trị mỗi đơn cao.

--9.Seller segmentation theo hiệu suất (review + volume + tỷ lệ giao trễ) seller_id
;with seller_metrics as(
    select oi.seller_id,
    count(distinct o.order_id) as volume_order,
    avg(r.review_score*1.0) as avg_review_score,
    sum(oi.price) as total_revenue,
    ROUND(
    AVG(
        CASE
            WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date
            THEN 1.0
            ELSE 0.0
        END) * 100,2) AS late_rate_percent
    from [dbo].[sellers_cleaned] as s
    join [dbo].[order_items_cleaned] as oi on s.seller_id=oi.seller_id
    join [dbo].[order_cleaned] as o on oi.order_id=o.order_id
    join [dbo].[review_cleaned] as r on o.order_id=r.order_id
    where o.order_status='delivered'
    group by oi.seller_id
),

threshold AS (
    SELECT
        AVG(volume_order * 1.0) AS avg_volume,
        AVG(avg_review_score) AS avg_review
    FROM seller_metrics
),

seller_segment AS (
    SELECT
        s.*,

        CASE
            WHEN s.avg_review_score >= t.avg_review
                 AND s.volume_order >= t.avg_volume
                THEN 'High Review - High Volume'

            WHEN s.avg_review_score >= t.avg_review
                 AND s.volume_order < t.avg_volume
                THEN 'High Review - Low Volume'

            WHEN s.avg_review_score < t.avg_review
                 AND s.volume_order >= t.avg_volume
                THEN 'Low Review - High Volume'

            ELSE 'Low Review - Low Volume'
        END AS segment

    FROM seller_metrics s
    CROSS JOIN threshold t
)

SELECT
    segment,
    COUNT(*) AS so_luong_seller,
    ROUND(AVG(volume_order * 1.0), 2) AS avg_volume,
    ROUND(AVG(avg_review_score), 2) AS avg_review,
    ROUND(AVG(late_rate_percent) * 100, 2) AS avg_late_rate
FROM seller_segment
GROUP BY segment
ORDER BY segment;












