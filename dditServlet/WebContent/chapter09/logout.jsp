<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	Cookie cookies = new Cookie("id", "");
	//유효시간을 0으로 설정 => 쿠키가 삭제되는 효과
	cookies.setMaxAge(0);
	cookies.setPath("/"); //생성할 때 "/"로 생성해서 삭제할 때도 해줘야됨
	response.addCookie(cookies);
%>
<!DOCTYPE html>
<html>
<head>
<title>로그아웃</title>
<script type="text/javascript">
	function fn_main() {
		var chk = confirm("메인화면으로 이동하시겠습니까?");
		if(chk) {
			location.href="/chapter07/layout.jsp"
		}
	}
</script>
</head>
<body>
로그아웃 되었습니다.<br>
<input type="button" value="메인" onclick="fn_main()">

</body>
</html>