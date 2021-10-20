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
		var vara = document.getElementById("a");
		var varSik = document.getElementById("sik");
		var varb = document.getElementById("b");
		if(vara.value == "") { //첫번째 값이 없을 때 첫번째 값을 입력
			if(getb == 0){ //7클릭하면 7, 0임(숫자일 경우만 체크 [0: 숫자, 1: 연산자, 3: 실행])
				vara.value = geta;
			}
		}else { //첫번째 값이 있을 때 두번째 값으로 입력
			if(getb == 0) {
			varb.value = geta;
			}
		}
		//연산자를 입력함
		if(getb == "1") {
			varSik.value = geta;
		}
	}

	
	function result() {
		var vara = document.getElementById("a");
		var varSik = document.getElementById("sik");
		var varb = document.getElementById("b");
		
		if(vara.value == "") {
			alert("첫번째 숫자를 입력해주세요.");
			return;
		}
		if(varSik.value == "") {
			alert("연산자를 입력해주세요.");
			return;
		}
		if(varb.value =="") {
			alert("두번째 숫자를 입력해주세요.");
			return;
		}
		
		$.ajax({
			url : "/chapter02/calc2.jsp"
			,type : "post"
			,data : $("#frm").serialize()
			,success : function (data) {
				console.log(data);
				$("txtResult").val("<%=resultInt%>")
			}
			,error : function (xhr) {
				console.log(xhr);
				alert("오류입니다. 관리자에게 문의하세요.");
			}
		});
		
	}
</script>

</head>
<body>
<form name="frm" id="frm">
<input type="hidden" name="a" id="a" value="">&nbsp;
<input type="hidden" name="sik" id="sik" value="">&nbsp;
<input type="hidden" name="b" id="b" value=""><br>
	<table border="1" style="width: 400px;">
		<tr>
			<th colspan="4"><input style="width: 90%; text-align: right;" type="text" id="txtResult" name="txtResult" value="<%=resultInt%>"></th>
		</tr>
		<tr>
			<th><input type="button" value="7" onclick="fncA('7', '0')"></th>
			<th><input type="button" value="8" onclick="fncA('8', '0')"></th>
			<th><input type="button" value="9" onclick="fncA('9', '0')"></th>
			<th><input type="button" value="x" onclick="fncA('x', '1')"></th>
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
			<th><input type="button" value="" onclick=""></th>
			<th><input type="submit" value="=" onclick="result()"></th>
		</tr>
	</table>
</form>
</body>
</html>