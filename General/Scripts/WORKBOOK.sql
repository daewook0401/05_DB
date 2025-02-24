/* BASIC */
--1번
SELECT 
	DEPARTMENT_NAME AS "학과 명",
	CATEGORY AS "계열"
FROM
	TB_DEPARTMENT;

--2번
SELECT
	DEPARTMENT_NAME || '의 정원은 ' || CAPACITY || '명 입니다.' AS "학과별 정원"
FROM
	TB_DEPARTMENT;

-- 3번
SELECT
	STUDENT_NAME
FROM
	TB_STUDENT
WHERE
	DEPARTMENT_NO = 001
AND
	SUBSTR(STUDENT_SSN,8,1) = 2
AND
	ABSENCE_YN = 'Y';

-- 4번
SELECT
 STUDENT_NAME
FROM
	TB_STUDENT
WHERE
	STUDENT_NO = 'A513079' OR
	STUDENT_NO = 'A031341' OR
	STUDENT_NO = 'A513091' OR
	STUDENT_NO = 'A513110' OR
	STUDENT_NO = 'A513119';

--A513079, A513090, A513091, A513110, A513119


-- 5번
SELECT
	DEPARTMENT_NAME, CATEGORY
FROM
	TB_DEPARTMENT
WHERE
	CAPACITY>=20 AND CAPACITY<=30;


-- 6번
SELECT
	PROFESSOR_NAME
FROM
	TB_PROFESSOR
WHERE
	DEPARTMENT_NO IS NULL;

-- 7번
SELECT
	CLASS_NO
FROM
	TB_CLASS
WHERE
	PREATTENDING_CLASS_NO IS NOT NULL;

-- 8번
SELECT
	DISTINCT CATEGORY
FROM
	TB_DEPARTMENT;

-- 9번
SELECT
	STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM
	TB_STUDENT
WHERE
	ABSENCE_YN = 'N' AND
	EXTRACT(YEAR FROM ENTRANCE_DATE) = 2002 AND
	STUDENT_ADDRESS LIKE '전주%'


/* FUNCTION */

-- 1번
SELECT
	STUDENT_NO 학번,
	STUDENT_NAME 이름,
	TO_CHAR(ENTRANCE_DATE, 'YYYY-MM-DD') AS "입학년도"
FROM
	TB_STUDENT
WHERE
	DEPARTMENT_NO = 002
ORDER BY
	ENTRANCE_DATE ASC;


-- 2번
SELECT
	PROFESSOR_NAME,PROFESSOR_SSN
FROM
	TB_PROFESSOR
WHERE
	LENGTH(PROFESSOR_NAME) != 3;


-- 3번
SELECT
	PROFESSOR_NAME 교수이름,
	FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE('19' || SUBSTR(PROFESSOR_SSN,1,6) , 'YYYY.MM.DD')) /12) 나이
FROM
	TB_PROFESSOR
WHERE
	SUBSTR(PROFESSOR_SSN,8,1)=1
ORDER BY
	PROFESSOR_SSN DESC;

-- 4번
SELECT
	SUBSTR(PROFESSOR_NAME, 2) 이름
FROM
	TB_PROFESSOR;

-- 5번
SELECT
	STUDENT_NO,
	STUDENT_NAME
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) - LPAD(SUBSTR(STUDENT_SSN, 1, 2),4,'19')>19;


-- 6번
SELECT
	STUDENT_NO,
	STUDENT_NAME
FROM TB_STUDENT
WHERE
	SUBSTR(STUDENT_NO, 1, 1) != 'A';



-- 7번
SELECT
	ROUND(AVG(POINT),1) 평점
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';

-- 8번
SELECT
	*
FROM TB_DEPARTMENT;

SELECT
*
FROM TB_STUDENT;

SELECT
	DEPARTMENT_NO "학과번호", COUNT(DEPARTMENT_NO) "학생수(명)"
FROM
	TB_STUDENT
GROUP BY
	DEPARTMENT_NO
ORDER BY
	DEPARTMENT_NO ASC;


-- 9번
SELECT
	COUNT(*)
FROM
	TB_STUDENT
WHERE
	COACH_PROFESSOR_NO IS NULL
GROUP BY
	COACH_PROFESSOR_NO;


-- 10번
SELECT
	SUBSTR(TERM_NO,0,4) "년도",ROUND(AVG(POINT),1) "년도 별 평점"
FROM
	TB_GRADE
WHERE
	STUDENT_NO = 'A112113'
GROUP BY
	SUBSTR(TERM_NO,0,4)
ORDER BY
	SUBSTR(TERM_NO,0,4);

-- 11번
SELECT
	DEPARTMENT_NO "학과코드명",
	COUNT(DECODE(ABSENCE_YN,'Y',ABSENCE_YN)) "휴학생 수"
FROM
	TB_STUDENT
GROUP BY
	DEPARTMENT_NO
ORDER BY
	DEPARTMENT_NO ASC;


-- 12번
SELECT
	STUDENT_NAME "동일이름",
	COUNT(STUDENT_NAME) "동명인 수"
FROM
	TB_STUDENT
GROUP BY
	STUDENT_NAME
HAVING
	COUNT(STUDENT_NAME)>1
ORDER BY
	STUDENT_NAME ASC;
	

-- 13번
SELECT
	SUBSTR(TERM_NO,1,4) "년도",
	SUBSTR(TERM_NO,5,2) "학기",
	ROUND(AVG(POINT),1) "평점"
FROM
	TB_GRADE
WHERE
	STUDENT_NO='A112113'
GROUP BY ROLLUP(SUBSTR(TERM_NO,1,4),SUBSTR(TERM_NO,5,2))
ORDER BY 1;

