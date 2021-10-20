<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String lprod_id = request.getParameter("lprod_id");
%>
<!DOCTYPE html>
<html>
<head>
<title>상품코드, 상품명 변경 form</title>
</head>
<body>
	<form name="frm" action="/chapter14/updateLprod.jsp" method="post">
		<table border="1" style="width: 100%;">
			<tr>
				<th>상품코드</th>
				<td><input type="text" name="lprod_gu" placeholder="상품코드입력"></td>
				<th>상품명</th>
				<td><input type="text" name="lprod_nm" placeholder="상품이름입력"></td>
			</tr>
		</table>		
		<input type="hidden" name="lprod_id" value="<%=lprod_id %>" >
		<input type="submit" value="변경">
	</form>
</body>
</html>