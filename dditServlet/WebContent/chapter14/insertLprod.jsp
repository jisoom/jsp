<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String lprod_gu = request.getParameter("lprod_gu");
	String lprod_nm = request.getParameter("lprod_nm");

	
	//Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;

	PreparedStatement pstmt = null;
	int insertCount = 0;
	
	try {
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbUser = "zisoom";
		String dbPass = "java";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		//실행할 query를 생성
		pstmt = conn.prepareStatement(
				"insert into lprod(lprod_id, lprod_gu, lprod_nm) values(SEQ_LPROD.NEXTVAL, ?, ?)"				
				);
		pstmt.setString(1, lprod_gu);
		pstmt.setString(2, lprod_nm);
		
		//query를 실행
		insertCount = pstmt.executeUpdate();
	}finally{
		if(pstmt != null) try{pstmt.close();} catch(SQLException ex) {}
		if(conn != null) try{conn.close();} catch(SQLException ex) {}
	}

%>
<!DOCTYPE html>
<html>
<head>
<title>상품 등록 처리</title>
</head>
<body>
<%if(insertCount > 0) {
	out.print("LPROD 테이블에 새로운 레코드 삽입완료");
}else{ 
	out.print("LPROD 테이블에 새로운 레코드 삽입실패");
}%>
<a href="/chapter14/viewLprodList.jsp">목록으로 이동</a>	
</body>
</html>