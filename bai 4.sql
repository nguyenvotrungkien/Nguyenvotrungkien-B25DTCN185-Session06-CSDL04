create database bai4;
use bai4;
create table users(
    id int primary key not null,
    USERname varchar(100) not null,
    phone int unique
);
alter table users
change phone phone varchar(15) unique;
select * from users;
-- sửa kiểu dữ liệu của phone từ int -> varchar để ko bị mất số 0 ở đầu khi nhập
