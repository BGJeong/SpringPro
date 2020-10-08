select * from CUSTOMER;
select * from seq;
desc customer
delete from customer;
alter table customer add(address varchar2(50));

alter table customer add(reg_date timestamp);

create sequence customer_no_seq
	start with 1
	increment by 1;
	
create table mem01(name  varchar2(20),
	   email  varchar2(20),
	   phone  varchar2(20));
	   
select * from mem01

create table member(name varchar2(20),
		    gender varchar2(10),
		    jumin1 varchar2(6),
                               jumin2 varchar2(7),
		    address varchar2(100),
		    buseo  varchar2(20),
                              sports varchar2(20),
                              music varchar2(20),
                              movie varchar2(20),
		    computer varchar2(20),
		    intro varchar2(1000)
		  );

select * from member;

create  table  mem02(id  varchar2(20)  primary key,
		  passwd  varchar2(20),
		  name  varchar2(20),
		  reg_date  date);
		  

		  
create table board(
	no number primary key,
	writer varchar2(20) not null,
    passwd varchar2(20) not null,
	subject varchar2(100) not null,
	content varchar2(1000) not null,
	reg_date timestamp );

	
create sequence board_seq
start with 1
increment by 1;
	
select * from board
	
		  
		  
		  
		  
		  
		  
