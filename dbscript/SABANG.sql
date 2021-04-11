-- 기존 테이블 삭제
DROP TABLE TBL_USER CASCADE CONSTRAINTS;
DROP TABLE TBL_USER_DOCUMENT CASCADE CONSTRAINTS;
DROP TABLE TBL_PICK_ROOM CASCADE CONSTRAINTS;
DROP TABLE ROOM CASCADE CONSTRAINTS;
DROP TABLE ROOM_FILE CASCADE CONSTRAINTS;
DROP TABLE ROOM_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE OFFICE CASCADE CONSTRAINTS;
DROP TABLE OFFICE_DOCUMENT CASCADE CONSTRAINTS;
DROP TABLE TRANSACTION_LIST CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE REPORT CASCADE CONSTRAINTS;
DROP TABLE REPORT_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE FREE_BOARD CASCADE CONSTRAINTS;
DROP TABLE FREE_BOARD_FILE CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE PAYMENT_LIST CASCADE CONSTRAINTS;
DROP TABLE MEMBERSHIP CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE CONNECT_STATISTIC CASCADE CONSTRAINTS;
DROP TABLE ROOM_STATISTIC CASCADE CONSTRAINTS;
DROP TABLE INFO_BOARD CASCADE CONSTRAINTS;
DROP TABLE INFO_BOARD_FILE CASCADE CONSTRAINTS;
DROP TABLE INFO_CATEGORY CASCADE CONSTRAINTS;

-- 기존 시퀀스 삭제
DROP SEQUENCE SEQ_USER_NO;
DROP SEQUENCE SEQ_ROOM_NO;
DROP SEQUENCE SEQ_POST_NO;

-- 시퀀스 생성
CREATE SEQUENCE SEQ_USER_NO;
CREATE SEQUENCE SEQ_ROOM_NO;
CREATE SEQUENCE SEQ_POST_NO;

-- 테이블 생성
----------------------------------------------------------------- 회원관련

-- TBL_USER 테이블 생성
CREATE TABLE TBL_USER (
  USER_NO NUMBER CONSTRAINT PK_U_USER_NO PRIMARY KEY,
  USER_ID VARCHAR2(20) CONSTRAINT NN_U_USER_ID NOT NULL,
  USER_PWD VARCHAR2(255) CONSTRAINT NN_U_USER_PWD NOT NULL,
  NICKNAME	VARCHAR2(255) CONSTRAINT NN_U_NICKNAME NOT NULL,
  EMAIL	VARCHAR2(50) CONSTRAINT NN_U_EMAIL NOT NULL,
  PHONE VARCHAR2(20) CONSTRAINT NN_U_PHONE NOT NULL,
  USER_ROLE VARCHAR2(15) DEFAULT 'MEMBER' CONSTRAINT NN_U_USER_ROLE NOT NULL,
  APPLY_DATE DATE,
  APPROVAL_YN CHAR(1),
  ENROLL_DATE DATE,
  USER_STATUS VARCHAR2(2),
  CONSTRAINT UK_U_USER_ID UNIQUE(USER_ID),
  CONSTRAINT UK_U_EMAIL UNIQUE(EMAIL),
  CONSTRAINT UK_U_PHONE UNIQUE(PHONE),
  CONSTRAINT CK_U_USER_ROLE CHECK(USER_ROLE IN ('MEMBER', 'OFFICE', 'ADMIN')),
  CONSTRAINT CK_U_APPROVAL_YN CHECK(APPROVAL_YN IN ('Y', 'N'))
);

COMMENT ON COLUMN TBL_USER.USER_NO IS '회원번호';
COMMENT ON COLUMN TBL_USER.USER_ID IS '아이디';
COMMENT ON COLUMN TBL_USER.USER_PWD IS '비밀번호';
COMMENT ON COLUMN TBL_USER.NICKNAME IS '닉네임';
COMMENT ON COLUMN TBL_USER.EMAIL IS '이메일';
COMMENT ON COLUMN TBL_USER.PHONE IS '전화번호';
COMMENT ON COLUMN TBL_USER.USER_ROLE IS '회원구분';
COMMENT ON COLUMN TBL_USER.APPLY_DATE IS '가입신청일';
COMMENT ON COLUMN TBL_USER.APPROVAL_YN IS '승인여부';
COMMENT ON COLUMN TBL_USER.ENROLL_DATE IS '회원등록일';
COMMENT ON COLUMN TBL_USER.USER_STATUS IS '회원상태';

-- 관리자 계정 추가 (!! 비밀번호 암호화 필요 !!)
INSERT INTO TBL_USER (USER_NO, USER_ID, USER_PWD, NICKNAME, EMAIL, PHONE, USER_ROLE)
VALUES (SEQ_USER_NO.NEXTVAL, 'admin', 'admin', '관리자', 'admin@sabangpalbang.com', '01048884888', 'ADMIN');


