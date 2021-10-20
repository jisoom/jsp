<%@page import="java.util.List"%>
<%@page import="chapter12.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
ArrayList<String> list = new ArrayList<String>();
list.add("blue");
list.add("green");
list.add("yellow");
list.add("red");
list.add("orange");

pageContext.setAttribute("list", list);

List<MemberVO> memberList = new ArrayList<MemberVO>();
//객체 생성
memberList.add(new MemberVO("a001", "김은대"));
memberList.add(new MemberVO("b001", "이쁘니"));
memberList.add(new MemberVO("c001", "신용환"));
memberList.add(new MemberVO("d001", "이석호"));
memberList.add(new MemberVO("e001", "김지수"));

request.setAttribute("memberList", memberList);
%>
<!DOCTYPE html>
<html>
<head>
<title>forEach 태그 연습2</title>
</head>
<body>
<!-- 이 부분에 list 배열을 출력. 글자에 해당 색상을 넣어보자 -->
<c:forEach var="str" items="${list}" begin="0" end="5" step="1">
<h3 style="color: ${str}">${str}</h3>
</c:forEach>
<br/>
<!-- 
*items
- 반복 처리할 데이터
-Collection, Iterator, Enumeration, Map, 배열, VO
 -->
<c:forEach var="memStr" items="${memberList}">
${memStr.memNo} : ${memStr.memName}<br/>
</c:forEach>
<br/>

<h2>콤마와 점을 구분자로 사용하여 반복</h2>
<c:forTokens var="token" items="빨강,주황,노랑.초록,파랑.보라" delims=",." >
${token}<br/>
</c:forTokens>
</body>
</html>