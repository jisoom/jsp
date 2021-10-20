<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<title>자유게시판 목록</title>
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
				<table border="1" style="width: 100%;">
					<tr>
						<td colspan="4"><a href="/chapter07/freeboardwrite.jsp">[게시글 쓰기]</a></td>
					</tr>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
					<%
					//freeboard.jsp?currentPage=1 기본 currentPage 파라미터 값 : 1
					String currentPageStr = request.getParameter("currentPage"); 
					int currentPage = Integer.parseInt(currentPageStr);
					
					//글 전체 개수(120행)
					//SELECT COUNT(*) TOTAL FROM FREEBOARD; => 120행
					int total = 121;
					
					//전체 페이지 수
					int totalPages = total /10; //12페이지
					//121 % 10 => 1 => 전체 페이지 수를 1 증가
					//(전체 행의 수/ 한 화면에 보여지는 size 했을 때 딱 떨어지지 않고 넘쳤을 때..)
					//12페이지는 120행을 커버하는데 문제는 121행처럼 1행이 넘쳤을 때에는 13페이지로 처리해줘야 하므로..
					if(total % 10 > 0) { 
						totalPages++;
					}
					
					//글 시작 번호(1페이지일 경우 시작번호 : 1, 2페이지일 경우 시작번호 : 11)
					int startNum = (currentPage * 10) - 9;
					
					//글 종료 번호
					int endNum = currentPage * 10;
					//int endNum = startNum + 9;
					
					//시작 페이지 [이전] 1 2 3 4 5 [다음] => 1
					//정수 / 정수 => 정수
					// 1 / 5 => 0.2지만 정수로 0임
					int startPage = currentPage / 5 * 5 + 1;
					
					//현재 페이지를 5개로 나눈 나머지
					//5같은 경우는 5/5 => 1이 되기 때문에 1 * 5 + 1 = 6이 됨
					int modVal = currentPage % 5;
					//6-5를 빼줌 => 1이 됨
					if(modVal == 0) startPage -= 5; //보정작업
					
					//종료 페이지 [이전] 1 2 3 4 5 [다음] => 5
					int endPage = startPage + 4;
					
					//종료 페이지 [이전] 11 12 13 14 15 [다음] => 15
					if(endPage > totalPages) endPage = totalPages; //totalPages : 13(121행일때)
					
					for(int i=startNum; i<=endNum; i++) { %>
					<tr>
						<th><%=i%></th>
						<th>제목<%=i%></th>
						<th>작성자<%=i%></th>
						<th>0</th>
					</tr>
					<%} %>
					<tr style="text-align: center;">
						<td colspan="4">
						<%if(startPage > 5) {%>
							<a href="/chapter07/freeboard.jsp?currentPage=<%=startPage - 5%>">[이전]</a>
						<%} %>	
						<%for(int j=startPage; j<=endPage; j++) {%>
							<a href="/chapter07/freeboard.jsp?currentPage=<%=(j)%>">
								<%=(j)%>
							</a>&nbsp;
						<%} %>
						<%if(endPage < totalPages) { %>
							<a href="/chapter07/freeboard.jsp?currentPage=<%=startPage + 5%>">[다음]</a>
						<%} %>
						</td>
					</tr>
				</table>
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