-- 회원 샘플 추가 (!! 비밀번호 암호화 필요 !!)
INSERT INTO TBL_USER (USER_NO, USER_ID, USER_PWD, NICKNAME, EMAIL, PHONE, ENROLL_DATE, USER_STATUS)
VALUES (SEQ_USER_NO.NEXTVAL, 'yoo', '123', '유코딩', 'yoo@sabang.com', '01011111111', TO_DATE('21/03/08', 'RR/MM/DD'), 'Y');
INSERT INTO TBL_USER (USER_NO, USER_ID, USER_PWD, NICKNAME, EMAIL, PHONE, ENROLL_DATE, USER_STATUS)
VALUES (SEQ_USER_NO.NEXTVAL, 'min', '123', '민코딩', 'min@sabang.com', '01022222222', TO_DATE('21/03/08', 'RR/MM/DD'), 'Y');
INSERT INTO TBL_USER (USER_NO, USER_ID, USER_PWD, NICKNAME, EMAIL, PHONE, ENROLL_DATE, USER_STATUS)
VALUES (SEQ_USER_NO.NEXTVAL, 'kim', '123', '김코딩', 'kim@sabang.com', '01033333333', TO_DATE('21/03/14', 'RR/MM/DD'), 'Y');
INSERT INTO TBL_USER (USER_NO, USER_ID, USER_PWD, NICKNAME, EMAIL, PHONE, ENROLL_DATE, USER_STATUS)
VALUES (SEQ_USER_NO.NEXTVAL, 'lee', '123', '이코딩', 'lee@sabang.com', '01044444444', TO_DATE('21/03/19', 'RR/MM/DD'), 'Y');
INSERT INTO TBL_USER (USER_NO, USER_ID, USER_PWD, NICKNAME, EMAIL, PHONE, ENROLL_DATE, USER_STATUS)
VALUES (SEQ_USER_NO.NEXTVAL, 'yoon', '123', '윤코딩', 'yoon@sabang.com', '01055555555', TO_DATE('21/03/21', 'RR/MM/DD'), 'Y');
INSERT INTO TBL_USER (USER_NO, USER_ID, USER_PWD, NICKNAME, EMAIL, PHONE, ENROLL_DATE, USER_STATUS)
VALUES (SEQ_USER_NO.NEXTVAL, 'park', '123', '박코딩', 'park@sabang.com', '01066666666', TO_DATE('21/03/27', 'RR/MM/DD'), 'Y');
INSERT INTO TBL_USER (USER_NO, USER_ID, USER_PWD, NICKNAME, EMAIL, PHONE, ENROLL_DATE, USER_STATUS)
VALUES (SEQ_USER_NO.NEXTVAL, 'choi', '123', '최코딩', 'choi@sabang.com', '01077777777', TO_DATE('21/03/29', 'RR/MM/DD'), 'Y');
INSERT INTO TBL_USER (USER_NO, USER_ID, USER_PWD, NICKNAME, EMAIL, PHONE, ENROLL_DATE, USER_STATUS)
VALUES (SEQ_USER_NO.NEXTVAL, 'jin', '123', '진코딩', 'jin@sabang.com', '01088888888', TO_DATE('21/04/03', 'RR/MM/DD'), 'Y');
INSERT INTO TBL_USER (USER_NO, USER_ID, USER_PWD, NICKNAME, EMAIL, PHONE, ENROLL_DATE, USER_STATUS)
VALUES (SEQ_USER_NO.NEXTVAL, 'han', '123', '한코딩', 'han@sabang.com', '01099999999', TO_DATE('21/04/06', 'RR/MM/DD'), 'Y');
INSERT INTO TBL_USER (USER_NO, USER_ID, USER_PWD, NICKNAME, EMAIL, PHONE, ENROLL_DATE, USER_STATUS)
VALUES (SEQ_USER_NO.NEXTVAL, 'jeong', '123', '정코딩', 'jeong@sabang.com', '01012341234', TO_DATE('21/04/08', 'RR/MM/DD'), 'Y');

-- 중개사 회원 샘플 추가 (!! 비밀번호 암호화 필요 !!)
INSERT INTO TBL_USER (USER_NO, USER_ID, USER_PWD, NICKNAME, EMAIL, PHONE, USER_ROLE, APPLY_DATE, APPROVAL_YN, ENROLL_DATE, USER_STATUS)
VALUES (SEQ_USER_NO.NEXTVAL, 'office1', '123', '나문휘', 'nmh@sabang.com', '01012345678', 'OFFICE', TO_DATE('21/04/03', 'RR/MM/DD'), 'Y', TO_DATE('21/04/05', 'RR/MM/DD'), 'Y');
INSERT INTO TBL_USER (USER_NO, USER_ID, USER_PWD, NICKNAME, EMAIL, PHONE, USER_ROLE, APPLY_DATE)
VALUES (SEQ_USER_NO.NEXTVAL, 'office2', '123', '공지철', '0ji@sabang.com', '01012340000', 'OFFICE', TO_DATE('21/04/05', 'RR/MM/DD'));

COMMIT;

-------------------------------------------------------------------- 매물관련


-- 매물_카테고리
CREATE TABLE ROOM_CATEGORY(
  CATEGORY_NO NUMBER CONSTRAINT PK_CATEGORY_NO PRIMARY KEY,
  CATEGORY_NAME VARCHAR2(50) CONSTRAINT NN_CATEGORY_NAME NOT NULL
);
COMMENT ON COLUMN ROOM_CATEGORY.CATEGORY_NO IS '카테고리번호';
COMMENT ON COLUMN ROOM_CATEGORY.CATEGORY_NAME IS '카테고리이름';




---------- 중개사무소 ----------
CREATE TABLE OFFICE (
  OFFICE_NO	NUMBER CONSTRAINT PK_OFFICE_NO PRIMARY KEY,
  OFFICE_NAME VARCHAR2(50) CONSTRAINT NN_OFFICE_NAME NOT NULL,
  OFFICE_ADDR VARCHAR2(100) CONSTRAINT NN_OFFICE_ADDR NOT NULL,
  OFFICE_PHONE	VARCHAR2(20) CONSTRAINT NN_OFFICE_PHONE NOT NULL,
  BUSINESS_NO NUMBER  CONSTRAINT NN_BUSINESS_NO NOT NULL,
  OFFICE_RATING NUMBER,
  USER_NO NUMBER CONSTRAINT NN_OF_USER_NO NOT NULL,
  CONSTRAINT UK_OFFICE_PHONE UNIQUE (OFFICE_PHONE),
  CONSTRAINT UK_BUSINESS_NO UNIQUE (BUSINESS_NO),
  CONSTRAINT FK_OF_USER_NO FOREIGN KEY (USER_NO) REFERENCES TBL_USER (USER_NO),
  CONSTRAINT UK_OF_USER_NO UNIQUE (USER_NO)
);

COMMENT ON COLUMN OFFICE.OFFICE_NO IS '사무소번호';
COMMENT ON COLUMN OFFICE.OFFICE_NAME IS '사무소이름';
COMMENT ON COLUMN OFFICE.OFFICE_ADDR IS '사무소주소';
COMMENT ON COLUMN OFFICE.OFFICE_PHONE IS '사무소전화번호';
COMMENT ON COLUMN OFFICE.BUSINESS_NO IS '사업자등록번호';
COMMENT ON COLUMN OFFICE.OFFICE_RATING IS '평점';
COMMENT ON COLUMN OFFICE.USER_NO IS '대표중개사';

