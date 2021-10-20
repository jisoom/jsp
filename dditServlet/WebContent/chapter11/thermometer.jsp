<%@page import="chapter11.Thermometer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
//Thermometer 클래스로부터 객체 생성
Thermometer thermometer = new Thermometer();
//EL에서 사용가능하도록 request 기본 객체의 속성으로 추가
request.setAttribute("t", thermometer);
%>
<!DOCTYPE html>
<html>
<head>
<title>온도 변환 예제</title>
</head>
<body>
${t.setCelsius("대전", 27.3)}
${t.setCelsius("서울", 26.7)}

대전온도 : 섭씨 ${t.getCelsius("대전")}도 / 화씨 : ${t.getFahrenheit("대전")}<br/>
서울온도 : 섭씨 ${t.getCelsius("서울")}도 / 화씨 : ${t.getFahrenheit("서울")}<br/>
<!-- 파라미터가 없는 메서드 경우, t.info처럼 소문자로 시작하고, ()를 없애면 t.getInfo() 한것과 동일 -->
정보 : ${t.getInfo()}<br/> 정보 : ${t.info}<br/>
작성자 : ${t.getName()}<br/> 작성자 : ${t.name}<br/> 
</body>
</html>