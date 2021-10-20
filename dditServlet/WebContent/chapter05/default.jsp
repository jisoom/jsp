<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>JSP 9가지 주요 기본 객체</title>
</head>
<body>
<h2>JSP 9가지 주요 기본 객체</h2>
<pre>
1. request*******
 - (실제 타입)HttpservletRequest, ServletRequest
 - 클라이언트의 요청 정보를 저장
 - <%request.setCharacterEncoding("UTF-8");%>
2. response***
 - (실제 타입)HttpServletResponse, ServletResponse
 - 응답 정보를 저장
 - <%response.getBufferSize();%>
3. session*******
 - (실제 타입) HttpSession
 - HTTP 세션 정보를 저장 
 - <%session.setAttribute("id", "a001");%>
4. page*
 - (실제 타입)Object
 - JSP 페이지를 구현한 자바 클래스 인스턴스
5. out***
 - (실제 타입)JspWriter
 - JSP 페이지가 생성하는 결과를 출력 
 - <%out.print("개똥이<br />");%>
6. pageContext*****
 - JSP 페이지에 대한 정보 저장
7. application***
 - (실제 타입)ServletContext
 - 웹 어플리케이션에 대한 정보를 저장(웹브라우저 간에도 호환)
 - <%application.setAttribute("name", "개똥이");%>
8. config*
 - JSP 설정 정보
9. exception****
 - (실제 타입)Throwable
 - 예외 객체. 오류 페이지에서만 사용됨
 </pre>
</body>
</html>