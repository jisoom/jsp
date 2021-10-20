<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 
	String memId = request.getParameter("memId")==null?"없음":request.getParameter("memId");
	String memName = request.getParameter("memName")==null?"없음":request.getParameter("memName");
	String memGu = request.getParameter("memGu")==null?"없음":request.getParameter("memGu");
	String memAge = request.getParameter("memAge")==null?"없음":request.getParameter("memAge");
	
	//registOk2.jsp로 보내주기 위한 인코딩 지정해줌
	memId = URLEncoder.encode(memId, "UTF-8");
	memName = URLEncoder.encode(memName, "UTF-8");
	memGu = URLEncoder.encode(memGu, "UTF-8");
	memAge = URLEncoder.encode(memAge, "UTF-8");
	response.sendRedirect("/chapter03/registOk2.jsp?memId=" +memId 
						+"&memName=" +memName 
						+ "&memGu=" + memGu 
						+ "&memAge=" + memAge);
%>    
<!DOCTYPE html>
<html>
<head>
<title>회원가입한 정보 출력</title>
</head>
<body>
 	아이디 : <%=memId %><br>
 	이름 : <%=memName %><br>
 	성별 : 
 	<!-- memGu가 1이면 남자, 2면 여자 -->
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