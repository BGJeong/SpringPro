select * from tab;

create  table  member2( id varchar2(12) primary key,
                               passwd varchar2(12) not null,
			name varchar2(10) not null,
			jumin1 varchar2(6) not null,
			jumin2 varchar2(7) not null,
			email varchar2(30),
			blog varchar2(50),
			reg_date date not null);


insert into member2 values ('a','b','c','d','e','f','g',sysdate);
		
select * from board2;

insert into board2 values(tmp_seq2.nextval, 'aa','bb',0,'asdf', sysdate)
