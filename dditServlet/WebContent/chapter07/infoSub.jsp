<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
// <jsp:param name="type" value="A" />
	String type = request.getParameter("type").toUpperCase(); // A가 받아짐
// 	if(type == null){
// 		return;
// 	}
	
	// type : info.jsp?type=B + jsp:param의 A
	String[] names = request.getParameterValues("type");
	for(String name : names){
		out.print("name : " + name + "<br>");
	}
%>
<!-- info.jsp페이지에 include되는 sub 페이지 -->
<br>
<table style="width: 100%;" border="1">
	<tr>
		<th>타입</th>
		<td><b><%=type %></b></td>
	</tr>
	<tr>
		<th>특징</th>
		<td>
	<%
	if(type.equals("A")){
		out.print("강한 내구성");
	}else if(type.equals("B")){
		out.print("뛰어난 대처 능력");
	}else{
		out.print("저렴한 가격");
	}
	%>
		</td>
	</tr>
</table>
