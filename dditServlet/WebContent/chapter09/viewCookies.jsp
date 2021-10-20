<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>쿠키 목록</title>
<script type="text/javascript">
	function fn_CRU(para) {
		if(para == "C") { //생성 페이지로 이동
			location.href = "/chapter09/makeCookie.jsp";
		
		}else if(para == "U") { //변경 페이지로 이동
			location.href = "/chapter09/modifyCookie.jsp";
		
		}else if(para =="D") { //삭제 페이지로 이동
			location.href = "/chapter09/deleteCookie.jsp";
		
		}else {
			alert("잘못된 명령입니다.");
		}
	}
</script>
</head>
<body>
	<h2>쿠키 목록</h2>
	<%
		//1) response.addCookie(cookie); //서버에서 쿠키 생성(오는것)
		//2) request.getCookies(); //클라이언트가 보낸 쿠키 읽음(가는것)
		//	getName() : 쿠키의 이름을 구함 / getValue() : 쿠키의 값을 구함
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null && cookies.length > 0) {
			for(int i=0; i < cookies.length; i++) {
				//쿠키의 이름 = 값
				out.print(cookies[i].getName() + "=" +
						URLDecoder.decode(cookies[i].getValue(), "UTF-8") + "<br>");
			}
		}else {
			out.print("쿠키가 쿠키 저장소에 없습니다.");
		}
	%>
<input type="button" value="쿠키 생성" onclick="fn_CRU('C')">&nbsp;	
<input type="button" value="쿠키 변경" onclick="fn_CRU('U')">&nbsp;	
<input type="button" value="쿠키 삭제" onclick="fn_CRU('D')">&nbsp;	
</body>
</html>