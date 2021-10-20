<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 값 변경</title>
<script type="text/javascript">
	function fn_view() {
		location.href ="/chapter09/viewCookies.jsp";
	}
</script>
</head>
<body>
<!-- Cookie cookie = new Cookie("name", URLEncoder.encode("개똥이", "UTF-8")); -->
<%
	//이름이 name인 Cookie 객체를 새롭게 생성(기존에 생성했던 쿠키의 이름과 동일하게 생성하고 값만 다르게 함)
	Cookie cookie = new Cookie("name",URLEncoder.encode("김은대", "UTF-8"));
	//응답 헤더에 추가함 => name 쿠키의 값이 변경됨
	response.addCookie(cookie);
%>

name 쿠키의 값을 변경합니다.
<input type="button" value="쿠키목록" onclick="fn_view()">
</body>
</html>