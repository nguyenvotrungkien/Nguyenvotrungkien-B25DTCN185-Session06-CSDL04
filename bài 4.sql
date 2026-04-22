create database booking_task4;
use booking_task4;
CREATE TABLE bookings (
    booking_id INT,
    hotel_id INT,
    status VARCHAR(20),
    total_price INT
);
INSERT INTO bookings VALUES
(1,1,'COMPLETED',4000000),
(2,1,'COMPLETED',3500000),
(3,1,'COMPLETED',3200000),
(4,1,'COMPLETED',5000000),
(5,1,'COMPLETED',4500000),
(101,2,'COMPLETED',1000000),
(102,2,'COMPLETED',1200000),
(103,2,'COMPLETED',1500000),
(201,3,'COMPLETED',4000000),
(202,3,'CANCELLED',5000000),
(203,3,'CANCELLED',3000000),
(204,3,'FAILED',2000000),
(205,3,'COMPLETED',3500000);
-- cách lọc trễ 
-- cách này sẽ gom dữ liệu kể cả 'CANCELLED' và 'FAILED' sau đó tính toán trên toàn bộ dữ liệu sau đó mới lọc vì vậy có thể dính các đơn rác
select 
    hotel_id,
    count(case when status = 'COMPLETED' then 1 end) total_completed,
    avg(case when status = 'COMPLETED' then total_price end) as avg_price
from bookings
group by hotel_id
having
    total_completed >= 50
    and avg_price > 3000000;
-- cách lọc sớm
-- cách này sẽ dùng where để loại bỏ 'CANCELLED' và 'FAILED'sau đó gom các nhóm hợp lệ nên từ đó conut avg tính toán nhẹ hơn cuối cùng dùng having lọc kết quả cuối
SELECT 
    hotel_id,
    COUNT(*) AS total_completed,
    AVG(total_price) AS avg_price
FROM bookings
WHERE status = 'COMPLETED'
GROUP BY hotel_id
HAVING 
    COUNT(*) >= 50
    AND AVG(total_price) > 3000000;
--                                                                                                                                          