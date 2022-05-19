
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




----




-- member 테이블 생성
CREATE TABLE member (
	mIdx NUMBER NOT NULL PRIMARY KEY,
	memberId VARCHAR2(20) NOT NULL,
	memberPassword VARCHAR2(20) NOT null,
	memberEmail VARCHAR2(20) NOT NULL,
	memberName VARCHAR2(20) NOT NULL,
	memberGender CHAR(1) DEFAULT 'N'
);

-- personalData 테이블 생성
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

-- crewMaker 테이블 생성
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

-- groupBoard 테이블 생성
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

-- bulletinBoard 테이블 생성
CREATE TABLE bulletinBoard (
	fbIdx NUMBER NOT NULL PRIMARY KEY,
	mIdx NUMBER NOT NULL,
	fbCategory NUMBER NOT null,
	fbTitle VARCHAR2(20) NOT NULL,
	fbContent CLOB,
	fbWriter VARCHAR2(10) NOT NULL,
	fbWriteDate DATE NOT NULL
);

sALTER TABLE bulletinBoard
ADD CONSTRAINT fk_mIdx3 FOREIGN KEY(mIdx) REFERENCES member(mIdx);

-- faq 테이블 생성
CREATE TABLE faq (
	qbIdx NUMBER NOT NULL PRIMARY KEY,
	qQeustion CLOB NOT NULL,
	qAnswer CLOB NOT NULL
	);

---- 데이터 테이블 생성 5/19

-- 테이블 삭제
DROP TABLE crewMaker;




