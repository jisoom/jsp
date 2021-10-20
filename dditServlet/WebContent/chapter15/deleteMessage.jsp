<%@page import="chapter15.service.InvalidPasswordException"%>
<%@page import="chapter15.service.DeleteMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
int messageId = Integer.parseInt(request.getParameter("messageId"));
String password = request.getParameter("password");

// out.print("messageId : " + messageId);
// out.print("password : " + password);

//false 오류 없음
boolean invalidPassword = false;
// String a = "";
try {
	DeleteMessageService deleteService = DeleteMessageService.getInstance();
	deleteService.deleteMessage(messageId, password);
}catch(InvalidPasswordException ex) {
	//오류 발생
	invalidPassword = true;
	
	//java에서 에러처리한 메시지 가져옴
	//a = ex.getMessage(); 
}
%>
<!DOCTYPE html>
<html>
<head>
<title>방명록 메시지 삭제완료</title>
</head>
<body>
<%
//invalidPassword : false면 정상
if(!invalidPassword) {
	out.print("메시지를 삭제하였습니다.");
}else { //true면 오류 발생(특히 비밀번호가 매칭되지 않은 오류 발생)
 	out.print("입력한 비밀번호가 올바르지 않습니다.");

	//ex.getMessage()한 메세지 가져오기
	//out.print(a);
}
%>
<br/>
<a href="list.jsp">[목록보기]</a>
</body>
</html>