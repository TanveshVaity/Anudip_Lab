create database tableassignment;

use tablessignment;

create table customer(
    customer_id varchar(10) primary key, 
    name varchar(10) not null, 
    email varchar(30) not null, 
    phone_no varchar(10) not null, 
    address varchar(50) not null,
    city varchar(20) not null, 
    pin_code int not null
);

desc customer;

create table product(
    product_id varchar(10) primary key, 
    product_name varchar(20) not null, 
    category varchar(20) not null, 
    sub_category varchar(20) not null, 
    original_price int not null, 
    selling_price int not null, 
    stock int not null
);

desc product;

create table orders(
    order_id varchar(10) not null, 
    customer_id varchar(10) not null, 
    product_id varchar(10) not null,
    quantity int not null, 
    total_price int not null, 
    order_status varchar(20) not null, 
    order_date varchar(20) not null, 
    payment_mode varchar(20) not null, 
    primary key (order_id), 
    foreign key (customer_id) references customer(customer_id), 
    foreign key(product_id) references product(product_id)
);

desc orders;

insert into customer (customer_id, name, email, phone_no, address, city, pin_code) values
('C001', 'Amit', 'amit.kumar@gmail.com', '9876543210', 'DLF Saket', 'Delhi', 110017),
('C002', 'Sneha', 'sneha.patil@yahoo.com', '9823456789', 'Law College', 'Pune', 411004),
('C003', 'Ravi', 'ravi.sharma@rediffmail.com', '9012345678', 'Mount Road', 'Chennai', 600017),
('C004', 'Pooja', 'pooja.verma@gmail.com', '9988776655', 'Lake Town', 'Kolkata', 700089),
('C005', 'Arjun', 'arjun.singh@hotmail.com', '9871234560', 'Indira Nagar', 'Bengaluru', 560038);

insert into product (product_id, product_name, category, sub_category, original_price, selling_price, stock) values
('P001', 'Redmi Note 12', 'Mobiles', 'Smartphone', 18000, 16999, 50),
('P002', 'Samsung Galaxy M14', 'Mobiles', 'Smartphone', 15000, 13999, 30),
('P003', 'HP Pavilion 15', 'Laptops', 'Notebook', 65000, 59999, 20),
('P004', 'Lenovo Ideapad 3', 'Laptops', 'Notebook', 60000, 54999, 25),
('P005', 'boAt Airdopes 141', 'Accessories', 'Earbuds', 3000, 2799, 100);


insert into orders (order_id, customer_id, product_id, quantity, total_price, order_status, order_date, payment_mode) values
('O001', 'C001', 'P001', 1, 16999, 'Delivered', '2025-07-01', 'UPI'),
('O002', 'C002', 'P003', 1, 59999, 'Shipped', '2025-07-03', 'Credit Card'),
('O003', 'C003', 'P005', 2, 5598, 'Pending', '2025-07-05', 'Cash on Delivery'),
('O004', 'C004', 'P004', 1, 54999, 'Delivered', '2025-07-06', 'Net Banking'),
('O005', 'C005', 'P002', 1, 13999, 'Cancelled', '2025-07-08', 'Debit Card');
