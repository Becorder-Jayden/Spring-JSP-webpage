
-- 테이블 생성 --
CREATE TABLE 테이블명 (
	컬럼명 데이터타입 NOT NULL 우선키 등,
	컬럼명 데이터타입 NOT NULL 우선키 등,
	컬럼명 데이터타입 NOT NULL 우선키 등
);

-- 테이블 삭제 --
DROP TABLE 테이블명;

-- 테이블 수정 --
-- 컬럼 데이터 타입, 길이 변경
ALTER TABLE 테이블명 MODIFY 컬럼명 데이터타입(길이);

-- 컬럼 명 변경
ALTER TABLE 테이블명 RENAME COLUMN 이전컬럼명 TO 새로운 컬럼명;

-- null 허용
ALTER TABLE [테이블명] MODIFY ([컬럼명] NULL);

-- 시퀀스 생성
CREATE SEQUENCE 시퀀스명
INCREMENT BY 1
START WITH 1;
--> 1부터 1씩 증가하는 fbidx_seq가 생성

-- 시퀀스 삭제
DROP SEQUENCE 시퀀스명;

-- 시퀀스 삽입, 데이터 추가
INSERT INTO a_board(BIDX,SUBJECT,CONTENT,WRITER,IP,MIDX) VALUES(bidx_seq.nextval, '열두번째 게시물', '열두번째 내용', '송혜교', '223.92.45.131',10);

-- 제약조건 확인: P(기본키), R(외래키), U(유니크키), C(체약조건 ex.NOT NULL), V(뷰에서 체크), O(뷰에서 읽기)
SELECT * FROM all_constraints WHERE constraint_type='R';
----

COMMIT;

--- member
-- 테이블 생성
CREATE TABLE member (
	mIdx NUMBER NOT NULL PRIMARY KEY,
	memberId VARCHAR2(20) NOT NULL,
	memberPassword VARCHAR2(20) NOT null,
	memberEmail VARCHAR2(20) NOT NULL,
	memberName VARCHAR2(20) NOT NULL,
	memberGender CHAR(1) DEFAULT 'N'
);


-- 데이터 컬럼 추가(프로필)
ALTER TABLE member ADD(memberimg VARCHAR2(100));
-- 데이터 컬럼 삭제
ALTER TABLE member DROP COLUMN img;
-- 데이터 추가
UPDATE member SET memberimg = '주펄.png' WHERE midx = 81;

--- personalData
-- 테이블 생성
CREATE TABLE personal (
	mIdx NUMBER NOT null,
	pbIdx NUMBER NOT NULL PRIMARY KEY,
	pbDate DATE dEFAULT SYSDATE NOT null,
	pbWeight NUMBER NOT null,
	pbContinuous NUMBER null,
	pbWeightImg VARCHAR2(100),
	pbMemo VARCHAR2(500)
);

-- 컬럼 추가
ALTER TABLE personal ADD(test int);


SELECT * FROM (SELECT MIDX, PBIDX, PBDATE, PBWEIGHT, pbContinuous, PBWEIGHTIMG, PBMEMO, RANK() OVER(PARTITION BY midx ORDER BY pbidx) pbidx2 FROM personal ORDER BY PBIDX DESC) WHERE midx = 45;
-- 데이터 수정
UPDATE personal SET pbidx2 = (SELECT RANK() OVER(partition BY midx ORDER BY pbidx) FROM personal);


-- 외래키 추가
ALTER TABLE personal
ADD CONSTRAINT fk_mIdx FOREIGN KEY(mIdx) REFERENCES member(mIdx);
-- 외래키 삭제
ALTER TABLE personal DROP constraint fk_midx;
-- 데이터 추가
INSERT INTO personal(midx,pbidx,pbweight,pbcontinuous,pbweightimg,pbmemo)
VALUES (1, pbidx_seq.NEXTVAL, 2,null,null,5);
-- sequence 생성
CREATE SEQUENCE pbidx_seq INCREMENT BY 1 START WITH 1;
-- NULL 수정
ALTER TABLE PERSONAL MODIFY pbcontinuous NULL;
-- 데이터 타입 변경
ALTER TABLE personal MODIFY pbWeight FLOAT(10);
SELECT * FROM personal;
DELETE FROM personal;



--- crewMaker
-- 테이블 생성
CREATE TABLE crewMaker (
	mIdx NUMBER NOT NULL,
	cIdx NUMBER NOT NULL PRIMARY KEY,
	cTitle VARCHAR2(20) NOT null,
	cObjective VARCHAR2(20) NOT NULL,
	cMember VARCHAR2(20) NOT NULL,
	cCapacity NUMBER NOT NULL,
	cPeriod DATE NOT null,
	cMemberYN CHAR(1) DEFAULT 'N'
);

