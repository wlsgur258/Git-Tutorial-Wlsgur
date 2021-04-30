<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="com.a.b.service.*"%>
<%@ page import="com.a.b.dto.*" %>
<html>
<head>
	<%
	Member vo = (Member)session.getAttribute("joinVo");
	if(vo==null){
		%>
		<script>
		alert('로그인 후 가능합니다.');
		document.location.href="main";
		</script>
		<%
	}%>
<link rel="stylesheet" href="resources/css/main_css.css">
<title>금액 충전</title>
</head>
<body>
	<%@include file="home.jsp"%>
	<br/>
	<br/>
	<br/>
	<h1 align="center">금액 확인</h1>
	<h3 align="center">현재 잔액 : ${joinVo.bCash}</h3>
	<br/>
	<br/>
	<h1 align="center">금액 충전</h1>
<form name="cashup" action="cashupdo" method ="POST">
	<input type="hidden" name="bId" value="${joinVo.bId}">
<table align="center">
	<tr><th>금액</th><td>
		<input type="number" name="bCash" size="20">
	</td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" class="btn btn-primary" value="충전">
		<input type="reset" class="btn btn-primary" value="재입력"><p/><p/>
	</td></tr>
</table>
</form>
	<footer>
		<div class="fixed">
	<%@include file="bottom.jsp"%>
	
		</div>
	</footer>
</body>
</html>
