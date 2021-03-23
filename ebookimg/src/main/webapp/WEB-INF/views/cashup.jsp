<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="com.a.b.service.*"%>
<%@ page import="com.a.b.dto.*" %>
<html>
<head>
	<div>
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
<title>금액 충전</title>
</head>
<body>
	<%@include file="home.jsp"%>
	<h1 align="center">금액 충전</h1>
<form name="cashup" action="cashupdo" method ="POST">
	<input type="hidden" name="bId" value="${joinVo.bId}">
<table align="center">
	<tr><th>금액</th><td>
		<input type="text" name="bCash" size="20">
	</td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" class="btn btn-primary" value="충전">
		<input type="reset" class="btn btn-primary" value="재입력"><p/><p/>
	</td></tr>
</table>
</form>
</body>
</html>
