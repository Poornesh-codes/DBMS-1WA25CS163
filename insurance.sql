create database insurance;
use insurance;
create table person(
driver_id  varchar(10) primary key,
name varchar(20) not null,
address varchar(50) );
create table car(reg_num varchar(10) primary key , model char(20) , Year year);
create table accident(report_num varchar(10) primary key , accident_date date, location varchar(20));
create table owns( driver_id varchar(10)  , reg_num varchar(10)   ,foreign key (driver_id) references person(driver_id), foreign key (reg_num) references car(reg_num));
create table participated( driver_id varchar(10)  , reg_num varchar(10)   ,
	foreign key (driver_id) references person(driver_id), 
	foreign key (reg_num) references car(reg_num), report_num varchar(10), foreign key (report_num) references accident(report_num) , damage_amount int not null );
insert into person values('A01','Richard' ,'srinivas nagar'),('A02','pradeep','rajaji nagar'),('A03','SMITH','ashok nagar'),('A04','VENU' ,'NR COLONY'),('A05','jHON','hanumanth nagar');
select * from person;
insert into car values('KA001434','INDICA' ,1970),('KA148989','lANCER',1989),('KA063434','toyota',1998),('KA048938','Honda' ,2001),('kA054234','Audi',2005);
select * from owns;

INSERT INTO owns VALUES
('A01', 'KA001434'),
('A02', 'KA148989'),
('A03', 'KA063434'),
('A04', 'KA048938'),
('A05', 'kA054234');

insert into accident values ('r11','2003-01-01','mysore road'),
('r12','2013-02-03','bull temple road'),
('r13','2003-09-03','kanakpura road'),
('r14','2003-03-02','mysore road'),
('r15','2003-07-02','south end circle');
insert into participated values ('A01','KA001434','r11',12000),('A02','KA148989','r12',5000),('A03','KA063434','r13',20000),('A04','KA048938','r14',53000),('A05','kA054234','r15',7000);

update participated set damage_amount = 25000  where reg_num = 'KA048938';
select * from accident;

insert into accident values ('r16','2004-02-01','ring road');

select accident_date,location from accident;
select driver_id from participated where damage_amount >= 25000;