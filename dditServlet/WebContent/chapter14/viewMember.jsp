<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
//후보키가 되는 조건
/*
1. not null : null이 아니어야됨
2. not duplicate => unique : 중복되지 않고 유일해야됨
*/

// /chapter14/viewMember.jsp?memberid=..."
String memberid = request.getParameter("memberid");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try{
	String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
	String dbUser = "jspexam";
	String dbPass = "java";
	String query = "select * from member where memberid='" + memberid + "'";
	
	conn= DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(query);
	if(rs.next()) { //memberid는 기본키이므로 중복되지 않음 ==> 딱 한 건 조회됨

%>
<!DOCTYPE html>
<html>
<head>
<title>회원 상세 정보</title>
</head>
<body>
	<table border="1" style="width: 100%;">
		<tr>
			<th>아이디</th>
			<td><%=memberid %></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><%=rs.getString("password") %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=rs.getString("name") %></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=rs.getString("email") %></td>
		</tr>
	</table>
	<a href="/chapter14/viewMemberList.jsp">목록으로 이동</a>
	<%-- <c:redirect url="/chapter14/viewMemberList.jsp" />
		바로 이동해버리기 때문에 바람직하지 않음 => 조건문이 있어야함
	 --%>
	<input type="button" value="수정" onclick="javascript:location.href='/chapter14/updateForm.jsp';">
</body>
</html>
<%
	}else {
		out.print(memberid + "에 해당하는 정보가 없습니다.");
	}//end if
}catch(SQLException ex) {
	out.print(ex.getMessage());
}finally {
	if(rs != null) try {rs.close();} catch(SQLException ex) {}
	if(stmt != null) try {stmt.close();} catch(SQLException ex) {}
	if(conn != null) try {conn.close();} catch(SQLException ex) {}
}
%>