<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");

	String lprod_id = request.getParameter("lprod_id");
	String lprod_gu = request.getParameter("lprod_gu");
	String lprod_nm = request.getParameter("lprod_nm");
	
	Connection conn = null;
	Statement stmt = null;
	int updateCount = 0;
	
	try {
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbUser = "zisoom";
		String dbPass = "java";
		
		String query = "update lprod" 
				+ " set lprod_gu='" + lprod_gu + "', lprod_nm='" + lprod_nm + "'"
				+ " where lprod_id = '" + lprod_id + "'"; 
				
		conn= DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		updateCount = stmt.executeUpdate(query);
	}catch(SQLException ex) {
		ex.printStackTrace();
	}finally {
		if(stmt != null) try{stmt.close();}catch(SQLException ex) {}
		if(conn != null) try{conn.close();}catch(SQLException ex) {}
	}

%>
<!DOCTYPE html>
<html>
<head>
<title>상품코드, 상품명 변경처리</title>
</head>
<body>
<%
if(updateCount >0) { //업데이트가 되었다면
	out.print(lprod_gu +"," + lprod_nm + "으로 상품코드, 상품이름 변경 성공");
}else { //업데이트 실패
	out.print(lprod_id + "에 해당하는 상품이 없습니다.");
}
%>
<a href="/chapter14/viewLprodList.jsp">목록으로 이동</a>	
</body>
</html>