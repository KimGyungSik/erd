-- create database inflean;
-- drop table if exists t_region; 

create table t_region (
	region_code varchar(3) not null,
    region_name varchar(10) not null,
    primary key(region_code)
    );

create table t_customer (
		customer_id int not null auto_increment,
        customer_name varchar(10) not null,
        phone varchar(20) not null unique,
        email varchar(50) not null unique,
        address varchar(100) not null,
        regist_date datetime default now(),
        region_code varchar(3) not null, -- FK속성이름(외래키 제약조건을 추후 만들기)
        primary key(customer_id)
        );
        
       create table t_product (
		product_code int not null auto_increment,
        product_name varchar(50) not null,
        price int,
        primary key(product_code)
        );
        
        create table t_sales (
			id int not null auto_increment,
            customer_id int not null,-- FK속성이름(외래키 제약조건을 추후 만들기)
            product_code int not null,-- FK속성이름(외래키 제약조건을 추후 만들기)
            qty int not null,
            sales_date datetime default now(),
            primary key(id)
		);
        
alter table t_customer
add constraint fk_region_code 
	foreign key (region_code)
    references t_region(region_code);
    
alter table t_sales
add constraint fk_customer_id 
	foreign key (customer_id)
    references t_customer(customer_id),
add constraint fk_product_code 
	foreign key (product_code)
    references t_product(product_code);
    
    
select * from
information_schema.table_constraints;


INSERT INTO t_region (region_code, region_name) VALUES
('02', '서울특별시'),
('031', '경기도'),
('032', '인천광역시'),
('033', '강원특별자치도'),
('041', '충청남도'),
('042', '대전광역시'),
('043', '충청북도'),
('044', '세종특별자치시'),
('051', '부산광역시'),
('052', '울산광역시'),
('053', '대구광역시'),
('054', '경상북도'),
('055', '경상남도'),
('061', '전라남도'),
('062', '광주광역시'),
('063', '전라북도'),
('064', '제주특별자치도');

select * from t_customer;

INSERT INTO t_customer (customer_name, phone, email, address, region_code)
VALUES
('홍길동', '010-1234-5678', 'hong@example.com', '서울시 강남구', '02'),
('김철수', '010-9876-5432', 'kim@example.com', '경기도 수원시', '031'),
('이영희', '010-1111-2222', 'lee@example.com', '인천시 남구', '032'),
('박민지', '010-5555-7777', 'park@example.com', '강원도 춘천시', '033'),
('정기호', '010-9999-8888', 'jung@example.com', '대전시 중구', '042');

INSERT INTO t_product
(product_name, price)
VALUES
('노트북', 1500000),
('스마트폰', 1000000),
('키보드', 50000),
('마우스', 30000),
('이어폰', 70000);

select * from t_product;

INSERT INTO t_sales
(customer_id, product_code, qty)
VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 5),
(4, 4, 3),
(5, 5, 2),
(1, 2, 3),
(3, 1, 1),
(2, 4, 2),
(4, 3, 4),
(5, 5, 1);

select * from t_sales;
    