<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인 FORM</title>
</head>
<body>
	<form action="login.do" method="post">
	<c:if test="${errors.idOrPwNotMatch}">아이디 또는 비밀번호가 잘못되었습니다</c:if>
	<p>
		아이디 : <br/><input type="text" name="memberid" value="${param.memberid }" />
		<c:if test="${errors.memberid}">아이디를 입력해주세요</c:if>
	</p>
	<p>	
		비밀번호 : <br/><input type="password" name="password">
		<c:if test="${errors.password}">비밀번호를 입력해주세요</c:if>
	</p>
	<input type="submit" value="로그인" />
	</form>
</body>
</html>