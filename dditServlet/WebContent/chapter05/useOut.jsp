<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String danStr = request.getParameter("dan")==null?"2":request.getParameter("dan");
	int danInt = Integer.parseInt(danStr);
%>    
<!DOCTYPE html>
<html>
<head>
<title>구구단 출력</title>
<script type="text/javascript">
	function fn_chg(getObj) {
		alert(getObj.value);
		//select객체의 선택된 value값을 varDan변수에 저장함(대입)함
		var varDan = getObj.value;
		location.href="<%=request.getContextPath()%>/chapter05/useOut.jsp?dan=" + varDan;
	}
</script>
</head>
<body>
<!-- <h2>2단</h2> -->
<select id="sel" name="sel" onchange="fn_chg(this)">
	<%for(int dan= 2; dan <=9; dan++) { %>
	<!-- 선택한 값이 화면에 보여지게 함  -->
	<option value="<%=dan%>" <%if(dan == danInt) {out.print("selected='selected'");} %>><%=dan%>단</option>
	<%} %>
</select>
<table border="1" style="width: 30%;">
	<%for(int i=1; i<=9; i++) {%>
	<tr>
		<td><%out.print(danStr +" x" + i + "=" + (danInt*i)); %></td>
	</tr>
	<%} %>
</table>

</body>
</html>