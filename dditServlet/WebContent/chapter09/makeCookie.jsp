<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
/*
	<쿠키의 구성>
	-이름 : 각각의 쿠키를 구별
	-값 : 쿠키의 이름과 관련된 값
*/
	//추가할 쿠키 정보를 담고 있는 Coockie 객체를 생성
	Cookie cookie = new Cookie("name", URLEncoder.encode("개똥이", "UTF-8"));
	
	//응답 데이터에 쿠키를 추가
	response.addCookie(cookie);
%>    
<!DOCTYPE html>
<html>
<head>
<title>쿠키 생성</title>
<script type="text/javascript">
	function fn_view() {
		location.href="/chapter09/viewCookies.jsp";
	}
</script>
</head>
<body>
<!-- 별도 유효 시간을 지정하지 않으면 웹 브라우저를 종료 시 쿠키도 함께 삭제됨 -->
<%=cookie.getName() %> 쿠키의 값 = <%=cookie.getValue()%>
<!-- <%=URLDecoder.decode(cookie.getValue(),"utf-8") %>을 하면 깨짐 없음 -->
<!-- 쿠키 동작 방식
1. 생성 : 웹 서버 측에서 생성함. 생성한 쿠키를 응답 데이터의 헤더에 저장하여 웹 브라우저에 전송함
2. 저장 : 웹 브라우저는 응답 데이터에 포함된 쿠키를 쿠키 저장소에 보관함
3. 전송 : 웹 브라우저는 요청이 있을 때마다 쿠키를 웹 서버에 전송함
 -->
 
	<input type="button" value="쿠키보기" onclick="fn_view()">
	
	
	
<!-- 아이디 저장하기 할 때 쿠키 사용함(유효시간 정해둠) -->	
	
</body>
</html>