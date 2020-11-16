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
		
select * from member2;

create table board2(bbsid number primary key,
			 		bbsTitle varchar2(10) not null,
			 		bbsContent varchar2(100) not null,
			 		bbsAvailable number,
			 		id varchar2(12) not null,
			 		constraints fk foreign key(id)
			 		references member2(id)
			 		)
			 		
CREATE SEQUENCE tmp_seq2 START WITH 1 INCREMENT BY 1  NOCYCLE NOCACHE;
			 		
select * from board2;

			 		
select * from (select rownum rn, bbsid, bbstitle, bbscontent, bbsavailable, id, reg_date_board from (select * from board2 order by bbsid desc)) where rn between 1 and 3; 
			 		
insert into board2 (bbsid, bbstitle, bbscontent, bbsavailable, id, reg_date) select * from board2;
			 		
insert into board2 values(tmp_seq2.nextval, 'a','a',0,'asdf',sysdate);

update board2 set bbstitle=?, bbscontent=?, reg_date_board=sysdate where bbsid=?
update board2 set bbstitle='11', bbscontent='11' where bbsid=119