ALTER TABLE crewMaker
ADD CONSTRAINT fk_mIdx2 FOREIGN KEY(mIdx) REFERENCES member(mIdx);


--- groupBoard
-- 테이블 생성 6/3
CREATE TABLE groupboard (
	gbIdx NUMBER NOT NULL PRIMARY KEY,
	gbTitle VARCHAR2(100) NOT null,
	midx NUMBER NOT NULL,
	gbWriter VARCHAR2(20) NOT NULL,
	gbWriteTime DATE NOT NULL,
	gbHit NUMBER,
	gbContent CLOB NOT NULL,

	CONSTRAINT fk_midx4 FOREIGN KEY(midx) REFERENCES member(midx)
	);

CREATE TABLE groupGoal (
	gbIdx NUMBER NOT NULL,
	gGoal VARCHAR2(200) NULL,

 CONSTRAINT fk_gbIdx FOREIGN KEY(gbIdx) REFERENCES groupboard(gbIdx)
 );



--테이블 확인
SELECT * FROM GROUPBOARD ORDER BY GBIDX DESC;
--데이터 삽입
INSERT INTO GROUPBOARD(gbidx, gbtitle, midx, gbwriter, gbwritetime,gbhit,gbcontent)
VALUES(GBIDX_SEQ.NEXTVAL,'gbtitle', 1,'gbwriter',sysdate,1,'gbcontent');
-- 외래키 생성
ALTER TABLE groupboard
ADD CONSTRAINT fk_mIdx4 FOREIGN KEY(mIdx) REFERENCES member(mIdx);
-- 외래키 제거
ALTER TABLE groupboard drop CONSTRAINT fk_midx4;
-- gbidx_seq 생성
CREATE SEQUENCE gbidx_seq INCREMENT BY 1 START WITH 1;
-- 6/2 외래키 설정을 제거하고 계속 진행하면 오류가 발생하나?
-- 기본값 설정
ALTER TABLE groupboard MODIFY gbwritetime DEFAULT SYSDATE;
ALTER TABLE groupboard MODIFY gbhit DEFAULT 0;
ALTER TABLE groupboard MODIFY gbhit NOT NULL;


--- bulletinBoard
-- 테이블 생성
CREATE TABLE bulletinBoard (
	fbIdx NUMBER NOT NULL PRIMARY KEY,
	mIdx NUMBER NOT NULL,
	fbCategory NUMBER NOT null,
	fbTitle VARCHAR2(20) NOT NULL,
	fbContent CLOB,
	fbWriter VARCHAR2(10) NOT NULL,
	fbWriteDate DATE NOT NULL
);

ALTER TABLE bulletinBoard
ADD CONSTRAINT fk_mIdx3 FOREIGN KEY(mIdx) REFERENCES member(mIdx);

ALTER TABLE bulletinboard modify (fbWriteDate DEFAULT sysdate);

INSERT INTO BULLETINBOARD(fbIdx,MIDX,fbCategory,fbTitle,fbContent,fbWriter,fbWriteDate) VALUES(FBIDX_SEQ.NEXTVAL, 42, '운동', '득근방법', '내용', '게시자',SYSDATE);

SELECT * from BULLETINBOARD ORDER BY FBIDX DESC;

-- 시퀀스 추가
INSERT INTO BULLETINBOARD(fbIdx,MIDX,fbCategory,fbTitle,fbContent,fbWriter,fbWriteDate) VALUES(FBIDX_SEQ.NEXTVAL, 42, '카테고리', '제목', '내용', '게시자',SYSDATE);

-- 데이터 열 추가 (이미지)
ALTER TABLE groupboard ADD(img VARCHAR2(100));

-- 데이터 타입 수정: null 허용
ALTER TABLE bulletinboard MODIFY fbWriter NOT NULL;


-- 테이블 확인
SELECT * FROM BULLETINBOARD;
SELECT * FROM bulletinboard WHERE FBCATEGORY = '카테고리';
SELECT COUNT(*) AS cnt FROM BULLETINBOARD WHERE fbtitle LIKE '%제목%' ;
SELECT * FROM BULLETINBOARD WHERE fbcategory LIKE '전체';

--- faq
-- 테이블 생성
CREATE TABLE faq (
	qbIdx NUMBER NOT NULL PRIMARY KEY,
	qQeustion CLOB NOT NULL,
	qAnswer CLOB NOT NULL
	);


--- Comment
CREATE TABLE bulletincomment(
	fbidx NUMBER NOT NULL,
	cmidx NUMBER NOT NULL PRIMARY KEY,
	cmwriter VARCHAR2(10) NOT null,
	cmcomment VARCHAR2(200) NOT NULL
	);

