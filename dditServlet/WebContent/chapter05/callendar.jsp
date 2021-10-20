<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String dd = request.getParameter("dd")==null? "1" :request.getParameter("dd"); 
	int ddInt = Integer.parseInt(dd);
%>    
<!DOCTYPE html>
<html>
<head>
<title>달력</title>
<script type="text/javascript">
	function fn_chg(obj) {
		var dd = obj.value;
		location.href="<%=request.getContextPath()%>/chapter05/callendar.jsp?dd="+dd;
	}
</script>
</head>
<body>
<!-- 1일~31일까지 채우기. 선택된 날짜를 ?dd=1 => 달력에 해당 날짜에 배경색 넣기 -->
<select name="sel" id="sel" onchange="fn_chg(this)">
	<%for(int i=1; i <=31; i++) {%>
	<option value="<%=i%>" <%if(ddInt ==i) {out.print("selected='selected'");} %>><%=i %>일</option>
	<%} %>
	
</select>
<table border="1" style="width: 50%;">
	<tr>
		<th>일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th>토</th>
	</tr>
	<tr>
	<% 
	//blank는 7이 주어지고, 행이 끝나면 다시 7이 충전이 됨
	//날짜를 출력할 때마다 1씩 감소. 31일을 출력하며 4가 남게됨
	int blank = 7;
	for(int i=1; i<=31; i++) {
		if(ddInt == i) {
		out.print("<td style='background-color:gold;'>" + i + "</td>");
		}else {
			out.print("<td>" + i + "</td>");
		}
		blank--;
		if(i%7==0) {
			out.print("</tr><tr>");
			blank=7; //7까지 다 찍고 나면 blank를 다시 초기화해줌
		}
	}
	for(int j=0; j<blank; j++) { //31까지 찍고 남은 칸이 2칸이라면, 2칸은 빈칸으로 만들어줌
		out.print("<td>&nbsp;</td>");
	}
	%>
	</tr>
</table>
</body>
</html>