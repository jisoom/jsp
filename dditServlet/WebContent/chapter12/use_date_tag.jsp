<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- *************** 꼭 추가 해줘야함 ************** -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>dateFormat 태그 사용</title>
</head>
<body>
<%-- <c:set var="now" value="<%=new Date() %>" /> --%>
<c:set var="now" value="<%=new java.util.Date() %>" />

<!-- 2021년 7월 13일 화요일 -->
<fmt:formatDate value="${now}" type="date" dateStyle="full"/><br/>

<!-- 21. 7. 13 -->
<fmt:formatDate value="${now}" type="date" dateStyle="short" /><br/>

<!-- 오후 3:20:42 -->
<fmt:formatDate value="${now}" type="time" /><br/>

<!-- 2021년 7월 13일 화요일 오후 3시 20분 42초 KST -->
<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/><br/>

<!-- KST 오후 3:21 -->
<fmt:formatDate value="${now}" pattern="z a h:mm" /><br/>
</body>
</html>