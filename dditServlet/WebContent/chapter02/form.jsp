<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>폼 생성</title>
</head>
<body>
<form method="post" action="/chapter02/viewParameter.jsp">
	이름 : <input type="text" name="name" size="10"><br>
	주소 : <input type="text" name="address" size="30"><br>
	좋아하는 동물 : <input type="checkbox" name="pet" value="camel" id="camel">
				<label for="camel">낙타</label>
				<input type="checkbox" name="pet" value="cat" id="cat">
				<label for="cat">고양이</label>
				<input type="checkbox" name="pet" value="dog" id="dog">
				<label for="dog">강아지</label>
				<input type="checkbox" name="pet" value="fox" id="fox">
				<label for="fox">여우</label> <br>
	<input type="submit" value="전송" style="cursor: pointer;" alt="전송" title="전송">				
</form>
</body>
</html>