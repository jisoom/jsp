<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="lprodInfo" class="chap08.member.LprodVO"></jsp:useBean>
<jsp:setProperty name="lprodInfo" property="*"/>
<!DOCTYPE html>
<html>
<head>
<title>상품 추가</title>
</head>
<body>
<table border="1" style="width: 50%;">
	<tr>
		<th>상품 분류 아이디</th>
		<td colspan="3">
			<!-- setProperty한 값 가져올 수 있음 -->
			<jsp:getProperty name="lprodInfo" property="lprodId" /> 
		</td>
	</tr>
	<tr>
		<th>상품 분류 코드</th>
		<td>
			<jsp:getProperty name="lprodInfo" property="lprodGu" />
		</td>
	</tr>
	<tr>	
		<th>상품 분류명</th>
		<td>
			<jsp:getProperty name="lprodInfo" property="lprodNm" />
		</td>
	</tr>
</table>
</body>
</html>