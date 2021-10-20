<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	//세션의 유효 시간 설정. 초단위로 유효 시간을 설정
	//0이나 음수로 지정시 세션은 유효 시간을 갖지 않음 => session.invalidate()
	//메서드를 호출하기 전까지 세션 객체가 서버에 유지됨 => 메모리 부족 현상 발생
	//세션 유효시간 설정 2번째 방법 => web.xml에 session-config - session-timeout지정
	session.setMaxInactiveInterval(60 * 60); //1시간
	
	//session 기본 객체에 속성을 설정. 세션이 종료되기 전까지 속성 값을 사용할 수 있음
	session.setAttribute("MEMBERID", "ddit");
	session.setAttribute("NAME", "개똥이");
%>
<!DOCTYPE html>
<html>
<head>
<title>세션에 정보 저장</title>
</head>
<body>
세션에 정보를 저장했습니다.<br/>
<a href="/chapter10/sessionInfo.jsp">세션 정보 보기</a>
</body>
</html>