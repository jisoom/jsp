<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>NULL 에러 발생</title>
</head>
<body>
<!-- noParameterWeb.jsp에서 null 에러가 발생했으므로 이미지 경로 잡을 때, 
noParameterWeb.jsp가 존재하는 폴더를 기준으로 함  -->

<img alt="null" src="/error/null.png" />
<!-- 
만약 에러 페이지의 길이가 512바이트보다 작으면,
인터넷 익스플로러는 이 페이지가 출력하는 에러 페이지를 출력하지 않고
자체적으로 제공하는 HTTP 오류 메시지 화면을 출력함.
인터넷 익스플로러에서도 에러 페이지 내용을 올바르게 출력하려면
응답 결과에 이 주석과 같은 내용을 포함해서
에러 데이터가 512 바이트를 넘도록 해야 함.
 -->
</body>
</html>