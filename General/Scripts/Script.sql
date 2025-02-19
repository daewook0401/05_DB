-- 한 줄 주석 (ctrl + /)
/* 범위 주석 (ctrl + shift + /) */

/* SQL 실행
 * 1개 실행 : CTRL + ENTER
 * 여러 개 실행 : (블록 지정 후) ALT + X
 * */

ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

/* 사용자 계정 생성 */
/*
DROP USER KH04_KDW CASCADE;
CREATE USER KH04_KDW
IDENTIFIED BY "KH1234";
*/
/*
ALTER USER KH04_KDW
DEFAULT TABLESPACE "USERS"
QUOTA 200M ON "USERS";
*/
ALTER USER KH04_KDW
IDENTIFIED BY "KH1234";

/* 사용자 권한 부여
 * - CONNECT : DB 접속 권한
 * - RESOURCE : 기본 객체 8개 제어 권한
 * - CREATE VIEW : VIEW 객체 생성 권한
 * */


