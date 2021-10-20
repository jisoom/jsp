<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>forEach 태그 연습1</title>
</head>
<body>
<h2>1부터 10까지 출력</h2>
<!-- 
var 속성의 변수 n : 1 부터 10 까지 차례대로 값을 갖음
begin ~ end : 범위 지정
step : 증감값(1인 경우 생략 가능)

 -->
<c:forEach var="n" begin="1" end="10" step="1">
${n} &nbsp;&nbsp;&nbsp;
<!-- 1     2     3     4     5     6     7     8
     9     10 -->
</c:forEach>
<br/>
<h2>1부터 100까지 출력. 5씩 증가</h2>

<c:forEach var="n" begin="1" end="100" step="5">
${n} &nbsp;&nbsp;&nbsp;
<!-- 1     6     11     16     21     26     31 
     36     41     46     51     56     61     66  
     71     76     81     86     91     96     -->
</c:forEach>
<br/>
<h2>자바 Collection 사용</h2>
<%
List<String> list = new ArrayList<String>();

String[] arr = {"사과", "귤", "바나나", "배", "오렌지", "키위"};

for(String str: arr) {
	list.add(str);
}

//request 객체에 담아보기(영역)
request.setAttribute("fruitList", list);
%>
<!-- 
* varStatus
index : 인덱스 정보, count : 반복 횟수, begin : begin의 속성값,
end : end의 속성값, step : step의 속성값, first : 첫번째 실행시 true,
last : 마지막 실행시 true, current : collection 중 사용할 객체
begin과 end의 속성값은 index를 사용함 ex) begin="0" 이면 index 0인 것 부터..

-->
<c:forEach var="fruitStr" begin="1" end="3" items="${fruitList}" varStatus="stat">
	${stat.count}, ${stat.index} => ${fruitStr} &nbsp;&nbsp;&nbsp; <br/>
<!-- 
1, 0 => 사과    
2, 1 => 귤    
3, 2 => 바나나    
4, 3 => 배    
5, 4 => 오렌지    
6, 5 => 키위  
-->
<!-- 
begin="1" end="3" 추가하면...
1, 1 => 귤    
2, 2 => 바나나    
3, 3 => 배    
 -->
</c:forEach>

</body>
</html>