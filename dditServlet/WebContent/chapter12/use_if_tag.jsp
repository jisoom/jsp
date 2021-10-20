<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="chapter11.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
StudentVO studentVO = new StudentVO();

Map<String, String> map = new HashMap<String, String>();
%>
<!DOCTYPE html>
<html>
<head>
<title>JSTL if 태그 연습</title>
</head>
<body>
<!-- 조건문의 값이 true 이므로 항상 실행됨 -->
<c:if test="true">
작성자 : 홍길동 <br/>
</c:if>
<!-- ..use_if_tag.jsp?name=ddit -->
<c:if test="${param.name == 'ddit'}">
name 파라미터의 값이 ${param.name}입니다. <br/>
</c:if>
<c:if test="${empty param.name}">
name 파라미터가 없습니다.<br/>
</c:if>
<!-- ..use_if_tag.jsp?name=ddit&age=25 -->
<c:if test="${21 < param.age}">
당신의 나이는 21세 이상입니다.
</c:if>

<!-- 
<<JSTL>>
-jsp : include와 같은 태그를 개발자가 추가할 수 있음.(커스텀 태그)
커스텀 태그 중에서 많이 사용되는 것들을 모아 JSTL(JSP Standard Tag Library)이라는 표준을 만듦
-JSTL을 사용하면 스크립트릿 코드의 사용을 줄이면서 간결하고 이해하기 쉬운 JSP 코드를 작성할 수 있음

* 코어 태그(c)
- 변수 지원(set, remove)
- 흐름 제어(if, choose, forEach, forTokens)
- URL 처리(import, redirect, url)
- 기타 태그(catch, out)
-->
<br/>
<!-- scope : page, request, session, application -->
<c:set var="name" value="개똥이" scope="request"/><!-- scope="page" 생략 가능  // scope="request" 생략하면 page 영역에 들어감-->
<c:remove var="name" scope="request"/> <!-- remove할 때는 반드시 scope 해줘야함 -->
${name} <br/>
<c:if test="${name == '개똥이'}">
동일함<br/>
</c:if>
<c:if test="${name != '개똥이'}">
동일안함<br/>
</c:if>

<!-- 스크립트릿에서 studentVO 가져와서 target에 넣어 사용해줌 -->
<c:set target="<%= studentVO%>" property="studentName" value="개똥이"/>
1. <%=studentVO.getStudentName()%>
<br/>

<!-- student에 studentVO 객체를 넣음 -->
<c:set var="student" value="<%=studentVO %>"/>
2. ${student.studentName}<br/>

<!-- c:set한 student를 타겟으로 해줌 ${student} -->
<c:set target="${student}" property="studentNo" value="202107001"/>
2_2. ${student.studentNo}<br/>

<hr/>
<c:set target="<%=map %>" property="id" value="a001"/>
1. <%=map.get("id") %><br/>

<c:set var="map2" value="<%=map %>"/>
<c:set target="${map2}" property="name" value="김은대"/>
2. ${map2.name}

</body>
</html>