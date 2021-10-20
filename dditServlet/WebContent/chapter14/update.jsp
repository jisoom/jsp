<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	//memberid 및 name 파라미터의 값을 구함
	String memberid = request.getParameter("memberid");
	String name = request.getParameter("name");
	
	//jdbc 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	Statement stmt = null;
	int updateCount = 0;
	
	try {
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbUser = "jspexam";
		String dbPass = "java";
		
		String query = "update member" 
				+ " set name='" + name + "'"
				+ " where memberid = '" + memberid + "'"; //set 앞에 띄어 쓰기 잘 해줘야 함
		
		//데이터베이스와 연결된 Connection을 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		//Connection으로부터 Statement(형식)를 생성
		stmt = conn.createStatement();
		//return : 변경된 레코드 개수(0보다 크면 변경된 값이 존재)
		/*
		* statement 객체가 제공하는 메서드로 쿼리 실행
		- ResultSet executeQuery(String query) : SELECT 쿼리 실행 시 사용
		- int executeUpdate(String query) : INSERT, UPDATE, DELETE 쿼리 실행 시 사용
		*/		
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
<title>회원명 변경 처리</title>
</head>
<body>
<%
if(updateCount >0) { //업데이트가 되었다면
	out.print(name + "으로 이름 변경 성공");
}else { //업데이트 실패
	out.print(memberid + "아이디가 없습니다.");
}
%>
</body>
</html>