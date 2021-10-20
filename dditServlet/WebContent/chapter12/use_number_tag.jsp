<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- *************** 꼭 추가 해줘야함 ************** -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>numberFormat 태그 연습</title>
</head>
<body>
<c:set var="price" value="10000" />
<c:out value="${price}"/><br/> 
<!-- 10000 -->

<fmt:formatNumber value="${price}" type="number" var="numberType" />
<c:out value="${numberType}"/><br/> 
<!-- 10,000 -->

통화 : <fmt:formatNumber value="${price}" type="currency" currencySymbol="원" /><br/>
<!-- 통화 : 원10,000 -->

숫자 : ${numberType}<br/> 
<!-- 숫자 : 10,000 -->

패턴 : <fmt:formatNumber value="${price}" pattern="00000000.00" /><br/>
<!-- 패턴 : 00010000.00 -->

<!-- 문자열을 숫자(Number 타입)로 변환 -->
<fmt:parseNumber value="1,100.12" pattern="0,000.00" var="num" />
숫자로 변환한 결과 : ${num}
<!-- 숫자로 변환한 결과 : 1100.12 -->
</body>
</html>