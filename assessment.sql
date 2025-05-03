SELECT * FROM sqlassessment.seller;
use sqlassessment;

create table seller(
seller_id int primary key,
seller_name varchar(25),
seller_number varchar(12),
seller_address varchar(25));

insert into seller(seller_id,seller_name,seller_number,seller_address) values (100,'Jeswanth','1111111111','Madurai');
insert into seller(seller_id,seller_name,seller_number,seller_address) values (101,'Balaji','2222222222','Theni');
insert into seller(seller_id,seller_name,seller_number,seller_address) values (102,'Vishwa','3333333333','Madurai');
insert into seller(seller_id,seller_name,seller_number,seller_address) values (103,'Aashik','4444444444','Nagarcoil');
insert into seller(seller_id,seller_name,seller_number,seller_address) values (104,'Mukesh','5555555555','Madurai');
insert into seller(seller_id,seller_name,seller_number,seller_address) values (105,'Madhavan','6666666666','Chennai');
insert into seller(seller_id,seller_name,seller_number,seller_address) values (106,'Rajesh','7777777777','Nagarcoil');
-------------------------------------
create table product(
product_id int primary key,
product_name varchar(25),
product_price int,
product_category varchar(25),
seller_id int,
foreign key(seller_id) references seller(seller_id)
);
insert into product (product_id,product_name,product_price,product_category,seller_id) values (1,'pen',20,'Education',100),
(2,'pencil',10,'Education',100),(3,'Engine oil',1100,'AutoMobile',101),(4,'tyre',3500,'AutoMobile',102),(5,'Laptop',40000,'Tech',102),
(6,'Earphone',500,'Tech',103),(7,'Watch',1700,'Gadget',104);
select * from product;

update  product set product_price=30 where product_id=1;
delete from product where product_id=7;

create table buyer(
buyer_id int primary key,
buyer_name varchar(25),
buyer_number varchar(12) unique constraint buyer_number check(buyer_number like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
buyer_address varchar(25));


insert into buyer(buyer_id,buyer_name,buyer_number) values (1000,'Bangaru','8888888888'),(1001,'Nitish','9999999999'),
(1003,'Ranjith','9090909090');
select * from buyer;



select seller.seller_id,seller.seller_name,product.product_id,product.product_name ,product.product_price from seller 
join product on seller.seller_id=product.seller_id;

select * from seller,product,buyer;

alter table product add constraint product_price check (product_price>0);
insert into product (product_id,product_name,product_price,product_category,seller_id) values (8,'phone',10000,'tech',100);
select*from product;

create table payment(
payment_id int primary key,
buyer_id int,
product_id int,
payment_date date,
foreign key(buyer_id) references buyer(buyer_id) on delete cascade,
foreign key(product_id) references product(product_id) on delete cascade);

insert into payment(payment_id,buyer_id,product_id,payment_date) values (1,1000,1,'2022-01-01'),(2,1001,2,'2022-01-02'),(3,1003,3,'2022-01-03');
select*from payment;

select payment.payment_id,buyer.buyer_name,product.product_id,product.product_name,payment.payment_date from payment 
join buyer on payment.buyer_id=buyer.buyer_id join product on payment.product_id=product.product_id;

select * from payment,product,buyer;
-- remove duplicate rows
select distinct * from payment,product,buyer;

create view product_view as select product_id,product_name,product_price from product;
select * from product_view;

select * from product where product_price=(select max(product_price) from product);

-- sum of product price
select sum(product_price) from product;

-- avg of product price
select avg(product_price) from product;

-- count of product price
select count(product_price) from product;

-- left join
select * from product left join seller on product.seller_id=seller.seller_id;

-- right join
select * from product right join seller on product.seller_id=seller.seller_id;

-- inner join
select * from product inner join seller on product.seller_id=seller.seller_id;

-- full join
select * from product full join seller on product.seller_id=seller.seller_id;

-- cross join
select * from product cross join seller;

-- email constarint
alter table buyer add constraint email check(buyer_name like '%@%.com');

