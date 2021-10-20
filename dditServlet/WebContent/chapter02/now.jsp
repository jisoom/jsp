<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 디렉티브 : 설정부분(JSP 페이지에 대한 설정 정보)
    	-page : JSP 페이지에 대한 정보를 지정(문서 타입, 출력 버퍼크기, 오류 페이지 등)
    	-taglib : 태그 라이브러리 지정
    	-include : 다른 문서를 포홤 
    	디렉티브 이름은 page이고, contentType 속성을 사용했으며, 
    	contentType 속성의 값은 text/html;charset=UTF-8이다.
    	
    	<TYPE>
    	- text/html
    	- text/xml
    	- text/plain
    	<charset>
    	- UTF-8(*)
    	- EUC-KR
    	- ISO-8859-1
    -->
<%
/*
스크립트 요소 : 동적으로 출력 결과 생성
-스크립트 릿(Scriplet) - 자바 코드를 실행
-표현식(Expression) - 값을 출력
-선언부(Declaration) - 자바 메서드(함수)를 정의
*/
//now.jsp를 다시 실행하거나 새로고침을 하면 화면에 표시되는 시간 값이 변경됨. => 동적 자원
//이유 ? tomcat이 jsp를 매번 실행하기 때문..
	Date now = new Date();
//생성 부분 : HTML 코드 및 JSP 스크립트
%>   
<!DOCTYPE html>
<html>
<head>
<title>현재 시간</title>
</head>
<body>

<!-- ISO-8859-1로 했을 때.. 알파벳과 서유럽어 문자만 포함...
소스 코드 저장시 사용한 캐릭터 인코딩(UTF-8)과
page 디렉티브의 contentType 속성의 캐릭터 셋(ISO-8859-1)과 다르기 때문에 글자가 깨짐 -->

현재 시간 : <%=now %>
</body>
</html>