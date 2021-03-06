<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입 폼</title>
</head>
<body>
<!-- 
join.do(요청) -> properties(joinHandler) -> get : jsp, post : service -> dao -> jsp
 -->
	<form action="join.do" method="post">
		<p>
			아이디 : <br /><input type="text" name="memberid" value="${param.memberid}" />
			<c:if test="${errors.memberid}">아이디를 입력하세요</c:if>
			<c:if test="${errors.duplicateId}">이미 사용중인 아이디 입니다</c:if>
		</p>
		<p>
			이름 : <br /><input type="text" name="name" value="${param.name}" />
			<c:if test="${errors.name}">이름을 입력하세요</c:if>
		</p>
		<p>
			비밀번호 : <br /><input type="password" name="password" />
			<c:if test="${errors.password}">비밀번호를 입력하세요</c:if>
		</p>
		<p>
			비밀번호 확인 : <br /><input type="password" name="confirmPassword" />
			<c:if test="${errors.confirmPassword}">비밀번호 확인을 입력해주세요</c:if>
			<c:if test="${errors.notMatch}">비밀번호와 확인비밀번호가 일치하지 않습니다</c:if>
		</p>
		<input type="submit" value="가입" />
	</form>
</body>
</html>