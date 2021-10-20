<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String memberId = (String)session.getAttribute("MEMBERID");
	
	//로그인 되면 true, 로그인 안되면 false
	boolean login = memberId==null?false:true; 
%>
<!DOCTYPE html>
<html>
<head>
<title>로그인 여부 검사</title>
</head>
<body>
<%if(login) {%>
	아이디 <%=memberId %>로 로그인 한 상태
<%}else { %>
 	로그인하지 않은 상태
<%} %>
</body>
</html>