-- member
create table member (
	midx int not null auto_increment primary key,
	memberid varchar(50) not null,
	memberpassword varchar(50) not null,
	memberemail varchar(50) not null,
	membername varchar(20) not null,
	membergender varchar(1) default 'N' not null,
	memberimg varchar(100)
);
select * from member;
insert into member(memberid,memberpassword,memberemail,membername,membergender,memberimg)
values('아이디1','패스워드1','이메일1','이름','F',null);

-- personal
create table personal (
	midx int not null,
	pbidx int not null primary key auto_increment,
	pbdate datetime default current_timestamp,
	pbweight float not null,
	pbweightimg varchar(100),
	pbmemo varchar(500),
	foreign key(midx) references member(midx)
);

insert into personal(midx,pbweight,pbweightimg,pbmemo)
values(4,75,'이미지1',null);
select * from personal;

-- 외래키 추가
select * from bulletinboard;
insert into bulletinboard(midx,fbcategory,fbtitle,fbcontent,fbwriter,filename)
values(2,'전체','제목1','내용1','작성자1',null);


-- bulletinboard
create table bulletinboard (
	fbidx int not null primary key auto_increment,
	midx int not null,
	fbcategory varchar(20) not null,
	fbtitle varchar(200) not null,
	fbcontent text not null,
	fbwriter varchar(20) not null,
	fbwritedate datetime default current_timestamp,
	filename varchar(100),
	foreign key(midx) references member(midx)
);
select * from bulletinboard;
drop table bulletinboard;

-- fbidx auto_increment 설정
alter table bulletinboard drop primary key;	-- 기존에 기본키가 등록되어 있으면 기본키 제거 후 추가해야 한다
alter table bulletinboard modify fbidx int not null auto_increment primary key first;

insert into bulletinboard(midx,fbcategory,fbtitle,fbcontent,fbwriter,filename)
values(4,'전체','제목1','내용1','작성자1',null);
select * from bulletinboard;


-- bulletincomment
create table bulletincomment (
	fbidx int not null,
	cmidx int not null primary key auto_increment,
	cmwriter varchar(50) not null,
	cmcomment varchar(200) not null,
	midx int not null,
	foreign key(fbidx) references bulletinboard(fbidx),
	foreign key(midx) references member(midx)
);
insert into bulletincomment(fbidx,cmwriter,cmcomment,midx)
values(1,'작성자1','댓글1',4);
select * from bulletincomment;

-- groupboard
create table groupboard (
	gbidx int not null primary key auto_increment,
	gbtitle varchar(200) not null,
	midx int not null,
	gbwriter varchar(20) not null,
	gbwritetime datetime default current_timestamp,
	gbhit int not null,
	gbcontent text not null,
	gbimg varchar(100),
	foreign key(midx) references member(midx)
);
insert into groupboard(gbtitle,midx,gbwriter,gbhit,gbcontent,gbimg)
values('제목1',4,'게시자1',0,'내용1',null);
select * from groupboard;

-- groupgoal
create table groupgoal (
	gbidx int not null,
	ggoal varchar(200),
	foreign key(gbidx) references groupboard(gbidx)
);
insert into groupgoal(gbidx, ggoal)
values(1,'화이팅1');

select * from groupgoal;
drop table groupgoal;

-- faq
create table faq (
	qbidx int not null primary key auto_increment,
	qquestion text not null,
	qanswer text not null
);
insert into faq(qquestion, qanswer)
value('질문1', '답장1');
select * from faq;
delete from faq where qbidx = 27;

-- bulletinboard rownum 열 사용
set @rownum:=0;
select @rownum:=@rownum+1, a.* from bulletinboard a;

-- groupboard rownum 열 사용
set @rownum:=0;
select * from (select @rownum:=@rownum+1 as rnum, a.* from (select * from groupboard order by gbidx desc)a )b where rnum between 1 and 10;


create table crew (
	midx int not null,
	cidx int not null primary key AUTO_INCREMENT,
	cName varchar(200) not null,
	cGoal varchar(400),
	cPersonnel varchar(400) not null,
	cDateStart date default CURRENT_DATE,
	cDateEnd DATE,
);









--
SELECT * FROM personal WHERE midx = 4;
SELECT MIDX, PBIDX, PBDATE, PBWEIGHT, PBWEIGHTIMG, PBMEMO, RANK() OVER(PARTITION BY midx ORDER BY pbidx) pbidx2 FROM personal ORDER BY PBIDX DESC;
SELECT * FROM(SELECT @rownum:=@rownum+1 AS rnum, A.* FROM(SELECT * FROM bulletinboard) A) B;
SELECT * FROM(SELECT @rownum:=@rownum+1 AS rnum, A.* FROM(SELECT * FROM bulletinboard where fbcategory like ?  and fbtitle like ? ORDER BY fbidx DESC)A) B WHERE rnum limit 1 AND 10;
SELECT * FROM(SELECT @rownum:=@rownum+1 AS rnum, A.* FROM(SELECT * FROM bulletinboard ORDER BY fbidx DESC)A) BWHERE rnum limit 1, 20;
select * from bulletinboard b order by fbidx DESC;
set @rownum:=0;
select * from (select @rownum:=@rownum+1 as rnum, a.* from (select * from groupboard order by gbidx desc)a )b where rnum between 1 and 10;
select * from groupboard order by gbidx desc;
select * from crew;