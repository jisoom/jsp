<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
//요청 파라미터의 캐릭터 인코딩을 UTF-8로 지정 (한글깨짐방지)
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>요청 파라미터 출력</title>
</head>
<body>
<!-- 이름, 주소의 값을 출력 -->
<!-- 이름을 적지 않았다면 빈 문자열("")이 파라미터 값으로 전달됨 -->
name 파라미터 = <%=request.getParameter("name")%><br />
address 파라미터 = <%=request.getParameter("address")%><br />

<%
//좋아하는 동물(배열 이기 때문에 배열로 받아줌)
//이름이 pet인 파라미터의 값 목록을 배열(String[])로 리턴함.
//체크박스를 아무것도 선택하지 않으면 웹 브라우저는 해당 이름의 파라미터를 전송하지 않음*******
String[] values = request.getParameterValues("pet");
if(values!=null){
	for(int i=0;i<values.length;i++){//values.length : 체크된 개수
		out.println(values[i]);	//value를 출력
	}
}
%>
<p />
<%
//파라미터 이름을 출력해주는 기본 형태.(Elements를 다룸)
Enumeration paramEnum = request.getParameterNames();
while(paramEnum.hasMoreElements()){ //요소가 있을 때만 반복
	String name = (String)paramEnum.nextElement();
	out.println(name+"<br />");
}
%>
<p />
<%
//파라미터 이름과 파라미터 값을 리턴.
//이 맵에는 <파라미터 이름, 파라미터 값 배열>이 쌍을 이루고 있음.
Map parameterMap = request.getParameterMap();
String[] nameParam = (String[])parameterMap.get("pet");	//name="address"
if(nameParam!=null){
	out.print("name = " +  nameParam[0] + "<br />");	//name, address, pet (1개 선택시)
 	out.print("name = " +  nameParam[1] + "<br />");	//pet (2개 선택시)
 	out.print("name = " +  nameParam[2] + "<br />");	//pet (3개 선택시)
 	out.print("name = " +  nameParam[3] + "<br />");	//pet (4개 선택시)
}
%>
<!-- 
name 파라미터 = 홍길동
address 파라미터 = 오정동
camel cat dog fox

name
address
pet

name = camel
name = cat
name = dog
name = fox
 -->
</body>
</html>









