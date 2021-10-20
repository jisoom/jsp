<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page isErrorPage="true" %>
<!-- 
에러 페이지에 해당하는 JSP페이지는 page 디렉티브의 
isErrorPage 속성의 기본값을 true로 지정해야함
 -->
<!DOCTYPE html>
<html>
<head>
<title>오류 발생</title>
</head>
<body>
<!-- isErrorPage="true"를 하면 exception 기본 객체를 사용할 수 있음 -->
오류가 발생했습니다. <br>
빠른 시간 내에 문제를 해결하도록 하겠습니다.<br>
<!-- exception 기본 객체의 클래스 이름을 출력함 -->
오류 타입 : <%=exception.getClass().getName() %><br>
<!-- 오류 메시지를 출력 -->
오류 메시지 : <%=exception.getMessage() %><br>
</body>
</html>