<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String memberid = request.getParameter("memberid");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	//메모리에 jdbcDriver를 올리는 과정
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;
	/*
	* PreparedStatement
	  - 간결한 코드를 위해
	  - 값 변환을 자동으로 처리하기 위해
	  - 검색 조건과 같이 값을 지정해야 하는 쿼리 실행 시 선호함
	  name = "I'm 개똥이"를 update할 때, Statement를 사용하면, orcle로 넘어가면서 '때문에 에러가 남 => 'I'm 개똥이' : 'm 개똥이' 이게 짝이됨
	  'I''m 개똥이' 이렇게 '를 2번 써야하는데 PreparedStatement는 그 과정을 자동으로 해줌  
	*/
	PreparedStatement pstmt = null;
	int insertCount = 0;
	
	try {
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbUser = "jspexam";
		String dbPass = "java";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		//실행할 query를 생성
		pstmt = conn.prepareStatement(
				"insert into member(memberid, password, name, email) values(?, ?, ?, ?)"				
				);
		pstmt.setString(1, memberid);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		
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
<title>회원 가입 처리</title>
</head>
<body>
<%if(insertCount > 0) {
	out.print("MEMBER 테이블에 새로운 레코드 삽입완료");
}else{ 
	out.print("MEMBER 테이블에 새로운 레코드 삽입실패");
}%>
<a href="/chapter14/viewMemberList.jsp">목록으로 이동</a>	
</body>
</html>