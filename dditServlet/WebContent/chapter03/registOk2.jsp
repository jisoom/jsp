<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 
	String memId = request.getParameter("memId")==null?"없음":request.getParameter("memId");
	String memName = request.getParameter("memName")==null?"없음":request.getParameter("memName");
	String memGu = request.getParameter("memGu")==null?"없음":request.getParameter("memGu");
	String memAge = request.getParameter("memAge")==null?"없음":request.getParameter("memAge");
%>     
<!DOCTYPE html>
<html>
<head>
<title>registOk.jsp를 sendRedirect</title>
</head>
<body>
	아이디 : <%=memId %><br>
 	이름 : <%=memName %><br>
 	성별 : 
 	<% if(memGu.equals("1")) {%>
 		남자<br>
 	<%}else if(memGu.equals("2")){ %>
		여자<br>
 	<%}else {%>
 		선택안함<br>
 	<%} %>
 	나이 : <%=memAge %>세
</body>
</html>