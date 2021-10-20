<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/js/jquery.min.js"></script>
<title>로그인</title>
<script type="text/javascript">
$(function(){
	//https://jquery.com/download/
	$("#btn").on("click",function(){
		var varId = $("#id").val();
		var varPassword = $("#password").val();
		
		$.ajax({
			url:'/chapter09/company/loginok.jsp',
			type:'post',
			data:{'id':varId,'password':varPassword},
			dataType:"json",
			success:function(data){
				var rslt = data.loginResult;
				
				if(rslt == "fail"){
					alert("아이디 또는 비밀번호가 올바르지 않습니다.");
				}else{
					alert("로그인되었습니다.");
					location.href="/chapter09/company/main.jsp";
				}
			},
			error:function(err){
				
			}
		});
	});
});
</script>

</head>
<body>

<table border="1" style="width:100%;" cellpadding="0" cellspacing="0">
<!-- top.jsp 시작 -->
<tr style="height:50px;">
	<td colspan="3">
		<jsp:include page="/chapter09/company/top.jsp" />
	</td>
</tr>
<!-- top.jsp 끝 -->
<tr style="height:300px;">
	<td style="width:10%;">
		<jsp:include page="/chapter09/company/left.jsp" />
	</td>
	<td colspan="2">
		<form name="frm" method="post" action="/chapter09/company/loginok.jsp">
			아이디 : <input type="text" id="id" name="id" placeholder="아이디를 입력해주세요" /><br />
			비밀번호 : <input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요" /><br />
			<input type="button" id="btn" value="확인" />
		</form>
	</td>
</tr>
<tr style="height:50px;">
	<td colspan="3">
		<jsp:include page="/chapter09/company/bottom.jsp" />
	</td>
</tr>
</table>

</body>
</html>