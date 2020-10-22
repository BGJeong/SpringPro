show databases;

create table customer(id int(4) auto_increment primary key, 
		       name varchar(20),
		       email varchar(20),
		       tel varchar(20),
		       address varchar(50),
		       reg_date timestamp);

		       
create table board(
	no int auto_increment primary key,
	writer varchar(20) not null,
    passwd varchar(20) not null,
	subject varchar(100) not null,
	content varchar(1000) not null,
	reg_date timestamp );
	
select * from board;

insert into board (writer, passwd, subject, content, reg_date) values('보길','1234','1234','1234',sysdate());


select count(*) from board;

select * from board ;
select * from board order by no desc limit 0, 5;

insert into board (writer, passwd, subject, content, reg_date)
select writer, passwd, subject, content, reg_date
from board

