show databases ;
use  shop;
show tables ;
create database shop;
create table customers(
    customer_number int not null unique ,
    customer_name varchar(50) not null ,
    contacts_last_name varchar(50) not null ,
    contacts_first_name varchar(50) not null ,
    phone varchar(50) not null ,
    addressLine1 varchar(50) not null ,
    addressLine2 varchar(50) not null ,
    city varchar(50) not null ,
    state varchar(50) not null ,
    postalCode varchar(15) not null ,
    country varchar(50) not null ,
    creditLimit float
);
create table orders(
    orderNumber int not null ,
    orderDate DATE not null ,
    requiredDate DATE not null ,
    shippedDate DATE not null ,
    status varchar(15) not null ,
    comments text,
    quantityOrdered int not null ,
    priceEach float not null
);
create table payments(
    customerNumber int not null ,
    checkNumber varchar(50) not null ,
    paymentDate DATE not null ,
    amount float not null
);
create  table  products(
    productCode varchar(15) not null ,
    productName varchar(70) not null ,
    productScale varchar(10) not null ,
    productVendor varchar(50) not null ,
    productDescription text not null ,
    quantityInStock int not null ,
    buyPrice float not null ,
    MSRP float not null
);
create table productType(
    productCode varchar(50) not null ,
    textDescription varchar(255) not null ,
    image varchar(100)
);
create table employees(
    employeeNumber int not null ,
    lastName varchar(50) not null,
    firstName varchar(50) not null,
    email varchar(100) not null,
    jobTitle varchar(50) not null
);
create table offices(
    officeCode varchar(10) not null ,
    city varchar(50) not null ,
    phone varchar(50) not null ,
    addressLine1  varchar(50) not null ,
    addressLine2  varchar(50) not null ,
    state   varchar(50) not null ,
    country    varchar(50) not null ,
    postalCode     varchar(50) not null
);
alter table offices
add primary key (officeCode);

alter  table products
add productTCode varchar(50) unique not null,
    add foreign key (productTCode) references productType(productCode);
alter table payments
add customer_number int unique not null ,
    add foreign key (customer_number) references customers(customer_number);

alter table orders
    add customer_number int unique not null ,
    add foreign key (customer_number) references customers(customer_number);

alter table customers
    add customer_number int unique not null ,
    add foreign key (customer_number) references customers(customer_number);

alter table employees
    add officeCode varchar(10) unique not null ,
    add foreign key (officeCode) references offices(officeCode);

create table productPayment(
    productCode varchar(15) unique not null ,
    customer_number int unique not null ,
    foreign key (productCode) references products(productCode),
    foreign key (customer_number) references customers(customer_number),
    primary key (productCode,customer_number)
);




