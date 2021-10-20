<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! //선언부(Declaration)를 시작함
/*
	스크립트릿이나 표현식에서 사용할 수 있는 함수를 작성할 때 사용
	선언부의 함수는 자바의 메서드와 동일
	정수 값 : int, short, long
	실수 값 : float, double
*/
/*
	<메서드 이름 규칙>
	첫글자? 문자(알파벳 대소문자) 또는 밑줄로 시작
	첫글자 제외한 나머지? 문자와 숫자 그리고 밑줄의 조합
	메서드 이름은 대소문자를 구분
*/
public int multiply(int a, int b) {
	int c = a * b;
	return c;
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부의 함수</title>
</head>
<body>
10 * 25 = <%=multiply(10, 25) %>
</body>
</html>