<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>INFO</title>
</head>
<body>
	<table border="1" style="width: 100%;" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2">
				<jsp:include page="/module/top.jsp" flush="false" />
			</td>
		</tr>
		<tr>
			<td style="width: 30%" valign="top">
				<jsp:include page="/module/left.jsp" />
			</td>
			<td>
				<!-- 내용 부분 : 시작 -->
				<table style="width: 100%;" border="1">
					<tr>
						<th>제품번호</th><td>P101000001</td>
					</tr>
					<tr>
						<th>가격</th><td>10,000원</td>
					</tr>
				</table>
				<!-- 
					info.jsp?type=B
					jsp:param 액션 태그로 추가한 파라미터가 기존 파라미터보다 우선한다.
				 -->
				<jsp:include page="/chapter07/infoSub.jsp">
					<jsp:param name="type" value="A" />
				</jsp:include>
<%-- 					<%@ include file="/chapter07/infoSub.jsp" %> --%>
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
