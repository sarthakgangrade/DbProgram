create table friday
(
Pubid int Identity(1,1) primary key,
id int FOREIGN KEY REFERENCES Orders(id),
CustomerName varchar(30),
shots int,
datetime datetime
)

insert into friday values 
(2,'kartik',5,getDate()),
(1,'samaira',3,getDate()),
(3,'shivani',4,getDate())

select * from friday