-- 외래키 추가
ALTER TABLE bulletincomment
ADD CONSTRAINT fk_bidx FOREIGN KEY(fbidx) REFERENCES BULLETINBOARD(fbidx);
-- 시퀀스 추가
CREATE SEQUENCE cmidx_seq INCREMENT BY 1 START WITH 1;
-- 데이터 추가
INSERT INTO bulletincomment(FBIDX,CMIDX,CMWRITER,CMCOMMENT,MIDX) VALUES('417', cmidx_seq.NEXTVAL, '댓글작성자', '댓글 내용','3');
-- 테이블 데이터 유형변경
alter TABLE bulletincomment MODIFY cmwriter VARCHAR2(100);
-- 테이블 데이터 컬럼 추가
alter TABLE bulletincomment ADD(midx number);
-- 테이블 확인
SELECT * FROM BULLETINCOMMENT ;
-- 데이터 삭제
DELETE FROM bulletincomment WHERE midx IS NULL;



-- 테이블 삭제
DROP TABLE crewMaker;

-- 데이터 수정
ALTER TABLE member MODIFY memberGender VARCHAR2(2);
ALTER TABLE member MODIFY membergender DEFAULT 'N';


-- 데이터 확인
SELECT * FROM member;

-- 게시판의 m 부터 n번째 글을 가져오기
SELECT * FROM
	(SELECT ROWNUM AS rnum, A.* FROM
		(SELECT * FROM a_board WHERE delyn='N' ORDER BY originbidx DESC, depth ASC)
	 A)
 B WHERE rnum BETWEEN 4 AND 10;

SELECT * FROM
	(SELECT ROWNUM AS rnum, a.* FROM
		(SELECT * FROM BULLETINBOARD ORDER BY FBIDX DESC)
	a)
b;












--커밋
COMMIT;

INSERT INTO BULLETINBOARD(FBIDX,MIDX,FBCATEGORY,FBTITLE,FBCONTENT,FBWRITER,FILENAME) values(fbidx_seq.nextval, ?,?,?,?,?,?);
SELECT * FROM BULLETINBOARD ;
SELECT * FROM BULLETINBOARD ORDER BY FBIDX desc;
SELECT * FROM member;
COMMIT;

SELECT * FROM (SELECT MIDX, PBIDX, PBDATE, PBWEIGHT, pbContinuous, PBWEIGHTIMG, PBMEMO, RANK() OVER(PARTITION BY midx ORDER BY pbidx) pbidx2 FROM personal ORDER BY PBIDX DESC) WHERE midx = 45 AND pbidx2 = 5;
SELECT * FROM (SELECT MIDX, PBIDX, PBDATE, PPERSONALBWEIGHT, pbContinuous, PBWEIGHTIMG, PBMEMO, RANK() OVER(PARTITION BY midx ORDER BY pbidx) pbidx2 FROM personal ORDER BY PBIDX DESC) WHERE midx = 45;

SELECT * FROM bulletinboard ORDER BY FBIDX DESC;
SELECT * FROM bulletincomment WHERE fbIdx=417 ORDER BY cmidx DESC;
SELECT * FROM BULLETINCOMMENT WHERE FBIDX = 418 ORDER BY CMIDX DESC;
DELETE bulletincomment WHERE cmidx = 64;
SELECT * FROM BULLETINBOARD a ORDER BY a.FBIDX DESC;
DELETE FROM BULLETINBOARD WHERE fbcategory IS NULL;
ALTER TABLE bulletinBoard MODIFY fbcategory NOT NULL;

select count(*) as cnt from a_board where delyn='N';
select * from groupboard WHERE gbidx = 53;
SELECT * FROM groupboard ORDER BY GBIDX desc;
UPDATE GROUPboard SET gbhit = gbhit + 1 WHERE gbidx = 55;
update groupboard set gbhit = gbhit+1 where gbidx = 54;

SELECT * FROM BULLETINBOARD ORDER BY fbIdx DESC;
DELETE FROM BULLETINBOARD WHERE fbidx = 486;

SELECT * FROM member;
SELECT * FROM(SELECT ROWNUM AS rnum, A.* FROM(SELECT * FROM bulletinboard  where fbtitle like '%%' and fbcategory like '%%' AND fbidx = '482' ORDER BY fbidx DESC)A) B;
SELECT * FROM(SELECT ROWNUM AS rnum, A.* FROM(SELECT * FROM bulletinboard  where fbtitle like '%%' and fbcategory like '%%' AND fbwriter = '3' ORDER BY fbidx DESC)A) B;