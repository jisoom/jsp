<%@page import="chapter11.vo.StudentVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("name", "개똥이");
session.setAttribute("name", "김은대");
application.setAttribute("name", "신용재");
%>
<!DOCTYPE html>
<html>
<head>
<title>EL Object</title>
</head>
<body>
<!-- request 기본 객체의 name 속성의 값을 가져옴 (표현식) -->
<%=request.getAttribute("name") %><br/>

<!-- request 영역에 저장된 name 속성의 값을 가져옴 (EL) -->
request객체의 name 속성 : ${requestScope.name}<br/> <!-- requestScope를 지워도 개똥이 출력됨 -->
session객체의 name 속성 : ${sessionScope.name}<br/> 
application객체의 name 속성 : ${applicationScope.name}<br/> 
name만 썼을 때의 name 속성 : ${name}<br/> 
요청 URI : ${pageContext.request.requestURI}<br/>

<!-- http://localhost:8090/chapter11/useELObject.jsp?code=P101 -->
<!-- code 파라미터 값이 없더라도 null을 출력하는 것이 아니라  아무것도 출력하지 않음 (오류가 발생하지 않음) -->
code 파라미터 : ${param.code}
<!-- 표현언어(Expression Language) 
- JSP에서 사용 가능한 새로운 스크립트 언어
- 간단한 구문 때문에 표현식 꺽임쇠 퍼센트 = 대신 사용함
- JSP의 네가지 기본 객체가 제공하는 영역의 속성 사용 
	(속성 찾을 때 순서대로 찾음. 동일한 속성 찾을 때는 우선순위 높은걸로 찾음.)
	(1. page, 2. request, 3. session, 4. application)
- 집합 객체에 대한 접근 방법 제공
- 수치/ 관계/ 논리 연산자 제공
- 자바 클래스의 메서드 호출 기능 제공
- 표현언어만의 기본 객체 제공
- 스크립트 요소(스크립트릿, 표현식, 선언부)를 제외한 나머지 부분에서 사용
-->

1. EL 리터럴 표현식 <br/>
문자열 : ${"apple"}<br/>
나는 ${'학교'}에 갑니다.<br/> 
맥날 아이스 아메리카 가격은 ${1000}원 입니다.<br/>
파이는 ${3.14}이다.<br/>
오늘 아침 식사를 하였나요? ${true}<br/>
null표현? "${null}" (빈문자열 whitespace)<br/><br/>

2. 배열<br/>
<%
int[] intArr = new int[]{100, 90, 80, 70, 60};
out.print("intArr.length :" + intArr.length + "<br/>");
//pageContext : PAGE 기본 영역의 속성에 배열을 저장
pageContext.setAttribute("jumsu", intArr); %>
${jumsu[0]}<br/>
${jumsu[1]}<br/>
${jumsu[2]}<br/>
${jumsu[7]}<br/> <!-- 없을 때 값을 출력하지 않을 뿐, 에러가 나지 않음 -->


<%
//이렇게는 잘 안되므로 JSTL 때 반복 처리를 배워서 하자.
for(int i=0; i <intArr.length; i++) { 
	out.print("${jumsu[" + i + "]}<br/>");
	
} %>
<br/>
3. List<br/>
<% 
List<String> list = new LinkedList<>();
list.add("사과");
list.add("바나나");
list.add("오렌지");
//pageContext : PAGE 객체의 보관소
pageContext.setAttribute("list", list);
%>
<!-- pageScope, requestScpoe, sessionScope, applicationScope -->
${pageScope.list[0]}<br/>
${list[1]}<br/>
${list[2]}<br/>

<!-- 
기본 객체			| 영역 이름				| 보관소
___________		__________________________________________________________________
PAGE			| pageScope				| pageContext
REQUEST			| requestScope			| sevletRequest
SESSION			| sessionScope			| httpSession
APPLICATION		| applicationScope		| servletContext
 -->
 <br/>
 4. Map<br/>
 <%Map<String, String> map = new HashMap<>();
 map.put("id", "a001");
 map.put("name", "개똥이");
 map.put("age", "25");
 
 pageContext.setAttribute("map", map);
 %>
 ${map["id"]}<br/>${map["name"]}<br/> ${map["age"]}<br/>
 ${map.id}<br/> ${map.name}<br/> ${map.age}
 <br/><br/>
 5. 자바 객체 <br/>
 <%
 //자바빈 클래스를 인스턴스화하여 객체를 생성
 StudentVO studentVO = new StudentVO();
 studentVO.setStudentNo("202107001");
 studentVO.setStudentName("개똥이");
 
 pageContext.setAttribute("student", studentVO);
 %>
 ${student["studentNo"]} <br/> ${student["studentName"]} <br/>
 ${student.studentNo} <br/> ${student.studentName} <br/><br/>
 6. 산술 연산자<br/>
 ${5+2}<br/> ${5-2}<br/> ${5*2}<br/> 
 ${5/2}<br/> <%-- ${5 div 2}<br/> --%><!-- 5/2 했을 때 자바는 2나오지만 이거는 2.5나옴 -->
 ${5%2}<br/> ${5 mod 2}<br/><br/>
 7. 논리연산자<br/>
 ${5==5 && 7==7}<br/> ${5==5 and 7!=7}<br/>
 ${5==5 || 7==7}<br/> ${5==5 or 7!=7}<br/>
 ${not true}<br/> ${!true} ${!(5==5)}<br/> ${!("사과"=="사과")}<br/><br/>
 8. 비교 연산자<br/>
 ${5==5}<br/> ${5 eq 5}<br/>
 ${5!=5}<br/> <%-- ${5 ne 5}<br/> --%>
 less than : &nbsp;<br/> ${5<7}<br/> ${5 lt 7}<br/>
 less than equal : &nbsp;<br/> ${5<=7}<br/> ${5 le 7}<br/>
 greater than : &nbsp;<br/> ${5>7}<br/> ${5 gt 7}<br/>
 greater than equal : &nbsp;<br/> ${5>=7}<br/> ${5 ge 7}<br/><br/>
 9. null 체킹<br/> <!-- empty 비어있어? flase : 아니 안비어있어 true : 응 비어있어 -->
 ${empty student}<br/>, ${empty studentVO2}<br/><br/>
 10. 3항 연산자<br/>
 ${empty param.code? "없음" : param.code}<br/>
 <!-- 확인 해보기 -->
 <!-- http://localhost:8090/chapter11/useELObject.jsp -->
 <!-- http://localhost:8090/chapter11/useELObject.jsp?code=a001 -->
  5+5 가 출력됨 : ${1 + 1;5 + 5}<br/>
  
 
 
 
</body>
</html>