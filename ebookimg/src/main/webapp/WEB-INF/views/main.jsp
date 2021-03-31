<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.a.b.dto.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>도서 관리</title>
<link rel="stylesheet" href="resources/css/main_css.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script src="/script/jquery-3.js"></script>
<style>
</style>
</head>
<body>
	<header>
	<%@include file="home.jsp"%>
	</header>
		<div id="container">
			<div class="left">
				<h3 align="center">신규 도서</h3>
				<table border="0" width="100%">
				<c:forEach items="${newbook}" var="newbook">
					<th colspan="4"><a href ="ebookcontentview?bId=${newbook.bBookname}">
					<img src="<spring:url value ='http://121.153.134.167/ebook/${newbook.bUrl}'/>" height="200px"></a></th>
				<tr>
					<th>제목</th>
					<th>저자</th>
					<th>출판사</th>
					<th>장르</th>
				</tr>
					<td><a href="ebookcontentview?bId=${newbook.bBookname}">${newbook.bBookname}</a></td>
					<td>${newbook.bWriter}</td>
					<td>${newbook.bPublisher}</td>
					<td>${newbook.bCategory}</td>
				</c:forEach>
				</table>
			</div>
			<div class="main">
			<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-timeout="2000">
			<img src="<spring:url value ='/resources/img/main/main.jpg'/>" alt="banner1" height="300px"> 
			<img src="<spring:url value ='/resources/img/main/main1.jpg'/>" alt="banner2" height="300px"> 
			<img src="<spring:url value ='/resources/img/main/main2.jpg'/>" alt="banner3" height="300px"> 
			</div>
			</div>
			<div class="right">
				<br>
				<h3 align="center">추천 도서</h3>
				<table border="0" width="100%">
				<c:forEach items="${bestbook}" var="bestbook">
					<th colspan="4"><a href ="ebookcontentview?bId=${bestbook.bBookname}">
					<img src="<spring:url value ='http://121.153.134.167/ebook/${bestbook.bUrl}'/>" height="200px"></a></th>
				<tr>
					<th>제목</th>
					<th>저자</th>
					<th>출판사</th>
					<th>장르</th>
				</tr>
					<td><a href="ebookcontentview?bId=${bestbook.bBookname}">${bestbook.bBookname}</a></td>
					<td>${bestbook.bWriter}</td>
					<td>${bestbook.bPublisher}</td>
					<td>${bestbook.bCategory}</td>
				</c:forEach>
				</table>
			</div>
		</div>
		<footer>
		<div class="fixed">
	<%@include file="bottom.jsp"%>
		</div>
		</footer>
</body>
</html>
