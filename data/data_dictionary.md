## 1. customer (`olist_customers_dataset`) (99,441 rows)

| STT | Tên cột | Type | Ý nghĩa |
|---|---|---|---|
| **1** | **customer_id** | **string (PK)** | **Khóa chính, định danh duy nhất cho 1 đơn hàng của khách** |
| 2 | customer_unique_id | string | Định danh thật của khách hàng|
| 3 | customer_zip_code_prefix | int (FK → geolocation) | Mã zip code (3 số đầu) nơi khách ở |
| 4 | customer_city | string | Thành phố của khách hàng |
| 5 | customer_state | string | Bang (state) của khách hàng |

## 2. geolocation (`olist_geolocation_dataset`) (~1,000,163 rows)

| STT | Tên cột | Type | Ý nghĩa |
|---|---|---|---|
| 1 | geolocation_zip_code_prefix | int (FK) | Mã zip code|
| 2 | geolocation_lat | float | Vĩ độ  |
| 3 | geolocation_lng | float | Kinh độ |
| 4 | geolocation_city | string | Tên thành phố tương ứng với zip code |
| 5 | geolocation_state | string | Tên bang tương ứng với zip code |

## 3. order_items (`olist_order_items_dataset`) (112,650 rows)
> Chi tiết sản phẩm được mua trong order

| STT | Tên cột | Type | Ý nghĩa |
|---|---|---|---|
| 1 | order_id | string (FK → order) | Đơn hàng chứa item này; 1 order có thể có nhiều order_item |
| 2 | order_item_id | int | Số thứ tự item trong đơn hàng |
| 3 | product_id | string (FK → products) | Sản phẩm được mua trong item này |
| 4 | seller_id | string (FK → sellers) | Người bán cung cấp sản phẩm này |
| 5 | shipping_limit_date | datetime | Hạn cuối seller phải giao hàng cho đơn vị vận chuyển |
| 6 | price | float | Giá bán của sản phẩm (chưa gồm phí vận chuyển) |
| 7 | freight_value | float | Phí vận chuyển (freight) của item này |

## 4. payments (`olist_order_payments_dataset`) (103,886 rows)

| STT | Tên cột | Type | Ý nghĩa |
|---|---|---|---|
| 1 | order_id | string (FK → order) | Đơn hàng được thanh toán |
| 2 | payment_sequential | int | Số thứ tự phương thức thanh toán nếu khách trả bằng nhiều hình thức cho 1 đơn  |
| 3 | payment_type | string | Loại hình thanh toán: credit_card, boleto, voucher, debit_card... |
| 4 | payment_installments | int | Số kỳ trả góp |
| 5 | payment_value | float | Số tiền thanh toán trong lượt này |

## 5. review (`olist_order_reviews_dataset`) (99,224 rows)

| STT | Tên cột | Type | Ý nghĩa |
|---|---|---|---|
| **1** | **review_id** | **string (PK)** | **Khóa chính định danh review** |
| 2 | order_id | string (FK → order) | Đơn hàng được đánh giá |
| 3 | review_score | int | Điểm đánh giá của khách (1–5), thước đo hài lòng |
| 4 | review_comment_title | string | Tiêu đề bình luận (có thể rỗng) |
| 5 | review_comment_message | string | Nội dung bình luận chi tiết (có thể rỗng) |
| 6 | review_creation_date | date | Ngày khách gửi review |
| 7 | review_answer_timestamp | datetime | Thời điểm Olist phản hồi/ghi nhận review |

## 6. order (`olist_orders_dataset`) (99,441 rows, 1 row = 1 order)

> Fact trung tâm

| STT | Tên cột | Type | Ý nghĩa |
|---|---|---|---|
| **1** | **order_id** | **string (PK)** | **Khóa chính, định danh đơn hàng** |
| 2 | customer_id | string (FK → customer) | Khách hàng đặt đơn này |
| 3 | order_status | string | Trạng thái đơn: delivered, shipped, canceled, processing... |
| 4 | order_purchase_timestamp | datetime | Thời điểm khách đặt hàng — mốc thời gian gốc để tính các khoảng thời gian khác |
| 5 | order_approved_at | datetime | Thời điểm đơn được thanh toán/duyệt |
| 6 | order_delivered_carrier_date | datetime | Thời điểm đơn được chuyển cho đơn vị vận chuyển |
| 7 | order_delivered_customer_date | datetime | Thời điểm khách nhận được hàng thực tế  |
| 8 | order_estimated_delivery_date | datetime | Ngày ước tính sẽ giao|

## 7. products (`olist_products_dataset`) (32,951 rows)

| STT | Tên cột | Type | Ý nghĩa |
|---|---|---|---|
| **1** | **product_id** | **string (PK)** | **Khóa chính định danh sản phẩm** |
| 2 | product_category_name | string (FK → category) | Tên category tiếng Bồ Đào Nha |
| 3 | product_name_lenght | int/float | Độ dài tên sản phẩm |
| 4 | product_description_lenght | int/float | Độ dài mô tả sản phẩm|
| 5 | product_photos_qty | int/float | Số lượng ảnh sản phẩm được đăng |
| 6 | product_weight_g | float | Trọng lượng sản phẩm (gram) |
| 7 | product_length_cm | float | Chiều dài sản phẩm (cm) |
| 8 | product_height_cm | float | Chiều cao sản phẩm (cm) |
| 9 | product_width_cm | float | Chiều rộng sản phẩm (cm) |

## 8. sellers (`olist_sellers_dataset`) (3,095 rows)

| STT | Tên cột | Type | Ý nghĩa |
|---|---|---|---|
| **1** | **seller_id** | **string (PK)** | **Khóa chính định danh người bán** |
| 2 | seller_zip_code_prefix | int (FK → geolocation) | Mã zip code nơi seller đặt cửa hàng |
| 3 | seller_city | string | Thành phố của seller |
| 4 | seller_state | string | Bang của seller |

## 9. category (`product_category_name_translation`) (71 rows)

| STT | Tên cột | Type | Ý nghĩa |
|---|---|---|---|
| **1** | **product_category_name** | **string (PK)** | **Tên category gốc bằng tiếng Bồ Đào Nha** |
| 2 | product_category_name_english | string | Tên category đã dịch sang tiếng Anh |
