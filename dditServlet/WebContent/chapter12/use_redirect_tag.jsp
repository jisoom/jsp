<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>redirect태그 사용하기</title>
</head>
<body>
<!-- 
* c:redirect 태그
response.sendRedirect() 처럼 지정한 페이지로 리다이렉트 시켜줌
 -->
 <c:if test="${param.dist=='1'}">
 	<c:redirect url="/chapter07/layout.jsp"/>
 </c:if>
 <c:if test="${param.dist=='2'}">
 	<c:redirect url="/chapter07/info.jsp" />
 </c:if>
 <!-- http://localhost:8090/chapter12/use_redirect_tag.jsp?dist=3 -->
 <!-- /chapter07/freeboard.jsp?currentPage=1 -->
 <c:if test="${param.dist=='3' }">
 	<c:redirect url="/chapter07/freeboard.jsp" >
 		<c:param name="currentPage" value="1" />
 	</c:redirect>
 </c:if>
 <!-- http://localhost:8090/chapter12/use_redirect_tag.jsp?dist=4 -->
 <!-- http://search.daum.net/search?w=blog&q=봄 + 라일락 -->
 <c:if test="${param.dist=='4' }">
 	<c:redirect url="http://search.daum.net/search">
 		<c:param name="w" value="blog"></c:param>
 		<c:param name="q" value="봄 라일락"></c:param>
 	</c:redirect>
 </c:if>
</body>
</html>