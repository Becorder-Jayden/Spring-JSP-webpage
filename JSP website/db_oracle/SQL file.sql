
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


-- 시퀀스 생성
CREATE SEQUENCE 시퀀스명;
INCREMENT BY 1
START WITH 1;
--> 1부터 1씩 증가하는 fbidx_seq가 생성

-- 시퀀스 삭제
DROP SEQUENCE 시퀀스명;

-- 시퀀스 삽입
INSERT INTO a_board(BIDX,SUBJECT,CONTENT,WRITER,IP,MIDX) VALUES(bidx_seq.nextval, '열두번째 게시물', '열두번째 내용', '송혜교', '223.92.45.131',10);
SELECT * FROM BULLETINBOARD a ORDER BY fbidx desc;

----



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


--- personalData
-- 테이블 생성
CREATE TABLE personalData (
	mIdx NUMBER NOT null,
	pIdx NUMBER NOT NULL PRIMARY KEY,
	pDate DATE NOT NULL,
	pWeight NUMBER NOT null,
	pContinuous NUMBER NOT null,
	pWeightImg BLOB,
	pMemo VARCHAR2(100)
);

-- 외래키 추가
ALTER TABLE personalData
ADD CONSTRAINT fk_mIdx FOREIGN KEY(mIdx) REFERENCES member(mIdx);


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
-- 테이블 생성
CREATE TABLE groupBoard (
	gbIdx NUMBER NOT NULL PRIMARY key,
	cIdx NUMBER NOT NULL,
	pIdx NUMBER NOT NULL,
	gbTitle VARCHAR2(20) NOT NULL,
	gbWriter VARCHAR2(10) NOT NULL,
	gbContent CLOB NOT null,
	gbWriteTime DATE NOT NULL,
	gbHits NUMBER NOT NULL,
	gbAttendant VARCHAR2(100) NOT NULL,
	gbGoal VARCHAR2(100),
	gbdWriter VARCHAR2(20) NOT NULL,
	gbdMention VARCHAR2(100)
	);

ALTER TABLE groupBoard
ADD CONSTRAINT fk_cIdx FOREIGN KEY(cIdx) REFERENCES crewMaker(cIdx);

ALTER TABLE groupBoard
ADD CONSTRAINT fk_pIdx FOREIGN KEY(pIdx) REFERENCES personalData(pIdx);


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

-- 테이블 확인
SELECT * FROM BULLETINBOARD WHERE fbidx = 1;
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

---- 데이터 테이블 생성 5/19

-- 테이블 삭제
DROP TABLE crewMaker;

-- 데이터 수정
ALTER TABLE member MODIFY memberGender VARCHAR2(2);
ALTER TABLE member MODIFY membergender DEFAULT 'N';

-- 데이터 확인
SELECT * FROM member;

-- 게시판의 m 부터 n번째 글을 가져오기 5/26
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

SELECT COUNT(*) AS cnt from bulletinboard where fbtitle like '%%' and fbcategory = 'all';

SELECT * FROM(SELECT ROWNUM AS rnum, A.* FROM(SELECT * FROM bulletinboard where fbtitle like '%%' and fbcategory = '운동법' ORDER BY fbidx DESC)A) B WHERE rnum BETWEEN 1 AND 20;
SELECT * FROM BULLETINBOARD a;
SELECT * FROM(SELECT ROWNUM AS rnum, A.* FROM(SELECT * FROM bulletinboard where fbtitle like '%%' ORDER BY fbidx DESC)A) B WHERE rnum BETWEEN ? AND ?
SELECT COUNT(*) AS cnt from bulletinboard where fbtitle LIKE '%%' and fbcategory like '%all%';
(pm.getTotalCount()/scri.getPerPageNum()+1);
SELECT * FROM(SELECT ROWNUM AS rnum, A.* FROM(SELECT * FROM bulletinboard where fbtitle like '%%' and fbcategory LIKE 'all' ORDER BY fbidx DESC)A) B ;
SELECT COUNT(*) FROM(SELECT ROWNUM AS rnum, A.* FROM(SELECT * FROM bulletinboard where fbtitle like '%%' and fbcategory like '%all%' ORDER BY fbidx DESC)A) B;
SELECT * FROM(SELECT ROWNUM AS rnum, A.* FROM(SELECT * FROM bulletinboard where fbtitle like '%%' and fbcategory like '%%' ORDER BY fbidx DESC)A) B;
SELECT * FROM BULLETINBOARD a WHERE;
SELECT * FROM(SELECT ROWNUM AS rnum, A.* FROM(SELECT * FROM bulletinboard where fbtitle like ? and fbcategory = ? ORDER BY fbidx DESC)A) B WHERE rnum BETWEEN ? AND ?;
SELECT * FROM(SELECT ROWNUM AS rnum, A.* FROM(SELECT * FROM bulletinboard where fbtitle like '%%' and fbcategory LIKE '%%' ORDER BY fbidx;
SELECT COUNT(*) AS cnt from bulletinboard where fbtitle like '%%' and fbcategory like '%%';
SELECT * FROM(SELECT ROWNUM AS rnum, A.* FROM(SELECT * FROM bulletinboard where fbtitle like '%%' and fbcategory like '%%' ORDER BY fbidx DESC)A) B ;

SELECT * FROM(SELECT ROWNUM AS rnum, A.* FROM(SELECT * FROM bulletinboard where fbtitle like ? and fbcategory like ? ORDER BY fbidx DESC) A) B ;