--------- 가입서류 ---------
CREATE TABLE OFFICE_DOCUMENT (
  FILE_NO NUMBER CONSTRAINT NN_OD_FILE_NO NOT NULL,
  OFFICE_NO NUMBER CONSTRAINT NN_OD_OFFICE_NO NOT NULL,
  ORIGIN_NAME VARCHAR2(50) CONSTRAINT NN_OD_ORIGIN_NAME NOT NULL,
  SAVE_NAME VARCHAR2(50) CONSTRAINT NN_OD_SAVE_NAME NOT NULL,
  EXTENSION VARCHAR2(50) CONSTRAINT NN_OD_EXTENSION NOT NULL,
  CONTENT VARCHAR2(50),
  SAVE_PATH VARCHAR2(100) CONSTRAINT NN_OD_SAVE_PATH NOT NULL,
  CONSTRAINT PK_FILE_NO_AND_OFFICE_NO PRIMARY KEY (FILE_NO, OFFICE_NO),
  CONSTRAINT FK_OD_OFFICE_NO FOREIGN KEY (OFFICE_NO) REFERENCES OFFICE (OFFICE_NO)
);

COMMENT ON COLUMN OFFICE_DOCUMENT.FILE_NO IS '파일번호';
COMMENT ON COLUMN OFFICE_DOCUMENT.OFFICE_NO IS '사무소번호';
COMMENT ON COLUMN OFFICE_DOCUMENT.ORIGIN_NAME IS '원본파일명';
COMMENT ON COLUMN OFFICE_DOCUMENT.SAVE_NAME IS '저장파일명';
COMMENT ON COLUMN OFFICE_DOCUMENT.EXTENSION IS '파일확장자';
COMMENT ON COLUMN OFFICE_DOCUMENT.CONTENT IS '파일내용';
COMMENT ON COLUMN OFFICE_DOCUMENT.SAVE_PATH IS '저장경로';


-- 매물_기본정보
CREATE TABLE ROOM(
  ROOM_NO NUMBER CONSTRAINT PK_RM_ROOM_NO PRIMARY KEY,
  ROOM_PRICE NUMBER CONSTRAINT NN_RM_ROOM_PRICE NOT NULL,
  ROOM_STATUS CHAR(1) DEFAULT 'Y',
  EXCLUSIVE_AREA NUMBER CONSTRAINT NN_RM_EXCLUSIVE_AREA NOT NULL,
  ADDRESS VARCHAR2(255) CONSTRAINT NN_RM_ADDRESS NOT NULL,
  CREATE_DATE DATE DEFAULT SYSDATE,
  CATEGORY_NO NUMBER CONSTRAINT NN_RM_CATEGORY_NO NOT NULL,
  OFFICE_NO NUMBER CONSTRAINT NN_RM_OFFICE_NO NOT NULL,
  ROOM_FLOOR VARCHAR2(50) CONSTRAINT NN_RM_ROOM_FLOOR NOT NULL,
  DIRECTION VARCHAR2(50) CONSTRAINT NN_RM_DIRECTION NOT NULL,
  MONTH_COST NUMBER CONSTRAINT NN_RM_MONTH_COST NOT NULL,
  COST_INCLUDE VARCHAR2(100) CONSTRAINT NN_RM_COST_INCLUDE NOT NULL,
  CONSTRUCTION_DATE DATE CONSTRAINT NN_RM_CONSTRUCTION_DATE NOT NULL,
  AVAILABLE_DATE DATE CONSTRAINT NN_RM_AVAILABLE_DATE NOT NULL,
  ROOM_EXPLANATION VARCHAR2(4000) CONSTRAINT NN_RM_ROOM_EXPLANATION NOT NULL,
  SUBWAY_INFO VARCHAR2(255) CONSTRAINT NN_RM_SUBWAY_INFO NOT NULL,
  BUS_INFO VARCHAR2(255) CONSTRAINT NN_RM_BUS_INFO NOT NULL,
  WASHING_MACHINE_YN CHAR(1) DEFAULT 'N',
  REFRIGERATOR_YN CHAR(1) DEFAULT 'N',
  AIR_CONDITIONER_YN CHAR(1) DEFAULT 'N',
  GAS_STOVE_YN CHAR(1) DEFAULT 'N',
  PET_YN CHAR(1) DEFAULT 'N',
  ELEVATOR_YN CHAR(1) DEFAULT 'N',
  PARKING_YN CHAR(1) DEFAULT 'N',
  VIEW_NO NUMBER DEFAULT 0,

  CONSTRAINT CK_RM_ROOM_STATUS CHECK(ROOM_STATUS IN ('Y', 'N')),
  CONSTRAINT CK_RM_WASHING_MACHINE_YN CHECK(WASHING_MACHINE_YN IN ('Y', 'N')),
  CONSTRAINT CK_RM_REFRIGERATOR_YN CHECK(REFRIGERATOR_YN IN ('Y', 'N')),
  CONSTRAINT CK_RM_AIR_CONDITIONER_YN CHECK(AIR_CONDITIONER_YN IN ('Y', 'N')),
  CONSTRAINT CK_RM_GAS_STOVE_YN CHECK(GAS_STOVE_YN IN ('Y', 'N')),
  CONSTRAINT CK_RM_PET_YN CHECK(PET_YN IN ('Y', 'N')),
  CONSTRAINT CK_RM_ELEVATOR_YN CHECK(ELEVATOR_YN IN ('Y', 'N')),
  CONSTRAINT CK_RM_PARKING_YN CHECK(PARKING_YN IN ('Y', 'N')),
  CONSTRAINT FK_RM_CATEGORY_NO FOREIGN KEY (CATEGORY_NO) REFERENCES ROOM_CATEGORY(CATEGORY_NO),
  CONSTRAINT FK_RM_OFFICE_NO FOREIGN KEY (OFFICE_NO) REFERENCES OFFICE(OFFICE_NO)
);

  COMMENT ON COLUMN ROOM.ROOM_NO IS '매물코드';
  COMMENT ON COLUMN ROOM.ROOM_PRICE IS '매물가격';
  COMMENT ON COLUMN ROOM.ROOM_STATUS IS '매물상태';
  COMMENT ON COLUMN ROOM.EXCLUSIVE_AREA IS '전용면적';
  COMMENT ON COLUMN ROOM.ADDRESS IS '주소';
  COMMENT ON COLUMN ROOM.CREATE_DATE IS '등록일시';
  COMMENT ON COLUMN ROOM.CATEGORY_NO IS '매물카테고리';
  COMMENT ON COLUMN ROOM.OFFICE_NO IS '사무소코드';
  COMMENT ON COLUMN ROOM.ROOM_FLOOR IS '층정보';
  COMMENT ON COLUMN ROOM.DIRECTION IS '방향';
  COMMENT ON COLUMN ROOM.MONTH_COST IS '월관리비';
  COMMENT ON COLUMN ROOM.COST_INCLUDE IS '관리비포함항목';
  COMMENT ON COLUMN ROOM.CONSTRUCTION_DATE IS '준공날짜';
  COMMENT ON COLUMN ROOM.AVAILABLE_DATE IS '입주가능일';
  COMMENT ON COLUMN ROOM.ROOM_EXPLANATION IS '매물상세설명';
  COMMENT ON COLUMN ROOM.SUBWAY_INFO IS '지하철정보';
  COMMENT ON COLUMN ROOM.BUS_INFO IS '버스정보';
  COMMENT ON COLUMN ROOM.WASHING_MACHINE_YN IS '세탁기';
  COMMENT ON COLUMN ROOM.REFRIGERATOR_YN IS '냉장고';
  COMMENT ON COLUMN ROOM.AIR_CONDITIONER_YN IS '에어컨';
  COMMENT ON COLUMN ROOM.GAS_STOVE_YN IS '인덕션/가스레인지';
  COMMENT ON COLUMN ROOM.PET_YN IS '반려동물';
  COMMENT ON COLUMN ROOM.ELEVATOR_YN IS '엘레베이터유무';
  COMMENT ON COLUMN ROOM.PARKING_YN IS '주차가능여부';
  COMMENT ON COLUMN ROOM.VIEW_NO IS '조회수';

