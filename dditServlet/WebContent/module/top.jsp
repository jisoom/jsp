<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
상단 메뉴 : 
<a href="<%=request.getContextPath() %>/chapter07/layout.jsp">홈</a>&nbsp;
<a href="<%=request.getContextPath() %>/chapter07/info.jsp">정보</a>&nbsp;
&nbsp;&nbsp;&nbsp;
<%-- <%
	//cookieMap.put(cookies[i].getName(), cookies[i]);
	Cookies cookies = new Cookies(request);
	
	//id라는 이름의 쿠키가 존재하면 실행
	if(cookies.exists("id")) { //로그인 상태
		out.print(cookies.getValue("id") + "님 환영합니다.");
%>
		<input type="button" value="로그아웃" onclick="fn_logout()">
	<%}else { //로그인 안됨 %>
		<input type="button" value="로그인" onclick="fn_login()">
	<%}	%>
<script type="text/javascript">
	function fn_logout() {
		location.href = "/chapter09/logout.jsp";
	}
	
	function fn_login() {
		//layout.jsp를 복사한 후 내용부분에 chapter09/loginForm.jsp를 include
		location.href="/chapter07/login.jsp";
	} --%>
</script>