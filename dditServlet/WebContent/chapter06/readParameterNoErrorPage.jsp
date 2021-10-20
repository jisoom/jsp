<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="/error/viewErrorMessage.jsp" %>
<!-- 
JSP는 실행 도중 exception이 발생 시 
오류 화면 대신 지정한 JSP페이지를 보여줄 수 있음.
 -->
<!DOCTYPE html>
<html>
<head>
<title>파라미터 출력</title>
</head>
<body>
<!-- 
name 파라미터가 없으면 request.getParameter("name")은 null을 리턴하므로 
실행도중 문제가 생겨 NullPointerException을 발생시킴

500에러 : 코드문제
404에러 : 페이지 없음(URL잘못 입력하거나, 페이지 안만듬)
 -->

name 파라미터 값 : 
<%
// try{
	request.getParameter("name").toUpperCase(); 
// }catch(Exception ex){
// 	out.print("name 파라미터가 올바르지 않습니다.");
// }
%>

</body>
</html>









