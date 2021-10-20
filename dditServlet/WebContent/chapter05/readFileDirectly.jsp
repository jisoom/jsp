<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>절대 경로를 사용하여 자원 읽기</title>
</head>
<body>
<%
String filePath = "D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\dditServlet\\WebContent\\chapter05\\message\\notice.txt";

char[] buff = new char[128]; //128자씩 끊어서 읽게끔 하기 위함
int len = -1; //length가 -1이라는 것은 없다는 뜻
try {
	//notice.txt로부터 내용을 읽어오는 스트림(데이터 물줄기)을 생성함
	InputStreamReader fr = 
			new InputStreamReader(new FileInputStream(filePath), "UTF-8");
	//notice.txt로부터 읽어온 데이터를 out 기본 객체를 사용하여 웹 브라우저에 출력함
	while((len = fr.read(buff)) != -1) { //읽을 게 있을 때만 실행(읽을 게 없으면 -1)
		out.print(new String(buff, 0, len));
	}
}catch(IOException ex) {
	out.print("익셉션 발생 : " + ex.getMessage());
}
%>
</body>
</html>