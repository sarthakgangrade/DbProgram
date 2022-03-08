create table orders
(
id int Identity(1,1) primary key,
Cusname varchar(200),
amount money,
startDate date
)

insert into orders values 
('mishti',230.20,'2-09-2016'),
('Bill',1200.33,'2-11-2018'),
('Meena',500.200,'1-03-2019')