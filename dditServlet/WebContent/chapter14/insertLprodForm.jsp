<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>상품 추가 폼</title>
</head>
<body>
<form method="post" action="/chapter14/insertLprod.jsp">
	<table border="1" style="width: 100%;">
		<tr>
			<th>상품코드</th>
			<td><input type="text" name="lprod_gu" placeholder="상품코드 입력"></td>
		</tr>
		<tr>
			<th>상품이름</th>
			<td><input type="text" name="lprod_nm" placeholder="상품이름 입력"></td>
		</tr>
	</table>
	<input type="submit" value="등록" />
</form>
<a href="/chapter14/viewLprodList.jsp">목록으로 이동</a>
</body>
</html>