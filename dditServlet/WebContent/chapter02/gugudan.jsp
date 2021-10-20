<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 출력</title>
</head>
<body>
<!--
<table>태그를 사용해보자 
2단 3단 4단...
2*1=2 3*1=3 4*1=4
..
 -->
<table> 
<%for(int dan=1; dan<= 9; dan++) {%>
	<tr style="background-color: gold;">
	<% for(int i=2; i <=9; i++) {%>
		<td style="padding: 5px;"><%= i%> * <%=dan %> = <%=i*dan %></td>
	<%}%>
	</tr>
<%}%> 
</table>
</body>
</html>