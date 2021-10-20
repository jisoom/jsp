<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<title>파라미터 없음, 이미지 처리</title>
</head>
<body>
오류 발생 <br>
<%
if("java.lang.NullPointerException".equals(exception.getClass().getName())){
%>
오류타입 : <%=exception.getClass().getName() %><br>
오류메시지 : <%=exception.getMessage() %><br><br>
<img alt="image" src="nullpointException.png">
	
<%
}
%>

</body>
</html>