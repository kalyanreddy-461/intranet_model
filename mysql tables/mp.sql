use xyz;
create table x1(name varchar(30),email varchar(30),userid int(30) primary key,password varchar(30),unique (name));
create table chat(name varchar(30), time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,msg varchar(500)not null);
create table Profile(userid int(30)not null,name varchar(30),phno numeric(30) not null,address varchar(50)not null,pic blob,foreign key(userid)references x1(userid),foreign key(name) references x1(name));
create table announcement(userid int(30),name varchar(30),annou varchar(30),Venue varchar(30),date varchar(30));
create table Notify(userid int(30),announce int(10),chatno int(10),assign int(30) default 0);
select *from x1;
select*from chat;
select * from Profile;
drop table user;
create table user(userid int(30),name varchar(30),email varchar(30),salary int(30) default 10000,position varchar(30) default 'fresher', foreign key(userid)references x1(userid),foreign key(name) references x1(name)); 
insert into user values(105,'sasank','sasank@gmail.com',25000,'manager');
select * from announcement;
select *from Notify;
delete from x1 where userid=109;
CREATE TABLE filetbl (
`id` bigint(20) NOT NULL auto_increment,
fileName varchar(30),
`fileBody` text,
`filedate` datetime  NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ;
drop table filetbl;
select * from filetbl;
select * from Profile;
select* from user;
create table attend(userid int(30),login_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);
create table attend1(userid int(30)unique,logout_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP  ,active varchar(30));
create table calend(userid int(30),date DATE ,value int(30) default -1);
select *from attend;
select *from attend1;
select * from (Profile natural join attend)natural join attend1 ;
select *from calend;
select * from chat;
create table Assign(userid int(30),assign_name varchar(30),assign varchar(30) default 'unknown',msg varchar(30) default 'none',given_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP); 
insert into Assign (userid,assign_name)values(101,'project2');
select * from Assign;
drop table Assign;
drop table notify;