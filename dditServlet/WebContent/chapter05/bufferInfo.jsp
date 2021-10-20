<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page buffer="8kb" autoFlush="true" %>
<%
//page 디렉티브
//buffer 속성의 값을 8kb로 설정
//autoFlush : false => 페이지의 결과 데이터가 8kb를 초과 시 오류발생
//autoFlush : true => 오류 발생하지 않음
%>
<!DOCTYPE html>
<html>
<head>
<title>버퍼 정보</title>
</head>
<body>
<%
//버퍼오버플로우 발생 시키기
for(int i=0; i<10000; i++) {
	out.print("개똥이");
}
//버퍼오버플로우 해결 : 버퍼 크기 늘리거나 autoFlush=true로 함
%>
버퍼 크기(8192) : <%=out.getBufferSize() %> <br>
버퍼의 남은 크기(8059) : <%=out.getRemaining() %> <br>
auto flush 여부(false) : <%=out.isAutoFlush() %>
</body>
</html>