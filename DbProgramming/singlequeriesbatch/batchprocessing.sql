
create table Data
(
id int Identity(1,1) primary key,
name varchar(200),
salary money,
startDate date
)


select * from Data;


insert into Data values 
('sarthak',5000,'2019-03-01'),
('mishti',23000.20,'2-09-2016'),
('Bill',12000.33,'2-11-2018'),
('Meena',5500.200,'1-03-2019'),
('Charlie',456123,'2-02-2020')


UPDATE Data
SET name = 'sam', salary = 50000
WHERE id=3