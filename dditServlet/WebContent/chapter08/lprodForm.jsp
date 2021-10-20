<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/chapter08/lprodJoining.jsp" method="post">
		<table border="1" style="width: 50%;">
			<tr>
				<th>상품 분류 아이디</th>
				<td colspan="3">
					<input type="text" name="lprodId" size="10" placeholder="상품 분류 아이디를 입력해주세요">
				</td>
			</tr>
			<tr>
				<th>상품 분류 코드</th>
				<td>
					<input type="text" name="lprodGu" size="10" placeholder="상품 분류 코드를 입력해주세요">
				</td>
			</tr>
			<tr>	
				<th>상품 분류명</th>
				<td>
					<input type="text" name="lprodNm" size="10" placeholder="상품 분류명을 입력해주세요">
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;">
					<input type="submit" value="추가">
				</td>
			</tr>
		</table>
		<!-- 
		[추가] 버튼을 누르면 입력한 데이터를 POST 방식으로 lprodJoining.jsp에 전달함
		 -->	
	</form>
</body>
</html>