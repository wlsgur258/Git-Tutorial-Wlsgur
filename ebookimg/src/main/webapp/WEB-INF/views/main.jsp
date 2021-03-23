<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>도서 관리</title>
<link href="/css/main_css.css" rel="stylesheet" type="text/css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script src="/script/jquery-3.js"></script>
<style>
.body {
	background-img: url('/resources/img/body.png');
}
.footer {
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
	padding: 0;
	text-align: center;
}

</style>
</head>
<body class="body">
	<div id="__next">
	</div>
	<header>
	<%@include file="home.jsp"%>
	</header>
	<main>
		<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-timeout="2000">
			<div class="cycle-pager"></div>
			<img src="<spring:url value ='/resources/img/LOGO1.png'/>" alt="banner1"> 
			<img src="<spring:url value ='/resources/img/LOGO.png'/>" alt="banner2"> 
			<img src="" alt="banner3"> 
		</div>
	</main>
	<div class="footer">
	<%@include file="bottom.jsp"%>
	</div>
</body>
</html>