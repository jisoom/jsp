<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String lprod_id = request.getParameter("lprod_id");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try{
	String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
	String dbUser = "zisoom";
	String dbPass = "java";
	String query = "select * from lprod where lprod_id='" + lprod_id + "'";
	
	conn= DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(query);
	if(rs.next()) { 

%>
<!DOCTYPE html>
<html>
<head>
<title>상품 상세 정보</title>
</head>
<body>
	<table border="1" style="width: 100%;">
		<tr>
			<th>상품번호</th>
			<td><%=lprod_id %></td>
		</tr>
		<tr>
			<th>상품코드</th>
			<td><%=rs.getString("LPROD_GU") %></td>
		</tr>
		<tr>
			<th>상품이름</th>
			<td><%=rs.getString("LPROD_NM") %></td>
		</tr>
	</table>
	<input type="button" value="수정" onclick="javascript:location.href='/chapter14/updateLprodForm.jsp?lprod_id=<%=lprod_id%>';">
	<a href="/chapter14/viewLprodList.jsp">목록으로 이동</a>	
</body>
</html>
<%
	}else {
		out.print(lprod_id + "에 해당하는 정보가 없습니다.");
	}//end if
}catch(SQLException ex) {
	out.print(ex.getMessage());
}finally {
	if(rs != null) try {rs.close();} catch(SQLException ex) {}
	if(stmt != null) try {stmt.close();} catch(SQLException ex) {}
	if(conn != null) try {conn.close();} catch(SQLException ex) {}
}
%>