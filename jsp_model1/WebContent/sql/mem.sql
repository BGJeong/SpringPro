create table mem (mem_idx number(10) primary key, /* pk */
				mem_uid varchar2(100) unique,	  /* user id*/
				mem_email varchar2(100) unique,	  /* email */
				mem_passwd varchar2(32) not null, /* passwd */
				mem_status char(2) not null,	  /* Y:정상, N:탈퇴*/
				mem_cert char(2) not null,		  /* Y:인증, N:비인증 */
				mem_uname varchar2(20) not null,  /* 이름(비실명제는 닉네임과일치) */
				mem_nickname varchar2(20) not null,/*닉네임*/
				mem_gender char(3) not null, 	   /* 성별 */
				mem_regtime date not null,		   /* 가입 일시*/	
				mem_logtim date,				   /* 마지막 접속 일시*/
				mem_is_super char(2) not null)     /* 관리자 권한*/
				
create sequence mem_seq start with 1 increment by 1; /* mem_idx 자동증가 시퀀스*/
create sequence brd_seq start with 1 increment by 1;
select * from mem;

create table board(boardid number primary key,
    boardtitle varchar2(50),
    boardcontent varchar2(1000),
    boardavailable number,
    mem_uid varchar2(100) references mem(mem_uid),
    reg_date_board date);

select * from board;
