<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- 
jsp:useBean 액션 태그는 JSP 페이지에서 사용할 자바빈 객체를 지정할 때 사용함
1) id : 빈 (bean)이름. JSP 페이지에서 자바빈 객체에 접근할 때 사용할 이름
2) scope : 자바빈 객체를 저장할 영역. page(default), request, session, application
3) class : 자바빈 클래스의 완전한 이름 입력(패키지 이름 포함)
 -->
<jsp:useBean id="member" scope="request" class="chap08.member.MemberInfo" />
<%
	//jsp:useBean 액션 태그의 id 속성에 지정한 이름을 변수명으로 사용함
	member.setId("ddit");
	member.setName("개똥이");
%>

<!-- useObject.jsp 페이지로 요청 흐름을 이동시킴 -->
<jsp:forward page="/chapter08/useObject.jsp"/>