--매물첨부파일--
CREATE TABLE ROOM_FILE(
  FILE_NO NUMBER,
  ROOM_NO NUMBER,
  ORIGIN_NAME VARCHAR2(50),
  SAVE_NAME VARCHAR2(100),
  EXTENSION VARCHAR2(50),
  CONTENT VARCHAR2(50),
  SAVE_PATH VARCHAR2(100),
  CONSTRAINT PK_FILE_NO_AND_ROOM_NO PRIMARY KEY (FILE_NO, ROOM_NO),
  CONSTRAINT FK_RF_ROOM_NO FOREIGN KEY (ROOM_NO) REFERENCES ROOM (ROOM_NO)
);
  COMMENT ON COLUMN ROOM_FILE.FILE_NO IS '파일번호';
  COMMENT ON COLUMN ROOM_FILE.ROOM_NO IS '매물코드';
  COMMENT ON COLUMN ROOM_FILE.ORIGIN_NAME IS '원본파일명';
  COMMENT ON COLUMN ROOM_FILE.SAVE_NAME IS '저장파일명';
  COMMENT ON COLUMN ROOM_FILE.EXTENSION IS '파일확장자';
  COMMENT ON COLUMN ROOM_FILE.CONTENT IS '파일내용';
  COMMENT ON COLUMN ROOM_FILE.SAVE_PATH IS '저장경로';


---------- 서류보관 ----------
CREATE TABLE TBL_USER_DOCUMENT (
  FILE_NO NUMBER,
  USER_NO NUMBER,
  ORIGIN_NAME VARCHAR2(50) CONSTRAINT NN_UD_ORIGIN_NAME NOT NULL,
  SAVE_NAME VARCHAR2(100) CONSTRAINT NN_UD_SAVE_NAME NOT NULL,
  EXTENSION VARCHAR2(50) CONSTRAINT NN_UD_EXTENSION NOT NULL,
  CONTENT VARCHAR2(50),
  REGISTER_DATE DATE CONSTRAINT NN_UD_REGISTER_DATE NOT NULL,
  ROOM_NO NUMBER CONSTRAINT NN_UD_ROOM_NO NOT NULL,
  SAVE_PATH VARCHAR2(100) CONSTRAINT NN_UD_SAVE_PATH NOT NULL,
  CONSTRAINT PK_FILE_NO_AND_USER_NO PRIMARY KEY(FILE_NO, USER_NO),
  CONSTRAINT FK_USER_NO FOREIGN KEY(USER_NO) REFERENCES TBL_USER (USER_NO),
  CONSTRAINT FK_ROOM_NO FOREIGN KEY(ROOM_NO) REFERENCES ROOM (ROOM_NO)
);

COMMENT ON COLUMN TBL_USER_DOCUMENT.FILE_NO IS '파일번호';
COMMENT ON COLUMN TBL_USER_DOCUMENT.USER_NO IS '회원번호';
COMMENT ON COLUMN TBL_USER_DOCUMENT.ORIGIN_NAME IS '원본파일명';
COMMENT ON COLUMN TBL_USER_DOCUMENT.SAVE_NAME IS '저장파일명';
COMMENT ON COLUMN TBL_USER_DOCUMENT.EXTENSION IS '파일확장자';
COMMENT ON COLUMN TBL_USER_DOCUMENT.CONTENT IS '파일내용';
COMMENT ON COLUMN TBL_USER_DOCUMENT.REGISTER_DATE IS '등록일시';
COMMENT ON COLUMN TBL_USER_DOCUMENT.ROOM_NO IS '매물코드';
COMMENT ON COLUMN TBL_USER_DOCUMENT.SAVE_PATH IS '저장경로';


-------- 찜한 매물 -------
CREATE TABLE TBL_PICK_ROOM (
  USER_NO NUMBER,
  ROOM_NO NUMBER,
  CONSTRAINT PK_PR_USER_NO_AND_ROOM_NO PRIMARY KEY(USER_NO, ROOM_NO),
  CONSTRAINT FK_PR_USER_NO FOREIGN KEY(USER_NO) REFERENCES TBL_USER (USER_NO),
  CONSTRAINT FK_PR_ROOM_NO FOREIGN KEY(ROOM_NO) REFERENCES ROOM (ROOM_NO)
);

