<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	//읽어올 파라미터의 캐릭터 인코딩을 UTF-8로지정함
	request.setCharacterEncoding("UTF-8");
%>
<!-- MemberInfo 자바빈 클래스의 객체를 생성. memberInfo 이름으로 저장 -->
<jsp:useBean id="memberInfo" class="chap08.member.MemberInfo" />

<!-- 파라미터 값을 memberInfo 자바빈 객체의 프로퍼티 값으로 저장 -->
<jsp:setProperty name="memberInfo" property="*" />
<%
// memberInfo.setId(request.getParameter("id"));
// memberInfo.setName(request.getParameter("name"));
// memberInfo.setEmail(request.getParameter("email"));
%>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입</title>
</head>
<body>
<!-- 
[회원가입] 버튼을 누르면 파라미터로 전송된 데이터가 자바빈 객체의 프로퍼티 값으로 지정됨
jsp:setProperty 액션 태그를 사용하려면 파라미터 이름과 자바빈 프로퍼티의 이름을 동일
 -->

<table border="1" style="width: 50%;">
	<tr>
		<th>아이디</th>
		<td colspan="3">
			<!-- setProperty한 값 가져올 수 있음 -->
			<%
				out.print(memberInfo.getId()); //jsp액션태그와 동일한 의미
			%>
			<jsp:getProperty name="memberInfo" property="id" /> 
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>
			<%
				out.print(memberInfo.getName()); //jsp액션태그와 동일한 의미
			%>
			<jsp:getProperty name="memberInfo" property="name" />
		</td>
		<th>이메일</th>
		<td>
			<%
				out.print(memberInfo.getEmail()); //jsp액션태그와 동일한 의미
			%>
			<jsp:getProperty name="memberInfo" property="email" />
		</td>
	</tr>
</table>
</body>
</html>