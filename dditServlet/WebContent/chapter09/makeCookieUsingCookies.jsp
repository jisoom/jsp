<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	response.addCookie(
			Cookies.createCookie("id", "ddit", "/", -1)
			// -1 : 웹 브라우저를 종료하면 사라짐 (default)
			);	
%>
<!DOCTYPE html>
<html>
<head>
<title>Cookies 클래스 사용 예</title>
</head>
<body>
<a href="/chapter09/readCookieUsingCookies.jsp">생성된 쿠키 정보 확인</a>

<!-- 
	쿠키 핵심 정리
	1. 쿠키 생성
		Cookie cookie = new Cookie("name", "a001");
		response.addCookie(cookie);
	
	2. 쿠키 사용
	1) 전체를 가져옴
		Cookie[] cookies = request.getCookies();
		cookies[0].getName();
		cookies[0].getValue();
	2) 하나를 가져옴
		Cookie cookie = new Cookie("name", "a001");
		cookie.getName();
		cookie.getValue();
 -->
</body>
</html>