<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Hello</title>
</head>
<body>
<!-- hello.do로 접근해야함 -->
<%=request.getAttribute("hello") %>
</body>
</html>