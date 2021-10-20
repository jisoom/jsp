<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! //선언부 사용
	public int add(int a, int b) {
		return a + b;
	}
	public int minus(int a, int b) {
		return a - b;
	}
	public int multi(int a, int b) {
		return a * b;
	}
	public int sub(int a, int b) {
		return a / b;
	}
%> 
<%
/*
	<request 기본 객체>
1. 웹 브라우저(클라이언트)가 웹 컨테이너(tomcat)(..웹서버)에 전송한 요청 관련 정보 제공
2. JSP페이지에서 가장 많이 사용되는 기본 객체. 웹브라우저의 요청과 관련이 있음
3. 웹브라우저에 웹사이트의 주소를 입력하면, 웹 브라우저는 해당 웹 서버에 연결한 후 요청 정보를 전송. 이때 이 요청 정보를 제공
4. 주요 기능 
	- 클라이언트(웹브라우저)와 관련된 정보 읽기
	- 서버와 관련된 정보 읽기
	- 클라이언트가 전송한 요청 파라미터 읽기 ******************
	- 클라이언트가 전송한 요청 헤더 읽기
	- 클라이언트가 전송한 쿠키 읽기
	- 속성도 처리해줌
*/
	String  firstStr = request.getParameter("a")==null? "0" : request.getParameter("a");
	String  sikStr = request.getParameter("sik")==null? "+" : request.getParameter("sik");
	String  secondStr = request.getParameter("b")==null? "0" : request.getParameter("b");
	
	
	int firstInt = Integer.parseInt(firstStr); //첫번째 숫자
	int secondInt = Integer.parseInt(secondStr); //두번째 숫자
	int resultInt = 0; //연산결과
	
	if(sikStr.equals("+")) { //덧셈
		resultInt = add(firstInt, secondInt);
	}else if(sikStr.equals("-")) {//뺄셈
		resultInt = minus(firstInt, secondInt);
	}else if(sikStr.equals("*")) { //곱셈
		resultInt = multi(firstInt, secondInt);
	}
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp계산기</title>
<script type="text/javascript" src="../../js/lib/jquery-3.6.0.js"></script>
<script type="text/javascript">
	function fncA(geta, getb) {
		/* alert(geta + "," + getb); */
		console.log(geta + "," + getb);
		var vara = $("#a");
		var varSik = $("#sik");
		var varb = $("#b");
		if(vara.val() == "") { //첫번째 값이 없을 때 첫번째 값을 입력
			if(getb == 0){ //7클릭하면 7, 0임(숫자일 경우만 체크 [0: 숫자, 1: 연산자, 3: 실행])
				vara.val(geta);
			}
		}else { //첫번째 값이 있을 때 두번째 값으로 입력
			if(getb == 0) {
			varb.val(geta);
			}
		}
		//연산자를 입력함
		if(getb == "1") {
			varSik.val(geta);
		}
	}
	
	function fn_chk() {
		var vara = $("#a");
		var varSik = $("#sik");
		var varb = $("#b");
		
		if(vara.val() == "") {
			alert("첫번째 숫자를 입력해주세요.");
			return false;
		}
		if(varSik.val() == "") {
			alert("연산자를 입력해주세요.");
			return false;
			
		}
		if(varb.val() =="") {
			alert("두번째 숫자를 입력해주세요.");
			return false;
			
		}
		return true; //submit이 실행됨
		//localhost:8090/chapter02/calc2.jsp?a=7&sik=x&b=2&txtResult=
	}
	
	function resetC() {
		$("#txtResult").val(0);
	}
</script>

</head>
<body>
<form name="frm" id="frm" method="get" action="/chapter02/calcJquery.jsp" onsubmit="return fn_chk()"> <!-- onsubmit : name있는거 빈값인지 전부 확인 후 submit함 -->
<input type="hidden" name="a" id="a" value="">&nbsp;
<input type="hidden" name="sik" id="sik" value="">&nbsp;
<input type="hidden" name="b" id="b" value=""><br>
	<table border="1" style="width: 400px;">
		<tr>
			<th colspan="4"><input style="width: 90%; text-align: right;" type="text" id="txtResult" name="txtResult" value="<%=resultInt %>" ></th>
		</tr>
		<tr>
			<th><input type="button" value="7" onclick="fncA('7', '0')"></th>
			<th><input type="button" value="8" onclick="fncA('8', '0')"></th>
			<th><input type="button" value="9" onclick="fncA('9', '0')"></th>
			<th><input type="button" value="*" onclick="fncA('*', '1')"></th>
		</tr>
		<tr>
			<th><input type="button" value="4" onclick="fncA('4', '0')"></th>
			<th><input type="button" value="5" onclick="fncA('5', '0')"></th>
			<th><input type="button" value="6" onclick="fncA('6', '0')"></th>
			<th><input type="button" value="-" onclick="fncA('-', '1')"></th>
		</tr>
		<tr>
			<th><input type="button" value="1" onclick="fncA('1', '0')"></th>
			<th><input type="button" value="2" onclick="fncA('2', '0')"></th>
			<th><input type="button" value="3" onclick="fncA('3', '0')"></th>
			<th><input type="button" value="+" onclick="fncA('+', '1')"></th>
		</tr>
		<tr>
			<th><input type="button" value="" onclick=""></th>
			<th><input type="button" value="0" onclick="fncA('0', '0')"></th>
			<th><input type="button" value="C" onclick="resetC()"></th>
			<th><input type="submit" value="="></th>
		</tr>
	</table>
</form>
</body>
</html>