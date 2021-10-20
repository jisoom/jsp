<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>laylout</title>
</head>
<body>
<!-- 
(차이점)
비교 항목 	   | jsp:include 액션 태그 			| include 디렉티브
-----------------------------------------------------------------------
처리 시간 	   | 요청 시간에 처리					| JSP 파일을 자바 소스로 변환 시 처리
기능	       | 별도 파일로 요청 처리 흐름 이동		| 현재 파일로 대상 페이지가 들어감
데이터 전달	   | request, jsp:param 이용		| 페이지 내 변수 선언 후 변수에 값 저장
용도		   | 화면 레이아웃의 일부분을 모듈화		| 저작권, 공통 변수 지정
 -->
	<table border="1" style="width: 100%;" cellpadding="0" cellspacing="0">
	<!-- cellpadding : 셀과 내용 사이의 여백, cellspacing : 셀과 테이블 사이의 여백 -->
		<tr>
			<td colspan="2">
				<jsp:include page="/module/top.jsp"  flush="false" />  
			</td>
		</tr>
		<tr>
			<td style="width: 30%" valign="top">
				<jsp:include page="/module/left.jsp" />
			</td>
			<td>
				<!-- 내용 부분 : 시작 -->
				레이아웃1<br><br><br>
				<!-- 내용 부분 : 끝 -->
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<jsp:include page="/module/bottom.jsp" />
			</td>
		</tr>
	</table>
</body>
</html>