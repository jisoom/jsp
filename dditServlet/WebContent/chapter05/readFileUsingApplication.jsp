<%@page import="java.net.URL"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>application 기본 객체를 사용하여 자원 읽기</title>
</head>
<body>
<%
	String resourcePath = "/chapter05/message/notice.txt";
%>
자원의 실제 경로<br>
<%
/*
D:\A_TeachingMaterial\6.JspSpring\workspace\.metadata
\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps
\dditServlet\message\notice.txt
*/
	out.print(application.getRealPath(resourcePath) + "<br/>"); 
	out.print(application.getResource(resourcePath)+ "<br/>");
%>
--------------------------------------<br>
<%
	char[] buff = new char[128];
	int len = -1;
	URL url = application.getResource(resourcePath);
	
	try {
		/* new FileInputStream(filePath) //realPath */
		
		//상대경로
// 		InputStreamReader br = new InputStreamReader(application.getResourceAsStream(resourcePath), "UTF-8");
		InputStreamReader br = new InputStreamReader(url.openStream(), "UTF-8"); 
		while((len=br.read(buff))!= -1) {
			out.print(new String(buff,0,len));
		}
	}catch(IOException ex) {
		out.print("익셉션 발생 : " + ex.getMessage());
	}
%>
<!-- 
<application 기본 객체의 자원 접근 메서드>
- getRealPath(String path) : 리턴 타입은 String
	웹 어플리케이션 내에서 지정한 경로에 해당하는 자원의 시스템상에서의 자원 경로를 리턴
	
- getResource(String path) : 리턴 타입은 URL
	웹 어플리케이션 내에서 지정한 경로에 해당하는 자원에 접근할 수 있는 URL 객체를 리턴
	URL url = application.getResource(resourcePath);
	url.openStream()
	
-getResourceAsStream(String path) : 리턴 타입은 InputStream
	웹 어플리케이션 내에서 지정한 경로에 해당하는 자원으로부터 데이터를 읽어올 수 있는 InputStream을 리턴
	application.getResourceAsStream(resourcePath)		
 -->
</body>
</html>