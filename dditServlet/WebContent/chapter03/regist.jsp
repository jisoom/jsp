<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
</head>
<body>
<!-- registOk.jsp에서 파라미터를 받아 출력해보자.(한글처리까지) -->
<!-- 출력 후에 registOk2.jsp로 redirect하여 결과를 한번 더 출력해보자. -->
<form name="frm" id="frm" method="post" action="/chapter03/registOk.jsp">
	아이디 : <input type="text" id="memId" name="memId"><br>
	이름 : <input type="text" id="memName" name="memName"><br>
	성별 : <input type="radio" id="male" name="memGu" value="1"><label for="male">남자</label>
		  <input type="radio" id="female" name="memGu" value="2"><label for="female">여자</label>
	<br>
	나이 : <select name="memAge" id="memAge">
			<%for(int i=21; i<=50; i++) {%>
			<option value="<%=i%>"><%=i%></option>
			<%} %>
		  </select>
	<button type="submit">등록</button>
</form>
</body>
</html>