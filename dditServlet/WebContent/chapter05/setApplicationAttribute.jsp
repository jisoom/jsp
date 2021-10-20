<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//jsp?name=b001&value=이쁜이
	String name = request.getParameter("name"); //b001
	String value = request.getParameter("value"); //이쁜이
	//첫번째 name : a001, value : 김은대	
	//두번째 name : b001, value : 이쁜이	
	application.setAttribute(name, value);
%>
<!DOCTYPE html>
<html>
<head>
<title>application 속성 지정</title>
</head>
<body>

application 기본 객체의 속성 설정 :<br/>
<%=name %> = <%=value %>
<br><br>
<input type="button" id="btn" value="application의 attribute 보기" onclick="javascript:location.href='viewApplicationAttribute.jsp';">
</body>
</html>