COMMENT ON COLUMN TBL_PICK_ROOM.USER_NO IS '회원번호';
COMMENT ON COLUMN TBL_PICK_ROOM.ROOM_NO IS '매물코드';

------------------------------------------------------------------ 중개사무소 / 리뷰 / 신고

-------------- 거래내역 ----------------
CREATE TABLE TRANSACTION_LIST (
  ROOM_NO NUMBER CONSTRAINT PK_TL_ROOM_NO PRIMARY KEY,
  USER_NO NUMBER CONSTRAINT NN_TL_USER_NO NOT NULL,
  OFFICE_NO	NUMBER CONSTRAINT NN_TL_OFFICE_NO NOT NULL,
  TRANSACTION_DATE DATE,
  CONSTRAINT FK_TL_ROOM_NO FOREIGN KEY(ROOM_NO) REFERENCES ROOM (ROOM_NO),
  CONSTRAINT FK_TL_USER_NO FOREIGN KEY(USER_NO) REFERENCES TBL_USER (USER_NO),
  CONSTRAINT FK_TL_OFFICE_NO FOREIGN KEY(OFFICE_NO) REFERENCES OFFICE (OFFICE_NO)
);

COMMENT ON COLUMN TRANSACTION_LIST.ROOM_NO IS '매물코드';
COMMENT ON COLUMN TRANSACTION_LIST.USER_NO IS '회원번호';
COMMENT ON COLUMN TRANSACTION_LIST.OFFICE_NO IS '사무소번호';
COMMENT ON COLUMN TRANSACTION_LIST.TRANSACTION_DATE IS '거래일자';

----------- 리뷰 -----------
CREATE TABLE REVIEW (
  REVIEW_NO NUMBER CONSTRAINT PK_REVIEW_NO PRIMARY KEY,
  RATING NUMBER CONSTRAINT NN_RATING NOT NULL,
  REVIEW_CONTENT VARCHAR2(150) CONSTRAINT NN_REVIEW_CONNECT NOT NULL,
  OFFICE_NO NUMBER CONSTRAINT NN_RV_OFFICE_NO NOT NULL,
  USER_NO NUMBER CONSTRAINT NN_RV_USER_NO NOT NULL,
  CREATION_DATE DATE CONSTRAINT NN_CREATION_DATE NOT NULL,
  CONSTRAINT FK_RV_OFFICE_NO FOREIGN KEY(OFFICE_NO) REFERENCES OFFICE (OFFICE_NO),
  CONSTRAINT FK_RV_USER_NO FOREIGN KEY(USER_NO) REFERENCES TBL_USER (USER_NO)
);

COMMENT ON COLUMN REVIEW.REVIEW_NO IS '리뷰번호';
COMMENT ON COLUMN REVIEW.RATING IS '평점';
COMMENT ON COLUMN REVIEW.REVIEW_CONTENT IS '리뷰내용';
COMMENT ON COLUMN REVIEW.OFFICE_NO IS '사무소번호';
COMMENT ON COLUMN REVIEW.USER_NO IS '작성자';
COMMENT ON COLUMN REVIEW.CREATION_DATE IS '작성일자';

------------ 신고카테고리 -------------
CREATE TABLE REPORT_CATEGORY (
  CATEGORY_NO NUMBER CONSTRAINT PK_RC_CATEGORY_NO PRIMARY KEY,
  CATEGORY_NAME	VARCHAR2(100) CONSTRAINT NN_RC_CATEGORY_NAME NOT NULL
);

COMMENT ON COLUMN REPORT_CATEGORY.CATEGORY_NO IS '신고카테고리';
COMMENT ON COLUMN REPORT_CATEGORY.CATEGORY_NAME IS '신고내용';
---------- 신고 ------------
CREATE TABLE REPORT (
  REPORT_NO	NUMBER CONSTRAINT PK_REPORT_NO PRIMARY KEY,
  CATEGORY_NO NUMBER CONSTRAINT NN_RP_CATEGORY_NO NOT NULL,
  USER_NO NUMBER CONSTRAINT NN_RP_USER_NO NOT NULL,
  ROOM_NO NUMBER CONSTRAINT NN_RP_ROOM_NO NOT NULL,
  OFFICE_NO	NUMBER CONSTRAINT NN_RP_OFFICE_NO NOT NULL,
  REPORT_CONTENT VARCHAR2(500) CONSTRAINT NN_REPORT_CONTENT NOT NULL,
  APPROVAL_YN CHAR(1) DEFAULT 'N' CONSTRAINT NN_RP_APPROVAL_YN NOT NULL,
  CONSTRAINT FK_RP_CATEGORY_NO FOREIGN KEY (CATEGORY_NO) REFERENCES REPORT_CATEGORY (CATEGORY_NO),
  CONSTRAINT FK_RP_USER_NO FOREIGN KEY (USER_NO) REFERENCES TBL_USER (USER_NO),
  CONSTRAINT FK_RP_ROOM_NO FOREIGN KEY (ROOM_NO) REFERENCES ROOM (ROOM_NO),
  CONSTRAINT FK_RP_OFFICE_NO FOREIGN KEY (OFFICE_NO) REFERENCES OFFICE (OFFICE_NO),
  CONSTRAINT CK_RP_APPROVAL_YN CHECK (APPROVAL_YN IN ('Y','N'))
);

COMMENT ON COLUMN REPORT.REPORT_NO IS '신고번호';
COMMENT ON COLUMN REPORT.CATEGORY_NO IS '신고카테고리';
COMMENT ON COLUMN REPORT.USER_NO IS '회원번호';
COMMENT ON COLUMN REPORT.ROOM_NO IS '매물코드';
COMMENT ON COLUMN REPORT.OFFICE_NO IS '사무소번호';
COMMENT ON COLUMN REPORT.REPORT_CONTENT IS '신고상세내용';
COMMENT ON COLUMN REPORT.APPROVAL_YN IS '승인여부';


---------------------------------------------------------- 자유게시판

