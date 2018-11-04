
CREATE TABLE sc_member(
	m_id varchar2(20 char) primary key,
	m_name varchar2(20 char) not null,
	m_pw varchar2(20 char) not null,
	m_zipcode varchar2(500 char) not null, /*우편번호*/
	m_address1 varchar2(1000 char) not null, /*주소*/
	m_address2 varchar2(1000 char) not null, /*상세주소*/
	m_question varchar2(1000 char) not null, /*질문*/
	m_answer varchar2(1000 char) not null, /*답변*/
	m_directory varchar2(1000 char) not null /*고유 디렉토리*/
);

insert into sc_member values('admin','admin','admin','admin','admin','admin','admin','admin','admin');

create table sc_publicboard (
	pb_num number primary key,
	pb_class number not null,
	pb_title varchar2(100 char) not null,
	pb_content varchar2(3000 char),
	pb_file varchar2(300 char),
	pb_writer varchar2(30 char) not null,
	pb_date date not null,
	pb_viewcnt number not null
)

create table sc_reply (
	re_num number primary key,
	re_nonum number not null,
	re_content not null,
	re_writer not null,
	re_date not null
)

create sequence publicboard_seq
	start with 1
	increment BY 1
	nomaxvalue;

create sequence reply_seq
	start with 1
	increment BY 1
	nomaxvalue;
	
	
