<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>초기화 파라미터 읽어오기(application 객체)</title>
</head>
<body>
	<h2>초기화 파라미터 목록</h2>
	<%
	/*
	<application 객체>
	- 웹 어플리케이션과 관련된 기본 객체
	- 특정 웹 어플리케이션에 포함된 모든 JSP 페이지는 하나의 application 기본 객체를 공유함
	- 초기 설정 정보를 읽어올 수 있음(서버 정보 등)
	*/
		Enumeration<String> initParamEnum = application.getInitParameterNames();
		while(initParamEnum.hasMoreElements()) { //있으면 실행
			String initParamName = initParamEnum.nextElement();
			out.print(initParamName + " = " 
						+ application.getInitParameter(initParamName) + "<br>");
		}
	%>
	서버 정보 : <%=application.getServerInfo() %><br>
	서블릿 규약 메이저 버전 : <%=application.getMajorVersion() %><br>
	서블릿 규약 마이너 버전 : <%=application.getMinorVersion() %><br>
	
	<%
		//[톰캣설치폴더]\logs폴더
		application.log("(홍길동)로그 메시지 기록");
	%>
</body>
</html>