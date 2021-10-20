<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- <%@ page buffer="5kb" autoFlush="false"%> --%>    
<%@ page buffer="1kb" autoFlush="true"%>    
<!DOCTYPE html>
<html>
<head>
<title>request기본 객체 및 autoFlush 속성값 true 예제</title>
</head>
<body>

<%

/*
	<request 기본 객체 - 주요 정보 제공 메서드>
	- getRemoteAddr() : 클라이언트(작성자)의 IP주소를 구함
	- getMethod() : 웹브라우저가 정보 전송시 사용한 방식(GET, POST)
	- getRequestURI() : 웹 브라우저가 요청한 URL 경로
	- getContextPath() : 웹 어플리케이션의 컨텍스트 경로
	- getServerName() : 연결시 사용한 서버이름을 구함
	- getServerPort() : 서버가 실행중인 포트 번호 구함
	
*/	
	//page buffer="8kb" : 기본값
		
	//크기가 4kb 이상의 데이터가 생성됨
	//page buffer="1kb" autoFlush="false"로 하면 에러남
	//에러 해결 : buffer를 키우거나, autoFlush를 true로 함
	for(int i=0; i < 1000; i++) {
		out.print("1234");
	}
%>
	웹 어플리케이션 컨텍스트 경로 : <%=request.getContextPath() %><br>
	웹브라우저가 정보 전송 시 사용한 방식 : <%=request.getMethod() %><br>
	클라이언트 IP 주소 : <%=request.getRemoteAddr() %><br>
	웹브라우저가 요청한 URI 경로 : <%=request.getRequestURI() %><br>
	서버 이름 : <%=request.getServerName() %><br>
	서버가 실행중인 포트 번호 : <%=request.getServerPort() %>
	
</body>
</html>