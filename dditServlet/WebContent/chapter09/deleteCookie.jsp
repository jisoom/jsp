<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = new Cookie("name","개똥이");
	//Cookie 클래스는 쿠키를 삭제하는 기능이 없음
	//유효 시간을 0으로 지정함(setMaxAge()) => 초단위로 지정
	// 60 * 60 => 60초(1분) * 60 = 1시간
	//만약에 유효시간을 0초를 초과하여 정해놓으면 웹 브라우저를 종료해도 해당 시간만큼 
	//쿠키가 삭제되지 않고 웹 서버에 전송이 됨
	cookie.setMaxAge(0);
	//응답 헤더에 추가
	response.addCookie(cookie);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 삭제</title>
<script type="text/javascript">
	function fn_view() {
		location.href="/chapter09/viewCookies.jsp";
	}
</script>
</head>
<body>
name 쿠키를 삭제합니다.
<input type="button" value="쿠키 목록" onclick="fn_view()">
</body>
</html>