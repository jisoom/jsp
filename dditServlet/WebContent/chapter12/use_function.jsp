<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- *************** 꼭 추가 해줘야함 ************** -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>함수 사용</title>
</head>
<body>

<c:set var="str1" value="Functions <태그>를 사용합니다. " />
<c:set var="str2" value="사용" />
<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10" />

<!-- str1의 length : 23 -->
str1의 length : ${fn:length(str1)}<br/>

<!-- str1을 모두 대문자로 : FUNCTIONS <태그>를 사용합니다. -->
str1을 모두 대문자로 : ${fn:toUpperCase(str1)}<br/>

<!-- str1을 모두 소문자로 : functions <태그>를 사용합니다. -->
str1을 모두 소문자로 : ${fn:toLowerCase(str1)}<br/>

<!-- substring(str1, 3, 6) : cti -->
substring(str1, 3, 6) : ${fn:substring(str1, 3, 6)}<br/>

<!-- substringAfter(str1, str2) : 합니다. -->
substringAfter(str1, str2) : ${fn:substringAfter(str1, str2)} <br/>

<!-- substringBefore(str1, str2) : Functions <태그>를 -->
substringBefore(str1, str2) : ${fn:substringBefore(str1, str2)} <br/>

<!-- trim(str1) 좌우 공백 제거 : Functions <태그>를 사용합니다. -->
trim(str1) 좌우 공백 제거 : ${fn:trim(str1)}<br/>

<!-- replace(str1, src, dest) : Functions-<태그>를-사용합니다.- -->
replace(str1, src, dest) : ${fn:replace(str1, " ", "-")}<br/>

<!-- indexOf(str1, str2) 사용 index(0부터 시작) : 16 -->
indexOf(str1, str2) 사용 index(0부터 시작) : ${fn:indexOf(str1, str2)}<br/>

<!-- startsWith(str1, str2) Fun으로 시작? : true -->
startsWith(str1, str2) Fun으로 시작? : ${fn:startsWith(str1,'Fun')} <br/>

<!-- endsWith(str1, str2) 합니다로 끝? : false -->
endsWith(str1, str2) 합니다로 끝? : ${fn:endsWith(str1, '합니다')} <br/>

<!-- contains(str1, str2) str1에 str2가 포함? : true -->
contains(str1, str2) str1에 str2가 포함? : ${fn:contains(str1, str2)}<br/>

<!-- containsIgnoreCase(str1, str2) 대소문자 관계없이 str1에 str2가 포함? : true -->
containsIgnoreCase(str1, str2) 대소문자 관계없이 str1에 str2가 포함? 
	: ${fn:containsIgnoreCase(str1, str2)} <br/>

<c:set var="array" value="${fn:split(tokens,',') }" />
<!-- 1 2 3 4 5 6 7 8 9 10 -->
<c:forEach var="s" items="${array }">
${s }
</c:forEach><br/>

<!-- join(array, "-") 문자열 합침 : "1-2-3-4-5-6-7-8-9-10 -->
join(array, "-") 문자열 합침 : "${fn:join(array, "-")} <br/>

<!-- escapeXml(str1) 특수 문자 처리(&는 &로 변환) : "Functions <태그>를 사용합니다. " -->
escapeXml(str1) 특수 문자 처리(&는 &amp;로 변환) : "${fn:escapeXml(str1)}"<br/>
<!-- xml에서 <를 쓸 때 &lt 라고 쓰는데 &가 에러날 경우를 대비해서 &amp;로 변경해줌 -->
< : &lt; <br/>
> : &gt; <br/>
<= : &le; <br/>
>= : &ge; <br/>

</body>
</html>