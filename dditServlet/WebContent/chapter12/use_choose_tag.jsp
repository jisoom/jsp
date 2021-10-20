<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>choose 태그 연습</title>
</head>
<body>
<c:set var="name" value="개똥이2"/>
<c:set var="age" value="25"/>
<!--자바랑은 다르게 한 구문이 true면 실행하고 종료함  -->
<!-- name이 개똥이랑 같기 때문에 age구문 실행하지 않고 종료됨 -->
<c:choose>
	<c:when test="${name=='개똥이'}">
		이름은 ${name}<br/>
	</c:when>
	<c:when test="${param.name =='soddong'}">
		이름은 ${param.name}<br/>
	</c:when>
	<c:when test="${age>=20}">
		나이는 ${age}이상<br/>
	</c:when>
	<c:otherwise>
		이름은 개똥이가 아니고 나이가 20 이상도 아님.
	</c:otherwise>
</c:choose>
</body>
</html>