<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie1 = new Cookie("id", "");
	cookie1.setMaxAge(0);
	Cookie cookie2 = new Cookie("name", "");
	cookie2.setMaxAge(0);
	response.addCookie(cookie1);
	response.addCookie(cookie2);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
<script type="text/javascript">
	function fn_main() {
		var chk = confirm("메인화면으로 이동하시겠습니까?");
		if(chk) {
			location.href ="/chapter09/company/main.jsp";
		}
	}
</script>
</head>
<body>
로그아웃 되었습니다.<br>
<input type="button" value="메인" onclick="fn_main()">
</body>
</html>