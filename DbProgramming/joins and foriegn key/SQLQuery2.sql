create table customerdetails
(
customerid int identity(1,1) primary key,
Pubid int FOREIGN KEY REFERENCES friday(Pubid),
id int FOREIGN KEY REFERENCES Orders(id),
phoneNo varchar(10),
nickName varchar(5)
)


insert into customerdetails values
(1,2,'9876544321','KD'),
(2,1,'8764532114','Sam'),
(3,3,'1234567890','shivi')

select * from customerdetails


SELECT
  friday.Pubid,
  orders.amount,
  orders.Cusname,
  friday.shots,
  customerdetails.phoneNo
FROM orders
JOIN customerdetails
  ON orders.id = customerdetails.id
JOIN friday
  ON friday.Pubid = customerdetails.Pubid;


SELECT
  friday.Pubid,
  orders.amount,
  orders.Cusname,
  friday.shots,
  customerdetails.phoneNo
FROM orders
right JOIN customerdetails
  ON orders.id = customerdetails.id
right JOIN friday
  ON friday.Pubid = customerdetails.Pubid;



SELECT
  friday.Pubid,
  orders.amount,
  orders.Cusname,
  friday.shots,
  customerdetails.phoneNo
FROM orders
left JOIN customerdetails
  ON orders.id = customerdetails.id
left JOIN friday
  ON friday.Pubid = customerdetails.Pubid;


SELECT
  friday.Pubid,
  orders.amount,
  orders.Cusname,
  friday.shots,
  customerdetails.phoneNo
FROM orders
full JOIN customerdetails
  ON orders.id = customerdetails.id
full JOIN friday
  ON friday.Pubid = customerdetails.Pubid;



SELECT
  friday.Pubid,
  orders.amount,
  orders.Cusname,
  friday.shots,
  customerdetails.phoneNo
FROM orders
cross JOIN customerdetails
  ON orders.id = customerdetails.id
cross JOIN friday
  ON friday.Pubid = customerdetails.Pubid;





