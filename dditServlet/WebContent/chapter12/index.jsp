<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Hello JSTL</title>
</head>
<body>

1. https://mvnrepository.com 접속<br/>
2. 검색에 "JSTL"을 입력<br/>
3. 가장 사용 많이 하는 JSTL 클릭<br/>
4. version 중에서 1.2 클릭<br/>
5. Files에 jar(404KB) 클릭<br/>
6. 다운로드된 파일을 WebContent > WEB-INF > lib에 드래그 또는 복사 붙이기 <br/>
7. taglib 디렉티브 추가. <!-- taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" -->
<pre>
	1) 코어 : c (http://java.sun.com/jsp/jstl/core)
			변수 지원, 흐름 제어, URL 처리
	2) XML : x (http://java.sun.com/jsp/jstl/xml)
			XML 코어, 흐름 제어, XML 변환
	3)국제화 : fmt (http://java.sun.com/jsp/jstl/fmt)
			메시지 형식, 숫자 및 날짜 형식
	4)데이터 베이스 : sql (http://java.sun.com/jsp/jstl/sql)
			SQL 처리
	5)함수 : fn (http://java.sun.com/jsp/jstl/functions)
			Collection 처리, String 처리     
</pre>
<c:out value="Hello JSTL!"/> <!-- 웹 브라우저에 Hello JSTL 출력 -->
</body>
</html>