----- 자유게시판 ------
CREATE TABLE FREE_BOARD(
  POST_NO NUMBER CONSTRAINT PK_FB_POST_NO PRIMARY KEY,
  POST_TITLE VARCHAR2(50) CONSTRAINT NN_FB_POST_TITLE NOT NULL,
  POST_CONTENT VARCHAR2(500) CONSTRAINT NN_FB_POST_CONTENT NOT NULL,
  VIEW_NO NUMBER DEFAULT 0,
  CREATION_DATE	DATE CONSTRAINT NN_FB_CREATION_DATE NOT NULL,
  MODIFICATION_DATE	DATE,
  REPORT_COUNT NUMBER DEFAULT 0,
  VIEW_YN CHAR(1) DEFAULT 'Y',
  USER_NO NUMBER CONSTRAINT NN_FB_USER_NO NOT NULL,
  CONSTRAINT FK_FB_USER_NO FOREIGN KEY (USER_NO) REFERENCES TBL_USER (USER_NO)
);

COMMENT ON COLUMN FREE_BOARD.POST_NO IS '게시물번호';
COMMENT ON COLUMN FREE_BOARD.POST_TITLE IS '게시물제목';
COMMENT ON COLUMN FREE_BOARD.POST_CONTENT IS '게시물내용';
COMMENT ON COLUMN FREE_BOARD.VIEW_NO IS '조회수';
COMMENT ON COLUMN FREE_BOARD.CREATION_DATE IS '작성일자';
COMMENT ON COLUMN FREE_BOARD.MODIFICATION_DATE IS '수정일자';
COMMENT ON COLUMN FREE_BOARD.REPORT_COUNT IS '신고건수';
COMMENT ON COLUMN FREE_BOARD.VIEW_YN IS '노출여부';
COMMENT ON COLUMN FREE_BOARD.USER_NO IS '작성자';

-- 자유게시판 샘플 추가 --
INSERT INTO FREE_BOARD (POST_NO, POST_TITLE, POST_CONTENT, CREATION_DATE, USER_NO)
VALUES (SEQ_POST_NO.NEXTVAL, '점메추해~~~~', '점심메뉴 추천해줘!!!', TO_DATE('21/03/08', 'RR/MM/DD'), 5);
INSERT INTO FREE_BOARD (POST_NO, POST_TITLE, POST_CONTENT, CREATION_DATE, USER_NO)
VALUES (SEQ_POST_NO.NEXTVAL, '아 배고프다.... 점심시간 언제오냐', '메뉴도 쌀국수로 이미 정해놨는데 시간이 너무 안감;;', TO_DATE('21/03/08', 'RR/MM/DD'), 4);
INSERT INTO FREE_BOARD (POST_NO, POST_TITLE, POST_CONTENT, CREATION_DATE, USER_NO)
VALUES (SEQ_POST_NO.NEXTVAL, '우리집 강아지 보고가라.', '너넨 강아지 없지?ㅋㅋ', TO_DATE('21/03/10', 'RR/MM/DD'), 5);
INSERT INTO FREE_BOARD (POST_NO, POST_TITLE, POST_CONTENT, CREATION_DATE, USER_NO)
VALUES (SEQ_POST_NO.NEXTVAL, '방구들아 평균 한달 생활비 얼마나 듦?', '나 혼자 사는데 한 달에 100만원 넘게 나옴', TO_DATE('21/03/12', 'RR/MM/DD'), 5);
INSERT INTO FREE_BOARD (POST_NO, POST_TITLE, POST_CONTENT, CREATION_DATE, USER_NO)
VALUES (SEQ_POST_NO.NEXTVAL, '중소청전세대출 받은 사람 나 물어볼 거 있음', '서류 준비할 때 시간 얼마나 촉박했어?', TO_DATE('21/03/12', 'RR/MM/DD'), 5);
INSERT INTO FREE_BOARD (POST_NO, POST_TITLE, POST_CONTENT, CREATION_DATE, USER_NO)
VALUES (SEQ_POST_NO.NEXTVAL, '전세집 권태기 극복하는 방법', '6개월 정도에 한 번씩은 집 인테리어 구조 싹 바꾸면 ㄹㅇ 새로 이사 온 기분들고 좋음 ㅋㅋ', TO_DATE('21/03/14', 'RR/MM/DD'), 5);
INSERT INTO FREE_BOARD (POST_NO, POST_TITLE, POST_CONTENT, CREATION_DATE, USER_NO)
VALUES (SEQ_POST_NO.NEXTVAL, '야근하고 이제 퇴근한다.', '개발자되면 좋을줄만 알았지.... 수료하면 내 세상이 될 줄 알았지...ㅎ', TO_DATE('21/03/15', 'RR/MM/DD'), 5);
INSERT INTO FREE_BOARD (POST_NO, POST_TITLE, POST_CONTENT, CREATION_DATE, USER_NO)
VALUES (SEQ_POST_NO.NEXTVAL, '신림역 근처 맛집 추천 좀', '점심메뉴 추천해줘!!!', TO_DATE('21/04/03', 'RR/MM/DD'), 5);
INSERT INTO FREE_BOARD (POST_NO, POST_TITLE, POST_CONTENT, CREATION_DATE, USER_NO)
VALUES (SEQ_POST_NO.NEXTVAL, '나 큰일났음 낼 이사인데 아직도 못 자는 중;;', '진짜 너무 설레서 잠 못자겠어.... 첫 자취인데 꿀팁 좀 알려줄 수 있을까 방구들아??', TO_DATE('21/04/03', 'RR/MM/DD'), 5);
INSERT INTO FREE_BOARD (POST_NO, POST_TITLE, POST_CONTENT, CREATION_DATE, USER_NO)
VALUES (SEQ_POST_NO.NEXTVAL, '니네 야식 뭐 먹었냐?', '난 불닭에 주먹밥!', TO_DATE('21/04/03', 'RR/MM/DD'), 5);
INSERT INTO FREE_BOARD (POST_NO, POST_TITLE, POST_CONTENT, CREATION_DATE, USER_NO)
VALUES (SEQ_POST_NO.NEXTVAL, '우리집 인테리어 봐줄 사람 ㅋㅋㅋ', '카페아님 ^^', TO_DATE('21/04/03', 'RR/MM/DD'), 5);
INSERT INTO FREE_BOARD (POST_NO, POST_TITLE, POST_CONTENT, CREATION_DATE, USER_NO)
VALUES (SEQ_POST_NO.NEXTVAL, '방구들아 이거 집주인이 잘못한 거 맞지?', '어쨌든 집주인이 잘못한거임', TO_DATE('21/04/08', 'RR/MM/DD'), 1);

