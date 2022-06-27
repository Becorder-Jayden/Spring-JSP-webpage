CREATE SEQUENCE uidx_seq
	START WITH 1
	INCREMENT BY 1;

CREATE SEQUENCE nidx_seq
	START WITH 1
	INCREMENT BY 1;

CREATE SEQUENCE bidx_seq
	START WITH 1
	INCREMENT BY 1;


CREATE TABLE storyBoardUser (
	uidx INT NOT NULL PRIMARY KEY,
	id VARCHAR2(100) NOT NULL,
	PASSWORD VARCHAR2(100) NOT NULL,
	NAME VARCHAR2(100) NOT NULL,	email VARCHAR2(100) NOT NULL,

	phone VARCHAR2(100) NOT NULL,
	address VARCHAR2(100) NOT NULL
);

INSERT INTO storyBoardUser(uidx, id, PASSWORD, NAME, email, phone, address)
VALUES(UIDX_SEQ.NEXTVAL, 'hello', 'world', 'kim', 'helloworld@gmail.com', '010-1234-6789', '전주시 덕진구 이젠 컴퓨터 학원');

SELECT * FROM STORYBOARDUSER ORDER BY UIDX desc;
DELETE FROM STORYBOARDUSER;

COMMIT;

CREATE TABLE noticeboard (
	nidx INT NOT NULL PRIMARY KEY,
	ntitle VARCHAR2(100) NOT NULL,
	ncontent VARCHAR2(500) NOT NULL,
	nwriter VARCHAR2(100) NOT NULL,
 	nwriteday VARCHAR2(100) NOT null,
 	nhit INT NOT NULL
 	);

INSERT INTO noticeboard(nidx, ntitle, ncontent, nwriter, nwriteday, nhit)
VALUES(nidx_seq.NEXTVAL, '제목1', '내용1', '작성자1', TO_CHAR(SYSDATE,'yyyy-mm-dd hh:mm:ss'), 0);

		SELECT nidx, ntitle, nwriter, nwriteday, nhit
		FROM noticeboard
		ORDER BY nidx DESC;
COMMIT;
DROP TABLE NOTICEBOARD;

		SELECT *
		FROM noticeboard;

CREATE TABLE bulletin_board(
	bidx INT NOT NULL PRIMARY key,
	btitle VARCHAR2(100) NOT NULL,
	bwriter VARCHAR2(100) NOT null,
	bwriteday VARCHAR2(100) NOT null,
	bhit INT NOT null
	);

INSERT INTO BULLETIN_BOARD(bidx, btitle, bwriter, bwriteday, bhit)
VALUES (FIDX_SEQ.NEXTVAL, '제목','작성자',TO_CHAR(SYSDATE,'yyyy-mm-dd'), 0);

		SELECT nidx,
				ntitle,
				nwriter,
				ncontent,
				nwriteday,
				nhit
		FROM noticeboard
		WHERE nwriter = '작성자3';

