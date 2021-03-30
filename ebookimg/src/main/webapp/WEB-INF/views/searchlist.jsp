<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.a.b.dto.*" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<link rel="stylesheet" href="resources/css/main_css.css">
</head>
<body>
	<%
		List<Ebook> book = (List<Ebook>)session.getAttribute("sear_result");
	%>
	<header>
	<%@include file="home.jsp"%>
	</header>
	<br>
	<h1 align="center">검색결과</h1>
	<br>
	<table border='1' width="70%" align="center">
	<%if(book.equals(null)){
		%>
		<h3 align="center">찾는 도서가 없습니다.</h3>
		<%
	}else{
		%>
	<tr>
		<th>타이틀</th>
		<th>저자</th>
		<th>카테고리</th>
		<th>출판사</th>
		<th>대여료</th>
	</tr>
	<%
		for (Ebook x: book){
	%>
	<tr>
		<td align="center"><a href="ebookcontentview?bId=${book.getbBookname}"><%=x.getbBookname() %></td>
		<td align="center"><%=x.getbWriter() %></td>
		<td align="center"><%=x.getbCategory() %></td>
		<td align="center"><%=x.getbPublisher() %></td>
		<td align="center"><%=x.getbPrice() %></td>
	<%
	}}%>
	</table>
	<footer>
		<div class="fixed">
	<%@include file="bottom.jsp"%>
		</div>
	</footer>
</body>
</html>
