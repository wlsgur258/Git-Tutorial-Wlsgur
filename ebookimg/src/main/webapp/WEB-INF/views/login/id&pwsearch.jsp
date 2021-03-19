<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.a.b.dto.*" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW 찾기 결과</title>
</head>
		<%@include file="../home.jsp"%>
<body>
	<%
		String vo = (String)session.getAttribute("searchID");
	if(vo == null){
		%>
		<h1 align="center">
		입력하신 정보를 확인 후 다시 시도해 주세요.
		</h1>
		<h5 align="center">
		<button class="btn btn-primary" onclick="location.href='idSearch'">ID/PW 찾기</button>
		</h5>
		<%
	}else {
		%>
		<h1 align="center">
		ID or PW : <%=vo %>
		</h1>
	<h5 align="center">
		<button class="btn btn-primary" onclick="location.href='login'">로그인 화면으로</button>
	</h5>
		<%
	}
	%>
	<p/>
</body>
</html>