-- 자유게시판 첨부파일
CREATE TABLE FREE_BOARD_FILE(
  FILE_NO NUMBER,
  POST_NO NUMBER,
  ORIGIN_NAME VARCHAR2(50) CONSTRAINT NN_ORIGIN_NAME NOT NULL,
  SAVE_NAME VARCHAR2(50) CONSTRAINT NN_SAVE_NAME NOT NULL,
  EXTENSION	VARCHAR2(50) CONSTRAINT NN_EXTENSION NOT NULL,
  CONTENT VARCHAR2(50),
  SAVE_PATH	VARCHAR2(100) CONSTRAINT NN_SAVE_PATH NOT NULL,
  CONSTRAINT PK_FILE_NO_AND_POST_NO PRIMARY KEY (FILE_NO, POST_NO),
  CONSTRAINT FK_POST_NO FOREIGN KEY (POST_NO) REFERENCES FREE_BOARD (POST_NO)
);

COMMENT ON COLUMN FREE_BOARD_FILE.FILE_NO IS '파일번호';
COMMENT ON COLUMN FREE_BOARD_FILE.POST_NO IS '게시물번호';
COMMENT ON COLUMN FREE_BOARD_FILE.ORIGIN_NAME IS '원본파일명';
COMMENT ON COLUMN FREE_BOARD_FILE.SAVE_NAME IS '저장파일명';
COMMENT ON COLUMN FREE_BOARD_FILE.EXTENSION IS '파일확장자';
COMMENT ON COLUMN FREE_BOARD_FILE.CONTENT IS '파일내용';
COMMENT ON COLUMN FREE_BOARD_FILE.SAVE_PATH IS '저장경로';

-- 댓글
CREATE TABLE REPLY(
  REPLY_NO NUMBER,
  POST_NO NUMBER,
  REPLY_CONTENT VARCHAR2(30) CONSTRAINT NN_REPLY_CONTENT NOT NULL,
  CREATION_DATE	DATE CONSTRAINT NN_RE_CREATION_DATE NOT NULL,
  MODIFICATION_DATE	DATE,
  REPORT_COUNT NUMBER,
  VIEW_YN CHAR(1) DEFAULT 'Y' CONSTRAINT NN_RE_VIEW_YN NOT NULL,
  USER_NO NUMBER CONSTRAINT NN_RE_USER_NO NOT NULL,
  CONSTRAINT PK_REPLY_NO_AND_POST_NO PRIMARY KEY (REPLY_NO, POST_NO),
  CONSTRAINT FK_RE_USER_NO FOREIGN KEY (USER_NO) REFERENCES TBL_USER (USER_NO)
);

COMMENT ON COLUMN REPLY.REPLY_NO IS '댓글번호';
COMMENT ON COLUMN REPLY.POST_NO IS '게시물번호';
COMMENT ON COLUMN REPLY.REPLY_CONTENT IS '댓글내용';
COMMENT ON COLUMN REPLY.CREATION_DATE IS '작성일자';
COMMENT ON COLUMN REPLY.MODIFICATION_DATE IS '수정일자';
COMMENT ON COLUMN REPLY.REPORT_COUNT IS '신고건수';
COMMENT ON COLUMN REPLY.VIEW_YN IS '노출여부';
COMMENT ON COLUMN REPLY.USER_NO IS '작성자';

-- 이용권
CREATE TABLE MEMBERSHIP(
  MEMBERSHIP_NO NUMBER CONSTRAINT PK_MEMBERSHIP_NO PRIMARY KEY,
  MEMBERSHIP_NAME VARCHAR2(50) CONSTRAINT NN_MEMBERSHIP_NAME NOT NULL,
  MEMBERSHIP_PRICE NUMBER CONSTRAINT NN_MEMBERSHIP_PRICE NOT NULL,
  MEMBERSHIP_PERIOD	NUMBER CONSTRAINT NN_MEMBERSHIP_PERIOD NOT NULL
);

COMMENT ON COLUMN MEMBERSHIP.MEMBERSHIP_NO IS '이용권코드';
COMMENT ON COLUMN MEMBERSHIP.MEMBERSHIP_NAME IS '이용권이름';
COMMENT ON COLUMN MEMBERSHIP.MEMBERSHIP_PRICE IS '이용권가격';
COMMENT ON COLUMN MEMBERSHIP.MEMBERSHIP_PERIOD IS '이용권기간';

-- 결제내역
CREATE TABLE PAYMENT_LIST(
  PAYMENT_NO NUMBER	CONSTRAINT PK_PAYMENT_NO PRIMARY KEY,
  EXPIRATION_DATE DATE CONSTRAINT NN_EXPIRATION_DATE NOT NULL,
  PAYMENT_DATE DATE CONSTRAINT NN_PAYMENT_DATE NOT NULL,
  MEMBERSHIP_NO	NUMBER CONSTRAINT NN_MEMBERSHIP_NO NOT NULL,
  USER_NO NUMBER CONSTRAINT NN_USER_NO NOT NULL,
  CONSTRAINT FK_MEMBERSHIP_NO FOREIGN KEY (MEMBERSHIP_NO) REFERENCES MEMBERSHIP (MEMBERSHIP_NO),
  CONSTRAINT FK_PL_USER_NO FOREIGN KEY (USER_NO) REFERENCES TBL_USER (USER_NO)
);

COMMENT ON COLUMN PAYMENT_LIST.PAYMENT_NO IS '결제번호';
COMMENT ON COLUMN PAYMENT_LIST.EXPIRATION_DATE IS '유효기간';
COMMENT ON COLUMN PAYMENT_LIST.PAYMENT_DATE IS '결제일';
COMMENT ON COLUMN PAYMENT_LIST.MEMBERSHIP_NO IS '이용권코드';
COMMENT ON COLUMN PAYMENT_LIST.USER_NO IS '회원번호';

-------------------------------------------------------------------------- 공지, 정보, 통계


