<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String password = 
	request.getParameter("password");
//아이디가 a001이면서 동시에 비밀번호가 1234인 경우 로그인 성공
if(id.equals("a001")&&password.equals("1234")){
// 	Cookie cookie = new Cookie("id",id);	
//	cookie.setPath("/");
//	cookie.setMaxAge(-1);
	response.addCookie(
			Cookies.createCookie("id", id, "/", -1)
			//cookie
	);	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
	로그인에 성공했습니다.<br />
	<div class="count" style="font-size:1.2em;">5초 뒤에 메인화면으로 이동합니다.</div>
<script type="text/javascript">
const countDisplay = document.querySelector(".count");

//1초마다 countDown 함수를 실행
setInterval(countDown, 1000);
var time = 5;	//5초
function countDown(){
	if(time>0){	//5 4 3 2 1 
		time--;
		countDisplay.innerText = time + "초 뒤에 메인화면으로 이동합니다.";
	}else{	//0
		location.href="/chapter07/layout.jsp";
	}
}
</script>
</body>
</html>
<%
}else{	//로그인 실패 시
	out.print("<script>alert('로그인 실패');history.go(-1);</script>");
}
%>



