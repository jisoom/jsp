<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	//<인코딩>
	/*
		- 알파벳과 숫자 그리고 몇몇 기호를 제외한 나머지 글자들을
		URL에 포함시키려면 인코딩을 해주어야 함
		
		- response.sendRedirect()메서드를 사용하는 경우에도
		마찬가지로 인코딩한 쿼리 문자열(?name=개똥이)을 사용해야함.
		
		- Java.net.URLEncoder 클래스가 존재하고,
		URLEncoder.encode() 메서드를 사용하면 파라미터 값으로 사용될
		문자열을 지정한 캐릭터 셋으로 (UTF-8) 인코딩 할 수 있음
		
		-크롬, 파이어폭스는 웹 브라우저가 UTF-8로 인코딩된 주소 경로나 파라미터 값을
		해당 문자로 변환해줌
		
		-IE는 인코딩된 파라미터 값을 그대로 보여줌
	*/
%>    
<!DOCTYPE html>
<html>
<head>
<title>로그인 index.jsp</title>
</head>
<body>
index.jsp 페이지 입니다.
<br/>
<%=name %>
</body>
</html>