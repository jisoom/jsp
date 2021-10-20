<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>catch 태그 사용하여 에러처리하기</title>
</head>
<body>
<!-- 
* c:catch
- c:catch 사이의 구문을 실행 중 exception 발생 시 ex 변수에 
	발생된 exception 객체를 저장
 -->
 <c:catch var="ex">
 name 파라미터 값 : <%=request.getParameter("name") %><br/>
 <%
 if(request.getParameter("name").equals("test")) { %>
	${param.name}은 test입니다.	 
 <%} %>
 </c:catch>
 <br/>
 <c:if test="${ex != null }">
 	예외가 발생했습니다.<br/> 
 	: ${ex }
 </c:if>
</body>
</html>