CREATE TABLE NOTICE(
  NOTICE_NO NUMBER CONSTRAINT PK_NOTICE_NO PRIMARY KEY,
  VIEW_NO NUMBER,
  CREATION_DATE DATE CONSTRAINT NN_NT_CREATION_DATE NOT NULL,
  MODIFICATION_DATE DATE,
  USER_NO NUMBER CONSTRAINT NN_NT_USER_NO NOT NULL,
  TITLE VARCHAR2(50) CONSTRAINT NN_NT_TITLE NOT NULL,
  CONTENT VARCHAR2(500) CONSTRAINT NN_NT_CONTENT NOT NULL,
  CONSTRAINT FK_NT_USER_NO FOREIGN KEY (USER_NO) REFERENCES TBL_USER (USER_NO)
);

COMMENT ON COLUMN NOTICE.NOTICE_NO IS '공지사항번호';
COMMENT ON COLUMN NOTICE.VIEW_NO IS '조회수';
COMMENT ON COLUMN NOTICE.CREATION_DATE IS '작성일자';
COMMENT ON COLUMN NOTICE.MODIFICATION_DATE IS '수정일자';
COMMENT ON COLUMN NOTICE.USER_NO IS '작성자';
COMMENT ON COLUMN NOTICE.TITLE IS '글제목';
COMMENT ON COLUMN NOTICE.CONTENT IS '글내용';



CREATE TABLE CONNECT_STATISTIC(
  CONNECT_DATE DATE CONSTRAINT PK_CONNECT_DATE PRIMARY KEY,
  CONNECT_COUNT NUMBER
);

COMMENT ON COLUMN CONNECT_STATISTIC.CONNECT_DATE IS '접속일자';
COMMENT ON COLUMN CONNECT_STATISTIC.CONNECT_COUNT IS '접속자수';



CREATE TABLE ROOM_STATISTIC(
  ROOM_REGISTER_DATE NUMBER CONSTRAINT PK_ROOM_REGISTER_DATE PRIMARY KEY,
  ROOM_COUNT NUMBER
);

COMMENT ON COLUMN ROOM_STATISTIC.ROOM_REGISTER_DATE IS '등록일자';
COMMENT ON COLUMN ROOM_STATISTIC.ROOM_COUNT IS '매물등록수';


CREATE TABLE INFO_CATEGORY(
  CATEGORY_NO NUMBER CONSTRAINT PK_IC_CATEGORY_NO PRIMARY KEY,
  CATEGORY_NAME   VARCHAR2(50) CONSTRAINT NN_IC_CATEGORY_NAME NOT NULL
);

COMMENT ON COLUMN INFO_CATEGORY.CATEGORY_NO IS '카테고리번호';
COMMENT ON COLUMN INFO_CATEGORY.CATEGORY_NAME IS '카테고리이름';

CREATE TABLE INFO_BOARD(
  POST_NO NUMBER CONSTRAINT PK_POST_NO PRIMARY KEY,
  POST_TITLE VARCHAR2(50) CONSTRAINT NN_IB_POST_TITLE NOT NULL,
  POST_CONTENT VARCHAR2(500) CONSTRAINT NN_IB_POST_CONTENT NOT NULL,
  VIEW_NO NUMBER,
  CREATION_DATE   DATE CONSTRAINT NN_IB_CREATION_DATE NOT NULL,
  MODIFICATION_DATE   DATE,
  CATEGORY_NO NUMBER CONSTRAINT NN_IB_CATEGORY_NO NOT NULL,
  USER_NO NUMBER CONSTRAINT NN_IB_USER_NO NOT NULL,
  CONSTRAINT FK_IB_CATEGORY_NO FOREIGN KEY (CATEGORY_NO) REFERENCES INFO_CATEGORY (CATEGORY_NO),
  CONSTRAINT FK_IB_USER_NO FOREIGN KEY (USER_NO) REFERENCES TBL_USER (USER_NO)
);

COMMENT ON COLUMN INFO_BOARD.POST_NO IS '정보게시물번호';
COMMENT ON COLUMN INFO_BOARD.POST_TITLE IS '게시물제목';
COMMENT ON COLUMN INFO_BOARD.POST_CONTENT IS '게시물내용';
COMMENT ON COLUMN INFO_BOARD.VIEW_NO IS '조회수';
COMMENT ON COLUMN INFO_BOARD.CREATION_DATE IS '작성일자';
COMMENT ON COLUMN INFO_BOARD.MODIFICATION_DATE IS '수정일자';
COMMENT ON COLUMN INFO_BOARD.CATEGORY_NO IS '카테고리번호';
COMMENT ON COLUMN INFO_BOARD.USER_NO IS '회원번호';

CREATE TABLE INFO_BOARD_FILE(
  FILE_NO NUMBER,
  POST_NO NUMBER,
  ORIGIN_NAME VARCHAR2(50) CONSTRAINT NN_IBF_ORIGIN_NAME NOT NULL,
  SAVE_NAME   VARCHAR2(50) CONSTRAINT NN_IBF_SAVE_NAME NOT NULL,
  EXTENSION   VARCHAR2(50) CONSTRAINT NN_IBF_EXTENSION NOT NULL,
  CONTENT VARCHAR2(50),
  SAVE_PATH   VARCHAR2(100) CONSTRAINT NN_IBF_SAVE_PATH NOT NULL,
  CONSTRAINT PK_IBF_FILE_NO_AND_POST_NO PRIMARY KEY(FILE_NO, POST_NO),
  CONSTRAINT FK_IBF_POST_NO FOREIGN KEY (POST_NO) REFERENCES INFO_BOARD (POST_NO)
);

COMMENT ON COLUMN INFO_BOARD_FILE.FILE_NO IS '파일번호';
COMMENT ON COLUMN INFO_BOARD_FILE.POST_NO IS '정보게시물번호';
COMMENT ON COLUMN INFO_BOARD_FILE.ORIGIN_NAME IS '원본파일명';
COMMENT ON COLUMN INFO_BOARD_FILE.SAVE_NAME IS '저장파일명';
COMMENT ON COLUMN INFO_BOARD_FILE.EXTENSION IS '파일확장자';
COMMENT ON COLUMN INFO_BOARD_FILE.CONTENT IS '파일내용';
COMMENT ON COLUMN INFO_BOARD_FILE.SAVE_PATH IS '저장경로';
COMMENT ON COLUMN INFO_BOARD_FILE.FILE_NO IS '파일번호';