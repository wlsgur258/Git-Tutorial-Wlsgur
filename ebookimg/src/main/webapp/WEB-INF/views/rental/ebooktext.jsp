<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ page import="java.util.ArrayList"%>
    <%@ page import="com.a.b.dto.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.a.b.dao.EDao" %>
<%@ page import="com.a.b.dao.MDao" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/main_css.css">


<meta charset="UTF-8">
<title>EBook text page</title>
</head>
<body>
		
<div align = "center">
<%-- 
<p>책 넘버 :${ebook_text.bBookno}</p>
<p>책 이름 :${ebook_text.bBookname}</p>
<p>책 오라클db상의 리얼콘텐츠 이름 : ${ebook_text.bRealContent}</p> --%>
<%@include file="../home.jsp"%>
<br>
	<h1><i>${ebook_text.bBookname}</i></h1>
	<br>
<form>
<textarea rows = "30" cols = "120" readonly style = "background-color: #FFFFF0;">

<%= request.getAttribute("txt1") %>

</textarea>
</form>

<br><br>
<%-- <p>책 내용 : <%= request.getAttribute("txt1") %></p> --%>
		
		</div>
		<p><br></p>
		<footer>
		<div class="fixed">
	<%@include file="../bottom.jsp"%>
		</div>
	</footer>
		
		
</body>
</html>
