-- DDL, DML, DCL 학습하기
-- DDL: 테이블 수정 : CREATE, ALTER, DROP,
-- DML: 데이터 조작 : INSERT, UPDATE, DELETE, SELECT
-- DCL: 실행 : COMMIT, ROLLBACK -> MYSQL은 자동 COMIT이 실행된다. ROLLBACK 기능은 없음

-- DDL 연습
CREATE TABLE 이름 (
	컬럼1 데이터타입 NULL여부 주요키나 제약조건 기본값,
	컬럼1 데이터타입 NULL여부 주요키나 제약조건 기본값,
	컬럼1 데이터타입 NULL여부 주요키나 제약조건 기본값
);

-- a_member table 생성하기
CREATE TABLE a_member (
midx int NOT NULL AUTO_INCREMENT PRIMARY KEY,
memberid VARCHAR(20) NOT null,
memberpwd VARCHAR(20) NOT null,
membername VARCHAR(20) NOT null,
memberemail VARCHAR(20) null,
membergender CHAR(4) null,
memberaddr VARCHAR(100) null,
memberphone VARCHAR(15) null,
memberjumin VARCHAR(15) NOT null,
memberhobby VARCHAR(10) NULL,
writeday DATETIME DEFAULT NOW(),
memberip VARCHAR(20) NULL,
delyn CHAR(1) DEFAULT 'N'
);

-- ORACLE VS MYSQL
--	VARCHAR2 -> VARCHAR
--	SEQUENCE -> AUTO_INCREMENT : 컬럼의 값 자동 증가
--	DATE, SYSTDATE -> DATETIME, NOW()
--	nvl(컬럼, 0) -> if null() : null 처리
--	substr(컬럼, 2, 1) -> substring(컬럼, 2, 1)

-- 데이터 삽입하기
INSERT INTO 테이블 이름(컬럼1, 컬럼2, 컬럼3 ...) VALUES(데이터1, 데이터2, 데이터3 ...);

INSERT INTO A_MEMBER(memberid,memberpwd,membername,memberemail,membergender,memberaddr,memberphone,memberjumin,memberhobby)
VALUES('test', '1111', '홍길동', 'test@naver.com','M', '전주', '010-1111-2222', '111111-2222222', '축구');
INSERT INTO A_MEMBER(memberid,memberpwd,membername,memberemail,membergender,memberaddr,memberphone,memberjumin,memberhobby)
VALUES('test2', '2222', '홍길서', 'test@naver.com','F', '서울', '010-2222-3333', '222222-3333333', '농구');

-- null 처리
select ifnull(memberip,0) from a_member;

-- 회원 이름 중에 '서'라는 글자가 포함된 회원번호를 출력하시오
select midx, membername from a_member where membername like '%서%';
select midx, membername from a_member where membername like concat('%','서','%');

-- 문자열 자르기
select substring(membername,2,1) from a_member;
select left(membername,2) from a_member;	-- only MYSQL
select right(membername,2) from a_member;	-- only MYSQL