<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// 1. JDBC 드라이버 로딩
//Class.forName("oracle.jdbc.driver.OracleDriver"); //OracleDriverLoader클래스의 init()메서드에서 드라이버로딩 시켜주고, web.xml에서 서블릿 정보 넣어줌

Connection conn = null; //연결 객체
Statement stmt = null; //형식 지정
ResultSet rs = null; //Query 실행 결과를 담을 객체

try {
	//오라클 드라이버 : Thin 드라이버, OCI 드라이버. (모듈 설치 필요)
	String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
	String dbUser = "jspexam";
	String dbPass = "java";
	String query = "select * from member order by memberid";
	//2. 데이터베이스 커넥션 생성
	conn= DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	//3. Statement 객체 생성
	stmt = conn.createStatement();
	//4. Query 실행 -> resultSet에 저장
	rs = stmt.executeQuery(query);
%>

<!DOCTYPE html>
<html>
<head>
<title>회원 목록</title>
</head>
<body>
<h2>member 테이블의 내용</h2>
<input type="button" value="회원 추가" onclick="javascript:location.href='/chapter14/insertForm.jsp';">
<table border="1" style="width: 100%;">
	<tr>
		<th>이름</th>
		<th>아이디</th>
		<th>이메일</th>
	</tr>
<%while(rs.next()) {	
/*
* 데이터 조회를 위한 주요 메서드
1. 문자형 : getString()
2. 숫자형 : getInt(), getLong(), getFloat(), getDouble()
3. 날짜형 : getTimestamp(), getDate(), getTime()
*/
%>
	<tr>
		<c:set var="memberid" value='<%=rs.getString("MEMBERID") %>'></c:set>
		<td><a href="/chapter14/viewMember.jsp?memberid=${memberid}"><%=rs.getString("NAME") %></a></td>
		<td>${memberid}</td>
		<td><%=rs.getString("EMAIL") %></td>
	</tr>
<%} %>	
</table>
</body>
</html>

<%	
}catch(SQLException ex) {
	out.print(ex.getMessage());
}finally {
	if(rs != null) try {rs.close();} catch(SQLException ex) {}
	if(stmt != null) try {stmt.close();} catch(SQLException ex) {}
	if(conn != null) try {conn.close();} catch(SQLException ex) {}
}
%>
